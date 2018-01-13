From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jan 2018 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-12
Message-ID: <20180113070009.2C36B2086B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-12
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 152 |   9 |   3 | 164 |
   2017.11.x |  21 |   2 |   0 |  23 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 3 
              e2fsprogs-1.43.8 | 2 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 
              host-erlang-20.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 mplayer-1.3.0 | 1 
            nilfs-utils-v2.2.7 | 1 
                wolfssl-3.13.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/10197d2eb45ac4101906c09c003142d1fc29bb1b |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/3b123bd65d3d8aaf7df734dff2408e62f9810e35 |     
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/db95e4fa29706d736d7c6444f35c88e58bd34a18 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/5e6ec1b96dc2044a7c97e373754d1c26a26a672c | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/32bc77c94b27a0b69d0c28486d6411a349df3e8c |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2f469d011ce0f3e71867f8eaf4cba84787c34b27 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5626e18cb039c12fcf6707da76bde2325c7d16a2 |     
       sparc |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/bea69fc6ff68ae86915779c86aa9229c69f0dd8a |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/d1c79a28e18bda40cbeb6a7b7ce5ce3e87f7ab22 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/1d974186663e705f3f5ae1bf9b3cf861b875e503 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/1abd76e0150bd8ec51ee701e1cab9ddbe4029b91 |     
     aarch64 |                 wolfssl-3.13.0 | NOK | http://autobuild.buildroot.net/results/6080648394d09a0d382087831ee6f063c7638be9 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-erlang-19.3 | 1 
                    php-7.1.13 | 1 


Detail of failures
------------------

         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/ffae723b3edeb6b9c03ae49bb5305a7c0941c58b |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/4d8a7329e6421d0d62a207b4f6759f05ce03be93 | ORPH


-- 
http://autobuild.buildroot.net
