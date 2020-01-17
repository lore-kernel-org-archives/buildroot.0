From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2020 07:16:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-16
Message-ID: <20200117071650.9630120530@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  2  |  1  | 12  |
  2019.11.x  |  9  |  2  |  0  | 11  |
    master   | 73  | 74  |  1  | 148 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 15
             freeswitch-1.10.2 | 9 
                    brltty-6.0 | 7 
           host-doxygen-1.8.17 | 5 
                 libnss-3.49.1 | 5 
                    parted-3.3 | 5 
                apr-util-1.6.1 | 4 
              host-grpc-1.25.0 | 3 
                oprofile-1.3.0 | 3 
                   mimic-1.1.0 | 2 
                   mpd-0.21.16 | 2 
                  olsr-0.9.6.1 | 2 
                      bash-5.0 | 1 
                haproxy-2.0.10 | 1 
                     host-llvm | 1 
            host-mfgtools-0.02 | 1 
                      lzo-2.10 | 1 
                 mesa3d-19.3.2 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 ripgrep-0.8.1 | 1 
           uboot-tools-2019.10 | 1 
                       unknown | 1 
                     vlc-3.0.8 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e5b1c208e95f765acb765e3d7d6004fd0c036f15 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/9f867986643991d8d9f3f94aaa7634756ad34f26 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/fe2e26edbd9f1157cf526fafeafd6b6feca8bc6c |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4ca5ae02c599b1246c9bb073105683761d54f4b0 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/95f8291279ba8f620fd2997db32fc9d419347a29 | ORPH
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/40549ce81edd9bad09500bf809f9a08982155fe6 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/14ffc6b1a621f6b5260360cf77919ceaf508fae6 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/490f4c5930d40c649ff0626eef3832c4853fd018 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c837a09ae418adfba20080e49a9e301ca9bfe427 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c2bc4608d7d629deeb0694db834e425e3d1e16d4 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8086429fd31d1e1eec8d6cd85579e2c863f3c267 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d2700965d59284d1510e00c16c6b680dac86b74c |     
microblazeel |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/aa05a3eba70d1f7af9a5738b4aa880b47d0031a0 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/5760d0fdb547463d792d3abb14cc0bc4c2b77efc |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/f22007492c6eaec2cd3649bf0d2fbd2d5346485d |     
   mipsel    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/68c6ae6cb1d02278422ef2dcf7bda4983b1ac51d |     
   sparc     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e3e7ed55ae9c19e97737800630505a02fbf3f598 |     
 aarch64_be  |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/ca911203df380189f8c1b2aac474c30afc66c729 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/d266903c3e8bcbcb503860a39b5849c3716b7be2 |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/4bd0d44ac5eb97b46405d517043d77e0283dda19 |     
    i686     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/1e702624c4ef652cc44102c322c3b8975b65f6dc |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/abc9ba716dcd4e0522dedffc0fabffa8a35395a5 |     
  riscv64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/7ead720772f89883b82621d15905822c75fcb8f0 |     
   sparc     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/bd1c68169adf32713f9587f555559031ac8f11ff |     
    arc      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/0e39a4d6fb620dc77793c06fa38ee763efedf7ca |     
   xtensa    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/aabb9bd49285baa9ce16776f15b86549bd5e328b |     
   nios2     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/b820b8bedc54fc6b17776629e4f33a26d27e955e |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6d60de5f4a340c1a2e87f61708fe60eb9fa9a057 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8ef9d2e396ddd9b05cff22f408e9f327c4991c46 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/87051dfb9fc81e3c7d0f808712fe55f52a801c4b |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/a3263fe9755834e81661230e8647d25cc085b071 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c9c58988dacfc17d8cabf6d8d5da7189c0ad3328 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/f30b942ab6fba8bdbcee45489d57437150450d32 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/edef9853b9eac32c9ad9cbbb0b23b41771edc2bc |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/7efc3a0da3b2fbf85ed20fb1bd0e6fc6a6bda938 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/c2954eaac5bd3847433631ecb3760f76defed33d |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/bdbb8c2082082875b9e55fc30f950f85f31878dd |     
    arm      |            lzo-2.10            | NOK | http://autobuild.buildroot.net/results/af722bbaeb48b2a2a9b65971d2aea843156516ff | ORPH
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/45b43c2ff3d6fc4c08c1c5c8f7b1857f83cce680 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/920acba2d55dfe1c0fa6167bead1a2030ac77134 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ba838d2108943faecba003239967c68ac6f8dcbd |     
   xtensa    |          mpd-0.21.16           | NOK | http://autobuild.buildroot.net/results/2ca02d135af6eea225fe62f72fbc1d36b93a3d9d |     
    arm      |          mpd-0.21.16           | NOK | http://autobuild.buildroot.net/results/1b5173248c6ce29f13d779c40d38c47628af67c0 |     
 aarch64_be  |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0d9ee244696a9c8bf3588d2e364599e530983dde |     
  sparc64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/90f5c5dcf3c981dfe735f90244baccf74ab843bf |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/fb017c7c04febad1c2266145e08964364fa7ad75 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ddbbe9cd2ea9952a27546b70f2a82dd24daa2aab |     
    or1k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/be7776b5c4172be0745a7bd61144858887194c8a |     
  riscv32    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/99c7eb691561c79c293c7524e5f65fa7d25ef6ae |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1bb4e720ac7620566301fc463cceb26fc524715e |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2aea2dcaa017011972779840d878298b20d3ed51 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/e1f4a409786822ff70a552db16c9b9632a86e371 |     
 aarch64_be  |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5733813311f8d20a0adcbb68c9fd08cafb1370b0 |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/670914e71043861b44f83d8270966f89ef5bff06 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0d34828c5a4f87ce2fb448955d4ba890d832c1a7 |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/67bd78381c75695a65094b444818b49d8dfd5c85 |     
    mips     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0eee1c08f1d4c9341c542099dccebf41245405ed |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/81d0c1fe55f90ec1362ae6398815af468a614d2e |     
  riscv64    |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/f71346dfbc16d465f4eaf537a69afbb4125c772b | ORPH
