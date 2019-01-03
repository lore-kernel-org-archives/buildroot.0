From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  3 Jan 2019 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-02
Message-ID: <20190103070028.770E92074E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   2 |   0 |  24 |
   2018.11.x |  30 |   0 |   0 |  30 |
      master | 201 |  52 |   2 | 255 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
        network-manager-1.10.2 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/bc2ee174569a853be7b3c87e5422d181d7fb9a20 |     
   powerpc64 |         network-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/a14ab848e1cae09e943041b9748008167480d3f1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 18
        glib-networking-2.56.1 | 6 
glibc-glibc-2.28-50-gb8dd0f... | 4 
   libtorrent-rasterbar-1.1.11 | 4 
                    atk-2.30.0 | 3 
                  ffmpeg-3.4.5 | 3 
                  libssh-0.8.6 | 3 
                  libftdi1-1.4 | 2 
                   netsurf-3.8 | 2 
                        glibmm | 1 
                    host-clang | 1 
             host-grpc-v1.16.1 | 1 
         libcpprestsdk-v2.10.8 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                 php-zmq-1.1.3 | 1 
             stress-ng-0.09.47 | 1 
             terminology-1.2.1 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

        i586 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/86aa9cdde0a6d9faa3ba0d4e154b1a88453cf66b | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/368d08331955e5b179cc872d4f8416515addda95 | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/b933aedc84f21681033f109e2fdd58390dcde2e4 | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2155e418d2ab2ef8d1b7cd83998a59054ca546a4 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f6b3590a4c466f9ddf14b7b55b3902f2ca76a706 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/32e17b6f29ef9a15e09350bccda08c8a632c10a0 |     
        i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/cc094e0a7c130c60641d32e9f4cbc46b0eba0852 |     
         arc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9c87ecd5597044eb640d3a46ea0d118efd5d3f27 |     
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/604ac7d5b0829eeaebabb87c64528bef9aaa3d94 |     
      x86_64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/4d04aaea26fde89ecf19d6da726540747c87d2cf |     
 powerpc64le |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9fd6e7b2eb076c22e276e187d1a0a99a76c3f6b8 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c126e98c3b1fe30ebed258cece64b33a41fd5819 |     
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/4420a6602e14482b9be74b23f305c0fffede75a3 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/3e3f83ced72cd0fa4fb6e15d06c759f9c3729cd6 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/575fa648929df61de927fabe9fa0d5cbd4a7660b | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/8190eb74b2b97911e03671138487d747fcb22cba | ORPH
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/ab26ef117abc4754ccc4c978a44fb790c67c00d9 |     
     aarch64 |                     host-clang | TIM | http://autobuild.buildroot.net/results/637d62565a1b119cafdcac5ce04adb2205724491 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6d863532f98e4059ab3db604242eb275d00b7dba |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/3f3fc5ac36e282ccde4698f54b47bf30f2d12ffe |     
    mips64el |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/869ce70782f04d163441bd653a95233915b7f397 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/ea4d319dc4fee737aededa43304b118d3d2267fd |     
         arm |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/31d994afab2e23e1bd6af59e64e91b65bae3fe1e |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4a1506811dcafdf12d8295b98484918851e94cf4 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/962f46c1009a2cf0cd13c62637ec24bd71aed05e |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/db675e259ecfdbec977856ccd33d836bcc5fb880 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f74a590e80223f627842586f50dc6d1eca1a0e82 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/fd7ca20c4c8dc51441b04f17c5bc87e25f06eac1 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b66f17d327b5143546dcccd0c937d89fae1bc3d5 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f1a25efb20afed03f50e74c079e7ac61de22e757 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/134426a6eb9e12d7f223d9f07493839c43fd9015 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/64ae399d1d7bf5833825d500b2418ae9543afccd |     
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8ddfd9323ad0abf73c4b16a3559a9dbe19b01e74 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/98608ea84419d29c01e9e23216b2d1ea4d844f23 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e2833559139a1ffc138903edfd36479d499b53ac | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/611a87d2295ec1414bbec443d65fb5ffed88ca51 | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8e7c842011a6d59fcc6a7ab4ec2cbdcce5889cce | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/af1f4da1bde0b3af28ab6bb2d5f2cd33270c8ab6 | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d4eb9a0f6ac10b0a28015df03613a50ac93cc4f3 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c61b5416877c0515a11b0c8181a5607983b80975 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/489ef5fe0d55db75765421b04675749336aa4222 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/64260ff73a7967f7aa17a6f1bc71c04eaf654efc | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c2f12011a26dbcdf37d631c591a3f5f1264f9930 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f1e686f7f33aedd55ae4e45580284be574e1325e | ORPH
 powerpc64le |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d12531296ce6cc4b855af537a8a3dc5e447541cc | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/bbb6fa078bdf90ab5a98f8ab9856b5032a829628 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/36244b691b420f41c1935c6bfe925681e70fa58c | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/aa58a112ba967dd67bca5f2b927ebbed7ece4654 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/84d002d25d99bb689725bbed93e7d24ef5f6fb4d | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/deeb16582c00aa6d6862cb11134f9fac496a18fb | ORPH
        i686 |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/d1dad9a94993f2635a157c0c97b6f11cb3730c4d | ORPH
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/3cdd367140fe147f71269657c46f7fb3bbe36895 |     
     powerpc |              terminology-1.2.1 | NOK | http://autobuild.buildroot.net/results/6e445e8f0c973fad58937824452aac9b593b3e8d |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/cf335dc71d54458132f6887cc84e1ff6dfa2b5b2 |     


-- 
http://autobuild.buildroot.net
