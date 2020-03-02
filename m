From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Mar 2020 07:27:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-01
Message-ID: <20200302072740.1948785495@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-01
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  9  |  0  | 25  |
  2019.11.x  | 29  |  8  |  0  | 37  |
    master   | 193 | 76  |  0  | 269 |
     next    | 48  | 55  |  0  | 103 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 15
                 rocksdb-6.6.4 | 6 
               libglib2-2.62.4 | 5 
                      bash-5.0 | 4 
                    mpv-0.29.1 | 4 
               acpica-20191018 | 3 
             host-guile-2.0.14 | 3 
                 mesa3d-19.3.4 | 3 
                       unknown | 3 
                 binutils-2.32 | 2 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.16.0 | 2 
                   libnss-3.50 | 2 
                qt5base-5.12.7 | 2 
                     vlc-3.0.8 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
      dovecot-pigeonhole-0.5.9 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 haproxy-2.1.2 | 1 
               host-llvm-9.0.1 | 1 
host-python-setuptools-scm-... | 1 
            ibrdtn-tools-1.0.1 | 1 
             libopenssl-1.1.1d | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
        network-manager-1.20.4 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                  pango-1.44.6 | 1 
piglit-ef761094be04d14e258a... | 1 
               protobuf-3.11.0 | 1 
                      tio-1.32 | 1 
                    xen-4.13.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b6d389845a281f999c98b4ad67f51cfd04a58716 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/e4ba66606cc287489926a1c94b42d7278d9b1854 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/1d24d3634651d7013411ffbb56622a3cbf3d66e0 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/c51950032f63b939743243ccd009e3e3c0171e83 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/f4b408f3705c95f9f0704fd79fb2500207b09be0 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/560f0ba90e953f114860773b772a163c0c168d98 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/64fe81de45b241c5262025f246925d2d5633129a | ORPH
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/cfa19024f8213d18029a016800887fb864cc1ce3 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/6db4a57c8ec43169720bc0cf64a0917d1e7eac0e |     
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/5a11445f493bede8c7761c2fdc017267655f5069 | ORPH
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/bcc1239a26782f5569fb0d5081914feedeb6e006 | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/da445ae9c8fa4fcae266ca61e06cd3342338fe6b | ORPH
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ada63f311053d90f1e321456494823aa63f67618 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/0a93b248fc82818804fec59b58648da939d6196c | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/1b12d2608428a313b12081b362180760c65c549f | ORPH
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/97bb1a43c8f2eb1d6a983fd9ffd69ec4c74701d3 | ORPH
    mips     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/bbfa38f87370b5b842b8983133784f151e787019 | ORPH
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d1ac79fd39019f4b7aafa736f03b8064fc4f4224 | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8da333bac3675efa672010208bcc141b1e583208 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/4f1d3f5f72dd769bc1552a44f576bf2ccde41666 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/0f1e8b33d8fdeb685315418a2672fa5879f95ab3 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d2d11c89d392dddbefb0abdf2b7a9cda1e8f20dc | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d62fe939ae808857e3ddaf0315b602b46c6d2721 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/e71e2923647f1150002b523f67ee3d53f7975409 | ORPH
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/e41c503195d92aa2a1250acf5c1cab031d061703 |     
  riscv64    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/615493e3a64e6eb39b78972d9d935b226631be6d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/6f4f798044fb606186b1b4253c1cbbcf434fe461 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/127dfc27cc6c3db1707fb5a683cbf3a912c57687 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/60b8f7763f95946eb0139aa426c6b1db4bb3b87a |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a6458757fa4a92ab995757c727ad22224aad10a8 |     
    i686     |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/38412d7d9a923bfb16a40208e3d2b232be8780c1 | ORPH
  powerpc    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/0bdbab4f920be72a24f662df985f7c7f1b6e6e12 | ORPH
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/1897ffc994bbf8a8217cb3b292f45163e94e0b75 | ORPH
   mipsel    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/d35b6685acda124120e3642c96525dace809800e |     
    i586     |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/64e17f38136949970f3fc650ceeb996459914ca2 |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/4da6c695b8ceca0a6eee2481a1b873a46676d0f5 |     
    sh4      | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/d997c592dd4a12ebe019ecee03ff6093afa131b3 |     
    m68k     |       ibrdtn-tools-1.0.1       | NOK | http://autobuild.buildroot.net/results/6280e17a794e04962ff5313669b28ca227aec63c | ORPH
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/26cb4cbbec001149e668a9cbeb0c3ed70d5b94eb |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/96c1956f54b1ca8c376b2cf8c76307e56e9474a5 |     
    i586     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2a80f8ec5137cafc3338e2e8e3628125d9388824 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/0b76eed214ce92dc7d7713830303035401c226c9 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f0ffde15fb956bf0c6a90654e348ac0b7f783714 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/e6693a39b6a602efc55b990422ad1c8385be3a70 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/0223e5cde4560a7b8c96cecbd2da1caab4c587c1 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/66fcd0a7411b611be82d73239d0246af70a6e442 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/09f1b56ba8846dbff9ba88fee90984b5d9ca6a42 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b179864bfb4aa78b65b088812bbb618508412d70 |     
  mips64el   |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/cbefc5d4a4fefb674e596400fa1d2698cd89c5b3 |     
    or1k     |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/dc974da012f53fa4ed3be616f937b0afae423d66 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/df5bcb8e4f6e98c4de347abbbe91e10a98047422 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c177257cd320ef8d9e734ef8b32f54c4bb3cc1f9 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0d9da19fb4efee002f5cc8dd82e5714b56d70781 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/431e3f9201fdf8d29a2c73adf60d83031aa0fb4b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/670a19238db0440fd18501a19153229a9de56416 |     
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/67582dc4f592aba10347a1984ad7429a2cc5e3e5 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/b467e239f5d88966f5711c03dbfb3a6c92bc1663 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/c525f0ce66aa0eb303bacca40317489ba609a461 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/e61918a44fa9ac4eaf7d37cea9e7b576ceaee8e2 | ORPH
  aarch64    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/fd412dd6049cd82ba352bb09468acb6eb886df53 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/418215b76b47385d3a8f0e1c26ca58669f001126 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/bb6082f055892c63c5e58fc35b109bcb85037cc9 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/4aee46a97ce56c0d830b1fc55e5c15833141da87 |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/09b7b255ac686d75431eeb654573f766e8b54ea2 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/195ea05cb6f845baf099a3d5efaacdb7e0084b7b |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/7ab3c7fb8c9579b1d3ab01a90b1a8101244ce3c2 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/70d97451f68075d53a0ba59166f8caaf620df632 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/34c1c54c253ff9d5b95f6cf4fe781cc9c5e07cf7 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/031e7a40e69a9572be1359bae602971df7e3af66 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b18f200d6a4d9315bcabf163c38bf665389f9c40 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8218e180aa6d557cf55f120719996232a91da733 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/89361613f38bbc5603fa372875098c7f42971992 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f97ddf6c75057c5338f047c7fc0bd8dacfd4bff8 |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/534f8fd0fcaa4a9bee8e5117b556f5d4b6ebb603 |     
   mipsel    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bcfa76e616a3f84b0df6c727ab2147681c6c0d37 |     
  aarch64    |           xen-4.13.0           | NOK | http://autobuild.buildroot.net/results/734692b77df74472c1c105149838cc98ddf456c6 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_256mb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255323  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255632  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255635  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255638  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255640  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255699  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255771  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255780  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255914  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255954  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454255988  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/454256067  | ORPH 




Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   erlang-22.2 | 8 
                linphone-3.6.1 | 6 
                    brltty-6.0 | 4 
                classpath-0.99 | 4 
