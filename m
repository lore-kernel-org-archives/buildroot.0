From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 08:28:34 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-24
Message-ID: <20170325072834.09F51207FA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-24
================================

      successes : 117
       failures : 26 
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

                  ntp-4.2.8p10 | 11
                libepoxy-1.4.1 | 2 
           uboot-tools-2017.03 | 2 
             bluez_utils-4.101 | 1 
                  boost-1.63.0 | 1 
                    gdb-7.11.1 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
              leptonica-1.74.1 | 1 
                libmpeg2-0.5.1 | 1 
            lttng-libust-2.9.0 | 1 
               madplay-0.15.2b | 1 
               nfs-utils-1.3.3 | 1 
                      qt-4.8.7 | 1 
             rabbitmq-c-v0.8.0 | 1 


Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1c221f65b17e546cb3eed59cefef2c5020daf602 |     
     powerpc |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/84b992f5b8cffa65e2c3ca8f945a653ce268a653 |     
         arm |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/6b1b44e72147113b3f0e3f049cb9026d6c7dffb7 | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8cdd0c3cf9de1a2506713b9e291ec7f9c602ca67 |     
         arm |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/35f9a0f2db30dd62733142f0fcfa72699452583f |     
         arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/c6ee564f599afa113e092dcfcd213bfb33bceb49 |     
         arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/aa740a5409355235e8c82ecef7663d26b17aa18d |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/44fd4e90f8c2c275278eb9eb0c257c3569dff093 | ORPH
     powerpc |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0b7ca5d90fedd4ffef23540409663b5cd9de42ab |     
         arc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/b18f0580ea29937963ad76f7734ec1f3011f523f | ORPH
        or1k |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/8249dd1f0588ae7c3529241f848970efff1dfc45 | ORPH
      xtensa |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/4313121883abd7dcdf93f7671c7c1d935d237132 | ORPH
     powerpc |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/5fba4d8e0b332e0155c303dd247931b60d451301 | ORPH
        i586 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/b7cb1b60fe70974cc708e5c6fa6b461823ef7844 | ORPH
        i586 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/59fe985408b8ff7b88db4f8a54671d8bd3693599 | ORPH
      mipsel |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/5bd33328feddb557604417d8cfcbd321f0086d85 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/b78036a890a265e6b703aa7bbd51a41423135676 | ORPH
    mips64el |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/8a7f5e312a5192d26e1003ffe536b2887209fd45 | ORPH
     powerpc |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/b798e71ac9b55dc614db123f16122f61cac1d4a7 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/221c87c28e7ca4437523776317225cd09dc93183 | ORPH
         arm |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/b11b69905b7572d46743664717e917c8d78af9de | ORPH
      xtensa |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/4a4fdd910b6cde0084905cbe0e0692e800515768 | ORPH
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa37b4cee01301dc01394fb279e7a16f10e3a6b5 | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/0fa280e9458a344967c786b465741ede147c98b6 |     
         sh4 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/868a8fe91532dffb1a3823644000d80c6a8cce22 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/adefb74c717faefce047af304c1bb2c251a198cf | ORPH

-- 
http://autobuild.buildroot.net
