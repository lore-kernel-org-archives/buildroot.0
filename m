From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Sep 2020 07:10:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-09
Message-ID: <20200910071022.7ACC387660@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  5  |  0  | 25  |
  2020.05.x  | 14  |  5  |  0  | 19  |
  2020.08.x  |  8  |  1  |  0  |  9  |
    master   | 135 | 60  |  0  | 195 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.42 | 10
              asterisk-16.10.0 | 7 
host-meson-tools-0a02e2d344... | 6 
                   libcap-2.42 | 5 
         libcpprestsdk-2.10.16 | 4 
                  uhd-3.15.0.0 | 4 
                       unknown | 4 
              host-grpc-1.31.0 | 3 
                 fwts-19.09.00 | 2 
                 gnuplot-5.4.0 | 2 
              host-guile-3.0.4 | 2 
                  c-icap-0.5.6 | 1 
              cryptsetup-2.3.3 | 1 
                  gqview-2.1.5 | 1 
                   guile-3.0.4 | 1 
                iptables-1.8.5 | 1 
             kismet-2016-07-R1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
neardal-4143d130ed39299bfc5... | 1 
                 opencv3-3.4.9 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                    ympd-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/45c264934b572563134f42e23dd73be422a95faf |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/81b5a4d1cd78fc441ea22bcc5a1b388ba1895208 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/6411a529e7ece5e10432d97f442fc929efda1977 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/4122c772c473c9ed7e57680372e8eee81a301461 |     
   xtensa    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/13a69b70920b94c6f14ac5df4063cc743d0137a0 |     
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/0227fcbfcb0dfb3615c53eeaed517dfab0f81cd1 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/bfad4ff7cf3f9ce86d9572ace4d6c09295c62af0 |     
    arm      |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/ea107d725cbe01c415520bd9ea8092619222cd9e |     
   mipsel    |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/729547c09930c7f4b4dd0be2c764dc5d77326722 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/3b07051da6dffd47592d92f84a05c007c6895f18 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/56dbae67652a2ba308b5b2e76f7f5b68fe4fb77a |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/6869f2202f06483f32030eceffa5a9561b5a3ae7 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/367821f019efd6c8e2206be3b23b6de73f992e88 |     
    arm      |          gqview-2.1.5          | NOK | http://autobuild.buildroot.net/results/ab19e23cae603b2aa6e696e4937d106883e78b76 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6fba551a0166f4dea86d6ec6b09ec64f2f7be096 | ORPH
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/f5c0a6205d3ffe2614f65504a059f10c249b309b |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/528501dffafafd5337d9e6d2f3f9c019b1fe5335 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/cb032a128bbda400419bc4cf77c84a37406a3541 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1a9a2c9af3e8866db670ef947f71f4afb6415e9f | ORPH
   x86_64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/b4452d4b97861711d2ec713aefa250fb63de90f0 | ORPH
   x86_64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/d803481093d3ae24b002bcdbc4986679cdd6d1cd |     
   nios2     |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/344fc46c0a298285fae424b955b01acb54093b29 |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/e13ccd9256d55743ce51e54bbbb62818f4ec4f89 |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/0deca9aea278cff5bb33b9fbaa5440b94cccae03 |     
   x86_64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/ceca0ab1f8ba27d50b3abb901b90a41839ed415b |     
    arc      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/80c7fae95b7a80467cccc8aaa5f90c0ea365b9ee |     
