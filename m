From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 07:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-16
Message-ID: <20190317070051.2875C87C91@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   2 |   0 |  31 |
   2018.11.x |  28 |   0 |   0 |  28 |
   2019.02.x |  24 |   0 |   0 |  24 |
      master | 217 |  48 |   0 | 265 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 2 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/156a445efb75885757f46d76f4ad7848d3dec805 |     
        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/4887731efb5641d524fcbb5210c2fa536c754eff |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2019.01 | 10
            optee-client-3.4.0 | 9 
                   netsnmp-5.8 | 5 
           uboot-tools-2019.01 | 4 
               wireshark-2.6.7 | 3 
                   glm-0.9.8.4 | 2 
          wpebackend-fdo-1.0.1 | 2 
                xapp_xfd-1.1.3 | 2 
                  dbus-1.12.10 | 1 
                   dvblast-3.4 | 1 
                gerbera-v1.3.0 | 1 
                      gzip-1.9 | 1 
                  linuxptp-2.0 | 1 
                nodejs-10.15.3 | 1 
             nodejs-legal-info | 1 
           oracle-mysql-5.1.73 | 1 
                qt5base-5.12.1 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.1 | 1 


Detail of failures
------------------

 powerpc64le |                   dbus-1.12.10 | NOK | http://autobuild.buildroot.net/results/9c3ee798fa6bb501a20a7892c0b085d2b279b664 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/34d24339314caea7328675a53ecce946f84b4123 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/9222a4193d14c1bbbf64958f047c8832fe53812f |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/2dc28bb8c3f3b48dd35d85fd811ffc505f84d696 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/78d139eb1ca807072159489beeaf4018e4d0d41d | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/79dd22b611b6235d2ea4299e2a047c2419f9395c | ORPH
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a4715d8a605677e6472f55083a4c103aa4dc2684 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c62c824453325e7653b172d9b2a9fdaf04e2db3b |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/522db2d6fe50005a537218780ba2ddc4f59a7ba5 |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a8829fcbeadc5450fa464152d030a2cf8ce3a145 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8919a238adf8201bcafe2787eec1ac7a4e32e0b5 |     
     sparc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8dd57650608ac92c6582b0dbd27fc4ffe32b9420 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/645e7e90b2c6a0738ec0914b08a375b9bf523933 |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0aca57d1dbb04a8bc4256e89fffa0170e5ad739f |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/465e99b94aee270941b606f8c39b727e0fb99c25 |     
   powerpc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f83e77bce97a6c8b488f71e5b9521e1ca2d02c29 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/b147ee3da000adc8cc2048580521f94112a39523 |     
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/44c8e6e35664294332de50a32ba17c96309407f8 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/a9911df22fe9a5ea9b301174c465897b9f9e187e | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/1f28b5f6f34628a90a47179d7cf33e674ebbb007 | ORPH
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8d6a2b653ccb87fb61bf31bbaf334140a03f7580 | ORPH
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/bf5f4793e550a603f9dc196709bb2952b3494c8e | ORPH
      mipsel |                 nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/804951467d3f5b212bd33b95dc8fe9c6f5f63838 |     
         arm |              nodejs-legal-info | NOK | http://autobuild.buildroot.net/results/bb6cb93f323be22e4c0efc05011042526c01f62c |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a75abec50d69cf7a06848750db5febde1d69e6c4 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/45b6dc3d6fcf577e9404c65f4659eba4c6092673 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/354f08ddad330aab9c81a9e9b024dd3a22c8d57a |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cbc728297e61fe5b31c7c08be58d0636d60d860b |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4757ec69c1e0fa4e5bdcd05e99c098ab918add7d |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cb4fdb292f2313e3088b1e653d65ee9c63c18092 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f7272e5ed3f3fc0ef2e2ffdb7b0e881814c6dddb |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d0a10a24c9e12e5f272a071953a4539cf4947018 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1b364afda1cb75e9e8b5a277d7d67eab0a054d55 |     
      xtensa |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/c7d83f3a3c9af95b709e746938333c28c1b67184 | ORPH
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/b1422f01bade75bb80d9f8fe831e112de542c80f |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/090f76635e285ea411a62ee8f45e5270d0e83e5b |     
        or1k |           qt5multimedia-5.12.1 | NOK | http://autobuild.buildroot.net/results/bd2a1cad83048f24f1df8d5493421b91428efbe4 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/648a6cceaaa8c4720a40eb3acd71fe9089e9d51f |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/21b6f0f1b6b4764788c25c7223f06e512295d744 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/162e9ec0e6ddacc037541e39c4b8f2a107867d60 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8091458738caed2e71332e8ad05fa93c624ae764 |     
       nios2 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/1235d0fccad41e6746771ed01107d338dd8f439e | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/f7997bc92bbe9c3abb475f075926dd1b24ab3efe | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/5ab486341f233e8e6518d39b4d7f855e121a95d6 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/337e74336c42889737a65b9f77620d16e8bc114c |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/725a3e0f9d38b4f6d1c8ffa581ca9cb241d9b65c |     
         arm |                 xapp_xfd-1.1.3 | NOK | http://autobuild.buildroot.net/results/35fac70a41dc321f0b3401c88452b513e7a9e24f |     
     aarch64 |                 xapp_xfd-1.1.3 | NOK | http://autobuild.buildroot.net/results/6a487750c0f08f1a87ae4e30e139e5a1a6004b81 |     


-- 
http://autobuild.buildroot.net