host-sdbusplus-4212292bcf13... | 4 
             host-guile-2.0.14 | 3 
               libglib2-2.62.4 | 3 
             libopenssl-1.1.1d | 2 
                libtirpc-1.2.5 | 2 
       linux-firmware-20200122 | 2 
                 mesa3d-20.0.0 | 2 
psplash-fd33a9b3d68c89fa22f... | 2 
          python-jinja2-2.11.1 | 2 
                  gensio-1.5.2 | 1 
                 gerbera-1.3.4 | 1 
                 granite-0.4.1 | 1 
              host-grpc-1.25.0 | 1 
    host-python-markdown-3.2.1 | 1 
                libgdiplus-5.6 | 1 
                  pango-1.44.6 | 1 
              spandsp-20180108 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a2b17d90bd8aa41a0d46f7c9d3ac697aa000fbcc |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f0c240f7c3c299b2ed867ddd7634b3624f04ec25 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8f27b5315b38bd3dc42e7d6d5ccdadeb8da6ded7 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4e0470000ff83c4f6d8083d48da696acdfcbc57a |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/4901545bd01f6653906f7e8dbbf7fde9154e91cb | ORPH
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/fdce56924de9cd0f61ea01c22ea8b2fdf89167c1 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/dce425fce207d72ccd811595a0af0fcb8670fed8 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/486f1804886bd5c22861174d0d85a27cdf3b8e3f | ORPH
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/aa3988463446ecec4d9d63bf06d6abe290aa3c3f |     
    i686     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e7c5ff0c7647f2e0c7f6ee0e54152cbd68fe85fc |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2bd2a78316fa563956fc7cb3afcb96c2af0b4f00 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/74e5caca0c8cc097faee845bcdff859ac50455b7 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8cd09458cdddfbd3580909de2f6fa5f73f6e170c |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/95361aa99dff885c41b08076d34ae3c819cfbc5a |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/601b140ab42217aaaba245dca936b78d15dbae33 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4fda5174b2f46dfe1635eb37f6f608a471b98f12 |     
    arm      |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/255e4a404319f4a38a8fd21043f5bc9b070bdf62 |     
   mipsel    |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/5f38a8536e1e3e7d6a68e2bf77df276b7da01028 |     
    or1k     |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/0e248664b0bcbe0a91b1c9734318edeee17e26ae | ORPH
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/587df3ed4909cf2eb679bb3add467b3211d957e9 |     
   sparc     |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/6348e38b4151f6c79e3d73e20133631502cd456d | ORPH
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/e7b64be047d77e1ea909fb9fc225a0f4eb67d013 | ORPH
  aarch64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/41c88f9b74ceb0e5a29801e3e5999d6f73328475 | ORPH
   sparc     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/a2c491c0ccc1d47026d9111ca7ea389c60ace6ea |     
  aarch64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f73f83b6fb7873956dc75847aef9dbac15844ef7 |     
  riscv64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/37e3702415a3af226d89c71b97875b31071363a5 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/4d28553f06377497071f2920e3c4234c9a6989fd |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f85a5d8b137dcc93c065e7d5afb431d9e35d767c |     
