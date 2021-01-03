From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 03 Jan 2021 08:18:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-02
Message-ID: <20210103081900.21D2A8587C@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  3  |  0  | 15  |
  2020.11.x  | 18  |  4  |  2  | 24  |
    master   | 105 | 59  |  0  | 164 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 6 
        host-sentry-cli-1.57.0 | 5 
    python-mwclient-legal-info | 5 
package/python-mwclient/pyt... | 4 
            quickjs-2020-11-08 | 4 
                  bind-9.11.25 | 3 
              fetchmail-6.4.14 | 3 
                       unknown | 3 
                    qemu-5.2.0 | 2 
                    ruby-2.7.2 | 2 
               target-finalize | 2 
             timescaledb-1.7.4 | 2 
      trace-cmd-trace-cmd-v2.7 | 2 
                  zeromq-4.3.3 | 2 
               belle-sip-4.3.1 | 1 
                  boost-1.74.0 | 1 
                 dmalloc-5.5.2 | 1 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                hiawatha-10.11 | 1 
           host-mono-6.12.0.90 | 1 
                    htop-3.0.3 | 1 
             kismet-2020-12-R3 | 1 
                    mpv-0.32.0 | 1 
                openblas-0.3.9 | 1 
              wpewebkit-2.30.4 | 1 
