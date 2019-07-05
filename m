From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Jul 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-04
Message-ID: <20190705060048.5A34D86F87@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  14 |   2 |   0 |  16 |
   2019.05.x |  20 |   1 |   0 |  21 |
      master | 127 |  34 |   1 | 162 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/8c97e58c6d450067e8c7aa240b0efc53dffcfbac |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  dnsmasq-2.80 | 9 
                       unknown | 4 
               libcap-ng-0.7.9 | 3 
              libsodium-1.0.17 | 3 
                 python3-3.7.3 | 3 
                    atk-2.30.0 | 2 
               qt5webkit-5.9.1 | 2 
           at-spi2-core-2.28.0 | 1 
      gst1-plugins-base-1.16.0 | 1 
                harfbuzz-2.5.2 | 1 
               host-efl-1.22.2 | 1 
               json-glib-1.4.2 | 1 
           libfreeimage-3.17.0 | 1 
                       lmbench | 1 
                   mimic-1.1.0 | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures
------------------

      x86_64 |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/0b0d3370d8d050f7a3ba5663833e5e06e7c0b7b1 |     
        m68k |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/3f86e2ddc6b756e8ef1f3bcce5ceb602fe694d7f | ORPH
microblazeel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/5feee338c29d38e6e475f3e2b2960ca418b025ee | ORPH
     riscv32 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/777005223e111e0a696109edecaba34d7e1e3309 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/5dcca42e666c90a0bbd9b153b28a241edb67b872 |     
     riscv64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/1cf5acad785d9017748b9d781e79586d0d465619 |     
     riscv64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/255fde78b6078c9045b0c6af9d690ffffc80ef0b |     
         sh4 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/d323cb9ee3541aa8e863ea51e563212f6e44c44c |     
 powerpc64le |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/b421f844fd744be485c5a2b6dacad79c45fed2a5 |     
     riscv32 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/e58c508693fe4e7ba60a5debedd7cb4c0ca39279 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/4b87b60172dc916ef59bf6666998f8dd7e15b0cd |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/6396ebb83c11093f6f9277e4c58ff7c2617fe19d |     
      mipsel |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/ca7ad192c6af15b364be8dd8caab2064001f872b |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/926b905a0c8c5fb06d690eeb734282b22bcba734 | ORPH
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/f8c8f60f30f59c1f956ed94a6569e44ce176bc4c |     
      xtensa |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/a03d8aa65269e23f5d7e714045234dc6933425ae |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/5000355bdbdc62d11437791f178bb7a75bc47611 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/075f6c50f9b0a27d6ac94379c20d8539314f3c85 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/d708fb0600abbd57fb3b3cec12fcd42c1d168b8d |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6e5f155c4d7427dc1deefd0f568c2f072bd2bb59 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/459016e06c8afa694474b5dcfeed681b78d7338b |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/ee4a36ee385022d34279c34fd7ed776d86db52df |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/1c7681e739132a5a4c27e34357d56cb1c997b773 |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/3cff350a89ee22dac15dfdfbb7534f5611d4ee20 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/269fb82121fe8cb692854a78db15d62ec23ed230 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/60906365f2fd330834026d6ffe17fbbbb0aa6b62 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/88904249ec22658d216538d90686b3fb25cb679b |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/b9f727b41fd07d895ba16eb04614682fe8b81166 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/ee85984201dfd943e18b0a141ca0927ae7abea88 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/1c258b0a7abbf4e0f6420b20701135a03e4ad50a |     
      xtensa |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/8c9a42c859eb6a9ae81421517a79456e7aa52161 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0f8e0dbcea0cccf8148daed053e484fbd72c3f24 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/fcf896bf30a53fa3eb1e0511cef3586b0354b34f |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/336c7ae8ed045bb7d8765a344716d67d76e40e5f |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/49f5003581bc336bc108a76db6f7b824d5e692d3 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/87ba8f6475322b9e630c6bb77654a65ab4ead867 | ORPH
     powerpc |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/c63b23eb91a85bd64e7d03798f841afcf334cd24 |     


-- 
http://autobuild.buildroot.net