powerpc64le  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f7f43b8f1ae703f9d9d9fe1734c719244ecea34c |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/656c3057573b96d7f047ba880a47b60bfa64b2aa |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5765b02bf49ed2c25ff830e73168014eb7ee822e |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/9a3114ca3b25338a457962b159f63e188839cfa1 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/39da68dfdad7a00ebfac3d375a1c260e296f7b4b |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/b69c000ae3e318443dc0381ea40a061eac662ec4 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c1d8f8600d4d838e327b0b6f9f58f87d9359fcad |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/323432f77ea251353ecfcf9f0339434aeeb5b171 |     
  riscv64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/c372f17f46b42adcbbddce38e763b578beb02785 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6b1dc8e756c201b03c9987c77808ce97ca74fb70 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f4f3f956a28c010e553c68fcf9c8d7561fe6c5cf | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4a60881ec4de962ffdd62effb5414e0c0a631698 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/af5628b54b09ea60c54e91767d7ef2e0c9edabc9 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/9f11a257cd109fdc62cb4daaecfacf7304e689cf | ORPH
    arm      |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/6799b7530db2813d06b291b397ae9c8bd51618c5 |     
  powerpc    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/dcadf4150b23fe9610bf9daca2ead0392ff40729 |     
   xtensa    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/dcbe3260735ed51a72fa07fa634bdbb6fe30dbef |     
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/d77d0f118c3b2af8674fa704d6af4309ee29bf1f |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/6c3aca2ea27fd44c63ed0b8d5f6621af47a07342 | ORPH
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/99bf11900ca398e64273e833ddc2ae92e8627a5a |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/122f5bc677199b65cbd0d6cc2476071f9d6c139d |     
 aarch64_be  |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/7f55aaad59e620d7681ba59752d96002877cc173 |     
