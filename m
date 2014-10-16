From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-15
Message-ID: <20141016063013.EF9DA100E05@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-15
===============================

        success : 208
       failures : 30 
       timeouts : 10 
          TOTAL : 248

Classification of failures by reason
====================================

  getent-buildroot-2014.11-git | 5 
                libgtk3-3.12.2 | 4 
                    qemu-2.1.2 | 3 
                  thrift-0.9.1 | 2 
                   ushare-1.1a | 1 
                  zeromq-4.0.4 | 1 
                     radvd-2.8 | 1 
          sane-backends-1.0.22 | 1 
                  libv4l-1.6.0 | 1 
             xscreensaver-5.22 | 1 
                 libplist-1.11 | 1 
                 opencv-2.4.10 | 1 
                 webkit-1.11.5 | 1 
             libxmlrpc-1.25.26 | 1 
                  botan-1.10.8 | 1 
                 python3-3.4.1 | 1 
                 rt-tests-0.83 | 1 
checking sys/timex.h usabil... | 1 
              uemacs-4.0.15-lt | 1 
               host-ruby-2.1.3 | 1 
                  prboom-2.5.0 | 1 
        gst1-plugins-bad-1.4.3 | 1 
                      qt-4.8.6 | 1 
               log4cplus-1.1.2 | 1 
               iptables-1.4.21 | 1 
                 pixman-0.32.6 | 1 
                   nginx-1.6.2 | 1 
                  weston-1.6.0 | 1 
                    lftp-4.5.5 | 1 
           libmemcached-1.0.18 | 1 

Detail of failures
===================

    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/37991c12dcf5bce8c0282ac881004c9b98bd21c5/
     powerpc | checking sys/timex.h usabil... | TIM | http://autobuild.buildroot.net/results/83e84064d05b93be5630ddcb28e5a2dfc9a7e9c9/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/36a8a49ff50dc001fa8052c60a127df25fd6dc09/
     powerpc |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/c60dbccfd686062f533ba01e0f9b30d3e9edb664/
    mips64el |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/9c533b6bb0bc01076d906c68d2494fdf8f1e4933/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/f475135936af182a824ebe9cd15ebd7579ffa98f/
     powerpc |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/b29ccb4a251b9f0686abee6f04ceb57888bd6250/
         arm |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/57bc8ae14c01c3c806d8a7bbc1a13889f8e0a90e/
microblazeel |                host-ruby-2.1.3 | TIM | http://autobuild.buildroot.net/results/d96bb8b7dc9626e39f9bd50ca120c83a36ee9133/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/b2d5e23cad1072dea888681288fdcc9ea3e40532/
         arm |                     lftp-4.5.5 | TIM | http://autobuild.buildroot.net/results/ab04bdb871fbb0cc028c2390bb48b90d1d23821b/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/ea50dd75692aabb429628a4a7379a6b77ba2c1e2/
      xtensa |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/0efab4c6c8cd20ff8d02f90e456dc969efd4cc1a/
     powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/ad636fe7a909538a97042563ed255cff3f5bfd62/
      x86_64 |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/95f43cc9694899b775e02127307103ae6d0c0b09/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/1002d7ea08ede5583d2cdcf35df3ac9afd8602c9/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/ca246b943889566fe8c171b954523bb7f760215c/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/7a1bc26d0ba8984096105531b2ff76a3f6814220/
         arm |              libxmlrpc-1.25.26 | TIM | http://autobuild.buildroot.net/results/2a9e5cbbf2a06e7f4819f905233603d536f8715f/
     powerpc |                log4cplus-1.1.2 | TIM | http://autobuild.buildroot.net/results/6a8e44f31ab54b51b68bad9f613417d29469a856/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/addd970b65e7fcb9976593f57b0cfd786743deb2/
         arm |                  opencv-2.4.10 | TIM | http://autobuild.buildroot.net/results/39259cfd87f53f0098f0070fe123b86a76454aad/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/5b71f5ccb3306ee50bc393fe3bc2314bad0d1e34/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/f87149e7c63b631177e2cd57d169a2926f33c7bf/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f20d585c780171ab0b88ac619a97dd633980cef5/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/317fd086fb8b5542f539c36c63b77330594457c9/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/961a24fd4f953711ed8e33a4ee2571c4ad6dff15/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f25fa9da01a434d74e6c75afe6961abcf887e234/
        i686 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/2a5e51fc3ef1196ebbde8dfe6bb61b0d563fe361/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/f67774e9834de984c8916b24adc4fd77d2ce0e89/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/630412248451e3537d3342eca35e0bb3700bc4af/
     aarch64 |           sane-backends-1.0.22 | TIM | http://autobuild.buildroot.net/results/2291e873bf9b77da31357a5a9d3b45e24fd3baa9/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/523fd7fd37e529a55996557a2fb697789c853894/
         sh4 |                   thrift-0.9.1 | TIM | http://autobuild.buildroot.net/results/7575a94bfa80b26593258f2a284cd28586bb1985/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/bc93c4bb436abac8b859524a53a7b4c787d67617/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/a40388792f1cb3057e47c61d7873d1358ee00c52/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/108071c8377a6e0e76e40a24e3e39e0b57537cd6/
         arm |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/fa21f36c7285921203aa20b20878b50ea2f6bb0a/
         arm |              xscreensaver-5.22 | TIM | http://autobuild.buildroot.net/results/26dc061ffc5f169796cb7853b157213fc8e4524e/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/f62aba3795e55edd7147e6b888fabe1416825729/


-- 
http://autobuild.buildroot.net
