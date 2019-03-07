From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 Mar 2019 07:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-06
Message-ID: <20190307070046.D6B7685623@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   1 |   1 |  31 |
   2018.11.x |  24 |   1 |   0 |  25 |
      master | 201 |  85 |   3 | 289 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 
                       unknown | 1 


Detail of failures
------------------

      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/a2e3f2f8954e036e786326b1987b306a5f72f18c |     
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/b249c529415bd47758e57a2a580ca46af120d07e |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                   systemd-240 | 1 


Detail of failures
------------------

      mipsel |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/8b40a4bee139bcbf912e7d3d2cc8259dc9840e70 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 23
            optee-client-3.4.0 | 17
host-imx-mkimage-rel_imx_4.... | 9 
                  flashrom-1.0 | 8 
      host-uboot-tools-2019.01 | 5 
           uboot-tools-2019.01 | 5 
                    ncmpc-0.33 | 4 
                   netsurf-3.8 | 3 
              qt5enginio-1.6.3 | 3 
              spandsp-20180108 | 2 
       gst-plugins-bad-0.10.23 | 1 
                      gzip-1.9 | 1 
                host-libsodium | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                          opus | 1 
                qt5base-5.12.1 | 1 
               waylandpp-0.2.3 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

microblazeel |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/cdf0fb462eec143ea881d43cdd0c69c86122f66b |     
microblazeel |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/5d7bf67039ab86d54145fa8f14da446c3f4572bc |     
     riscv32 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/fb95c22cbe1d19e73f0089103ed6da2f4b3081c8 |     
         arc |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/fa35292d178721350302f99093058c54c7372722 |     
