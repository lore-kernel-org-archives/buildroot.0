From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jun 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-28
Message-ID: <20180629060023.0B8702082B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   0 |   0 |  18 |
   2018.05.x |  16 |   1 |   0 |  17 |
      master | 139 |  30 |   0 | 169 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

open-plc-utils-1be781d1ea81... | 1 


Detail of failures
------------------

         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/f7eea52e56b925e75ba049db166d592f5d6dfc67 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 6 
python-libconfig-b271c3d9da... | 6 
                  boost-1.67.0 | 3 
                 wiringpi-2.46 | 3 
                      x265-2.8 | 3 
                 gnutls-3.5.18 | 1 
                    host-rustc | 1 
              libostree-2018.6 | 1 
                 libv4l-1.14.1 | 1 
                  mender-1.4.0 | 1 
                 opencv3-3.3.0 | 1 
                qt5base-5.11.0 | 1 
           qt5serialbus-5.11.0 | 1 
                  samba4-4.8.2 | 1 


Detail of failures
------------------

       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3d8bb3ac40c405c7e20e654b8088c71e96b3406f |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c98777b7769d4e58b693cd56020c747b1699b3da |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7f70782e94ffa11b9a05977799d253fa2ca69b2c |     
        or1k |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b5b138b9d046f2689775a8c0fca8e3720fce8a6c |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f824bbcf8de7ac0ad0b27b6c00967807443070ef |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/aaea409ba8f325595e90691677f1575f24e8a2eb |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/913e9858c4ef83eaf2e3ff0f1db16a0194a7934a |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/bd930e1b9d5d13a8001ae274c1a633f98e570e8a |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9a0cb11089515080544cc09311c7097c21df352f |     
         arm |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/86f08276fcb0cc557ab3cc5f57229b2c0c6ac2d7 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/da655a2d092951e26e5b512cfd47b224a4204f06 |     
     aarch64 |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/cf8ab76b8ea1a555d42f0625df1d58543e88efb1 |     
    mips64el |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/1eded8b44cc369550566c6ce0b3c042f1aec8d44 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/8934c5a3036dcf06098d41cf1cfe0e9735eef249 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/f85b349ca9eef4360fc4effd7f885f7844399b6f |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/dfc55b6a153364c19539366a7044d73ed65afe56 |     
        or1k | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/51c9a3d6bca427cefe59bfd7f20b4636d6b8106d |     
      mipsel | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/093d0dd953f3ea6d1cadc79d0cf4eae6bbc1cf65 |     
        or1k | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7e40fffa67b82958fad31014e363b2fa0912f477 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b95e5563e1307aaa8d45d595a3e713d188b0e8d9 |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3502fa86b60256a19ffbefa2c1014d5bcb6970c2 |     
microblazeel |                 qt5base-5.11.0 | NOK | http://autobuild.buildroot.net/results/0230f3105bfd2129debe32cf5ee62e25443a245c |     
         arm |            qt5serialbus-5.11.0 | NOK | http://autobuild.buildroot.net/results/f8761672ba66d7b635c6c55bbcad8ba161c278a5 |     
      xtensa |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/6b9dc94ad398ec846669b89fb86ace2a77ac2d5a |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/4366d548d59148e0e0bfcf6c885605d88ac3a1d4 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/741a3a6991f8f58ad4719745ef5a34671a8b66a5 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/d0cdb74d35813788228f9e32c506ae1e6693697c |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/4d79a4c10a43f3525c33c05b40b2766a16001c12 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/56ab682ab157e7962fe88fcf3e90065ba81faf76 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/6d29fc4a4be218d635082d1951db29fac9a8b9c0 |     


-- 
http://autobuild.buildroot.net
