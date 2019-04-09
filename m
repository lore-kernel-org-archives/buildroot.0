From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 09 Apr 2019 06:00:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-08
Message-ID: <20190409060035.1B19885E93@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  31 |   1 |   0 |  32 |
      master | 220 |  13 |   4 | 237 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-go-1.12.1 | 5 
                       netsurf | 3 
                qt5base-5.12.2 | 2 
              qt5enginio-1.6.3 | 2 
          wpebackend-fdo-1.0.1 | 2 
                        glibmm | 1 
             openjdk-jdk-12+33 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/3c6c85aa14d57f500863754b993905ed6018316c |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/f6b8d65d4692c8408cac0299caaafe3e592a69e0 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/6d8d9a2e8f7019d69138fdfba6a4f0de746b29a7 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/089e622a68a19634b3821d48e6751e8ae1c64bc6 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/a4688b3ba82915245eab3bf6db596c0cfb3af21b |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/949bedaffb04db9f85330f8c284a8cc00ab7da91 |     
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/648a07e3e10a6b9b057a231f15a955267ebdd97c |     
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/0f890294d46908191df51544d687c7d4a0d6fba3 |     
   powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/d8cf910a5b4eb5c45b71ab130d54884cbae9c236 |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/c43d05f2b69f543f566285a38e107cd198b50a61 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/55b093c06b85f09f660e7b3e963105f3043d167e |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/7ba0c9d3fb1e19d051d930b343b1fc5f6e7dacb6 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f610e99021e694074294d40af4069b2fd2765b5d |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ca67fd5063b1aa7c9e88dc65eaae3890ce315eaf |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/6fc424bf208e5e5fab449417d74bb1b0b536ad28 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/caaf61b461e9411db30bdb280f028dbf97f86dca |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/e2bf30acc0d09f6c56d2e5a52761cc025b7679cb |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/2107c305702f36a79f8c4123ccab65978ef25ced | ORPH


-- 
http://autobuild.buildroot.net