powerpc64le  |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/84afe890e787a5dcd337d128b511b2f21b15b104 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/fb752978901b1ff970470bdea83317b2158d85e9 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1ae121524d1904f84aadd10460308f1f6ea9fafd | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3c25b9f0ee04952d3406b82fbeec98e2428287aa |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/076555bbce2b9ad7d5d5280abd22768ef7498bcc |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 3 
           host-libselinux-2.8 | 3 
host-google-breakpad-7515ab... | 1 
             host-guile-2.0.14 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/d72f55f75e0977bd426fc81af54829df7f63a321 |     
    arc      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/485afd0d45aa6c7bbaf0373dd3c72684ddeac27d |     
   mipsel    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/2c80fba5e2b70a1d002463d0860dd0e2caacce2c |     
    sh4      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/6c1c898cf8a96122087dd64132737bc26b86791e |     
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/cea8425583ded077232638e697030c2b9e98e79d | ORPH
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/b9d891966c472e19e8516454dc996895abc313c7 |     
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c8664773413b805f868dc2078ebf5774512a3a1c |     
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/910ae599d452b2ad107ccdc005ab2ab6f3a04201 |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/de2a02d96508f4ffc3fbc61ccbc0cc72af9b58e9 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 2 
                  boost-1.71.0 | 1 
                classpath-0.99 | 1 
          gstreamer1-mm-1.10.0 | 1 
                libgdiplus-5.6 | 1 
       python-matplotlib-3.0.3 | 1 
           python-numpy-1.16.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/7ce8d5005e80820d8286d7e95ccbf7990afb8b84 |     
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ded8165efa593d6154ccbe2fb69e294e340cba81 | ORPH
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8e9ca2f6660290e0c7771215eab48766246e270d |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/9a7e5c729876885f67e78ec6f0b94326b40a65e7 |     
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/4d35ae2fd80044333a7e96b7c01ecdea8d49ecce |     
  riscv32    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/3f90eb8c0895b0c65c325213375c19f5842bd544 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2da1d02de3349fe9d5394877efb2c1e219801f3d |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/65327b688853e5a168e29a3aea26ef4e6939bbad |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8..7_SP3.... |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200214     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.35.92      |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.2.0        |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.2.1.2      | 1.2.2        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.2.1        | 1.2.2        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r29   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.850.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.2.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.2       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.35.92      |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.5       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.5       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.60         | 1.62         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.4.0-alpha  | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.16.0       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.5.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.19.1rc2    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.3       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.13.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.4.1        | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     can-utils |  DISTRO  | https://release-monitoring.org/project/10554 | 2020.02.0    | 2020.02.04   |     
                    cannelloni |  DISTRO  | https://release-monitoring.org/project/21403 | 20160414     | 20170601     |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.42.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.42.0       |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.13.0       | 0.14.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.9          | 6.10         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.16.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                       connman |  DISTRO  | https://release-monitoring.org/project/00337 | 1.37         | 1.38         |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.2       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.10.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.5        | 1.5.6        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.16       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.1        | 4.4.2b1      | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.6        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20191210 | 1.3-20200228 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.6      |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.12       | 1.3.3        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.5      | 19.03.6      |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.11.0       | 9.12.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                            ed |  DISTRO  | https://release-monitoring.org/project/00659 | 1.15         | 1.16         | ORPH
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.02        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.178        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.2       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.28         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0-rc1     |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.14       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.4        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.22       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.7        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.32       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.19       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.31       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.4        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.18       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.39       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.5        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.23       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.3        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.3          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.1        | 6.4.2        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.17         | 3.18         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.0        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.0        | 2.1.1        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.12.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.02.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.1        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.8        | 0.9.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.35.91      | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 1.5.2        | 1.5.3        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.24.1       | 2.25.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.92      | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.7      | ORPH
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.2.2        | 0.3.2        |     
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.10       | 3.6.12       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.8       | 1.14         |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.62.0       | 1.63.2       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.1.0        | 5.2.0        |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.3          | 3.4          | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.28.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.35.91      | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.2        |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.5.91       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.0        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.2        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.92      | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.2        | 2.1.3        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.2       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.332        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.29.0       | 2.30.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 66-rc        | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-27     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                        inadyn |  DISTRO  | https://release-monitoring.org/project/21677 | 2.5          | 2.6          |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.4.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.4.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 20.1.pre1    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.5        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.5          | 7.6          |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.5          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.8.1        | 0.9.0        |     
                         jhead |  DISTRO  | https://release-monitoring.org/project/10546 | 3.03         | 3.04         | ORPH
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-12-R2   | ORPH
                          kmod |  DISTRO  | https://release-monitoring.org/project/01517 | 26           | 27           |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.5-Leia    | 18.6-Leia    |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.2-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.1-Leia   | 2.2.1-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.1-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.3-Leia   | 2.2.1-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.4-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.5-Leia   | 2.1.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.3-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.3-Leia   | 2.1.0-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.2-Leia   | 2.1.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.2-Leia   | 2.5.4-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.8-Leia   | 3.0.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.5-Leia    | 18.6-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.2-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.1.3-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.1-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.20-Leia  | 5.3.4-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.8.8-Leia   | 4.11.0-Ma... |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.1-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.2.6-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.18-Leia  | 4.3.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.2-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.1-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.3-Leia   | 4.2.4-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.9.7-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.2-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.1-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.3-Leia   | 3.1.1-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.2-Leia   | 2.3.1-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.1-Leia   | 2.3.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.1-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.1-Leia   | 2.2.1-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.0-Leia   | 3.1.1-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.3-Leia   | 2.2.1-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.5-Leia    | 18.6-Leia    |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.5-Leia   | 1.1.2-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.1.0-Leia   | 3.1.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.3-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.4.1        | 3.4.2        |     
                     libargon2 |  DISTRO  | https://release-monitoring.org/project/15244 | 20171227     | 20190702     |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.33         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.3       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.14      | 2.10.15      |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.0        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.31         | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.8.0        | 1.9.0        |     
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.8        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/01625 | 0.20.2       | 0.20.3       |     
                       libgit2 |  DISTRO  | https://release-monitoring.org/project/01627 | 0.28.4       | 0.99.0       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.2       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3          | 3.3.2        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.4       | 2.64.0       |     
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.24       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5          |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20190621     | 20200225     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.7        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.15.1       | 1.15.2       |     
                        libite |  DISTRO  | https://release-monitoring.org/project/17367 | 2.1.0        | 2.1.2        |     
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.17         | 1.18         |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.20.4       | 1.22.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.3        | 1.1.7        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2019.6       | 2020.2       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200218  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.0.4        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.4       | 1.24.6       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.47.3       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.20.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.2        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.69.90      |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.16.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.12.0       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.18.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.34.1       | 1.34.2       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.1        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.10.0       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.109      | 1.0.130      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.5.2        | 1.6.1        |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 4.4.0-alpha  | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.02.25   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.4        | 1.0.5        | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.15.1       | 3.16.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.31         |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 2.0.0        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.11.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.11.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                           luv |  DISTRO  | https://release-monitoring.org/project/21510 | 1.34.1-1     | 1.34.2-1     |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.9.3        | 2.10.1       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.1       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.23       | 4.8.24       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 168          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 2.14.0       | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.5.22       | ORPH
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.53.1       | 0.53.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.35.92      | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.0      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.1.0        | 5.1.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.1.0        | 5.1.1        |     
                    mini-snmpd |  DISTRO  | https://release-monitoring.org/project/21523 | 1.4          | 1.6          |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.1        | 2.9.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.01.1    | 2020.02      |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.3        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.105    |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 1.6.8        | 1.6.9        |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.0        |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.0        | 3.2.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.6        | 1.8.7        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.5        | 1.1.6        |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.1.24       | 1.2.0        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.3       | 1.13.4       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.7          | 4.8          | ORPH
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200229 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.23.2-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.11-dev   |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.7       | 1.17.8       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.16.0      | 13.9.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.10.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.5       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.7        | 0.3.9        | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.27       | 2.0.28       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.1.1        | 6.2.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.48       | 2.4.49       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.3rc4     | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.9.2        | 3.10.0       |     
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.5          | 0.6          |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.1p1        | 8.2p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.5       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.19       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 0.27.0       | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.5        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          pcre |  DISTRO  | https://release-monitoring.org/project/02610 | 8.43         | 8.44         | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.33        | 10.34        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.9       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/02811 | 1.642        | 1.643        |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.18         | 6.22         |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.066        | 2.067        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4229       | 0.4231       |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.32         | 8.33         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.21         | 1.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.110        | 0.112        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/05675 | 0.19         | 0.20         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.008003     | 1.010000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0202       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.4.2        | 7.4.3        |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.0        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.86.1       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc3     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.3.0        | 7.0.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.2        | 1.3.3        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.5       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.2.0        | 1.3.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.11.1      | 20.2.2       |     
                python-automat |  DISTRO  | https://release-monitoring.org/project/15101 | 0.8.0        | 20.2.0       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.8.2        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2019.11.28   |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.14.0       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 20.2.1       |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.43.1       | 0.46.4       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.15         |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.11.2       |     
                 python-enum34 |  DISTRO  | https://release-monitoring.org/project/08176 | 1.1.6        | 1.1.9        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.12.2       | 1.0.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.4.1        | 0.5.0        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.2        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.1.1        | 3.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.14.0       | 0.17.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 1.0.0        |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.8          | 2.9          |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.13.0       |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.15.1       | 0.16.0       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.10.3       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 21.1.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.1        | 4.5.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.2        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.1.1        | 3.2.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc3     |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.8.1        | 0.8.4        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a2      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.2.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 0.6.2        | 1.0.0        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 4.7.4        | 4.7.5        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.6.0        | 2.7.1        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.5.1        | 0.6.2        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.1        | 1.7.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.2.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.4        |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.7.0        | 4.8.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 19.3.1       | 20.0.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.3        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.6.7        | 5.7.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.8.0        | 1.8.1        |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.7        | 0.2.8        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.2       | 1.19.1       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.4          |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.5.2        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.1        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.6        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.4       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.79         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.9        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.27.2       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.50.0       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.1.1       | 19.0.0       |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.2.24    |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.22.0       | 2.23.0       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.1        | 3.1.2        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.9.0        | 2.9.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.2       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.2.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.3.3        | 3.5.0        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.0.0        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.0        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.13       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 0.17.4       |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.9.1        | 0.10.3       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 2.1.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.43.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 18.8.1       | 20.1.1       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.6        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.8       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.7        | 0.1.8        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.0        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.0       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.26         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.8        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.24.4       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 4.7.1        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.1        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.2        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.30.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.14.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.14.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.3-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                restclient-cpp |  DISTRO  | https://release-monitoring.org/project/21388 | 0.5.1        | 0.5.2        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1911.0     | 8.2002.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.6          | 1.7          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.0        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.41.1       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.41.1       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.3       |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.6       | 4.12.0rc4    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.29       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                           sed |  DISTRO  | https://release-monitoring.org/project/04789 | 4.7          | 4.8          | ORPH
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.1.1        | 4.1.2        |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.5        | 3.3.6        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.7        | 1.1.8        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.3.12       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.32-9731... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 5.0.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.0.2        | 6.1.0-rc1    |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.4          | 5.5          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.2        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1.1      |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.5       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.1        | ORPH
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.24.1       | 3.25.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.3.21       | 1.4.2        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.3.1       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 244.1        | 245-rc1      |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.2        | 2.4.0-rc1    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.33       |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10         | 4.10.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.9.1        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.5        | 1.4.7        |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.47.92      | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.2.0343     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.4          | 2.6          |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.92      | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.20         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.18         | 1.20         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.4       | 2.27.91      |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.5        | 5.5.6        |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.3         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.3        | 5.0          |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.1        | 3.2.2        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.4       | 2.27.91      |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191217-... |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.2.1        | 3.3          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.14       | 1.4.15       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
                  xapp_xkbcomp |  DISTRO  | https://release-monitoring.org/project/15018 | 1.4.2        | 1.4.3        |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.4.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.28         | 2.29         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 353          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.00         | 2.01         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.7.1        | 5.8          |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
