From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-26
Message-ID: <20181227070032.61768209ED@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   0 |   0 |  16 |
   2018.11.x |  17 |   1 |   0 |  18 |
      master | 109 |  34 |   0 | 143 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 


Detail of failures
------------------

     powerpc |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/8906e5482b8762661288aadcecb869eb5208accf |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 15
                   netsurf-3.8 | 8 
                  linuxptp-2.0 | 2 
                    php-7.2.13 | 2 
                 dmalloc-5.5.2 | 1 
       gst-plugins-bad-0.10.23 | 1 
    json-for-modern-cpp-v3.5.0 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
             stress-ng-0.09.47 | 1 
                   whois-5.3.2 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/a0f810aafc7675163ed682daf8ca6d7a02420944 | ORPH
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8091af11adce98ec813c397415177e1cceb89c7e |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/28cbff236ab3fb2daeacc0e18c48930a4e6bd32e |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4a0bba2b6b03cfc4187e1b90bd15e40cf57bd890 |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2fdf7be323e8d9494325a64ed94e36df640a702f |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/77916a56985589b2dc05390ee026fd9a2cee87b3 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7f9f47b2102e907f1faef09d764d117b17785fa3 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bf17f8fbe95cb6c3b8d126b2f816b0fd6af2c93b |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c5e245ef3c359456b10ae524af39a798b2627731 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/75f03559805d20f70c5b78be61ab8dc920e0c4f9 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5e20c3d975ee6e9665acd7f71b5f7382e2e11e92 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d44dc0b09713fcbf8dd1d4ab9fb7783e8e1923d1 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6804013b4de5411da89f1b401988cd204318ac97 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6b03d270dae4f3aa3bf5f4b6ae1ac74413fdbb18 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/53902fd4eed9ac8e8db5368db0d64b05ed2d8a90 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8da225d496333b0fc546848709cb6fd8345634c2 |     
        i686 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/3d478f998b547b6b33b6d5d75689b621a8f2b926 | ORPH
      x86_64 |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/4e537ed6556d9ff51020e3b1820e863f372fdf1d |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/1d607e076330cb6491f446af574900d478eb5a96 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e6d8354982e03835d91361c217d55badb2f25404 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/95138bacd031a0562bea88dc36cafa5c62503e09 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/eeee8a6c2b1d280cbd5d09cda5714e003f483392 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c5d455cfb61247474d48c5c8f12b04149c09b27e |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/470d9c8fded3ccd81080668de9160aba35a45b18 |     
      mipsel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6a2d0ab2a107ad94bf416866eeb90af96394b4ac |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2793e111170080cbe249bce564e924045aee6f32 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/830b733523ee315f12bccaad118868c195384f54 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4ff709333778a42420f249d207ea19ed2400f972 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/11a1ac1f70f1062aa1d3a3f9592e8c6a5ebead6b |     
         sh4 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/4950c4e1561b4c505c1ef739dce5e66131d13663 | ORPH
         sh4 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/84ab557230766d2ebabed9772b1142a2572b4d3d | ORPH
      x86_64 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/4f6c266cd45287a3604344e17327c3d72ab5bc4b |     
     powerpc |                    whois-5.3.2 | NOK | http://autobuild.buildroot.net/results/96d830a433157f4b6c786df5c866422702ed338e |     
         arm |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/e66d6fedadfa6a921e040e2fbb41c47a2c073ab8 |     


-- 
http://autobuild.buildroot.net
