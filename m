From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-09
Message-ID: <20150410063020.3AE6C101166@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-09
===============================

        success : 159
       failures : 73 
       timeouts : 5  
          TOTAL : 237

Classification of failures by reason
====================================

              procps-ng-3.3.10 | 13
                     php-5.6.7 | 10
                      gd-2.1.1 | 5 
freerdp-770c67d340d5f0a7b48... | 4 
                  boost-1.57.0 | 4 
                     vlc-2.2.0 | 4 
           libmemcached-1.0.18 | 2 
                    webp-0.4.3 | 2 
                     at-3.1.13 | 2 
              postgresql-9.4.1 | 2 
                libtirpc-0.2.4 | 2 
              strongswan-5.3.0 | 1 
make: *** [qt5xmlpatterns-l... | 1 
                    parted-3.1 | 1 
               mongrel2-v1.9.1 | 1 
               libecore-1.7.10 | 1 
                    qpdf-5.1.2 | 1 
           host-openssl-1.0.2a | 1 
               linux-pam-1.1.8 | 1 
                  python-2.7.9 | 1 
                 ipkg-0.99.163 | 1 
                 civetweb-v1.5 | 1 
               alsa-lib-1.0.29 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                 leveldb-v1.18 | 1 
        host-util-linux-2.26.1 | 1 
                 python3-3.4.2 | 1 
                 cdrkit-1.1.11 | 1 
                libevas-1.7.10 | 1 
                   erlang-17.4 | 1 
                 rsyslog-8.8.0 | 1 
               host-qemu-2.1.2 | 1 
                netatalk-3.1.7 | 1 
                   lite-0.8.10 | 1 
                     tmux-1.9a | 1 
                     gdb-7.8.2 | 1 
               linknx-0.0.1.32 | 1 
             armadillo-4.000.4 | 1 
make[2]: *** [all-recursive... | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/0eb1c9798bb7c2d2db2a0fab3ed7038c4fa2f376/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e2cd79d3252e4daac0ba77bdcc9d0d4c4d2ecda4/
         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/0958a098b0b0f584d67107ac4e447b69ad8e037b/
         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/ad139bcaf0ff3cc8da133fbf1b050438fdf5cd85/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7e61912e2acb8dd62f59ac1dba3061aae036b7e0/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8cdac9cc67394aaae09ee816a9adddec762e3bd0/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6ec1775a8c19a326b5fa270bfcaf14f0a5747247/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9f8b51d9a0697c7eeb1e33b8a11551cdf8e81373/
         arm |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/833947cda53cbd8a71cbf4ff88770e6be2a499e2/
        i486 |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/fb5159adf1c8614da2402add3c3b4963950abf89/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/609571b0b964f5dd98bd8a0273cd9e1bc6936a5e/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/adceb7220741a420dca6a5441320e9e52fcfc3c9/
      x86_64 | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b19f9a26cabd9243be960c15ca55f46fd7495721/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b517df2980b3e2a10f46150ee0c3e8bb11b6f51d/
         arm |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/dfed2b62aad83cc960ba3c93b7f0a994f18ad22a/
     powerpc |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/a919d2bcbbd573e7a5556fbcdea053d4d451dd50/
         arc |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/526550e73581a91427b394d566d3389554ee90ed/
         arm |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/b89d7e3a1fc9403984bcd6462b8fd8d1196f2095/
     powerpc |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/61739df0009015451ba78a7ca335dcc0d0dedcc8/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/fb1e7535abc227f5fa511408b505807b63650515/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/cd745e1625cada5c327a906c19c6523823a52627/
     powerpc |            host-openssl-1.0.2a | TIM | http://autobuild.buildroot.net/results/61a102ca3f2cf24d0ec5e18bbbb40c841acf3802/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b1f67078d62401362369158068f022693c3bbc48/
    mips64el |         host-util-linux-2.26.1 | TIM | http://autobuild.buildroot.net/results/44d69fe8bc274f90c5a38e5bd370b07f87039bb0/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/12fcd1b71a3d3439b396b25d72bfc875db564f38/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/12aa1612d43eb359950545b8fccead5df837d075/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/d1cfbf9b96675b8b0cd52f117ac9f0dd4df0af6a/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/c3c19aca95bbcde864fdd735143ea087f0d598c7/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/107c3c98c84af6b3a6aa27a03bc2843376d429c8/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d70788a772941fd3edadc2437ecedb9122ba9fc8/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5eeb31988275e3ee7e3b4b535414fe8a0da55f2b/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/134e78ef1fa87f7fbf26c23ec5dfc68785d79613/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/10db32ce2f2892b7d5187c55215e63d8c8648a65/
         arc |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/7c13e39642296f98ceb835cf8778b0935d0d0777/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/f433c4dcea5b40a602ed3cc5d5698c8496650255/
         arm | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/4f95f72064d316325f5096c22fe3d020447d32fe/
         arm | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/e85a304acee8e18951882c6ac5c5046bc6698518/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/396d1532b37c912ac69fc117f0103079444d57bf/
         arm |                 netatalk-3.1.7 | NOK | http://autobuild.buildroot.net/results/a9b4c4c0d20ef52f5422297bfcb879f8b65fc0b6/
         arm |                     parted-3.1 | TIM | http://autobuild.buildroot.net/results/272de20787c45c34f9004473eb37f0138422d616/
     aarch64 |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/a46272b23a415c5c6e0d534bfaa8c5d5c80bad1b/
         arm |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/a8b9c7fcb2debc9748e9bfb9dcef1dd7d7244ead/
        i486 |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/e83a5b0d5fabfbb7e87af0f89bfd94b95d2a12a5/
     powerpc |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/10ae44cbc7c0c8e6f1ac54dae4c9d94c703aa3dd/
      mipsel |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/368da962f657801817a4b962415e55606915c871/
        i486 |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/40e469d61254433ce48700182668938dc9067897/
    mips64el |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/d2353e5f6451ef05d16e42fa9eb79c5fca5897e0/
        i486 |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/08c0e63ee532664ef32cf64a9c330ae621ec259a/
     powerpc |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/49915070145174787b682c9879811bae1df80403/
    mips64el |                      php-5.6.7 | NOK | http://autobuild.buildroot.net/results/0241256eb98623e35a9308a94e04970960f3e93d/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/a91bc596f33d8fc4fb2233e483b28c186487ed52/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/e27a5fd0898b9e0212e2645c6886665759b980b9/
      xtensa |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/7a81f0154a9d3acb6022b895514b6527022c2143/
    mips64el |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/8515f56a4f2a807a3f2f21bee4856f4917559355/
        mips |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/1cbaefc86313e26128c7de328d45b15cc142baa3/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/3741bd8f1525383e00876afc50c26f66d382bdc0/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/c0ff15860207e77b5ece5040b4ecb996c736636e/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/69e8005babacaedcebf6e6fb14ff5684c516af2f/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/afb542a4718512fc80b1e67a2e648d7c91683a33/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/80c9e226adb623182b970d429b96e6c3f801cbeb/
    mips64el |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/cb0e5e070b8c0732e2bc633d811c9da2aee7dd47/
     aarch64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/046e6f01f5114e8e5040526d6d0be2eecd0dd9d2/
        mips |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/b67751687099eff91bb8d31634f6c271c7968479/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/a4bea725ab9b2d35cabb79164a8cc2d8ead8754c/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/b88a11815a17e89916679c3e5872402cfe12b6e4/
      xtensa |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/27ff12127dee3b1a8df86ef8b05681d695b2cac8/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/8476757122820d4becabfefce9623dcfbb4a98aa/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/652a184e8825f57ecbd6afeb46f3d87388aff04b/
        i486 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/0bdde92bd0e0fa163c4b6579ff69b7f6e61a8b19/
microblazeel |               strongswan-5.3.0 | NOK | http://autobuild.buildroot.net/results/8f3e4031f722ff13bc3e9eeb88197c925977aa88/
         arm |                      tmux-1.9a | TIM | http://autobuild.buildroot.net/results/886441659a3e44cfce89c0b4f4ecd7300769b2c6/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/3e2171c4bd91027067bf8b53cf5306ad1aea480f/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/857a83c9e620804d83e5d131328ac0c39c6ec064/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/0187cbac5406fd1f08ced4cd6e3fbe155e8cc64c/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/b7e8227a4033843a5391e48e358074b4cd2da7b5/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/796bf7205167a091b70eb1f99c3f63b6abce9153/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/edf48f0ecfb959e2c0071c3795e6f2a543e3534c/


-- 
http://autobuild.buildroot.net
