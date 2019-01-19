From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Jan 2019 08:00:33 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-18
Message-ID: <20190119070033.A2FE1209BF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.11.x |  27 |   0 |   1 |  28 |
      master | 200 |  50 |   2 | 252 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                    host-clang | 1 


Detail of failures
------------------

         arm |                     host-clang | TIM | http://autobuild.buildroot.net/results/f301576e5653250c4d31e5dc8868a271d2924e45 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 10
                  ffmpeg-3.4.5 | 4 
             libva-utils-2.3.0 | 4 
             host-grpc-v1.16.1 | 3 
                 dmalloc-5.5.2 | 2 
                 gnu-efi-3.0.9 | 2 
                  gnutls-3.6.5 | 2 
                  libssh-0.8.6 | 2 
                wavemon-v0.9.0 | 2 
        glib-networking-2.58.0 | 1 
                 gnupg2-2.2.12 | 1 
       gst-plugins-bad-0.10.23 | 1 
                    host-cmake | 1 
                        jasper | 1 
         libcpprestsdk-v2.10.8 | 1 
                libnice-0.1.14 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                  linuxptp-2.0 | 1 
                     lua-5.3.5 | 1 
                   netsurf-3.8 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                    qemu-3.1.0 | 1 
                      qt-4.8.7 | 1 
       shadowsocks-libev-3.2.3 | 1 
               skalibs-2.6.4.0 | 1 
                   strace-4.26 | 1 
             stress-ng-0.09.47 | 1 
                   taskd-1.1.0 | 1 
           tesseract-ocr-4.0.0 | 1 
zbar-b3b4e32b55f570372fc3af... | 1 


Detail of failures
------------------

         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/5cfa01a41951ee3be2e8c1cb10edac3722d72c77 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/08bd321f555d21615fffedc30fceb041ce3a53d2 | ORPH
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3beb2d503be119ddcfa66e761b58a712c8731388 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/47e27c394201817e8ae48ac4f04021d9b089a517 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/163bf602f6ef7aad6ed64ca565d6b3b956d88bc8 |     
       sparc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/9112fa8af0bb6bbb5afaa3fa2f132e78d3be3064 |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/58e9a0a4b65387ce528b48e1ea1f104ee1202d64 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/a1ac3d0ebd50ef71c64cf4e6e0c8998f09d377ca |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50 |     
       sparc |                  gnupg2-2.2.12 | NOK | http://autobuild.buildroot.net/results/c2c58f7125027f876dd96315500098bb8d3fcb2e | ORPH
       sparc |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/8f72a0ca7d2c964f90a59aaad9befd1d0ced64fe |     
       sparc |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/1724b1d6d96904a75833f3c12793e2b0913e0cf6 |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/d1f5299311340fa467c82f4d462e540b657c65bd | ORPH
         arm |                     host-cmake | TIM | http://autobuild.buildroot.net/results/b59ad732b80200d1b6cebad50d17245c42150bae |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3c4c167a6926cba4760edf9fdc63f8ba32e766e7 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6f61c1534c29d80d14a87c3837ab30244f648b5f |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/692c6d5945399eea63ad0fe1b6412b5c5d461556 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/5b6ee0efc300bf5061ba2f972e4542fc96a7e120 |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/a080dbe2977cd35e4f8351d864bd71aaa8f9b743 |     
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/fdcdb40178cfbc1a28f35010a71ffc61f4524b97 |     
     aarch64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/8a7de35026667712b657cd9d9e1b2109477a56e5 |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/067ca364a1974a17bf2e5223163c59fa5a294e8b |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8c42aeea7aab9fb96416c72b1c11b6995530decf |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/cecebe6be85d8f0400d81451ce4fde985cbe6cb3 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/b26d8ffb4a85343cec183378669a2c2130a68229 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/4caa37c4292473b88319cd64d84085c0812fc0c6 |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/af1d2126e35dddf43fa0372794876d0e83cb66cf |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/bb0a649e485b5cfd511db911088ac49191fb9bca |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/0e66c7f5a407c5c817c39accb27b06d6d3888a76 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d624a83fc089bdb78af4945a97d08dbfc9d35212 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/86b0cf13049bdc8d59629d9a3c0ad6f13e50ddc9 |     
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d09cd1422de764c84e2701644167992306d85eca | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c7a3af266c59770efa9a9bc5fc0296f1b46819fe | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e5a01f7c133ddbb08342ca3c6616b9a03de2dae4 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/10d4de92c39f7b3f3f033b1c98084db20f7c6d49 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7cbf1ded61e9ebe6c1a22f7d96a232a581564a08 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/20d46dde6d15071a7aaed31c15efe993725e0373 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d312d458a2ae69501f24554173fdd342649c453d | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e6e659a5825aa2af4038ba37ce01d29fb4c7c73d | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/83c7e63eb5b0123b905a0bd265d64aec1fe13fed | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ec25f9982fc18b18a56187171546d10f7993c982 | ORPH
        i686 |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/2684bbb1d46871cc2dee60ed241e8c48947fc5ae |     
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1036ee061ce7f7747d5514c61866da60bcfae769 | ORPH
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/22a28e8fd8182e1c908541dbc5b0ee087c3803e6 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/6c5ee3b8a94c7c2434a3aad303d6c7844b566b72 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/2000baf19e99949dfb934493e3080e593b1ad0eb |     
      x86_64 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/ec6c6c64a5403e2cadecf7812b939653be4fa165 |     
       sparc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/694df098b28ee80431bd88511dc81a9911960586 |     
      xtensa |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/a608e9bfb2b0161c45ae490e2866d96763593723 |     
         arm |                 wavemon-v0.9.0 | NOK | http://autobuild.buildroot.net/results/0a786908737cfb7cb093b1ef012060bed240539b |     
      x86_64 |                 wavemon-v0.9.0 | NOK | http://autobuild.buildroot.net/results/5f2cf1a113c212e056c475d866d4d0da053d223d |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/bfa78b5b21de62bfa53af1dd49547659f682ba9b |     


-- 
http://autobuild.buildroot.net
