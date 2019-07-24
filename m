From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 06:00:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-23
Message-ID: <20190724060035.601E987CC9@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   2 |   0 |  18 |
   2019.05.x |  15 |   0 |   0 |  15 |
      master |  99 |  39 |   0 | 138 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 8 
                       unknown | 8 
              iputils-20190709 | 4 
                  dnsmasq-2.80 | 2 
           can-utils-2018.02.0 | 1 
              domoticz-4.10717 | 1 
                  flashrom-1.1 | 1 
      gst1-plugins-base-1.16.0 | 1 
       gst1-rtsp-server-1.16.0 | 1 
                harfbuzz-2.5.2 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
                 libidn2-2.2.0 | 1 
               libupnpp-0.17.1 | 1 
                 libv4l-1.16.5 | 1 
       python-matplotlib-3.0.3 | 1 
                 python3-3.7.4 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.4 | 1 
socketcand-df7fb4ff8a4439d7... | 1 
tvheadend-8f1de1621d78c9143... | 1 


Detail of failures
------------------

microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/eacad5a2f680ce60222b5386f50d2f122a0e25fb |     
         arc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/8d55b1f30285bd51acee5f72f197ff7924ac8572 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/dd79bcb02fc81c77451c0516416eae9fff4cc8bb |     
        or1k |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/71203890e2022df3e1a391ea02384eb20073328d |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/0daddb3b326c73d53684a406b1c13f7c257aa0be |     
 powerpc64le |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/b16d14d4889b0ce1124a66629a194032dba067d4 |     
         arm |        gst1-rtsp-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/b4ea23678bfab32f3a1fc0d49b18956c2599ba5b |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/b666b90caf5ab26a6df2d33e4b3408f9dea93e40 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/40e6643f0bf0b28650eed257a0b1a4f82ab37d69 |     
         arm |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/556f5203c105cac3eff4526e43ab886e0573f74d |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/deadb01bb4223008f6f57672bb82e31e846a0755 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/158497136ac4ea817271c1779748ff28b55c2247 |     
microblazeel |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/eda51359cbf2cde760a2be4f7fa185c2381bd54f |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/055f6170798f2a48d66212f8e1a76ab0252d5259 |     
      x86_64 |                  libidn2-2.2.0 | NOK | http://autobuild.buildroot.net/results/9b0489bed7b8885a58a5fe9b4dd46abbfcc6d34b |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/68f145df322e6ec84b34fbce2d32fff37650da9f |     
     riscv32 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/6f3c6b4c163b7bfdb3c7431deb7fa3fee0078fd1 |     
        mips |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/044c23e161dea3c4640f74d5003be11a2dfef33d |     
  aarch64_be |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/0e6e9563e50116cc8dcb03b4ec4d43ae2700b97a |     
     aarch64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/f040a843ed802d4e215f38e013ec838589688393 |     
        mips |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a331a019bb282dde70297d474f74b2f52b0ec12d |     
     powerpc |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/b3b3bbfee3a428f3804af7666d0839c6e3779ae7 |     
      x86_64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/d91c39e5140d39bd28f6138ec4df83c54fadeb89 |     
        i586 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/f24daad729210aab494aa9f6f67c4dce503d2d50 |     
        i686 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/48a0def7ef6f89cb40130df4a9a4957b234149e9 |     
         arm |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/3778ad603fdb400244281bb7841268b7ba183b12 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/fd4601ac90a9c2f28206389c218cdbea6e7aa769 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/1ec6a0663c5c53a0931d4aaed14a58f4365f59d4 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/95ee614d026115f7146013bd7219da797ce780df |     
         arm | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/439ffb29c99c2ef960c930a47c2c94cb6873b2e1 |     
         arc | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/80fdd2242283f054f623ad9ee4f3410f59f25fed |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/fb6b567fef35c5202b555b98bb797d535ababd39 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0594230241154be0a7920e98d36d4ceee4db665a |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/9ae5a339bc9019264c499456789625bf771dd71c |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/b03370ff01f42aa09c24a2bd3ce95b5b0f48422e |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/aafe8f61fe02db871222300dba8f4bc502eef33e |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/1a7a5d677ab58933ed7238c0197b50a7641d4339 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/d9176a350365ccc179290937b4717c3253ff6b47 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/183b66826d7f60d647e8eeef7b68ea4f825fb356 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

      mipsel |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/b3e92669e3de0e50f0e14f1dcbc87b206901bda1 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f52c6d59021ebbf8fb3f27c985811b94f25ee0c8 |     


-- 
http://autobuild.buildroot.net
