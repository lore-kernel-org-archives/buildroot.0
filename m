From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  9 Oct 2018 08:00:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-08
Message-ID: <20181009060047.754D6207C3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.08.x |  26 |   0 |   0 |  26 |
      master | 161 |  93 |   0 | 254 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                libcurl-7.61.1 | 1 


Detail of failures
------------------

         arm |                 libcurl-7.61.1 | NOK | http://autobuild.buildroot.net/results/f98ad90a77295d73c3ef2fc704f5ec187a31832e |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 18
     linux-firmware-legal-info | 10
              ptpd2-ptpd-2.3.1 | 7 
                blktrace-1.2.0 | 6 
                     vlc-3.0.4 | 6 
                  boost-1.68.0 | 4 
                   netsnmp-5.8 | 4 
               boa-0.94.14rc21 | 3 
              glibc-legal-info | 3 
                 lvm2-2.02.180 | 3 
             util-linux-2.32.1 | 3 
                    brltty-5.6 | 2 
                collectd-5.7.1 | 2 
                   luvi-v2.8.0 | 2 
 Makefile:709: target-finalize | 2 
                     squid-4.2 | 2 
          synergy-v2.0.12-beta | 2 
     docker-engine-v17.05.0-ce | 1 
                   gvfs-1.30.3 | 1 
             host-gauche-0.9.5 | 1 
                  host-go-1.11 | 1 
                   mpd-0.20.21 | 1 
