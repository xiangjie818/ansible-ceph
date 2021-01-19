#!/bin/bash
dev=$1

# 确认设备是否可以创建osd
dev_stat=$(ceph-volume inventory ${dev} | grep available | awk '{print $2}')

if [ $dev_stat = True ] ; then
   ceph-volume lvm create --bluestore --data ${dev} | tee /tmp/create-osd.log
   if [ $? = 0 ] ; then
      rm -rf /tmp/create-osd.log
      sleep 10
   fi
fi
