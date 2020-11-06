From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Nov 2020 08:10:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-05
Message-ID: <20201106081034.7395E86890@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  0  |  0  | 11  |
  2020.08.x  | 12  |  1  |  0  | 13  |
    master   | 57  | 15  |  0  | 72  |
     next    |  5  |  2  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                  zeromq-4.3.3 | 2 
                clamav-0.103.0 | 1 
          fuse-overlayfs-1.2.0 | 1 
            lttng-tools-2.12.1 | 1 
                     mc-4.8.25 | 1 
          modem-manager-1.14.6 | 1 
                openntpd-6.2p3 | 1 
            qt5location-5.15.1 | 1 
              sigrok-cli-0.7.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/02ab60de73245a10714afd9d069ff407bc589843 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/85864d5219392b1e6a4860e8ad60601bdced2fe5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1382e52b597e47d314899fab6210a5dc551fa1c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8e3724f6136a687c31b104711b4a055810285528 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/661dfcffbe945cc921e9e98fd0e70198ca6d730d |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1163e7c00132aa72f59d70cf8123c9b76b2d2f0f |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/b3d4d27e8ea5478fcdc8a5936bb1b5e4a616060c |     
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/ab6035f21f0c6e536205d7fa9cc9de1a2b4b4ca6 |     
    arm      |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/edc755b874ea43d1c009ad76c28f05e18519138e |     
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/36557472f48779871a9c4654d873ec0728c32dbb | ORPH
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/9bb80c978d069ec05581fb4f1eed7ec0ec9daadf |     
  mips64el   |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/cc6447b926f8223c68d0086428d29a037b18252d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/af80b4763cd2917a4c4cedcc75304364ee1d66ef |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/8b1d2c90bfa3972cef25a157119683b981275058 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/30195c4366a91f3017a7e14b12643e806c159da0 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/890578ef009159a176803754fc50c4540dc0a9e7 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 2 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/112435e23cde28f15bc7c968e0d6c6746cb7c8b0 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/45ecab65a1d6b82492ad78057233532b4388e361 | ORPH


Gitlab CI results for 2020-11-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421057  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421063  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421064  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421100  |      
               orangepi_zero_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421115  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421135  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421137  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421172  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421174  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421205  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/831421210  |      



-- 
http://autobuild.buildroot.net
