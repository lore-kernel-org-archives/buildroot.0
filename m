From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 May 2019 06:00:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-18
Message-ID: <20190519060033.366A2862E6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   3 |   1 |  24 |
      master | 259 |  16 |   1 | 276 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 5 
                qt5base-5.12.2 | 4 
              qt5enginio-1.6.3 | 3 
kvm-unit-tests-kvm-unit-tes... | 1 
                          opus | 1 
                suricata-4.1.3 | 1 
                       unknown | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cd2eb19a1a694fb1c9ddbc8dd7ad55dad6de0436 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/64fa5c5c0447190053910888b1ca8935f5cec686 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4a4ba0f5af9097cc33083a55d1bf27eba6e64721 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/52ef5f016a81d5a8884812c643193b2349e1f174 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7f66feb49cb41f67d5c0618b8c5bfa44e2758416 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/73dc9610a13d6e14eec58d529617210d93d5dec4 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/be0af6e7b48c57f6a08895bdfd5d21ed65070a84 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/f06fdd3c1c51a0cf2cebf0c53ae02b57952596d3 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/67ebafa8aeff1ffff796e9b8701b563b9c5c0839 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/adc05c37560325745f6496b90186b7b5acefb626 |     
     powerpc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f0fb7bd0f43db4f3bb498847f08db53d1c8e4afe |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/548e18367099b851aef2b84808be41fa37198832 |     
      x86_64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/776c30a17d540aabeba3c3f3765fe46d7f13d427 |     
      mipsel |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/5eef636d5d07b9f4ecca17e3ef8d9f93a6c58f16 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2098510bc81c1fdbecd8c44d9c8033b20b536e05 |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ed3132f597ac98ae0ca1ad23b88803412678bb9d |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-cryptopp-8.0.0 | 1 
libssh2-1b3cbaff518f32e5b70... | 1 
              qt5enginio-1.6.3 | 1 
                         snort | 1 


Detail of failures
------------------

         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/ec58ee1f96f359914d87029c7988c331a9a46977 |     
       sparc | libssh2-1b3cbaff518f32e5b70... | NOK | http://autobuild.buildroot.net/results/e381eefa39307f1c8eb22f872df438b3fe0352dd |     
     riscv64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/cc8df233e670a340598a451925bf33de7de33884 |     
microblazeel |                          snort | TIM | http://autobuild.buildroot.net/results/cc1862c2248392df13db9a5653078be95248baba |     


-- 
http://autobuild.buildroot.net
