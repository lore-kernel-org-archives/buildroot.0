From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 08:28:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-28
Message-ID: <20170429062815.1245E20CA6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-28
================================

      successes : 144
       failures : 43 
       timeouts : 2  
          TOTAL : 189

Classification of failures by reason
====================================

                    ola-0.10.2 | 11
                protobuf-3.2.0 | 8 
           uboot-tools-2017.03 | 4 
                busybox-1.26.2 | 3 
                    mpir-3.0.0 | 3 
                 binutils-2.27 | 2 
                 libqmi-1.18.0 | 2 
                    mpv-0.25.0 | 2 
                 efibootmgr-14 | 1 
expedite-0529ce56b6fb01e965... | 1 
                    ffmpeg-3.3 | 1 
make[1]: *** Waiting for un... | 1 
make[7]: *** Waiting for un... | 1 
                    qemu-2.8.0 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
          shairport-sync-3.0.1 | 1 


Detail of failures
===================

        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/700a99f7dba4af1c8e079c1a9aab9ac0c3416d5e | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/ff00985da822cbecdca62b6ecb9ad4c7a8b10aac | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e79fb4cea40ebc6eb0fb8fdd972c334afab69f7b | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e17b67061e67d9f8761ba25c624c7cd68c75a2ac | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/0012ffff6b484f3c0e0d3220589339466c0a9206 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/bb20af261f46291cc535140f6e9cf7fe5f8ac9ea |     
         arm | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/930796603d37bc309a591eec68037192c51028ce |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/7e95ac6d78bc1732127bea084b4f791e52637abd |     
      x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/bd1018295ab6193d94904cf90804fc82db087e3a |     
      x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/93803bc057d42cc05b67376fba899bf00cb22f2f |     
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/bdce0b5b31b3ce5fc69c7de11c0de74c5c71c82d |     
microblazeel | make[7]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/064fcec8a8b7e832ebeecbefca31d0b7f8d77e02 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c360581c2925529f18635aac32c2865899f5e0f5 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/3de0ef545a7303ec6564ecf1a1da3dd539957ed4 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/10f548f4ff173f9b04ee74ae255fea852f01a2c9 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/e86aa4b50ef419f055e0a337d5201499051e8213 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8463c24e20468688eb2a4e8d9aec8da353d0b315 |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/32c9ed7688ef5a045afc296f36b63425a8b63ffc |     
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ae26b248df729e74d9600cc8bcdaf1165ac33c4d |     
        or1k |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/82e92211e651cb778110e1e7621a83333af57e7a |     
      mipsel |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/517c70212804ad17c506090b797d15c6d0e7fc5d |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/4c9a2a04d34e97fbce5b7aee3f514836b748465d |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/5877b2301b7da43c50127a4c5f648acd3b0264cc |     
      xtensa |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b314811dedce04ebdc779df67de6cb59a1880cac |     
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/b09e22437297c1a30667ad12958a9ccc939675c7 |     
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/440b60a195df91eed613522f34291fd8604416f7 |     
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d9a24f7b715100be1580a568a5e3ff72b0389165 |     
     sparc64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/7d2c6aab2941a6d95adc2abc5fe4f4c245626405 |     
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/11129fd45a0ae08f9290980963ee6eb376434dbb | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0ce905f7d126b12d45074dccb3a90013a95dac82 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1a546badc40fb1d55316ceb8c98cd2347ea2ce9e | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f603ce41122d27726ff3b90d71e582a38947b880 | ORPH
      x86_64 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/578ca6894cca20957e59208c73406015253e3893 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7425b1fc69a8c1bdc81c967ed0eba254807e9210 | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8c6c8675c6b6d787bd6c580001174e64affd8148 | ORPH
      x86_64 |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/46f77daa2b5208f43635f07bcf6e82894f3785cf | ORPH
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/01e138d41ae639cf774576a95b687b0762ddb7fa |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/97e3fcd5bad47ce04b2c4024f58adb2f989e34da | ORPH
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/ee9bd8d3b62ee4c701ac8dc157e708bce61fa206 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/528d6265ec9699e044945513f5617702fe097f54 |     
     powerpc |           shairport-sync-3.0.1 | NOK | http://autobuild.buildroot.net/results/1dda55079f693caa9e99bd409373079264fc1e6a |     
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4236f20559067ea306082dc9bfda338e908cdd2f | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/10518e967d7752147fb962791047c8d8001371fd | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/37290e3072c7a59cfc141308e98cbd6a1dc1cef4 | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/30bec806c91bfc743e412d2eab8904158d1e10e6 | ORPH

-- 
http://autobuild.buildroot.net