microblazeel |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/4520d27bb4b470a866e9fb4795c91b041dc4032e | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/ac34ab75652d7384d608b6c3ae94dba3084c27cb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/625a1a8546985d84982d52e647310c077dcdf98a |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/07a0f5756cc58b25c0016bbeb73a4fe11bc59751 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/2927881efc5774499f49954a565a813ab3423f54 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/d9ce7bc6ca32e3f2475cb5c59181b3e420710e44 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/aba520dd6575b989083f0bd78fcdaefa766cc0ca |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/e1257dc4a50b95b081b156f58438ac55e1e201fa |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/addd5fce10a0889034e10640d2589896bed594d7 |     
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/61ac856867cc6baa33f62300d4a31b40362f9461 |     
   x86_64    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/546634bd64769cd74259fdabc299debad839de51 |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/16c029e229c9feb377b60e84b10554f9f237842d |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/644f060487a592f907b56bca197eb9b493294848 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8e2c41dca15daab0a902e4083b42641ede1678e8 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/3b4984f37eab0d9d41f9d66412f894af5e7dcc73 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/93a35da3e28b96b143bf6ba3c25ef4cded18721a |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     host-llvm | 1 
              python-pyqt5-5.7 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/ded2f9569e22e2997591ac80df979bce7e52b09c |     
    sh4      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/33ab393cec60d29a173aa1831113f82c30d1842d |     
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/dff48c38011cb4a02c36830a929acde788ce149a |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/dbe45ab8bca37fe00caa6161c0fcb68ce7f100e5 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/59c48620b3337e7380cc67deacd0d9d0335562c6 |     



-- 
http://autobuild.buildroot.net
