From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 07:00:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-22
Message-ID: <20190223070053.7843A875DA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.11.x |  20 |   1 |   0 |  21 |
      master | 187 |  23 |   2 | 212 |
        next |  42 |  13 |   0 |  55 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ab0abd91a99f505175e43823f527734cd0897e19 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 5 
             stress-ng-0.09.47 | 3 
                 ibrdtnd-1.0.1 | 2 
                 qt5base-5.6.3 | 2 
                chocolate-doom | 1 
                gerbera-v1.3.0 | 1 
                 haproxy-1.9.1 | 1 
                host-libsodium | 1 
                   i2pd-2.22.0 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                  libssh-0.8.6 | 1 
               mono-5.14.0.177 | 1 
                   netsnmp-5.8 | 1 
           python-numpy-1.15.1 | 1 
                qt5base-5.11.3 | 1 
               qt5webkit-5.9.1 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/d7bbee884d53e48c05138dc9bc78022972c263d0 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/cd97f9c0ff9e5927b0315670c51eb8e5d9fb287d |     
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/7def97a7134d1e3e9b40f3f922ec3bc9f8fe5b23 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b41ae0bf149169fdaf875fc89198ec5b3f5970bb |     
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/95b83816c79461629e4dd015f2b36ca9249016c9 |     
         arc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1c3aa96eed467008e881b56164b135ae36d594f6 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/4b1f467d0eaf14ff979e270b451d8b1f33df957a | ORPH
microblazeel |         kf5-kcoreaddons-5.47.0 | NOK | http://autobuild.buildroot.net/results/512fba19ae797c092980b90e2975f72befda57c3 |     
      x86_64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/7192ecf15331a01c2b18ea2342ed420d95c39b9b |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/11030ea4081a510e40fd9c97f1239ea0a1dfdde5 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/56374e7dab6dc87295d44b324b45fc533880692f | ORPH
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/0e8121ecbdbc9d154d46cfe02dcfd513f4912a4f |     
     riscv64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/4bc623516cceeb787bb83c5616188adf3d2a2fe8 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e3f214cb9cf4e4b8dd6d5ac57ddf62beb03fd73f |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/de1144f5cf7dd1754c1ff01bc07101dddbdbc6b4 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d8ee478f3289651a5e0860c7c5389e5f3c9e328e |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/cec7765b7b1701ef7187ab003d38f0993c1359a9 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/fcdda4c3180c8e6e893b8d17359b18692cf8a335 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/2832abac5379c3d7e722dd47ce13f253bb8d8deb |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c78b680b9ec8b687cf3e3d812b6abd375bced16b |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/a22961a48a82c0cd5d6e4f2f034fd3cfef72349c |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/3b267f7bfa32efda230024bd92488192888d83bc |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/28b7989bda5d6f5cdc3f32bb83c4e90765df6e0e |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/1d644ce900cc87eb8988b9ae482a029d125a928d |     
        i686 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/849773d5dc8d69c20b88c7864dd3960ba0202283 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            optee-client-3.4.0 | 4 
           uboot-tools-2019.01 | 3 
       gst-plugins-bad-0.10.23 | 1 
                 ibrdtnd-1.0.1 | 1 
                  libssh-0.8.6 | 1 
                     pcre-8.42 | 1 
               runc-v1.0.0-rc6 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

     riscv64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/794149507e76d6eb28beda1ef077d4f13cc83a28 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/e2276139eab7f1815b1af23642391d51caed79d0 | ORPH
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/03f9d9c4f1444b5dd18fabd12262b0dddb70c756 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/5e87edf33239c6c94d037237cedaa01761881e7f |     
     powerpc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b401947b6eded8f03305bb1fbeb343d20d9aa156 |     
    mips64el |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f5f04992869d4d8544a0ff493f1c87e1039318b9 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ba25402bf086bafd89b0b6dafe74848bd91005d5 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/02089eb21ecd344ffbb815cf2d5800bca9de1087 | ORPH
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/a9362f6acc432102031898b8b0346f8d5149b16c |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fbe027fb63361ab53bac8faadb387bace6c2f20a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/86d40ad5189ba87c0225427cc4c9f4e7f3ee4f5a |     
     sparc64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a1be5988f2e12613764c399ca182fc24544e9a08 |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/d3d07c3f8202d7fa6b570864c6fa1b75876eb0ca |     


-- 
http://autobuild.buildroot.net
