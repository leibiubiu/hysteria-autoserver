这个脚本主要是为了获取vpn地址，自动切换失效vpn，以提供一个稳定的vpn服务

添加crontab，确保系统有run-one，避免脚本重复运行，注意修改路径
```shell
*/60 * * * * /usr/bin/run-one /home/pi/tools/hysteria/sysconf.sh
* * * * * /usr/bin/run-one /home/pi/tools/hysteria/initMyNet.sh
```

下载合适的hysteria，我用的 v1.3.3 版本

```shell
https://github.com/apernet/hysteria/releases/tag/v1.3.3
```
