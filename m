From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Mar 2020 07:26:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-05
Message-ID: <20200306072634.4BB4B203D7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.11.x  | 15  |  1  |  0  | 16  |
    master   | 140 | 42  |  0  | 182 |
     next    | 36  | 24  |  0  | 60  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 5 
                      bash-5.0 | 3 
              host-grpc-1.25.0 | 3 
             host-guile-2.0.14 | 3 
               libupnpp-0.17.2 | 2 
              openjdk-13.0.2+8 | 2 
   openvmtools-10.3.5-10430147 | 2 
               protobuf-3.11.0 | 2 
              bitcoin-0.19.0.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
               dvdauthor-0.7.2 | 1 
                     flite-1.4 | 1 
                 haproxy-2.1.2 | 1 
                host-go-1.13.8 | 1 
           host-nodejs-12.16.0 | 1 
               libglib2-2.62.4 | 1 
                 mesa3d-19.3.4 | 1 
                  ndisc6-1.0.4 | 1 
                  polkit-0.116 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.12.7 | 1 
              qt5enginio-1.6.3 | 1 
          qt5serialport-5.12.7 | 1 
                 qt5svg-5.12.7 | 1 
                 ser2net-4.1.1 | 1 
                     vlc-3.0.8 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/05351f482080d2ca84b0d449eaa57070c0da5de3 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/2edfba59345258259da2d5d1db63061f5e6d4a01 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/6701e745aac36f3d07836019437362a902a3ea23 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/81fe87916fcbe948092bc1accbda305eaafc6473 |     
  mips64el   |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/5bba7c2ebdd690a13c73bfae5703031bd8afbc8c |     
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/921f644953bc46fdda7a161ffe4eeb798061db3e |     
    m68k     |           flite-1.4            | NOK | http://autobuild.buildroot.net/results/ce367e45b033f77a3d4290a48e8cef1be07a590a |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/2a7fc0d95cbddaf0e10b1e835d546f723f589276 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/e70667bd18b43ef4e71919600c2be09e012bd8c8 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a97118382b4212ab7108c72c309293cec676bceb |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/03702f96db98536a5a98df2868fcf64383725dfd |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1ddaf353b07dba9644f9ef991bd3c12036c1efeb |     
  mips64el   |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/c7eb3162b99f0948ddfb00c5d4524f6b71806107 | ORPH
powerpc64le  |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/4881ed2a70ed63be00de34dcd952bb33d7f4e9ce | ORPH
    i686     |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/265caf9d842882d963d2a6a6790c700b2a384f3d | ORPH
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/7bb974f22063fd5a987fb24d43d0013384c14d01 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/52a5308207eadc7bca511eca964084bd83296d51 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/fd1178d2f0c1a0a529342ee91859ed42adc903d5 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b2386bbd179b5c15c83f8ce987dce8c5fd61b9a9 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/6bab04d64bf912647ef6bda76d439bc2cbfe8907 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bca52819da63a9804fc33a7c798604eed1a89cf0 | ORPH
 powerpc64   |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/dfd40587b8d75caaae7ff93a9db42779f0ac6542 |     
    arm      |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/d1927ddb5d4a81691320e071b348442cfb1b3b71 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2ab9bf0042089aed4ed21529a2874f22c221309a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4aa3b9a676d473fc1ead046ae5cba81d213631aa |     
  riscv64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/b1393fc1f09223d4edd03bc17d60103c66362b31 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/83cb5be77626fa3fd3d663566f53b5fe95ac1e60 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/faaeffc127a1831fb3e4cf640da4d01fe29aa0f9 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/e5f60b66d88b70d16b6957cf1571edd4e6d86020 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/e0b181e42c185fbe5939d12c95443f0a37a02f18 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/59c67e77262d9c3777658f5e43a4af6a256adbe8 |     
    mips     |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/2017a04e2b39480152cb81921fa5754e277543f8 |     
  riscv32    |      qt5serialport-5.12.7      | NOK | http://autobuild.buildroot.net/results/fd51398fe64713348a86342853e6d59b91566e07 |     
  aarch64    |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/c137e8313836e8403dd663632c15d46c11348ad6 |     
    arm      |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/ccebd933feddcea2253837b8a0bf1ef96356b4fb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e640a655a1cd781469d2ddad72ae54560beae51 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/96069ca00c01e9dcf68dc99edbc44f3cc9c058c4 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f9465804331dc4c0aad64b8e9521834d9e46928c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/fb4339a2a400956305b01c47e3ebbd498d524d63 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc53cb90b214a598f17d701a7074a8c643500b14 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/b3a3641ca7812652992dd65cc7294195642213dd |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/4ffc8ed7a2b9d54f9a17e782304be9d5707c9c85 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 5 
                   erlang-22.2 | 4 
                    brltty-6.0 | 2 
                linphone-3.6.1 | 2 
                classpath-0.99 | 1 
                 dmalloc-5.5.2 | 1 
                host-go-1.13.8 | 1 
           host-nodejs-12.16.0 | 1 
    host-python-markdown-3.2.1 | 1 
host-python-setuptools-scm-... | 1 
                      icu-65-1 | 1 
                   libnss-3.50 | 1 
             libopenssl-1.1.1d | 1 
                  ramsmp-3.5.0 | 1 
sdbusplus-4212292bcf136d04b... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b09f7cbea010460327050fa5e6fd0c105cf1e2e4 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7887dfc3a799e2bad0ba8d4dc73ec42f548433e6 |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ff6ac557f6e93888f786c4ff53d7d4122ac72f9e | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/b65c5cde09e6762413bc247670086db481997cd0 | ORPH
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/9dd4458c9e218be922c87f4257f2b1b7755ba466 |     
    i586     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2b2394ced125945876a4545f60f2a740334c9e40 |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a09d1878a15ef9245f1c743179cefb145460f6c3 |     
    i686     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/39d61e471469ebd0c9857028c463a7d040685019 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/d71fdfe9048721b4c3863b83a0184e5474647605 |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/36636f317cbb8d49c861bd87ad0411ea640cdedf |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/8687fefc4e87fe931b1642cc882f4f5dedf50102 |     
  riscv32    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/33d2c827c41a86489b399988c106b9e18d8dc853 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/bd7f61c50dad42786d54a8afbf3b986adeff91ec |     
   mipsel    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/40b331837efe48ae84ab89fbde2e77ad9e036060 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/dec0e7a720646228dc42554da432e800dc335773 |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/81aa4ce1ba368e7ee0b50c4598b843f0ef6f04e9 |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ce691d2b2a4b04e4f5812c4e4d0dd70b18054035 |     
  sparc64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/eca7e8085219e3a46152f40f7c8ef629a53acf36 | ORPH
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/3b51f73cd5e736946358c365fa41806f10b943ae |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/b6fcda69366ca026424fadc522cdb2b54054f226 |     
    m68k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/971f8967b9400b733eb1a8095cad46fdda5c9d45 | ORPH
  riscv32    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/28df5bc750fc8e1f2dabc46646f91460e191501f | ORPH
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/2753525d1227d02b33cca2a43f21895131c25d3f |     
  mips64el   | sdbusplus-4212292bcf136d04b... | NOK | http://autobuild.buildroot.net/results/a93d97f742ffb0f0c5e7f16f498b2c9a32e09dc2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/1582b5b37552b704e551e6507b237585dcadb9f2 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3a7d091cfc9feedd2dd3eadc645b993dc2fac433 |     



-- 
http://autobuild.buildroot.net
