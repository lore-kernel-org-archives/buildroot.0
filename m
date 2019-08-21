From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Aug 2019 06:17:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-20
Message-ID: <20190821061741.9EC4822DDB@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  2  |  0  | 22  |
  2019.05.x  | 17  |  1  |  0  | 18  |
    master   | 151 | 33  |  0  | 184 |
     next    | 11  |  8  |  0  | 19  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/9889162c9fc1c52e917803a2d917332f90c72262 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/95f7e3a1918296dac7691215d499169e7eac981b |     
   xtensa    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/9b60a2e64391e27873a5071b1828c51dd81c38c6 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 5 
                 libdrm-2.4.99 | 5 
                    mpv-0.29.1 | 4 
            host-mfgtools-0.02 | 3 
                host-go-1.12.8 | 2 
           host-harfbuzz-2.5.3 | 2 
               wireshark-3.0.2 | 2 
                    ffmpeg-4.2 | 1 
           host-nodejs-10.15.3 | 1 
                      icu-64-2 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                   mpd-0.21.11 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
           python-numpy-1.16.4 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/00646ce674785b95a169ed741542cf21f86a0961 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/839728e84cad5e7b105a1643b963d93d7e234329 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8a005870cae7c413f0bbc40958bcfd2b165817f9 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/915757d926f171597bca19796f81d326d82a39cb |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/84286e47101767c6e0d2312819239cbec5210017 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/a752e1940c65a4c2c759f75f167b3ff725788794 |     
  aarch64    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/bfde0fa0f9049fe5b349a28a89199b70543876fb |     
    arm      |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/3166d89f7cd3b85f2ff17ecf55177f2ac749553d |     
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5cb69a6df31845091fd1c8ef0257244f82ae28fe | ORPH
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/66ba2b46389e9b57b23ad56baa16a989d8bf35e2 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/431e358e6080772ea80094140c4ea93b1ee73db0 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/21d15b28d1a98327827f2203b2981ed6a8bbcf5e |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/51b7d000bbf397aa30a3365a0937ce4132ab2f9c |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/9a5c16877fb2167a03a2d2a0b54f3fe2f1190484 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/65aca9c7765598ed59df50d3b2cadcfaf539b71f | ORPH
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/fc573e7fd61695cf90ee94ada2415a76fd9a225d |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f094c68fb7caf9977262f8fe54294e6e05ba9ece |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5d86f54e89743ee61a33552a2e405803c6e43a96 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e22099a52650f17d1ca4b05cb083cbf847b68f85 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/48c1265eabfa2151e134bf0fe069e05d99861030 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/5ca5b753d34671109d67632853a683152905feab |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/cb304ff1735c8cf9ee627d02f7832e042ba83b7d |     
   mipsel    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/2b843d08e244edefb8aeefd2df3e85fdca488b19 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2ea77d64f383c47c728601230d986b9fbef704d3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/38c234727d7bcd5dbb5ea4f9a68c69275dafef34 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/10397b7c299cad38c2f7b2bf8bdc591645b537cb |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/677c3ce65a77df73e1802aebccec0ec853340802 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0db17610af5c6511727845c13a2a3742623f3c1d |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/34fdf83af1987683769288ae34741d7e16a76b10 |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/ac97b69e979380093f1a96531353c5d8eb6b04a1 |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/11029c0cf245e4a9d2c473f0384785896d00fb08 | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/16341d119ac08b9355ff4a6584282eb905a5a707 | ORPH
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/4306c2204ccf134f88297d98df5ba73afb2e856e |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   dvblast-3.4 | 1 
       gst1-plugins-bad-1.16.0 | 1 
          host-capnproto-0.7.0 | 1 
                host-go-1.12.5 | 1 
           host-harfbuzz-2.5.3 | 1 
               log4cplus-2.0.4 | 1 
          qt5multimedia-5.12.4 | 1 
                    strace-5.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/0e057b66e90a02fdd62c023e73edcdb17269f206 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/1280f7661a1c3ef694d23ff7c951101ff0e5eee9 |     
    mips     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/2d9f0377f10cc5ca5aa660260810b5957c2e0a68 |     
  aarch64    |         host-go-1.12.5         | NOK | http://autobuild.buildroot.net/results/9571527ba8e60d4870e3c9066729049a26151b97 |     
   xtensa    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/c3e973d3e2d7c33120e75a4a626e14ac75574c44 | ORPH
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/46d4f74351ac03aae571ae99564836f224fb879d |     
  riscv32    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/9085337e4db95c4e953dc208985705aaa5a3c76d |     
  riscv32    |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/912776cc1da1719806058516a2cc2a47c8dbad9b |     



-- 
http://autobuild.buildroot.net
