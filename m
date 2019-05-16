From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 06:00:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-15
Message-ID: <20190516060037.1706688020@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  28 |   1 |   0 |  29 |
      master | 244 |  18 |   1 | 263 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 3 
              qt5enginio-1.6.3 | 3 
             openjdk-jdk-12+33 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
          wpebackend-fdo-1.0.1 | 2 
                  brotli-1.0.7 | 1 
                       netsurf | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
                suricata-4.1.3 | 1 
               tpm2-totp-0.1.1 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/e73d01aacd25319dbd118a21029c8b0a3e204d02 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/fa900584e775e3ff63b0a3cc47200abb6b116041 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a6d885bdb40dc2efd4413299b847418f8c19c9c2 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4273a9bf584a10d65bebbfa1cc1b37110efd1809 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6c8bb5071e9d266a54afad317fec45fcbd2af496 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/bd17be79a40e97223759a69052ea2371c294bdf9 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/0ac1b391bb41cade0b38bcf49df51ad274336086 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/8c4111e65648d8a25bbf6d36a962cfba2337f3cb |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c2b6bd947c7e72b22df6c9ea57174e055f702f53 |     
   powerpc64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b25b836053c77a12b729a48e797f510baee1a7d3 |     
       sparc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/0ac2e83a6c6e41942312298600d8b05920ef8e8c |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/56794a7b113ab9f387d550a8a17117023be30ee1 |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/f4ac030737c22a78cac17499ac96341e4119403a |     
      x86_64 |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/da6f559e72c120202a2f8b81b0a5eddd99567161 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/3f4505726465fa3a1e9f748bd6b386572864617f |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/af508d067b3bf2a73e5051e1a293ffa7cdaa56a7 |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/431efab9a925cc229b6922c2e3cfae2dfe1e4afa | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/256739a88a79ce92e9e09cdae5e1f290f9cad0b0 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/6ffbf528ae8a32a130bf912007f80cd440ba119c |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/d85014730dde32a4122a1b4078bbacc17a5e592b |     


-- 
http://autobuild.buildroot.net