microblazeel |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/992cde33cfdf1f423389b597593239086f562394 |     
      xtensa |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/12aed8bda14f3303ea7aac2cc73150fdd7ca847b |     
      xtensa |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/33920367ac1c9d7e8108ccddad1263f09f637204 |     
      xtensa |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/df4d9702959b610762e87cf21fac9de62365dae6 |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/cf4bbd4104c13f0d609fe53323ce43648bf1acde | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/2f24498ea7819ac580a2465b287030e58ccd5cec | ORPH
     sparc64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/5ca251d71f630c591e07226f2767cc88fa85fb8f |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/d8717933bd1bf5d49e838830be35f8970ca5748e |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/ce6d7cd5f69b8eefa30b22f588ceb43ecb568c5f |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/45a5745e16895ff9cde94689d62fcb570c6d475c |     
     riscv64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/fb0f2c295141e04239b0b3e5a9956772703ed62f |     
     powerpc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/ebcdfcf21def65720838cee8d19aa3c978033055 |     
         arc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/19f136a239013ad71b354f7e75d711b0be0c9506 |     
 powerpc64le | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/5eafb77e429dbde31abb108e4147a9c84d1dcaa4 |     
    mips64el | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/9f72d2f4da1941823473dd8bb0825ec0d64bcb4a |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/60cddc3f15938f42748c8c23e903262f62284e9e |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/034333f6709eafc9d56aff744943198ca0cafa05 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/10fec6e728d53fcd196ad0f007d5a182fa971722 |     
   powerpc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d5fbf46ffc3a3a02a51e7130500dd153114bcbf4 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5511498d5e802710fff512293138dd1ec8e182ee |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b1ed9ec58e8300fbcd05fb2a1f3add2ea9864d7a |     
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/15f076c24c1c9c229feaec66c431d22f05d38201 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d94172018f1d7b55bff0599f5544fc27fe50aab6 | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/404343182be54d044a93be5e94c6e14045cb5ef5 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/461f5a3aad8af2c1de5d1f68618e0f7ba196428f | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/37a5a2a1c9f5b73e99d9335464c4421467bf19cb | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0eeaf471c3c1ab649489282c2b8e100707535176 | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/48329d54e6777460adc7390543a4e4a1d4111766 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/65cf4a99255ee91c791a422112548b59742271ed | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a698976a80efb73052e3e09d7a7f0d0255166aaa | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6cde8810f84b03637ab9c3bd63cf16a783886141 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/07463a682e3ec2f4ff84328885fcb9551582a397 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1190e1fdc5304af454b143fb680f24e2d97ebc2c | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/ba4707f3f19fe29f72ce7ca83fbdabaf82c6dd36 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5ff44135567ed625e1896534b82186173d8a296b | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b95886c2e8a0d5d40d2c9c52f7af840da53f3b27 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/63b0c1c7a60d6dbb3d934557f4e83a761134f9be | ORPH
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2d4bd414d379ff9cdbf91d5cae6b7ac50303a4b1 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/624c3282419f8a8ac64680283e923339f463da4d | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c7f732ff9443350c958ed4b9dd21b62b9df8da7a | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/8b5a45952644fa4972eec2f7c25cfbc395fd0f85 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a0bccaa06c51e34dbf6b29d582fdcd681b1e62d6 | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9ee50b9982e8fbfb8141a69ef7ab7de3fdde67e5 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4a60537e4c1d89415f66c637481cd0c6573e02c1 | ORPH
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/423b3918c4611d2ad5948ba103dffe69e0e0d035 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/165e151d3415081542cbd93e9fa57e8abe02d8ae |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/54388078272513285fcbee00f6ce5e365f3a163f |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/bae917ba74f0b1bf6d263063c0ee08300dda5801 |     
        i586 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9fa7a9d06d7d61c624ee9d14f18abc2e7ff89b8c | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/e2605c16e2437b9054e8fa9c281d75bf433c456c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2975e1780eee0284e0f9e96d99b8ca8a86c7a721 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d73bc70b3bac9e369c71a91502c9df92be4da685 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/925a2d492fa22ea1267f3e0f548562d847db282c |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c9d0369963d3d06928bf478a0c1c6ef01f2b32f5 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d5c84b21fa33b343b6e569db7495f6cbbaf592a0 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/88ba89f07e44ccb1da794b76765c2c36665c84f1 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2437b285f80e845055d0d97b69bf6ec0d7009e6c |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/406f90048db097580b626ef889823132f8676ba1 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b6c24f22bcb1a7beb5f2b0a72941845fbc1dc3d4 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/5811022a8b0ea25a70b2960330fbd05163d14912 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ea9c54a553a43fa41d2a9fe024a1c149b09c02d4 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7619ea0cd9d22f8c830140001a10f4b7c97d2044 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9322ba1c4677f17a9f0dc11fe6e38b761be9188a |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/293a8cd1be381ed66eea92d9d1a45bb784883362 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/339cb6b2adaab84c1da7b73ea78c62432b0df116 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7822fd193cac8ea591a9e03144599837d625df9f |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3e43a2b1bd72c25d600eda94b28d7bd910abc0d0 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/060dcd36ee90c52815a8ce4961aa8f93a481c130 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/7a8454096120ce30ba675b5c4764faf6f10b9e7b |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a4cff380f9dedb27cb77006ad5d69349730a3e40 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ee4243d959fe8ce246964e44dd43cf4eab5e3e0b |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/579dfa53451ad78563faaad514f47d80851c3234 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/c48a976b2e71bdc84823da029577156561a4a435 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/6103fc6fdd7bf858444e149e483b7449c4986dad |     
     aarch64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ede87d580684066a72c519c862ee5d2ac26a5df9 |     
        or1k |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/250fa8c925f5c36b6f0573d7d72313ebab4a4a5a |     
   powerpc64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1199e95c5d4252b88e1e6bd5ce30dfc641047b06 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/58c73d2bb19ad9acd3c08a0f8c6a14a2be436862 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4c2d91489c0cb7a1d43665737919800615601193 |     
    mips64el |                waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/c61e024bb092912c80dbda62300ef03e13e6ba1a |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/5c12e3b9541495320a696a67b4d8e4f181f50455 |     


-- 
http://autobuild.buildroot.net
