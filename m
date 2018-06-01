From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  1 Jun 2018 08:00:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-31
Message-ID: <20180601060027.2921620828@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   4 |   0 |  21 |
      master | 146 |   6 |   1 | 153 |
        next |  29 |  16 |   0 |  45 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   exim-4.89.1 | 1 
          host-faketime-v0.9.6 | 1 
                   libnss-3.33 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

      x86_64 |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/621fff14b549352ba46fd750d769450d180885ee |     
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/8f185a3772f12f442787dd37f5aed300b12a311c | ORPH
   powerpc64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/014aac80efe59a38a74fe80c6144d56d8b2f5e6f |     
    mips64el |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/3623bbcac203ff30c0be6bd39a63cdeb18026b4f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 2 
                dos2unix-7.4.0 | 1 
                 expect-5.45.3 | 1 
                    links-2.14 | 1 
openvmtools-5a9033ddfa95786... | 1 
                       unknown | 1 


Detail of failures
------------------

         arm |                 dos2unix-7.4.0 | NOK | http://autobuild.buildroot.net/results/ebfe81e65751d7a5ca3aa4e20cc708a24ba65204 |     
   powerpc64 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/dd29953f28577674070717cbb5feba8e12aad8e3 | ORPH
      x86_64 |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/57d2bebaa430d17eac06f1736d17c73d0b3732b4 | ORPH
      x86_64 | openvmtools-5a9033ddfa95786... | NOK | http://autobuild.buildroot.net/results/f2c73480b5a1060bb17ac260ef82c3e641fad085 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/360d6b26249dac494207ce7c44e34e88ff0d39fc | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cebd1d3d013d40bf71bf20696c28818f58d9533a | ORPH
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/1c237d9f8de88893b7094e0af9885d21d55e8446 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 4 
host-imx-mkimage-rel_imx_4.... | 3 
              librtlsdr-v0.5.4 | 3 
                protobuf-3.5.1 | 2 
          host-faketime-v0.9.6 | 1 
               host-llvm-5.0.1 | 1 
         perl-libwww-perl-6.33 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

    mips64el |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/c95c82e22a13bad55e4e67beff1aa527770c1844 | ORPH
        m68k | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/0af94c6ad7a956c7db35eee3074927b6866bc1b3 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/afab0f9496f536bdb1f42dfb183c2bbd25d4cf2b |     
    mips64el | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/2cdd8e2f5263745f83e998548d1eff990d429f02 |     
      x86_64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/84fdc019ac2f3010c810f144a9949a8b1863b5d4 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/89298001e58c6a20b4fe45f7d0d6b3e14df3e09e |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/d92a2336e9ca76047cea6e4c5650e4f00e9e4f99 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/18651c3f6cca288d3ae744020ced71be7a172097 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/59cdc81460228a50b01445cbc8ebef04a08b117b |     
        m68k |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/ddbe791a8749d865eb0abe882f816807971ae829 |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/ff86557b6e4e43894406a2dd0da45f3176423850 |     
         arm |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/aafbc679f9db3efb75623f24ffce05148f343e60 |     
 powerpc64le |          perl-libwww-perl-6.33 | NOK | http://autobuild.buildroot.net/results/6f7745010ca589876a24d522bc0cb4a0dca26768 |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/5480a6087a5a782505cec88f797116d8679df3ac |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/982f727495c1d3524685015c34b1cbb1e0bbb4b0 |     
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/b8f5d663412f369590697bd278aa4d871200db79 |     


-- 
http://autobuild.buildroot.net