package/glibc/glibc.mk:143:... | 1 
package/linux-firmware/linu... | 1 
package/qt5/qt5serialbus/qt... | 1 
             perl-sys-cpu-0.52 | 1 
             qt5location-5.6.3 | 1 
       qt5serialbus-legal-info | 1 
                sedutil-1.15.1 | 1 
              traceroute-2.1.0 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/7eb8cf57a255f960768f1a6e60b526e8877bda4b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/3f9df5daaf50bcc4451e4aea34c76c4ed36a2c9d | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/061daf6f76660104b990f447163b3a0bb0f050a6 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/cb7b2d19342d5c63cbe9fe5e166ea79c22c1ee09 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/fe64c2d6561656f303ae799af2ae6c0e0a5d5738 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d8f42027dcb97f8a5e2a91bcddcc8d89c82c3aae | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2251c6c1ca9850d4edd1d659e605b8b410869feb | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/78bd307d862c4c0ad475b7ffdc13b0422fb97b38 | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/3f6ea22ea23bee74e79358f7f534e0245c7ff17c | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/38fdf721d2a34ab90c0d45cfd2bc354a89849619 |     
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/c1506a6da51c85251e47e53333a69304560fd71a |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/abfa4ba49b0c2d484b8a9888625cb5159cc5fb67 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/b87f8597aa9b2d088b5a14e0b15a219c9ecb74c8 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/19975a20eeafb3745c76836ab41fff355d5db7d0 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/67c35d6ae2eff1d8d534e279dfeb91102b777c89 |     
     aarch64 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/3092a546033b26d398d214d6267af4fd7588b53d | ORPH
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/52c5e357b5f92259e8879d174d7104b546baa7d7 | ORPH
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/6c686736d31a376b15e13e0f9828d80f185168de |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/777a1112341906dc69aa71e5e8a10222eeb6684e | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/511ea5e5e5dfffcdd9da80ddfbaf3bc4f735a399 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/17187079053359598d6f4e4d12feed5560acdfb2 | ORPH
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/66b30b979dbd8bf1c80b6d381cd367fa62a35c2e | ORPH
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/c4aeb3bb5a5a1e7f074e2cc2731d334b8d519e02 |     
 powerpc64le |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/8bea18cfc658375640a26015327fb5a3a62a1114 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ff08c839e15c2ac03b5544495386c2f9d9f1c05c |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/8a08ef479a549662e5dce436cea03b55a06bb803 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/f447ec396227801431114fc97564037aeb7ba695 |     
        m68k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/df841a0f4185db68c79ba01ea263baab4367bb29 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/3f93f55bc05f7d98af52d7d168f1666b99901e36 |     
      xtensa |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/11c07bceb803d89a805ef97bb6608df1a5f14e6d |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/84c353d9a182a49581c40a6ca8f4b962a3612059 |     
      xtensa |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/46f474b54bccde70cd75b4ef40dff165b179c246 |     
      mipsel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/94063c11fa58698fb8d297378dffc7e32f4752d3 |     
        or1k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/dde062246bc52d9d653b0fa40c79c853edb9d110 |     
     powerpc |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/df90d698a5ea09b6ce75b86c0d15b37f53526370 |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/c5bf3b0b40d9f8c074efc76fca421a6709da7a21 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/23f10af1dd129e8c7c62186d52650c3e25e8081d | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/07ed09ff2d09f750918e2b98dd3451dbf3ff81ef | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/c77f50c04a96e6820b332d6519cd98be41f0fcda | ORPH
  aarch64_be |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/84cf252fe09b2f22730b9f444d65725b6b1fd71d |     
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/388597e71129a5bd792d3052eac8e67bd0dc639a |     
         arm |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/0c633cacb97a326ec38cc4edecc1481a766b469b |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/881139fb049738b16609d39ad5a49bd77ff6b4aa | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b3772747af1cc7f82921d5d135513ff37b8367d5 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/096a72a6a48a65e0ec0f193768f9fbf5abb5727a | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/af67289acd40c90dcd530564219fa516a13e5a33 | ORPH
         arc | package/glibc/glibc.mk:143:... | NOK | http://autobuild.buildroot.net/results/48495ea41b3b78b4e2b9d49c4748ce7a1da08786 |     
        m68k | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/80df80fe82ad20fd63e21bcd20f46ccc5510429d |     
         arc | package/qt5/qt5serialbus/qt... | NOK | http://autobuild.buildroot.net/results/eb15667762465aac4607b0eaf70d303833f3c755 |     
         arm |              perl-sys-cpu-0.52 | NOK | http://autobuild.buildroot.net/results/2d7c213aa842f8d77b1da67fe20caf46b6258cd4 |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1905622b9c5d4629471bfcfe860e2f45333dbbcd | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/246267b9e307ac3f20665097f0be9f123a6a32c9 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/907d552b7ed45b2f7896f539ce378edc16e8d01d | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/60609ad3196f831add5792918d9417fa6e3a1090 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/91f68d799fbbe65629e30923c227930167755171 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7e6b4080b05ea59186b7505a5d58d2191d4f6b6f | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e23dddbee9903f856c96aa88a3fb5bd9110b3d37 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/b200f180e50d2cffc542ef0c43a77a1864082ea7 |     
     powerpc |        qt5serialbus-legal-info | NOK | http://autobuild.buildroot.net/results/bff1a8c92875bfc97e7f40d152d05d55b3f56a24 |     
    mips64el |                 sedutil-1.15.1 | NOK | http://autobuild.buildroot.net/results/2fc2d0111e467671ee4cec427234a9b2aada1cc9 |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/36125d345aafef41853fafdf0cdf62d8a0e73c0f | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/f046e3ebcaf5523d07a1ec8422456fee9143b3db | ORPH
      mipsel |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/1e0a2502d44076af32802b8a8dfea7baf8512fa6 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/2104fc45fce0e844205709d7cff07c6f35ea8713 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/21267dcdf23e22c788851fe27a7eac0fae08fbf3 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f0e1aece992f00d5d8914be579d518e7e3caaaa8 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/c7878a2f2a5b3596bf6d1a6ad1ea896f2ff8329e |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/f5c5cec460d0d45e9fa08f178b952d649804f2c4 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/5563bdc5305fbecd9cb958586d72611837458baa |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5a305e577d3b24a05521f04b5a8f246c160ca680 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/333ae1a940ac3a872b137d686b0b80533a78f9e7 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/49494349a4869d27e694221b9cb40f8734469577 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/f2b4771d30c79fbc060d1a00468be42653c0291c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2f79e89a3f4535e07eed423299d70177204d2cc4 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1a068e5cf3fd1e270f58d70a64244b5b976a1c8d |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/336489590078e0d95455a0f00d6e7d2622b11355 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/037ee57d1f4138beb30dd7063c3d2ef09a2d6c74 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/232b4b87fef4f7c5accc20b341f33b53fdad40d9 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/2f77ab55a10532992409e6c357e50b2e6e414918 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/e26d52be77f5efcf78900775665abb72d2de4df9 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/0dd2a6bf15af0136ca1e1af643ee31be81e5d5e8 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/fc426e1770d5f7e3065dad812aa4313d3a6a7c94 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/8d70df57459d24c72f11c284e67280bd25f17d74 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/23c85e7d71289dcebbf8ebf0d80396594119165d |     
  aarch64_be |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/123e008508eaa86b7f0e1384ac9339535aa0d6f4 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/3703b2693d63462734d2d3656d437d5c1c87631e |     
     sparc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/fa1c81df76b1dd6d8c390d912b1fa5eaf309ec66 |     
     powerpc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/72bac4d3b69b1cc06fe2ab0e09013cc820ed2dc8 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/19345db33be0988b8e04de02c6195e3f82040bf5 |     
       nios2 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/3853c288565cb3a52cc056eeb2aa342065375a0b |     
       nios2 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/d468c27f6c45c7e863002a50179e62272a271606 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/cede7aae77c0794fe7252675cf3e02ee5bbb0f40 |     
      mipsel |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/d609903324d44b970b1e1bb66bf5c4714104c350 | ORPH


-- 
http://autobuild.buildroot.net
