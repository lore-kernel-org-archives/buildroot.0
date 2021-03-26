From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Mar 2021 10:28:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-25
Message-ID: <20210326102846.AF27384BAA@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  2  |  0  | 17  |
  2020.11.x  | 11  |  2  |  0  | 13  |
  2021.02.x  | 18  |  5  |  0  | 23  |
    master   | 102 | 26  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

                  boost-1.75.0 | 2 
        host-sentry-cli-1.57.0 | 2 
               pulseview-0.4.2 | 2 
                   sdl2-2.0.14 | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
            erlang-jiffy-1.0.6 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              libostree-2020.8 | 1 
            lttng-tools-2.12.3 | 1 
                mono-6.12.0.90 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                 pixman-0.40.0 | 1 
                 python3-3.9.2 | 1 
            qpid-proton-0.33.0 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
          sane-backends-1.0.32 | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 
                      tar-1.34 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/227a98ded8790af266f06173e00d941d91eba5dd |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/3a73b3887b44926312a7294a7321b4252cbdc780 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/641fd4ce2e53c030d2f267e3484e6e24e62a2146 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/2b5b05263ca30eed943e4c242487d60974f411ce | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1e989194508a7433fff9dcea23c6a2c57d8f7f34 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/bcb29cffb77369d86f7a01809ad19bbb25d61e06 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/89dd385792f9614fa954ccb1b292a7ece39dc628 | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/240b18c857a13d83492cf4dc8bf80734c08630a3 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/349707052d9f9dd582e2d1a1420cebd5829982ae |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/cebe8a9b7fd7215e9d3eec3fa9fb5046438f4346 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/86bae3409226e3b15ec3363f7a8b84448736af40 |     
  riscv32    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/810a2d3252471722a5afe98db248c8c68dd679d9 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/dc0932627f1cf393ac5af38911c08fbabdb45fad |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/7636fa6b11c2443775025464cf6ad33f5af36b50 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c1c2acfba893e9abd40e793d89bbb6cdf88d26a6 |     
   nios2     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/589cfc6ea43dc5e714751f05be488f5c469641b9 |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/b70afa3ce755fa052c2ca2dc046c2530bd01c930 |     
microblazeel |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/fa63651fcf2c0057578b24e5fbdbb63b2c221b7b |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/f5eafd10f45fde1e3655928e3469eec8cdc4945d |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9b100bb7abb0c9d8795fd9a1d75ce29e2bee340c |     
    i686     |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/6fdb8e0330acf46bc7fa188b06aece6d607363a9 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/520120e0bcef5d1b110e30e42ceca39d9f242e87 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/6890ba93b2b24f27ea2c1b1cdab41c8e85d9d71c |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5aaa228b6eaca28321b3feb1ebc816c3edefc5c3 |     
    arm      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/1c75ef9cf796e3bcb55429801a3c048b9ce2d1cf | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/a824100b2180e15ea6f1a0e465f71505cb633b5b | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

           oracle-mysql-5.1.73 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/48877ff539298cd6a0810470ac753a2c170e31ab | ORPH
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c96c054b400d769430d74b0282b8710dc4bf99bf |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

            igd2-for-linux-2.0 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       igd2-for-linux-2.0       | NOK | http://autobuild.buildroot.net/results/b1c402be1c0f5fb52088c3e406666f33f0292d51 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7199c303707df524baa88e8131aec0d64f86c95d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

              asterisk-16.14.1 | 1 
            erlang-jiffy-1.0.6 | 1 
         imagemagick-7.0.10-62 | 1 
                 mesa3d-20.3.4 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/b4c987aab258dec41d698e795eb416b887039b97 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b72f04c45825cf0e9e9ebdebb3149c5f07217d12 |     
   sparc     |     imagemagick-7.0.10-62      | NOK | http://autobuild.buildroot.net/results/a3de1fdf796037e5b54460672f592fa8fd64a469 | ORPH
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/1d34227eebf4fd5c5738cdfdba07968fa5a06228 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/9ef09a6371efe07c89928365677ec8f9c9fc2300 | ORPH



-- 
http://autobuild.buildroot.net
