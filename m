From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-27
Message-ID: <20180428060019.64C2F207BF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   1 |   0 |  18 |
      master | 189 |  42 |   4 | 235 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 


Detail of failures
------------------

         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b1a2527f2daa3590f722fc48040b9cbe03fbaaf3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 13
                  host-go-1.10 | 5 
                 host-rauc-0.4 | 5 
              procps-ng-3.3.14 | 5 
               libupnpp-0.16.1 | 3 
                         boost | 2 
      gst1-plugins-ugly-1.12.4 | 2 
               log4cplus-1.1.2 | 2 
                 mplayer-1.3.0 | 2 
                cifs-utils-6.7 | 1 
dtv-scan-tables-07b18ecef17... | 1 
                   flann-1.9.1 | 1 
                  flare-engine | 1 
                        libnss | 1 
          shairport-sync-3.1.6 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/25859f34f654408d80d05ece436f954af2f6cbe1 |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/be2b7404364765bdcba6b574a86055e270da6afd |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/49d242ad13504c110f3cb23c5f8f5951e841d2dd |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1e2ff30a62e9d69352e69f3e649a338fa4bb7d07 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/57e875887cc6f47fca5fe3985ca2ee3f5245de66 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/2a0e4612e210daf0b1b45c1c1b5ff10720273aa8 |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/a8fe67c5bb632d8eda3b114f66ebb7e16bb6b7d5 |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/1e98c82046e1d6e08392596f02be0dc8b8b34ade |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2fe95775494e2f972a5ef9d973a2fd6fb2855169 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/830bd3086736612a7f0f2234280d3b063d9a94e3 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b4a83b9e1e9353e70b8819cf5af302594331f011 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/fe6469cdf531fe9cb3a0357fd947aae6e809d667 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5c0af58a551563a620936ef02e5eb784fa83c79f | ORPH
       nios2 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/4a633b27c169d8b6c9ae94f4c7382b56a5ff4df2 |     
         arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/ef287aefabe5b03b36e0ea28f92f8eabe1b70db4 |     
         sh4 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/aec15f5365de9a7cf6ba406683224ea21ae09d94 |     
      xtensa |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/ff001b7fe5e5702c298e32b7d3d0c812689e2791 |     
         arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/947e1854a9037196641aba3992d924b797743f7c |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/a1a9d679dda1eb7a98825a77ce14b31601abd4a3 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/092b8eeaf72eb0ea8dcded67f314cf726ede7b6f |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/8aef7480a48f22747f91a2e0c58b90d7626a80f7 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/fac5ce2b93d65f4944c087c6035ef6c49745bba9 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/3e75a7ffa95e647bf2d4db1b8773bf1f5e326981 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/59903fe02cd80a89f3a5eb1e5db7f81ee58a6ee9 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b51940b9fbb79a768d84d71efcc7529a09941a93 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/11ffdc0b0f772ec7ca2986ceddd0adff7df176e4 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/475ad154496a14748d018830b8c30afdc921c13e |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f4c17108fe6f95f35f9e27c26370ebec5687efd8 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fb7dc6d7e71d37914f384a634c40e059ec82b807 |     
   powerpc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5777fd3e56ae2dbe241ebef46523afc6c2a04dca |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/398e5db0d80ec4f04cb0b7e64bf324dd07a66f2b |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1ad4e0ba50628b49fb096ef01de03db6c6500fa0 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6941d6625e314a21ec288ef74486ccc0d8a6f1db |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0af62cc03edb123c8fd9daa06630766faa506187 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/08884bd7d346775e37aa8871545b9af652464930 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/667f0b36563e13eadd4cc4747d7e90c04c2abc07 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d5f2c2361cdbe86749828398ae0fdb89c2f81ba9 |     
 powerpc64le |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/033a01d8da9ad4ca74f494a575e913c081c890cc |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bda461391c9e02e313fda887b75099e619527a7a |     
microblazeel |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/b96d29d64f455726a53a7adcfd3edd546346201c | ORPH
         arm |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/35f9657a1847662e09255ead56af4401c1d94bb0 | ORPH
       sparc |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/eef68038dc0cec4f364653829ddef427ba2ecf92 | ORPH
microblazeel |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/f36a04740b2b6fa1908375db23b67746a94351ba | ORPH
microblazeel |               procps-ng-3.3.14 | NOK | http://autobuild.buildroot.net/results/6890030999f161df0155341b793fc1074b9f2c4d | ORPH
     powerpc |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/ab7f9a4016e90a319be0b27bb130edb0674fb466 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b4d3956773a2407b0e49ff55aecb242928fb2e02 |     


-- 
http://autobuild.buildroot.net
