# 实时同步

服务端由rsyncd实现，客户端由lsyncd实现，通过同一个镜像两个不同的docker-compose.yml文件进行启动

### lsyncd的启动 

lsyncd需要部署在数据的源服务器  

启动前需要编辑yml文件进行变量的配置，其中ip为数据接收服务器的ip，SECTION与PASSWORD随心而定，但一定要与rsyncd中设置的value完全相同

``` shell
   docker-compose -f docker-compose-lsyncd.yml up -d
```

### rsyncd的启动  

rsyncd需要部署在数据的接收服务器  

启动前需要编辑yml文件进行变量的配置，其中ip为数据接收服务器的ip，SECTION与PASSWORD随心而定，但一定要与lsyncd中设置的value完全相同

```shell
   #需要向给启动脚本在宿主机上赋予执行权限
   chmod +x docker-entrypoint-rsyncd.sh 
   docker-compose -f docker-compose-rsyncd.yml up -d
```

