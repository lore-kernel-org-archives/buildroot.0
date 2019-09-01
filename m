From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 01 Sep 2019 06:16:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-31
Message-ID: <20190901061705.4BDB686C34@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-31
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  1  |  0  | 21  |
  2019.05.x  | 19  |  2  |  0  | 21  |
    master   | 228 | 30  |  0  | 258 |
     next    | 14  | 10  |  1  | 25  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1608ae076f1033c7d309a0ddb82ebf84bf0641a6 |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/b345a449f62f234c36d02177e111574fb65ff207 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/28238dc7ee568286dba9b675c40af3b365366bbc | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 5 
                      icu-64-2 | 4 
   openvmtools-10.3.5-10430147 | 4 
                    ffmpeg-4.2 | 2 
                  flashrom-1.1 | 2 
               wireshark-3.0.2 | 2 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
            host-mfgtools-0.02 | 1 
               host-qemu-3.1.1 | 1 
                   mimic-1.1.0 | 1 
        network-manager-1.18.2 | 1 
       python-matplotlib-3.0.3 | 1 
           python-numpy-1.16.4 | 1 
                    qemu-3.1.1 | 1 
           uboot-tools-2019.07 | 1 
              webkitgtk-2.24.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/443ba52993d9737a0c27b28c6798f3764491ec82 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/9618aeffa7d72162d6643a89470c4a01d044a2dc |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/35e6c419da58127539018432ce1cbd93c773f47f |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/919e51dc05c01ad78a09e73631e075e616dc8799 |     
    or1k     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b67e47f626401d08e8e89d82bc9638a11ba9a0f1 | ORPH
    arm      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/902427ab3a84a4dcee0ec0c7f5b98ead192dc9c7 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/d19d85e5487c33047ad60a823f45e89d4de3604a |     
    m68k     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/2009f14607c4285500614d7de268d3df37bbb769 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d4c0bdb6cbe9e6651eaab67aa37d1be1c887f8ea | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/653a07109d8f9fb19ceccfc493e9bda5d9da3c2b | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9e2a275404bb038558919e3067ae3280e133502e | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d31d1e72c65e7e03df10cf81807250d369658b3a | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/069952aab35e792269d9f3c4ac029cc7bd78750e |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ec6aa714c93cc0124a43866f7684150e8c3c71cc |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6bba30bf8740f11743aa36eb18d3ec1fb6c1ba32 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5536007c3763a5517a89769868ba0562c3eddd83 |     
   sparc     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/15da42a2b794ef69e28619a87ba894688de0ef9e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/90cfffe00bd2e627ad7f0e0ea001f1b8006213d3 |     
   nios2     |     network-manager-1.18.2     | NOK | http://autobuild.buildroot.net/results/7c9a3bcdbb87398c48f112459e3d0fa67481a4e5 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c51379f4e526a0459ffd9a5739fe8e3e34240366 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/97188dd1c149fc9eb3000227db0aee889a39a9ef |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3bd66206ee77f6b88a023681245fc4cd856e543e |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c9b9da23ae7c95912af75c50b72d8a8d8ad99763 |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/c6ae87d7ba6f895de51ced75af674bba7eec5bfd |     
   mipsel    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/3109269e6fee9597f6010af95f19345ef0e51422 |     
    arm      |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/950e016f4f2d0440e684d7d52deebe37f6e7528a | ORPH
    arm      |      uboot-tools-2019.07       | NOK | http://autobuild.buildroot.net/results/cb9eef581afd1cc7786c2c6bc6a6043c93ac4401 |     
    arm      |        webkitgtk-2.24.4        | NOK | http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/9d037546b00ce21ac1999729f249b99c845833b8 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/104dcb5eb76330bf461973afe9665f14bd4566ae | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 2 
                    flac-1.3.3 | 1 
            host-mfgtools-0.02 | 1 
              iputils-20190709 | 1 
                         mimic | 1 
    network-manager-legal-info | 1 
                    qemu-3.1.0 | 1 
                  rygel-0.36.2 | 1 
                    strace-5.2 | 1 
            wpa_supplicant-2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/fff57aef4c8ede1957ed76bfd90e7a58959d43b3 | ORPH
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/36a1fe8b35dcf6d355b80fd85ed1bb13ac2fe17a |     
    m68k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/72949a3705b5c804f02b183e2b114e4c7977eecc |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4ca80d65d7410a83b98878a53bda615cbc371951 |     
    i686     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/4d85ed3db44f34363d23f42cf368c41b93e27054 |     
  mips64el   |             mimic              | TIM | http://autobuild.buildroot.net/results/6fdacca7e4e2807ac8a5f99a15b204a5c9941728 |     
    arm      |   network-manager-legal-info   | NOK | http://autobuild.buildroot.net/results/d243a4d60e7bd3d33cd09ade91b718a930222521 | ORPH
    arm      |           qemu-3.1.0           | NOK | http://autobuild.buildroot.net/results/eb35860bba60d52a1bef2ad231b2c167e6c98b46 | ORPH
    arm      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/9d2b9e887eada68536fe1e84ea50b531c8ed8072 |     
  riscv64    |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/0ccc00db4447eca3fb4796b43f02700071233ab8 |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d9a4cf21a621fab37f89e5a4865baaaf04ab2ba6 |     



-- 
http://autobuild.buildroot.net
