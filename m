From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Feb 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-15
Message-ID: <20180216070018.B60A82080B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-15
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 193 |  31 |   0 | 224 |
   2017.11.x |  20 |   2 |   0 |  22 |
        next |  42 |  18 |   0 |  60 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 9 
                  boost-1.66.0 | 5 
             bluez5_utils-5.48 | 4 
              lynx-2.8.9dev.16 | 2 
tvheadend-e06ffd87beff16103... | 2 
                busybox-1.27.2 | 1 
           cups-filters-1.17.9 | 1 
              host-erlang-20.0 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 mplayer-1.3.0 | 1 
package/postgresql/postgres... | 1 
           python-numpy-1.13.3 | 1 
             qt5location-5.9.3 | 1 
                    sdl2-2.0.7 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/cda9e77941fef182ce8af5c7d6f4ce487bf17a00 |     
        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ab78d7390b0b45bceb2be1b2302994c90c844216 |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/9e7c351672e8e09c4237dcd647a997238ddb98da |     
 powerpc64le |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/6e9ca186e765d59a0c893cca60189aae584f5a7a |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/747c676af2f0a21e82c96a52d60b3a10d7319962 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e406014de3a3fc1428a33cee89de48c3c61c3508 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6f552ec267a834632ba5e24588cd82cbcb88e9b9 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/bed4f9b6c5bf023ae5f9e60b10e03476709dca5f |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/34bc94d5b6adf5cce7e2859a81a69663589cb813 |     
        i586 |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/11d54fab2f9b407aca0b171927ae04ba380367dd |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/8aaa1f58754bc6e15635fb4ac5c8dec4adb54471 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/acd626a653c47f48e2c992b4f8adeca28b7edcd7 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/1c0d3198b8fde16c3bbad9860aa62c933e304dec |     
         arc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/11467ee3b0e26874d073d4ae01e4126a5e0a5cf4 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/0de7dd9ad1592e8775c39cd1efbe1f6483ceb130 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ce3a029de8f495a50905857436f3cc0b6ca33b08 |     
     aarch64 | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/471f06586e4473ec7cf0243b5ae72a87993b7663 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3ac08fe6a1b797de1ae759d64672bda3cb648004 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d3f4406b4590a9ca00432bb49bcb9f7675130385 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e813721834fecfadd4bb28a63c477b35d171fb97 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/fe6df250a575bc54fb406c1128a958ce7683fa84 | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f28f35824728adff4d6e69be70eebda3f48653ba | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/31f73409479f6cfa23d0959fe8c21757d814620d | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/6ba63b97dd7a3ece4320da59e45b25d659cf7077 | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/cfe48b364c6dbb945d2b3423b2f8e1db1257c991 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/99969e804d2127ada18de086a1faed5863bdabad | ORPH
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/1448425ba61c63f016da435f323f431fd1e7e443 |     
         arm |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/b9796052017ab0cdae437793e201bfad1e7cda28 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/3ba0e1f8e6f610d10f0f659a3e317f6e68c6f94d |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/efa8ae61df6418fa2fde81b0df4a2726f2d3dd96 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/b5c0bd8423dc45795a8fd243c1edf0c225c6d14a |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-59.1 | 1 
                    php-7.1.13 | 1 


Detail of failures
------------------

      xtensa |                       icu-59.1 | NOK | http://autobuild.buildroot.net/results/b60bb7a7b0e689eea9de5a68962cc7c6ff3b7b3b | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/7b584be794176b1396128650bf06179ac5ff2ce7 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              keepalived-1.4.1 | 2 
                     php-7.2.2 | 2 
                  autofs-5.1.4 | 1 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
                  ffmpeg-3.4.2 | 1 
                    htop-2.1.0 | 1 
               iproute2-4.15.0 | 1 
                    liblo-0.29 | 1 
               lightning-2.1.0 | 1 
                 mesa3d-17.3.3 | 1 
                 mplayer-1.3.0 | 1 
open-lldp-036e314bd93602f73... | 1 
                   systemd-237 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/3fcff5da9d3aab0ddde2259037f1b8e1e088358c |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/8a9eb07bfcfeaf0e35ef88bf0921deae7307cba7 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/84218c39b5991e63b521fff73a9e2e5d9bcebcf2 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d5b639051460c4277caeb38c9421d99749219c96 |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/9e4289c13370a4d52ed013e5cdc5974cde853156 |     
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/646e81022e405d1f9660a93f33b28b39fa8b4596 | ORPH
      mipsel |                iproute2-4.15.0 | NOK | http://autobuild.buildroot.net/results/3d5a29e3c61ff071628c2937844ea4156059b3dd |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a1521ca7b5d92205115de826d99e0e338f8762d6 |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/e07a13cd36cd64690f440451fac5428acb463dd2 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/e689cae8e9a2faf8c38e223407b8196985e416a7 | ORPH
      mipsel |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/79d6c5741cc7aac7e88f966fb8cb54325c07599b |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/729629fbc9a0c35e6d6f35dbd2a71d4da556d028 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c413392ef5c03cdb57c5d433c4fb42531a4924e1 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/3eb86249f2191aa4a3e0375746e79c1f9a039330 |     
         sh4 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/077b602ad5e9d083de8dd946e03e079eb59ae27d | ORPH
    mips64el |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4e92cc102be3b77eae2f4fe6216a73d8ce1b6ab5 | ORPH
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/f0f1ca9cf5a8b1d846e7a1f9ac7d6119f831d94d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8fcb5d521bb9d86b496b0acf800d5011dad82c81 |     


-- 
http://autobuild.buildroot.net
