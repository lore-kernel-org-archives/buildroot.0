From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jan 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-27
Message-ID: <20180128070015.B41C02088D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-27
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 222 |  26 |   2 | 250 |
   2017.11.x |  24 |   1 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

open-lldp-036e314bd93602f73... | 4 
                  boost-1.66.0 | 3 
         libcpprestsdk-v2.10.1 | 3 
           cups-filters-1.17.9 | 2 
                   gconf-3.2.6 | 2 
                   systemd-236 | 2 
             bluez5_utils-5.48 | 1 
                  ffmpeg-3.4.1 | 1 
                     gpsd-3.16 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
              lynx-2.8.9dev.16 | 1 
make[1]: *** wait: No child... | 1 
                 mesa3d-17.3.3 | 1 
                    mpv-0.27.0 | 1 
                pinentry-1.0.0 | 1 
                  samba4-4.7.4 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/54b94bc8d422b84953ace343da7590d62fdbe279 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/533c1d3a4a8ccb2e5056179d24dadc0b0769c1ce |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d1c8a02f01e06e6651283065ef85a4673c5d7d1f |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3ca93d38c82a94173401828164de4f246ec8e57d |     
      x86_64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/5956eb6245f348685a260f43b2f4ad32dc8c41a6 |     
      x86_64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/f9c2d05e313e6e4f9a19af9b7bf25812b0f01ffe |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/ef553bd325481315b4280009dbab5844fbdd34f7 |     
    mips64el |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/919e865cc19cac7f244bf65db159dd1528b8e852 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/2d134f385fa4afdf28a20fe81ce26a328e56124d |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6c26dacaf27ab40dae266f9f5c66c739c9dd7574 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/321ae4bf1fc105c40e5a0982c148df1e4d11f995 |     
         arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/06f2f59f6d302e1cec66b7c1f3bd69ecc1ea06ba |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/025e9d6505211eb34cbfe4d7d227beb6f55eb1c8 |     
      xtensa |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/7acf5fcfa4fbf7d9587617458a7785ddcd91e8f8 |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/65a9f81d06b3332fec8e74053d4cb2cef6d691f6 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/9636675567daaa5cead0bce44d97cb9dc1186069 |     
         arm | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/58faab5681189422f1eabb06bfa9532ebd411d1e |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/670f81cbd22aec7de0e31a06a2bc41cc27789da8 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/5c31ad15c997a27c1b301e16595a6f8f61dfe217 |     
     powerpc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/cc71a66248bc523fc0612f71271c225ee5383345 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/39446c3471b392e5829faaa4e0887c709c51093b |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/d2da393dc5dac928211b991524cbe27e9f97b3de |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8c5ced73554939ca895fa15f6482596a6b2cfde0 |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/1bd5cbeea5eb7121169feddc783307e6cc02f800 |     
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/573e2268e205e10d1352fa81122d8f225fdb4575 | ORPH
 powerpc64le |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/3c2f51120a8307fdd6eead29f48455adb9949521 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/b9b905c2f631d5b91c7adc371b33c760b71955b6 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/900d3a623d0b2ad127202b7037582c6cf329dac4 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

          shairport-sync-3.1.4 | 1 


Detail of failures
------------------

     powerpc |           shairport-sync-3.1.4 | NOK | http://autobuild.buildroot.net/results/d98fa974e0954f325366b02b922d4773bcc1dc5a |     


-- 
http://autobuild.buildroot.net
