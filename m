From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Dec 2018 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-01
Message-ID: <20181202070029.09A0320CFB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   1 |   0 |  30 |
   2018.08.x |  20 |   0 |   0 |  20 |
      master | 209 |  10 |   0 | 219 |
        next |  16 |  21 |   0 |  37 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/cb420b31840469ad9587ff79cb190ac2bb4018bf |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 2 
                qt5base-5.11.2 | 2 
     docker-engine-v17.05.0-ce | 1 
                      icu-60.2 | 1 
                  ntp-4.2.8p12 | 1 
                  quagga-1.1.1 | 1 
                     squid-4.4 | 1 
               waylandpp-0.2.3 | 1 


Detail of failures
------------------

         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/c2e2b232926528ecf1fd5acacd291e6eee5f3f8e |     
         arc |                       icu-60.2 | NOK | http://autobuild.buildroot.net/results/bb74ca02251d53279379ff643d454bd6322f2f8a | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ebe9f1b0d6c9fe6ba8b964b785ada353f33de69e | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/62448f3e106677940e3b272e5e91fa20a4658591 | ORPH
      x86_64 |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/b9dde103f56878dc1817d72743cb6ffbfb610cd4 | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/df0dab779213cf1ec3e511360bcc84f8856576b2 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/c65f65027a61beca47a28c828800b567b8a2fd01 |     
         arm |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/32f93a73379d073abcaf8936ffbb8b5707583024 | ORPH
     powerpc |                      squid-4.4 | NOK | http://autobuild.buildroot.net/results/7f23eb98c311b294c7f0e165279fa26909a5ff93 | ORPH
     aarch64 |                waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/33caa31dc7daace4ccdb8b745dd4523a5276b84e |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-2.0.3 | 3 
                apr-util-1.6.1 | 2 
             fontconfig-2.13.1 | 2 
               libiscsi-1.18.0 | 2 
                  linuxptp-2.0 | 2 
               util-linux-2.33 | 2 
                  bcusdk-0.0.5 | 1 
               boa-0.94.14rc21 | 1 
                  davfs2-1.5.4 | 1 
             gstreamer-0.10.36 | 1 
leafnode2-2.0.0.alpha20140727b | 1 
               libgcrypt-1.8.4 | 1 
          libmicrohttpd-0.9.60 | 1 
                   trinity-1.8 | 1 


Detail of failures
------------------

     aarch64 |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/01aa55b6c381181f8b0daa103349ff3e499443d6 |     
      x86_64 |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/024c1e0179e4aab39ff0a6af76cb973db6e048ca |     
     aarch64 |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/b6a1c0cce438c3ef6f75959426816c52cc45e3a3 |     
     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/8fa7bcf1f9907e8970a3e2103d0ae6d44d9edc8d | ORPH
microblazeel |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/42f03312869605b090cc09a8d0f5dc51e26daef8 |     
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/fab354d541ed8191a5f7084981a06dc846876e6d | ORPH
         arm |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/b86ae489206fd8daf8a547244204450c5ca53b13 | ORPH
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/b1ec6611a35152f1fdb3483f3efffa98eb57a8da | ORPH
         arc | leafnode2-2.0.0.alpha20140727b | NOK | http://autobuild.buildroot.net/results/8b343619e4ebbb4be25d4dadcd3394051e1c1b00 |     
     sparc64 |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/d3e3529611202aa1f63d84a9e91f23fd3f136565 | ORPH
       nios2 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/98dcfe5c9fc3babd5c8d3116d5128d437715c44e |     
         arc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/7e4bb107322da0b89885ecb34b0dd8301be99fa7 |     
     riscv64 |           libmicrohttpd-0.9.60 | NOK | http://autobuild.buildroot.net/results/c6484b928f91db75bb9aec1532a1849596dc81b4 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/78db7125f7765d1ab613a21570ab88030ffe0ac4 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/768e2ba83bcc1380db180f0c6b7bc3b8c3f7409b |     
    mips64el |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/7ab2334ac07d9b7c1e0a7625b8ac338939e0099e |     
      mipsel |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/608b2fd5b56c05c12c1d5b0f7489f7a2e01fc9d7 |     
        or1k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8f6365af46dbe3e28aa0b142a0fd567e3075a712 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/702f04af21537879dfec414665c12c5fb2bd6337 |     
        i686 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/70b75f3a4c574c31d6e9f9460ee4774e1710ca96 |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/4b9b528ac74db337faa677bd7c6bc8145ce6b4f2 |     


-- 
http://autobuild.buildroot.net
