From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Dec 2018 08:00:31 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-28
Message-ID: <20181229070031.506F02073D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   3 |   0 |  20 |
   2018.11.x |  11 |   1 |   0 |  12 |
      master | 139 |  39 |   0 | 178 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 2 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/5b6271141bf189ae2cbff2898bf755c3d245b079 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/2ab7860d53b24f41c2c673fff4611bc6f1631b27 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/51010073bb47ecf9597e7c462c77ad5ef804853f |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              libostree-2018.9 | 1 


Detail of failures
------------------

   powerpc64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/0986953a3e31b18bc870c25a0a77a3751161b131 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 6 
                     php-7.3.0 | 4 
                  ffmpeg-3.4.5 | 3 
                  linuxptp-2.0 | 3 
   libtorrent-rasterbar-1.1.11 | 2 
             stress-ng-0.09.47 | 2 
                   systemd-240 | 2 
    azure-iot-sdk-c-2018-03-16 | 1 
                collectd-5.7.1 | 1 
                 dmalloc-5.5.2 | 1 
                     efivar-34 | 1 
    json-for-modern-cpp-v3.5.0 | 1 
                libmad-0.15.1b | 1 
      lua-cqueues-rel-20161215 | 1 
                mongodb-r3.3.4 | 1 
                  monkey-1.6.9 | 1 
                    php-7.2.13 | 1 
                php-ssh2-1.1.2 | 1 
                 php-zmq-1.1.3 | 1 
                 sngrep-v1.4.6 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                supertux-0.6.0 | 1 
                  udisks-1.0.5 | 1 
                   whois-5.3.2 | 1 


Detail of failures
------------------

         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/0a0ebc59c204d3e21246d50130b0f0d5de4975cc |     
  aarch64_be |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/142c573a71df4550a8f474d4877f2ae0cc0c404d | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/6b9cb130f9649e28126852fe630d093c67dbe54d | ORPH
     aarch64 |                      efivar-34 | NOK | http://autobuild.buildroot.net/results/3dd82d63b9583696df538305fcea665c1c7bde5e |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ec0392422cb14b5a2e93a839e19e13c05ab660dd |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/9513a4a538ba0ad26a0e24a267c04803e362c65a |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e692f34728981e5f2f9cc893ee16ec16a6101b04 |     
     powerpc |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/0bf7c216b2a4d29f39cae25bd4f9f8b23e2fb9d2 |     
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/6a6aa29295bd70679c3a22a149e79010fa20c1bf | ORPH
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/cb5c1bcc8d95c65ae2027b7c9572e61211d84e03 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/355f5c2820859d7c1f55283ca873343063a96001 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/d8d25da0c2e79278c2a1c5516e592208269060eb |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/2f07b28552485114a9d496620196b2b313a13ab2 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/249f8fff82c34bdb814c182aa7ec54ceed21e798 |     
microblazeel |       lua-cqueues-rel-20161215 | NOK | http://autobuild.buildroot.net/results/1074191de657d545e59d0100ff3d0e83c2c7b087 |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/b684e810ac6f740ae03610a6c29c1d1dd102a699 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/8ee6998916c374e8867148ecb4dbdc9696ceedde |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/430c3c1375887c54d83e67cd591209b2146b8f31 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/35c04fbb46b6432f15d4f8f385450c9834ac534b |     
       sparc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/22520a91bc69c8e75a0ec23dcf971ff457aaeaf9 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e3fb0d720e05039805f5338133b278bee756e2e3 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/252ea9c935349889bc7b8783b93a268bb2a5252a |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bca5ca1b60d2aed7d983f5edfe7f79e6eaf2ce5b |     
      mipsel |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/8557a4da2e2825a804a1599ebb5aa12b5766f9ec | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/586f56e8fcf2d2bbbd3bdf69b1c3befff7ce8bbf | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e784342b980bb817de4d893a16601359880b6c3b | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8195826b4ed515591f8df54b039fab4e01db679f | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/211a695fec0980bd733688783375dfd000e6c7b9 | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/576f72c85b499b492961bbd5a24e4ef8696ab3ab | ORPH
      xtensa |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/f9638359ca3f127d64e6709b67e73a754d23720f | ORPH
         arm |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/f0bb762381948f7820405d307b12e2a95b3e8cb6 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/5ce7fffe569401aa800f66910b56de338d06640d |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/8f05ef30f32eff4abb56e2305f689edea9ffb9af |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/2bf09c42341313af0dd44b4458425c0541ea4a04 | ORPH
        mips |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/5b452c155917d783b3d8167fde48c2c938a74b95 |     
        mips |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/8f32d970c910a75ae447dde8195aa85766377d48 |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/e92b1d55f5565269bee74dfcbaac0968c1bab2a1 |     
         arc |                   udisks-1.0.5 | NOK | http://autobuild.buildroot.net/results/099df30e4608a84504059d1c92b1040727fbcca5 |     
        m68k |                    whois-5.3.2 | NOK | http://autobuild.buildroot.net/results/c139030e8383027dc679cfc59feddad426919900 |     


-- 
http://autobuild.buildroot.net
