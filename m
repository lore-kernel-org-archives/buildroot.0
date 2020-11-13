From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Nov 2020 08:10:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-12
Message-ID: <20201113081037.69BDC8761B@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  3  |  0  | 14  |
  2020.08.x  |  0  |  1  |  1  |  2  |
    master   | 56  | 14  |  1  | 71  |
     next    | 12  |  8  |  0  | 20  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
                    mpv-0.32.0 | 2 
               belle-sip-4.3.1 | 1 
                        bustle | 1 
        host-sentry-cli-1.57.0 | 1 
                minidlna-1.2.1 | 1 
                openblas-0.3.9 | 1 
                    php-7.4.12 | 1 
                rocksdb-6.10.1 | 1 
                suricata-6.0.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/69aaa6854c88f7aa77e9fa0d93a60cc1be0d7c98 |     
 aarch64_be  |             bustle             | TIM | http://autobuild.buildroot.net/results/2eaa716ee7372d0a2d5bc75219be81e35acb7858 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eb34095e5cb75786560628de77902a32f10b0101 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/4aedd1be88ac9e9b438426c0c8eef7a6185d03eb |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/590c337cab210646266e6334457476dc4471e536 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/85f1076a6965005dbab20722dea77984ac483b8e |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/381e8ea4210e4de2b67871c229661c33f0f6dba9 | ORPH
   mipsel    |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/ed54855983c168970999266a53e6dbe37d7f0bf3 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/efca15d3a01a9545be0111ac969ccc0d857d40ad |     
    mips     |         suricata-6.0.0         | NOK | http://autobuild.buildroot.net/results/f574005204905250702df32b61c85d427ab4feda |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bac931ea0ad8c0b4c2612454cd6b36b91d40d22a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9885e9d435125a3898f4cc0c8adc3adcdf28909f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f1fd4a9704d2485e3c9b1f71ceca0bbb1dd2ca06 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/69db5f6304a07f9aff32d17011dc8d7b04717afd |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libnetconf2-1.1.3 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/aac95dc43c67c29ee813afd5261cb597404e64d6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a61410674b019eff78c0739fb4e3cf787aa5ba6 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/cd0378130851524191e32742d559d6c55b001331 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                        bustle | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/db25e71bc19ced287d6650dc7484644b95f7182b |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/32048a6c1a1687bf63c9bb1b8d7a2314cda5e89b |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
                clamav-0.103.0 | 1 
                 dc3dd-7.2.641 | 1 
                    quazip-1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/baa6ed4a409fa1208bb2c35434b6ea8f6a471866 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a6f2fdc8b26ac007055e9f8dfe19fdeb02baa673 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9159c90cb7ef1fa32c04703e9274b694d2526926 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1c15debd9915f4e2532fd5d72018b6ba0cc1503b | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7fb937f445f89ac3868b5f2a4bb207825f394b23 | ORPH
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/6adc1ff74be4848c057aaf7bd02cc4b7d3610b1c |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1281bfcb385251c71a254826410f8c820620ac73 | ORPH
  riscv64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/c5e3a013ab1367158c90c8732c34924dd47b47f7 |     


Gitlab CI results for 2020-11-12
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/844739169  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/844739235  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/844739311  |      



-- 
http://autobuild.buildroot.net