xdriver_xf86-video-amdgpu-1... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/9e162276a5a8c5582f50adf87d9b1d38417d61bf |     
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/7a1a140314bc8d134f9eeb95ef2e46e7fb0ce9fd | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/f0db5fe7fc6860b7270c784989c451e2e7aa2afb | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/cb963298885df37f1e5c4d3ab3989773c01c54fc | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c08e3dbe326123ab37ca9bc510ae530be9b59d4d |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/bee53880394e8590d4f62fef7774dc5fd5c575b7 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/da5d6706c64ba6d06a2d8db6d821cc8f86d87503 |     
   mipsel    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/d8a75d3ca63d1ddbdf80b9019512c5bd95ecfd47 |     
   s390x     |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/2e56fd0c4bb63ecd64100e387535fded31d211bc |     
    arm      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/4570d0933f89118f92096281c5144ba88118c5be |     
   s390x     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/3b916ea8ab653545d51e9ea1b35177bdf57990a2 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c6cc4940883e1d658a0fc81579444d3f7bd19f88 | ORPH
    sh4      |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/1b27c9e4a55a89b82d7dc49f7666323604115bca |     
  powerpc    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/81fce30cbf12394ac6a337571e8c30e2fd93d9f4 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0711301b9c0e8f9324c95dc7db5ec88432f48c36 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7e14b06e345454bbfd97bd749a61400a104c3351 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4764d71807db3b51cd83653a98af00a573eeff88 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b56aad8e2598c771a74dc8810ae15fe162a53ff1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97cdcf5d017da678b850b6b3b9c9b2f6b81014d2 |     
   xtensa    |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/84ea9325dec3976d5df75d7a740cef1715666c5c | ORPH
  powerpc    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/f19b3d080514a799a1c75b38ff5f7ae4e8d2628d | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/1b0706090511f68756b700f35dc9c1a150238b7a |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5afdd14bc1538a6af967f07fed3c75730f57898c | ORPH
  aarch64    | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/0bfe1fde82dd71832418c8b8bd68df2c4fa4024d |     
    arm      | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/2b4ccb6ba6667322c00861ae9ce56f0c63f75a14 |     
  aarch64    | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/cd2bf0decd7080c968be3861cf1691ba8735e374 |     
    sh4      | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/cdf7a7d8095150ef622229b7bb8c11f54129a1c0 |     
    mips     |   python-mwclient-legal-info   | NOK | http://autobuild.buildroot.net/results/a94b9fb4c42198c75f06315ee82cd1b565ca9080 |     
  mips64el   |   python-mwclient-legal-info   | NOK | http://autobuild.buildroot.net/results/ab1c18813908ea76e7d9d88727ffd949e09688de |     
    sh4      |   python-mwclient-legal-info   | NOK | http://autobuild.buildroot.net/results/6729857557ed1b3aa321f2b124cc27a08200f89b |     
   mipsel    |   python-mwclient-legal-info   | NOK | http://autobuild.buildroot.net/results/4fa8d6c0ad8d38beb0a12242fede63c51dec8881 |     
    arc      |   python-mwclient-legal-info   | NOK | http://autobuild.buildroot.net/results/555c3cf117ce07f144bb1617ff2c315cc57619b5 |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/7d0018857bf7dd72bd9cfae13e965bc53819ffd9 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/d02fb24a1f9ee79998560e8096c58ae3d0eb3d4c | ORPH
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/e0766eef95a2559d51e58d1a81a9c40df84ae509 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c7882cc2d66984350f54d619f39cfee5065d941a |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/15d631f4fd46337271b1bbfae164763a64903d63 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/0a58b2275b85fef17c6359088ad4aef578b03103 |     
    arm      |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/4a7ea5517c810d39fcc97189e22f0473ed76fac5 |     
    arm      |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/1f997d96308b1ad99724b46c5ba0d669181350df |     
    sh4      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/004530d165b1aff3a26a01374970e8f20894812a |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/838da11cbd078ab8f42bcf203cdfd43455989cf4 |     
    i686     |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/078fec2605199a8899572bddb6d28cddf7bd27e9 |     
 powerpc64   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/acdfbe7741182327c454570cff882cbc319615e8 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/4a2b239677bee23846d286cf77c04af2b5577898 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/287476db94f559b76f51a87f17bc573150bf6169 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/27a58e332d597e5385ed1a628428bae628b7f1c3 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1c0054f6c9c47226b0ad5993546289d2bb2c8a00 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/18bdea64ac877a3dda826243015419b0cf848702 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2add3a9d42cb564860bf12859fa6ef241cde33e4 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/5abd823ab7beac1ea68c5ee528b9a9bb51bf986c |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/76278f52e7722e70061aecc39afdbbf2169b1659 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/97df10aebe04bdfe82e0cb98342a2cad0d2833a4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/df10b03776f1ff1ce8be1ff27192bfba22360b8c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/a8020aece5ec4d11aeaea5828423f2d8277ed835 |     
    arm      |        wpewebkit-2.30.4        | NOK | http://autobuild.buildroot.net/results/24a55f860ec8e4785f7d0a207c4cc7df7ff9bd8f |     
  riscv64    | xdriver_xf86-video-amdgpu-1... | NOK | http://autobuild.buildroot.net/results/298198c036931b10f7e1046176bd48310ae7455f |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/9c7a6aa327b61f3c9fd2332419c744e8573eb800 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/9cf643349e1aca76e3abdf32580e47529f174543 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                 mesa3d-19.3.4 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/97096d054828062e71d6c6fe3f35cb1992232274 | ORPH
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/7a062263267035ea7e749ddceea39080ba8b912d |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/2049681f2382bd109979f78a58deba9bc726aef5 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 uclibc-1.0.36 | 2 
              asterisk-16.14.1 | 1 
                        bustle | 1 
                 mesa3d-20.2.2 | 1 
                       vmtouch | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/01358dba3c6a31d2fbe4b6ef5e1ffecaaccb03df |     
   mipsel    |             bustle             | TIM | http://autobuild.buildroot.net/results/5084603b23c17cda329cb43b8e16b7c580ecce4f |     
    mips     |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/713de2344aaf6d1dfef68bb2a51b05430813a8cc |     
    arc      |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/6460d7d96c49810c08f6f7acb1dbfa8e438831ab |     
  powerpc    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/c53d7fa2baa5eee3128316b3e1da6143b5e76879 |     
microblazeel |            vmtouch             | TIM | http://autobuild.buildroot.net/results/1cee5248ff5c7d1e25e517974aeae11aa3a80170 |     



-- 
http://autobuild.buildroot.net
