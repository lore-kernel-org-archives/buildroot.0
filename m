From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jul 2018 08:00:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-22
Message-ID: <20180723060041.E7B0220922@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |   9 |   2 |   0 |  11 |
   2018.05.x |  22 |   0 |   0 |  22 |
      master | 131 |  30 |   0 | 161 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

     qt5xmlpatterns-legal-info | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

         arm |      qt5xmlpatterns-legal-info | NOK | http://autobuild.buildroot.net/results/b5150f488dbc234ca8c6d515ddcb060008e2490a |     
        mips |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/d39c4bf65410e217b7e0d4367d454e54bbb6459d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 6 
             gnuradio-3.7.13.3 | 4 
              libostree-2018.7 | 4 
               mono-5.12.0.226 | 3 
linuxptp-303b08cbf55096aba5... | 2 
                qt5base-5.11.1 | 2 
           qt5serialbus-5.11.1 | 2 
                    brltty-5.5 | 1 
     docker-engine-v17.05.0-ce | 1 
               domoticz-4.9700 | 1 
            perl-net-ssh2-0.69 | 1 
            qt5serialbus-5.6.3 | 1 
                  samba4-4.8.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2bf587a396713552ba3f047ec8dab4881355b27d |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9a5e8b78cda5266154a08b0da5f2b2f2492a320d |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c76a60725f5c9f1499e44a7b1bfbd91541006264 |     
      xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e5aedc598bb2b9175da3cb8bbe2622530e0ca911 |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a6f56bc3ec5a43c84cb74d00124a29ed6dcb0973 |     
  aarch64_be |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/db34b991a14a32b7317474cc7a037e7f63a22023 |     
      x86_64 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1f8184f1efb7de8fbee00a518b6588bd7e46e91f |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/a595812bfa7f12534d9f6508bf9dd1e169c6ba7a |     
        or1k |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/75309088242733a07f1453b5351fb404b3164300 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7cb92b62f89362990da571870aad26cf84a80e42 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/e1c5a8906d1c1ca8207895e27cece9dfde49be56 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ba427b4b61241f09f62b6e0637961de8dfdd80c0 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/623c498088a04abe5fcf5c6de9697c72ab36b2dd |     
      x86_64 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/7da9d4230f3f9f2c99b7f7df5532578784ddd62c |     
     aarch64 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/284778fdb2bd0c65b5d2ec318ede79408c451f09 |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/0512fef48fd1d201b013ab136023cce906dcb77d |     
        i686 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/5d2dc1415984116be04da31095eab11854c56bdc |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/25939ae27b8b9e3effcc6f4c40e48c57d233996a |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/a8de15ae057d1933194fff7c6dfd7d09db56b906 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/ccb79c36851a9c5b2edf44576de0e74ec129bff1 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/e6d2e1ec30ae7693b81a96406e73888084f646b8 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/ba2dd6f4c9b6c64935ab52ecfdf3b8db857ce667 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/1310a43508e0ec41b7c17845c078344b8a52cd06 |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/7a61ecec7fc4c62139530eb6c963399c34eb10b3 |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/b518be8e5c0949604f83e3b916b744f02c771819 |     
    mips64el |            qt5serialbus-5.11.1 | NOK | http://autobuild.buildroot.net/results/ac7a8dad76559f4e22a0668f350ffa801e36acff |     
    mips64el |            qt5serialbus-5.11.1 | NOK | http://autobuild.buildroot.net/results/47a941c7bcd0d5baf7e2c8993ae875f2550c925d |     
         arm |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/c5445685eb188f2eff1037e08121cd19b7da821e |     
   powerpc64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/9493b5895485c6a07698eb88a9c4cf9edda505fa |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3affcc97a6b6954d62946cf6822b7050bc491c21 |     


-- 
http://autobuild.buildroot.net
