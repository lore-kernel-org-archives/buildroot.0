From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Nov 2020 08:08:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-14
Message-ID: <20201115080824.0B5018685D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  3  |  0  | 13  |
  2020.08.x  | 17  |  1  |  0  | 18  |
    master   | 66  | 18  |  0  | 84  |
     next    |  7  |  5  |  0  | 12  |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.74.0 | 2 
                harfbuzz-2.7.2 | 2 
                rocksdb-6.10.1 | 2 
                  zeromq-4.3.3 | 2 
              asterisk-16.14.1 | 1 
          fuse-overlayfs-1.2.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             kismet-2020-09-R4 | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-20.2.2 | 1 
              micropython-1.13 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
                  weston-9.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/c2d175289c587b19f871134a6b075b2dce0ecce7 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6b8dd45a4452711698278f5d420b2b97bc0345ab |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e87f61726ba260b5914a4cf51230a8f773592661 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/0eaf5fdcbd5ebd33917fd4993a95b777c203764a |     
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/3161267f53f7a9db1010a1a1de28849225133116 | ORPH
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/70c98e89b1d5e5b651d1f6928dc53f465103f57a | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3eb1d1b296e00d01bcd0f54bab606af7990e94c4 |     
    arm      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/23315ab69eeb26ef8aca9a24e6265504717040e6 | ORPH
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/92dccc7f2689d3288e972c3b453a160bdb02a2a3 | ORPH
  mips64el   |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/265b425b6ff0ed05958f4992346724fe8d56e06e |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/b75eadac8254a4bf9f4df302f1e3df34928c4806 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a5585eccbf8507b785b281a1ab6676c75545514d | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c1f5c9d8017d74e47078c3e77dfa6638d255f204 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/4f1b4d2aa64ac07d6c4630700faf858c10347f66 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/737d85bb11bb3b4ab10ac5aa5b1d1337b1a3bac0 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/bb7efaab11277a47eed85c65959bf68604c61e4d |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/aad4831d6d5193f580bdd560ad01f516f99efc05 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/3c4e50427db24596f8cd4930c3aade3257689e41 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 2 
domoticz-0f411f781ae4fb4a82... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/64ddcfbbc0264921171b9361ecd06581d3b18f86 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/fa30b8f28fe88dc5c38d9267e7932473b31a9756 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/07e8986797c0c6c9051176a4830d49f13b218ffa |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/bcbad006cc19d7f40a011c1cce0604a55e55374b |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 3 
  gobject-introspection-1.64.1 | 1 
                    qemu-5.1.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3f525ca035965bd0b2e815e999adc89348585e01 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a74c28cc889b9f0c7bfaa87fe574b4428168be0c | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/119484269390559d4fa1b04327fd7e5c6b722b2b | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/89c5cdbd482ef54a36e23119178e0c605fc3d943 | ORPH
   x86_64    |           qemu-5.1.0           | NOK | http://autobuild.buildroot.net/results/616dff216a215dc0494c846d337e03e0795b2fb2 | ORPH


Gitlab CI results for 2020-11-14
================================


-- 
http://autobuild.buildroot.net
