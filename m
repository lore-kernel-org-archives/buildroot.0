From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Nov 2020 08:10:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-23
Message-ID: <20201124081059.1E92B20029@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 27  |  3  |  0  | 30  |
  2020.08.x  | 15  |  1  |  2  | 18  |
    master   | 116 | 31  |  0  | 147 |
     next    | 23  | 20  |  0  | 43  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  boost-1.74.0 | 4 
                       unknown | 4 
                    rpm-4.16.0 | 2 
              asterisk-16.14.1 | 1 
                  autofs-5.1.6 | 1 
               capnproto-0.8.0 | 1 
         conntrack-tools-1.4.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-20.2.2 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
                opencv3-3.4.12 | 1 
                rocksdb-6.10.1 | 1 
       shadowsocks-libev-3.3.4 | 1 
               target-finalize | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/d129310af96354de22e5a8fd3325eb5de7869a7f |     
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/36998c8b65f305ab4eb7589b65d25068766266ac |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/0613b7da2bfdf0b3a2cbddf42636d31436f403bb |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d66fa71217e132612c7ceb00ded2bcc0ed5b3079 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ea89a852286fe6b5cb769dc3a6edce4a5929cbbf |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f6be5549d58194db2da70133cdded31eb53f1a64 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e760ce372e090321012a4e4bae2cc6c13e46fc64 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/f18d5f39ce15dd10d2911cc6dba40ee1996aadc3 | ORPH
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/da8e4114ede7f0e236217f0d16ff38381cfa92e3 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7d3eefb45ba09c7ad7316dc3c2a180c412a46691 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/916f1b805e7e38d782e82aeb8140b47e8b637dcc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2779ab6ebd6377bc17263276fa9c06893c43feff |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0d66c0dc84796927ba403f3910fa61a4420f02b |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e14fe9289ba4c436989ede8ecfc39f2b19ec29bb |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/86fe2d22e43f9d62c1cfcee9fb2729ea14bd93a2 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bc320575c5dabe122062e558d6bd4eef7d2937d1 |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/3d0f874358e8e5edb1e9aab8ee099183ece56347 | ORPH
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/0216fd76f2237ee06e81358691e45e86c60b074f |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0ea499ac72a555773926f96ba3b75b899e4a2681 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/8314eff88da76b79808a386ec219f68aa04b9e3d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/712fd12d50d45f27c16a26ebbe5a1e2c759583a9 | ORPH
   xtensa    |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/622f70e0fe4bd00661e9b3c0d9967364f080feac |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/87237e26126924bb60ce4e4d0917aa7b87310d6f |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/44b5af2fa34f21183ea8f2c4fa727df0197b087a |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/13a820f77d79b72c3d7159cb12ff0e43bb5b6a0b |     
   x86_64    |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/6cad497a7ab941a0ee3fd7007defc81e30cdcbe0 |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/cc3a1b9cda4e09b058f068ac0caff555f1f7bc55 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2793b479985b6aedeaa4f6b95de3f20f1810542c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/363721270cd78236d618f551e27238d45be729d1 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/193c6ff74917fa38a34483dc87e4b0b67ceb39b9 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/9db59484ed47300362d9f63309c73c3f83fe001b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               host-go-1.13.15 | 1 
           oracle-mysql-5.1.73 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/ab5580377906f6bd1d2d62fa99cb75a853d33f15 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/6352f01eff336faa28595087797a3374347b6d71 | ORPH
  aarch64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/2d46e9d15647c93659350bccac9ceceb132b31b5 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                        bustle | 2 
             kismet-2016-07-R1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |             bustle             | TIM | http://autobuild.buildroot.net/results/f2c83a84d27741bee3722edaffa932af7bbc2ef1 |     
powerpc64le  |             bustle             | TIM | http://autobuild.buildroot.net/results/b28af5c958b6c7d98ca1dbd5af6d64eb9c44b246 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c7771571bd469a24495d0ce2f920a51a4f6dbbdf | ORPH


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 10
            resiprocate-1.12.0 | 3 
        host-sentry-cli-1.57.0 | 1 
              libeXosip2-5.1.1 | 1 
            lttng-tools-2.12.1 | 1 
                oprofile-1.4.0 | 1 
                    quazip-1.1 | 1 
                   rhash-1.4.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/067645bf07ccbb1b5ea8bf2849d22577307d2b13 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/24f23f1ea44451d074f7a6f4e9710367c9997795 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/293d2abbc5583ce70fd1b88e3404165ec2b3d643 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/42601e3bc578d607d81accbc004eb82973e9b674 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f499281bccfb5c2c5b57f2e17a53aaaa99c8712c | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2eaf725b7d447fbfc341066a5b9112c3b14b1e37 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ff90667002b9dc71582e38823c5e410b96867acf | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7f03a1ab6b2d264c95a188f7b5fe61b94e6cec74 | ORPH
  nds32le    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1d07760e05a5e1f7855de1f6f4201559ffb6175f | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f9737afd86b62475bafd8337a3992ada40418a2f | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/76f7557e9214577bf09f80455b97522c9f67b4d2 |     
  mips64el   |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/104136bfa6e5d5d09d524bdc597453e6c4369d3a |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/e596875e914c5fb90e3c06c8a7a434afaa3a7686 |     
    arc      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/84edcdb0f5759fa587a5638e1bab18379ee1f3b2 |     
   s390x     |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/20fee21a91a6c6c74108130544e496f52a99e906 |     
 aarch64_be  |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/a62d77a7a159e61df73fac506897d166d0fd7ba2 |     
 powerpc64   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/e266ab43f1823eb325dc5b536c1314253e449f24 |     
    arc      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/49e37e19667839d4f0ba9e0adfd8f937be32e12f |     
    arc      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/65ffb7bf6020961f3543589fbd0746a8714b9abc | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a40dcb1241cd55912e149049aa1531c868260979 |     


Gitlab CI results for 2020-11-23
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/866121391  | ORPH 



-- 
http://autobuild.buildroot.net
