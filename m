From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 08:00:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-21
Message-ID: <20180822060008.D3614207C4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   4 |   0 |  25 |
   2018.05.x |  14 |   0 |   0 |  14 |
      master | 161 |  16 |   2 | 179 |
        next |  18 |  19 |   1 |  38 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.7 | 2 
                  cc-tool-0.26 | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f6562662383827d25bba232c0ad59356d6455b52 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ec2e3ecbe3f781571d63cd9a92f7f8ac0dd77fe7 |     
   powerpc64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a8d1009d8c3445b39483e7ed1d3304f7cbb18055 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/8582749e3888c61e485be21445232e12c57572ac |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 6 
                  boost-1.67.0 | 3 
               domoticz-4.9700 | 2 
                    brltty-5.5 | 1 
                    f2fs-tools | 1 
gst1-interpipe-10dba89eecc2... | 1 
            micropython-v1.9.3 | 1 
              mjpegtools-2.1.0 | 1 
                qt5base-5.11.1 | 1 
                        uhttpd | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fdbcb4d66e9976b0d67763596fd5cce103c5319b |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f5f96177f1a43d21fec21d5015bba106457e8435 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4b7544a073e35096c15704e05e77277b312e6781 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a37782b3cfc1a96cc129db8fade20a36a7b2d470 |     
         arm |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/e604f2d68a44005ee19b67782dc8bc75cd33ea8e |     
        i686 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/a4d09b1aa5d72dba0b95ac6951b285962d6302b9 |     
    mips64el |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/4a53c86f6ed0c99ac87e273864c273318b3d03ec |     
      xtensa | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/afa9ef39c0fdd30b578f4cb17628b6d0d26c020a |     
       nios2 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/5700e9d504c8531af797be8cfe62e8ad7bffcd8b |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/c9464712f43efb8954fd2e5460126ad193660353 |     
     powerpc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/ef2e07106cf0ae2ce55e58553e18a942c1799026 | ORPH
microblazeel |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/0cfb3c5f9f6ef2097ba2dc557666c4f6538135f3 | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/4bd7107bb49b203bf0a52001db199fc9f61076cf | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/cb1b51ddf52cd34888c650ef861aeebb8cc2615e | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/cc6ddf39668b9f20790f457fd00a4134a72b481b | ORPH
        or1k |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/f73e8e3c09c80853fb83ec9bdec55771425ea013 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a1008b119866a01e291a7802aba30cf46a71e6d6 |     
      mipsel |                         uhttpd | TIM | http://autobuild.buildroot.net/results/d4eb441aa19140fe98b3f1ca53146500fec9b4e4 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                       unknown | 3 
            host-lvm2-2.02.180 | 2 
                  libssh-0.8.1 | 2 
                     vlc-3.0.3 | 2 
               asterisk-14.7.6 | 1 
                  boost-1.68.0 | 1 
                    f2fs-tools | 1 
           host-libselinux-2.7 | 1 
                libsrtp-v2.2.0 | 1 
      libusbgx-libusbgx-v0.2.0 | 1 
                linphone-3.6.1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
            python-pyyaml-3.12 | 1 
                qt5base-5.11.1 | 1 
                rtorrent-0.9.6 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/c4c241020d9e7b139b59429498b78243090245a7 |     
       sparc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/89bca00553677db2702e549bcab3ef94374c2c32 |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/6317bc783d542eb5b823e30d284b600f32bebf16 |     
        i686 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/a9726d780c6af2e93097f51888af01743186ab17 |     
      x86_64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0d524f9267ca18d9269a0a1c352815201b90664b | ORPH
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/17f9aebd1e8671626519584c94092c92f967f24a | ORPH
         arm |                 libsrtp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/10e4198e8d86eecb9c672db77cbaff1e8a592ad3 |     
      mipsel |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/f2cc965bb134bf4fd9e625eb267b67c949c202fc |     
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/8aa2bd894416a4508ca7140f8947ff46243f8b78 |     
         arm |       libusbgx-libusbgx-v0.2.0 | NOK | http://autobuild.buildroot.net/results/872e2ab084c0c9bf466265d2f66140fbba692ee6 |     
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/c18b003ac6aa923fd4466874f695dbecb1994009 | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4b416edaec9528d75a82c9570b8f8297718ca62d | ORPH
         arm |             python-pyyaml-3.12 | NOK | http://autobuild.buildroot.net/results/a95b458c3bb0d767594a01de569d13bddcd1321e |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/4891d96f45c64c2e66fe819bd4175cc1d6243a93 |     
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/9c64888e96d59cb536dc7ccaa52f731118e69ce1 | ORPH
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/9dcfbdcb645a3baec35d92f3063afca8db85e10d |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/5ebaf3792882c2fde517a41103dd62333ffad002 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/6d84ee649ced20c6c5675f15b6ea8de168f22050 |     
      xtensa |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/3dbb17bc548aa7d5fecd857a9bbd761729d20d4f |     
         arm |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/ddb1ab48adb9705c44ed3d6d800b6d01ad52ac8c |     


-- 
http://autobuild.buildroot.net
