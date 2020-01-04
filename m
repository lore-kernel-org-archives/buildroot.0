From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 Jan 2020 07:17:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-03
Message-ID: <20200104071732.F20318138E@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.11.x  | 11  |  5  |  0  | 16  |
    master   | 122 | 41  |  2  | 165 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 5 
                  snort-2.9.15 | 5 
                       unknown | 4 
                apr-util-1.6.1 | 3 
            host-mfgtools-0.02 | 2 
                libgdiplus-5.6 | 2 
                qt5base-5.12.5 | 2 
                    xen-4.12.1 | 2 
                  zeromq-4.3.2 | 2 
                bitcoin-0.16.3 | 1 
                  boost-1.72.0 | 1 
    dovecot-pigeonhole-0.5.7.2 | 1 
                     host-llvm | 1 
                   libnss-3.48 | 1 
             libopenssl-1.1.1d | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-19.2.7 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
            python-cffi-1.13.1 | 1 
       python-matplotlib-3.0.3 | 1 
                       qt5base | 1 
                suricata-4.1.5 | 1 
               wireshark-3.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/6359bf8c2ba204ddfc866ac06700590b75ed535e |     
    sh4      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e4babc0898ff3f4497efcc7b29e5fc47e7db9ebb |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/2ed3375082a7cb0fd3581c946ed82b6a67b0696d |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/c14208be935e79cff0f54efa20036931ac05c1da |     
microblazeel |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/74dfbc1b83eb7b3e1da1c425a72e0bd1dc964958 |     
  riscv32    |   dovecot-pigeonhole-0.5.7.2   | NOK | http://autobuild.buildroot.net/results/6e4236eec9173549f5340ef356087a17011c5b66 |     
    sh4      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ac0c9d31dcd3f1f6c461b199d79d7eb7ecf8098a |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c145af29dc95fc9c0c4c5ffba9504877eaec59b9 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/876dc699bc26f9bc4320fcc4029860f69c791347 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0fc030a085141a6c1526983aac0e843764c1d1b6 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4df89837d46ab7077a29ef2e631b3a2f773d0015 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/72cfce7b3c699c600af4af634f8c5f7ad2fa4a9d |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d57edc846fde8306b7012ae91920f1016ac273bd |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/55a82a6e92edfe98975f0f7767c36162921d7632 |     
  riscv32    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/187bce985cb2a7980bf3fc99062ca986f46fe951 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/79ab74bd36d3d6fa0ea9e5b483e9aaa17f9c89a2 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/d913339f332bcf77eb97b904d320aa4da6a6996a |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/486b8f4ffdfdfd2f51ed3c016a07568ff96f1b13 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ecf4abc7596d4aa7e90fcbed5ce253b6807c4464 | ORPH
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/6b96258b2e2a4ff27e39340c58bfa5b3240d50c8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/622505454bd9e232a904f5250dcdcecf58ce0f7d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b24490ffeed970c4880ce16b73353cc1dfc2918c | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/73e8371c27701ef736d34697979a17dc4da68712 |     
    arm      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/c56a19e718c176bee4c1bcebd03784a066833687 |     
    mips     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/c7135b12ca8da5f8f3fb4960f2738707901810ae |     
   x86_64    |            qt5base             | TIM | http://autobuild.buildroot.net/results/f40da5874d381d05ee3b7b44a8502287efddd572 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/1a2384a5d1abc90952ee676b6ee57b9c2e55d044 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/c0303ea2d1bfd816f5272b84783fc577bbe89b56 |     
powerpc64le  |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/81be78527e247987dfe599fea47399e7251579f6 |     
  aarch64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/ecc460a1fec032f301df51c04f2804c38960c507 |     
   nios2     |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/f6c33b6df688117546e8861026934d2156afdbd0 |     
 powerpc64   |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/1630ef1c9e18b9a24ed14477c8562e8db4749034 |     
    arm      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/305a40d636a80db5c3ecaed387d2aaf8120ef4ee |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/6e1b2a86afb9983d33793fdc3a61d73cb51c7023 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ad162a47152a86b856a670343422339084ca05fd |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c1526aa3d1b145ffe050f58a668da0f6f06945f6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bee7f7317bae3e635665c47f9a9802ab8cec4d2e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5c769422a2a7f00805c54154a7c0f2c3f1367a3c |     
    arm      |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/2387d4590c5dce73d5f6d72bccf253e79f9a73d8 | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/173b9614e6bd5b37e0f97bb3f7e101ce1a48abff |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/a3f5d9f4cab2716d97914b4962ceac1c5132ce11 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e2dc1071263a761239445ce1282f6007fa8745b2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c51b56ff6f3cd6d7bf619006876be46606c41ea8 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393026993  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027094  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027119  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027120  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027121  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027122  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027169  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027188  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027223  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027228  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027313  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027303  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027306  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027353  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/393027402  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              fconfig-20080329 | 1 
                liblinear-2.20 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        fconfig-20080329        | NOK | http://autobuild.buildroot.net/results/f899293f94851230f7f0b7844b4fa1b8b6791c11 | ORPH
    arc      |         liblinear-2.20         | NOK | http://autobuild.buildroot.net/results/e97ce4953cf5f19baf1aa31ec04d2859a5734596 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.71.0 | 1 
            live555-2019.09.30 | 1 
                   mimic-1.1.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                qt5base-5.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/a707cd77a24269db4eea42fb2008e2ec467c13a9 |     
   nios2     |       live555-2019.09.30       | NOK | http://autobuild.buildroot.net/results/1844a5f2d968f0ba51d821e825edfac84ac9d86c | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c8b230f9e6e815f28dadad0570c032bbaa9ebbf4 |     
   mipsel    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/ca643a4667688d3ad451ddfd92c8fb0220e898b4 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/d4886041baa698e097d91a517d3f7cec81184aa3 |     



-- 
http://autobuild.buildroot.net
