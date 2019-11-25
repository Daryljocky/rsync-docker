# 实时同步镜像

一个镜像实现两个功能，服务端由rsyncd负责实现，客户端由lsyncd实现，通过同一个镜像两个不同的docker-compose.yml文件进行启动。

**目前展示只实现了单向同步，还没有实现双向实时同步，为了后来的双向试试同步做了预留，所以客户端和服务器端使用同一个镜像**

### lsyncd

客户端

Lysncd 实际上是lua语言封装了 inotify 和 rsync 工具，优点是实时同步客户端不再需要通过定时任务或手动调整 inotify+rsync进行客户端的配置

lsyncd需要部署在数据的源服务器

启动前需要编辑yml文件进行变量的配置，其中ip为数据接收服务器的ip，SECTION与PASSWORD随心而定，但一定要与rsyncd容器中docker-compose.yml中设置的value完全相同

记得修改docker-compose.yml中数据文件夹地址

```shell
docker-compose -f docker-compose-lsyncd.yml up -d
```

### rsyncd

服务端

rsyncd需要部署在数据的接收服务器

启动前需要调整etc/rsyncd.conf配置文件，修改{{SECTION}}为与对应lsyncd中配置一样的value；调整etc/rsyncd.d/rsyncd.secrets文件，修改{{SECTION}}和{{PASSWORD}}为与对应lsyncd中配置一样的value

```shell
docker-compose -f docker-compose-rsyncd.yml up -d
```

### 多客户端

rsyncd是支持多个lsyncd客户端的，配置方法如下：

在etc/rsyncd.conf中添加如下配置

```ini
#修改{{SECTION}}为与对应lsyncd中配置一样的value
[{{SECTION}}]
path = /data/
read only = no
list = yes
auth users = {{SECTION}}
secrets file = /etc/rsyncd.d/rsync.secrets
```

在etc/rsyncd.d/rsyncd.secrets中添加新的一行：

```ini
#修改{{SECTION}}和{{PASSWORD}}为与对应lsyncd中配置一样的value
{{SECTION}}:{{PASSWORD}}
```

### 双向同步

暂未实现
