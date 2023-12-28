echo -e "\e[32m Downloading ElasticSearch Repo \e[0m"
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cp /root/elk_roboshop/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
echo -e "\e[32m Installing ElasticSearch \e[0m"
yum install elasticsearch -y
echo -e "\e[32m Enabling and starting ElasticSearch \e[0m"
systemctl enable elasticsearch
systemctl restart elasticsearch

echo -e "\e[32m Installing kibana \e[0m"
yum install kibana -y
echo -e "\e[32m Enabling and starting kibana \e[0m"
systemctl enable kibana
systemctl restart kibana

echo -e "\e[32m Installing logstash \e[0m"
yum install logstash -y
echo -e "\e[32m Copying logstash.conf file \e[0m"
cp /root/elk_roboshop/logstash.conf /etc/logstash/conf.d/logstash.conf
echo -e "\e[32m Enabling and starting logstash \e[0m"
systemctl enable logstash
systemctl restart logstash

echo -e "\e[32m Installing nginx \e[0m"
yum install nginx -y
echo -e "\e[32m Removing default nginx conf file \e[0m"
rm -rf /etc/ginx/nginx.conf
echo -e "\e[32m Adding new nginx conf file \e[0m"
cp /root/elk_roboshop/nginx.conf /etc/nginx/nginx.conf
echo -e "\e[32m Enabling and starting nginx \e[0m"
systemctl enable nginx
systemctl restart nginx



