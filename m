From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 May 2021 04:49:02 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-11
Message-ID: <20210512044911.702D983C94@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 64  | 14  |  1  | 79  |
    master   | 56  | 19  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                    ffmpeg-4.4 | 2 
        host-sentry-cli-1.57.0 | 2 
               pipewire-0.3.26 | 2 
                 rt-tests-1.10 | 2 
                  zeromq-4.3.4 | 2 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                 gerbera-1.8.1 | 1 
  gobject-introspection-1.64.1 | 1 
               host-qemu-5.2.0 | 1 
                 mesa3d-21.0.3 | 1 
                 openal-1.20.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/a13667228e0796bdbb6d92b5211382b05b1e47a3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/503f0689a5c758965f56e279a7a51a0444609afe |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ef911882006baa89c2c9db913b387d8bb6c9e4ae |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8a02d0d9ec5f06af3b3ef1306aed6de90e580168 |     
   x86_64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/a4ee8ad7ff93939716673b611c7cc3f68dafa3d0 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5c6de5f3103d242aca7da72c5fd444ce02e16ca3 | ORPH
  mips64el   |        host-qemu-5.2.0         | NOK | http://autobuild.buildroot.net/results/ecd1ab327bf4e4cb6de8b9af2e26711a6b21881c |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/55b71c4c33593b4722ee8fcea232579d4aae9a61 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/53b0ac905782cf82c8a4f07ac28c039eadd3d8f8 |     
  powerpc    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/fcb9fe075e1bfe4b0f43c459cb1ad168128b01a1 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/3f8a2410b6bfd68d6a456a24b66e19a955b3e8a3 |     
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/447eae63c4b1dbdcb68affa53540657922de754d |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/7e131bec458bf5c263ee1858d38ed5dc3cf704a6 |     
 aarch64_be  |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8 |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/e841753472d8c7c5926db2e217e87d0b44c318a4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d49dc69f24025eb71a9dbb98cf9fc1ddc8adf8bf |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/92f927770bc2f3b919a9a19c3f913dbbfe2868db |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6b6993b2c7cc5f2d38a1022595c5a2dc057ec319 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/324570b6c4d0c1005668cf497f6cc59b52228dd7 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 4 
        host-sentry-cli-1.57.0 | 2 
          gstreamer1-mm-1.10.0 | 1 
         imagemagick-7.0.10-62 | 1 
                 libp11-0.4.11 | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                   python-lxml | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f9b324297faee546a8d809763d546612007bb81a | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1d79946b73816467b3edc0c32bb44f618621ed78 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68a69144e81bd8e2259bdf28a4b5627db070183d |     
   sparc     |     imagemagick-7.0.10-62      | NOK | http://autobuild.buildroot.net/results/ad11f113c25a9acc05291a9427d14370f3f2a7a3 | ORPH
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/fb8741d8ab16fd73a901770221f755cc86f8369a | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3abf767a1a02f8484c97e557b4c7dd9b12782fd5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/56b1d6eb9f5403cbda76acef366772f442ac7d46 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8de0bc1cf6daadef2f4a79a8c2c988880009ce2a | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e114788cb498149c00a8de4e78a1cb363fd824f8 |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/a53384342c0e37faf56d690c855e7b9a288c133f |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/f120ae1dce51e68f1c0a8ad5016e73edcbda10f8 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/deb26045d803432794e159eca9dd425b6ff44cac |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7aca756a51c617a7093c66e503061c30da17f6da |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21839684098b3d08a088f448a1b2fe3658db856f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f47900bfed5397eb9f78c5ae29a9a898947659db |     



-- 
http://autobuild.buildroot.net
