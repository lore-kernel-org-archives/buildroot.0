From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 06:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-23
Message-ID: <20190424060049.B12A185BAE@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  28 |   1 |   1 |  30 |
      master | 228 |  43 |   2 | 273 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 16
        libcpprestsdk-v2.10.12 | 4 
                cracklib-2.9.7 | 3 
           host-cryptopp-8.1.0 | 2 
                  libnspr-4.20 | 2 
                  linuxptp-2.0 | 2 
                   netsurf-3.8 | 2 
               wireshark-3.0.1 | 2 
          dacapo-9.12-MR1-bach | 1 
                host-libsodium | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
               libsigsegv-2.12 | 1 
                       netsurf | 1 
                 qt5base-5.6.3 | 1 
      qt5webkit-examples-5.9.1 | 1 
              spandsp-20180108 | 1 
            supertuxkart-0.9.3 | 1 
              swupdate-2018.11 | 1 
           uboot-tools-2019.01 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/dd269e0f10bc0d2ca3685b1b6bade2c8821ee118 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/a504fc67d9f9ddf9e2bd93fe5880f604bc7b65d3 |     
        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/c2447587c3d619ac7ba882df0356e7291d133b16 |     
     aarch64 |           dacapo-9.12-MR1-bach | NOK | http://autobuild.buildroot.net/results/7db9e700fb6c384ed3f10ec00b42bec0de47b5e7 |     
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ebc6d22d85d0766728a6195d5e4706dd489171d3 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8eb0dc8313e94f28dc59d92c82853006dadd6233 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/34c07993ee2f7c97bfdac298bc1af9bf44550562 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a80b4f6489d079f645d44c17b4c657192e34738e | ORPH
       sparc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/912fa66ddf33b8500753cc88b4691e5ead2b5fc7 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0ed1a3809863ed9125a626afb8a7cb39c49e3dc9 | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6df370113e2cd462a8be3a0c08e7b408f8e37d58 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3b6527ffcf05a93a8a3f14f6f89de25422d0e818 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a61f24e9f117c81893c58befb20d21179e61b85b | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0610c3eeabf0334953073a6c7313841cd771db30 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0fb3ea42b27fe037dedba722112b6fdb52826bd0 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/eb5fb16f100cfb57246746f1f703a572c193db99 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f8afd243cce609b7aab5fe630bbd66eb3327b789 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/55f1c823c56556b40e29a0a8b3614ae76cef45e0 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/dcbd053a61ec6c83c78e5f90b2f1e3f91d5c2b4c | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/39f3caf5df1ba8ab276a0dc1177aa2c910f170b0 | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/458d1f4d611aba192ec155dc80d1715f49f810c2 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/0fb4c87e9a8676b20529ab69dd0e9d9ac29c7a76 |     
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/864835bb8424cfc4a8c9473c503fe7d7f7a4e2a7 |     
microblazeel | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/cbfe0f3217877bc33588256f368cb05bc2b74515 |     
   powerpc64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/7612653cd0987aacd7c5cce4a7a26a045cd814e7 |     
 powerpc64le |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/dd9467feae1611dc89be955ecce1e7d9fc92756e |     
        mips |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/9e9da232140de75aae7e6c4409c4a1c576262ca3 |     
      mipsel |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/fbc6c53989a92185f1c9233113e588462811af4c |     
     nds32le |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/5f824a1747d556d0a097caac9c2f98e2eb0f3116 | ORPH
     nds32le |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/32afd08d0427afbdbc88dacc9f03ad904515e374 | ORPH
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/a2fc44575a900f2221c2a3a11491c527871555ee |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/11054221aa2f09ccaea7db54a1c51f0b3ca42777 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/f671479148665681cec8461adbd7a9e4adec4380 |     
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/7f05b5c7d386e8f7bc3a701d60e4345efbcd7af7 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2696f5ffb87d6cd8e99966171c430da477fab60e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8bf421a7fa87780b60186b8f0b43697d9d921822 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/23107279cafe9956cf6adf4d32663f847a1066bb |     
      x86_64 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/ac6eee7089c4536f513c57123aa30f03f6dedaba |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/775d2e0bf4a5cf8e9b6485cf404bc9d1233d7b2f |     
      x86_64 |             supertuxkart-0.9.3 | NOK | http://autobuild.buildroot.net/results/69e1f5ac980a9144c69015cd833dd4346b05aab5 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/c430d8f78cf9fd190f21f79a802195a17db31541 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ad3edbdb07eda9650ae3682b49a53bea027c3eca |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/3e35cdf28147a5464c04934853fa726f0a90f1f6 | ORPH
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/419468f0d7d3c2b64d420513aa9505c6de097ed2 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/5b1a6b0f3cc70be9922c992033b4c0437ad35e1e |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 1 
                 python3-3.7.2 | 1 


Detail of failures
------------------

         sh4 |                        netsurf | TIM | http://autobuild.buildroot.net/results/32b9ff534d00ba8164e30852b286ea97aba7fa20 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/88df128123948603135826fe72009b70ac9340ad |     


-- 
http://autobuild.buildroot.net
