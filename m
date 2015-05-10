From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 May 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-09
Message-ID: <20150510063016.6FAAF100F2F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-09
===============================

        success : 270
       failures : 36 
       timeouts : 1  
          TOTAL : 307

Classification of failures by reason
====================================

                host-gdb-7.8.2 | 6 
                  snmppp-3.3.4 | 3 
            python-pyqt-4.11.3 | 3 
             armadillo-4.000.4 | 2 
                 cdrkit-1.1.11 | 2 
               host-mono-4.0.1 | 2 
                ipmiutil-2.9.5 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                      qt-4.8.6 | 1 
                 lcdproc-0.5.7 | 1 
              libarchive-3.1.2 | 1 
                 rsyslog-8.9.0 | 1 
                    ruby-2.2.2 | 1 
               libsigsegv-2.10 | 1 
          enlightenment-0.17.6 | 1 
           libmemcached-1.0.18 | 1 
rpi-userland-8f542a1647e6f8... | 1 
            gst-ffmpeg-0.10.13 | 1 
              strongswan-5.3.0 | 1 
         lua-periphery-1.0.4-1 | 1 
              lirc-tools-0.9.2 | 1 
               mongrel2-v1.9.1 | 1 
                    qemu-2.3.0 | 1 
                  guile-2.0.11 | 1 
                    gpm-1.20.7 | 1 

Detail of failures
===================

      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/6ef53aae42790f10821e76c69f3099f0b3e9f332/
      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e3ac58ac99a51e68db191d7b5605b87eb21f6d7d/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a92d72f39ff899d359df8cfa179c077a2a3f9936/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1d4dbb07389802fe14c94c992afefb3d8d5db086/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/8d38976177124e170ea59ca306c3f98756b6aa2f/
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f80b17513ae5c2797c9d0bb4db4b40e4c2e1560e/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/7c50d16493c96c8034c00116eb610cff60f18eea/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e0d8e508317d280985c24a276fae77830b3097c1/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/badc76848f6e7e82c64c901843dd9529b7907cc0/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/5d27e549126bb80df4e8758401b49b8e29d97325/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/28f3074e99a35f4321dad2fa6c5abdad14d2d2c6/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/a55976746c87f880100355e20d742e2e1def9f12/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c544701894bd5bf1eb1ec704701cffd77f1e8002/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/471d40d4e5af1869a485d9ae8eb027b83a96a9ea/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ea198ae049f6ba12406993d5cf040c4aceccce81/
     powerpc |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/55bea9abfe4ce439f3ed970ebfb0807d0cc07396/
        i686 |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/a6994bf7038246d8d24fe8e29f7ebad6e5cff38b/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/fd965d7006306f3a04f9aaec3d4670dbe44a3532/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/13800e3b52c9f6c84f85325710a59c7b3c04d0ee/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/59aeb475d5b3a062861ab5898542abe3d70ec3f1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a9789551b8108348b0db0c50b6dc3bc8e5e9c1c7/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e3bd3d51005a05cca0ab057900cc310bb93a01f9/
        i686 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/09f5fa52f49f82d1d24c87dac2a86955182c1b7a/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/1b997b39a3a0537bba91ee7fa41f5602e89f9b40/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/7043ab8c5b5953f96f86431a4fe8bfc8dc04749c/
         sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/b69ccd5865f7957b22ca902da7094fa4ab3ba669/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/02755e9d704126d614527037cc11348ef84e6272/
      mipsel |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/7ad7b4cd72c9b1dbae206412fcb7b6749bd24d90/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/ebf31a7c7ea95462b9035f1329f26c7f55bfcd67/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b8d07005d37e890bd0ef92bfb918caec9961191c/
         arm | rpi-userland-8f542a1647e6f8... | NOK | http://autobuild.buildroot.net/results/c97f7df043469bc51ebbb41ddf30f8e82d4e6bb5/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/34bbf1bba7c1d3f8d6266f9cd8aff87f2c052b3e/
    mips64el |                     ruby-2.2.2 | NOK | http://autobuild.buildroot.net/results/4be1acec48eca39d8e7ffd7dbe9d021afbe9501d/
         sh4 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/8c9f622e3e77dcd617b7085821534899253932bc/
      xtensa |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f8ba099f671faf2e3615bc7f1e5d82653640f852/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/64c948b0ce2bc93fd273c2d3de7f988d6ca28bcc/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/5cb94169741a8c5ea9d387b7bb1dc9f90d9587a2/


-- 
http://autobuild.buildroot.net