microblazeel |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/0b388da7af445864b55bfae8de133a7b62e239ba |     
microblazeel |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/50875269d517d1d6dfbe2771e6e276c277b817ae |     
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/4b14458014e420ffe088f118e7d0261e67f2d551 |     
  riscv64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/39f6b0d92cfff1219f2d39c5f0ce94ab219ae8c3 |     
  mips64el   | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/62bca4b6a0315c546a684f280588bd3bb4dba269 |     
  riscv64    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/328de18ec6f87fb53707843b33773f3c05ab3d46 |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/822453abad550ec761c35b81fc1207453fed1323 |     
    arm      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/0328c699ff6b6b3b704b7f0d19042251cedc18a6 |     
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/d195a97666c1502f00ea5240669389e05a3bce8b |     
    arc      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/1d4c8241b68ba2474711ca6c2090013e6e296907 |     
    arm      |         iptables-1.8.5         | NOK | http://autobuild.buildroot.net/results/00f551be87507757a78e332f2859b1e7b3190363 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/87e8f8701da53bc7f27c20f00ab7c4893bce2e79 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9475eb47b78cb256febb69013ada7ab918753121 |     
  powerpc    |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/8961759067c4639ae697b6ee5db606f098b7c7e8 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/69c1d3526dba0b9989c70ac606d22140f31dcd17 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/2abc3250318438e51a198872a0a2c97f2e7db4cf |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/182c211fda6bf69b5559a62609cab40da1440cdf |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/d714690875737818c0e73d6c38ab5c2807c92452 |     
  aarch64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/64b65bccc6c8e7c12e9b75e3534bfbad2b62d699 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/164af8f254a388e0a5f6d9ab68d22f086148e3e6 |     
    arm      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/b84cadc9e3ec235443e5d4e18aa99acf101f8e6e |     
   nios2     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/98dcb6b2d3391b1569948d3facf6ccea58a716cd |     
    arm      | neardal-4143d130ed39299bfc5... | NOK | http://autobuild.buildroot.net/results/7efb100c899b67ffd570f73c202442f95ca5397e |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e602d24eb925246ac6b9636992f18dec2d17ded7 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/38ee96637083127b704a53ba245b39b83f60ab16 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/f0daa28c8ea4c1e7f5e7aeb8450701fde4fa9b43 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/e0f76d2cf456914556ad222da63ebfe1921d2b44 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b8cb629d395605f9ccf2417e10a3dd3a26318e18 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d19e0c945e104dace711f71fb788126cf611b859 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/460ffc3d5c277575778a987666997863fbe281be |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/116b1fc37c52c860af2863566b96e1eb3011e469 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4c7c1bc9f7060a743dc474afacdb1e539c247441 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/84c520223bbc044371a84b803dc22ded233bbc43 |     
    arm      |           ympd-1.3.0           | NOK | http://autobuild.buildroot.net/results/ea4b96ba8d4a398515ed349e8304a656b684f718 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

     dovecot-pigeonhole-0.5.11 | 1 
            flatbuffers-1.11.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 qt5svg-5.12.8 | 1 
                samba4-4.11.10 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/f242e2e06abf12aadc9b08cbcf583bc183b90f97 |     
    arm      |       flatbuffers-1.11.0       | NOK | http://autobuild.buildroot.net/results/d12c4d7994b608a36de4bffd14b05ec985f3af53 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1e05dad656ba9ddb6b49488996ae86c0b18e8ba7 |     
    arm      |         qt5svg-5.12.8          | NOK | http://autobuild.buildroot.net/results/966e784628b4fd6928a34d1cb3e454fdd553d5c3 |     
  mips64el   |         samba4-4.11.10         | NOK | http://autobuild.buildroot.net/results/41b64b84203c76cd016794399976086480a8ad85 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              luabitop-1.0.2-1 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/51ffc3ce775a081a10c367456561f254ea014b5a |     
    mips     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/38017e5bc6b0a33b7e92022aff20cb5acdfcc248 |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c9a5d9935e47e19699e504c2223d50790393d247 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d129714e2a7cdf4aee1df414690ffddc03820b47 |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/0aa8d98786f31390ede108c1d059a73d5c29a67f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

  binutils-arc-2020.03-release | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/731236c158d984ffcfb1d52ec0c248b61cc0fe93 |     


Gitlab CI results for 2020-09-09
================================


-- 
http://autobuild.buildroot.net
