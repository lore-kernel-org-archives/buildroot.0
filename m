From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 08:27:51 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-16
Message-ID: <20170517062751.2CBF020789@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-16
================================

      successes : 251
       failures : 10 
       timeouts : 0  
          TOTAL : 261

Classification of failures by reason
====================================

                protobuf-3.2.0 | 2 
                   cmake-3.7.2 | 1 
                  cppcms-1.0.5 | 1 
                libepoxy-1.4.1 | 1 
           libmemcached-1.0.18 | 1 
           modem-manager-1.6.4 | 1 
                  ntp-4.2.8p10 | 1 
           oracle-mysql-5.1.73 | 1 
             rabbitmq-c-v0.8.0 | 1 


Detail of failures
===================

      x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/e89a29fb06991d8da9b946e284741c56397ac4bc |     
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a7eb1ede552ae14f409cfd7bd877bcf25ca69a74 | ORPH
         sh4 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/38701cee74110de90cd72f720b3ee8bd69666325 |     
      x86_64 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5ee26b9676acc1a360bb86aa13a0c992727309a2 |     
      x86_64 |            modem-manager-1.6.4 | NOK | http://autobuild.buildroot.net/results/8a551a29263d5daa12e1036a4e3804214fd4066a |     
    mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/25efd86193d0b0fea2a4b2d84fb7f19baa140eb5 | ORPH
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/61074b69b81cd5c17a7f74dc1f7b31f3fc35fd8a | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/4329cda610082053d0a8fd7796a690ddaa21de04 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d1640867dee1b0fe8341698b1d4d02c5edff90a1 | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d90fc2ccf61518f3c3198ef566976096f75c2776 |     

-- 
http://autobuild.buildroot.net
