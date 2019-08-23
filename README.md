#实时同步
------ 

服务端由rsyncd实现，客户端由lsyncd实现，通过同一个镜像两个不同的docker-compose.yml文件进行启动

### lsyncd的启动 

lsyncd需要部署在数据的源服务器  

``` shell
   docker-compose -f docker-compose-lsyncd.yml up -d
```

### rsyncd的启动  

rsyncd需要部署在数据的接收服务器  

```shell
   #需要向给启动脚本在宿主机上赋予执行权限
   chmod +x docker-entrypoint-rsyncd.sh 
   docker-compose -f docker-compose-rsyncd.yml up -d
```

