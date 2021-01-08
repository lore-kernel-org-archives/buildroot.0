From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 Jan 2021 08:34:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-07
Message-ID: <20210108083411.5288780077@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  9  |  0  | 28  |
  2020.11.x  | 19  |  3  |  0  | 22  |
    master   | 139 | 54  |  1  | 194 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 9 
        host-sentry-cli-1.57.0 | 6 
            erlang-jiffy-1.0.6 | 3 
 Makefile:753: target-finalize | 3 
            qt5location-5.15.2 | 3 
                clamav-0.103.0 | 2 
                coreutils-8.32 | 2 
                 mesa3d-20.3.2 | 2 
                    olsr-0.9.8 | 2 
                 open62541-1.0 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
               capnproto-0.8.0 | 1 
              fstrcmp-0.7.D001 | 1 
  gobject-introspection-1.64.1 | 1 
                   gvfs-1.44.1 | 1 
                 haproxy-2.2.6 | 1 
             kismet-2020-12-R3 | 1 
               libuhttpd-3.6.0 | 1 
                 libusb-1.0.24 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-5.2.0 | 1 
               target-finalize | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                    vlc-3.0.11 | 1 
                       vmtouch | 1 
               wireshark-3.4.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/7aa9bc600cfa63125fe2bb38c824eca621b7c335 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/99efcbac2be28b8a831a2caf0080b623c3dc8144 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e26bad81ad291af8f5fc33b03ecfe84a4fd689a5 |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/37b365f104cd1074f889697db51ea9631f618639 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/46dbf08eec07dc8865399457548c27a7117b4bce | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/f0e5b621ef12ab128de5e791d1fd51bf634c4453 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f22344ddc03cecaac15d6b87fcf0cb4496d0d0af |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9100f213bcf294f069416592c165593027b5a057 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/af6a5714990cd53e5f8a8278910162cbb66786f7 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/b209df4414c970d58bf7032df92c89c89bde65a1 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/e11f2cedd5b2e55fb295ebf920f9eedf20e1d9f3 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ab1b7ba76c4de5e1e32ee9b9a3fd314f6918bc07 | ORPH
    sh4      |         haproxy-2.2.6          | NOK | http://autobuild.buildroot.net/results/c58376165406ed28cf736cb13158629f654a7491 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bfdda3a7e1a133c82a9f84bdd091583074a3fdd9 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e9eff105a815302b7d19710097c2a832b74a56b5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f35f8d462fc64e571a11af15dd73b2fc5387a633 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e66be1c6cfdf39a7e1cc617c20cfc9dd22a14c67 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/660fb94162df9525de0295999517a26f597a3d85 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2d6f9e07d87e4aac79de231a4e494c6377f4c960 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/6393b1348ba065cebc62fd3df0046bc80c357fe3 | ORPH
   x86_64    |        libuhttpd-3.6.0         | NOK | http://autobuild.buildroot.net/results/0d53b561ba02db018ca90dce29e9064b12c1276b |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/51defe571f612222b8624898b6ea7f1ee86df9c7 |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/602d02e59be7588d1245c89a582a4d9ec7ffa2f4 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/c7f5b39d3f2685050fbffd20c7af347a0f88cccf |     
    mips     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/53f6e3c908edc5dc7f61dd0844f85c971ffe827c |     
  powerpc    |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/d90aa19f49da4172e94451f44b3a4ab2c0f6e927 |     
    mips     |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/caabb146470d4bf813a91545964acb1772e65a58 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d9f05fa8557b9a849955aa387b128f070a9eafa8 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/c49de5742aba01dc1332ea2dfcf49cdb73b0a188 |     
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5b598d728e6aae61b295681b0d7777e83074fecd | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b457b18dfdc9a38a0e5c8198e5d760906822ab5c | ORPH
    arm      |         open62541-1.0          | NOK | http://autobuild.buildroot.net/results/8a719397079b5b529fa83d7bd27780d40bcbd4ee |     
    arm      |         open62541-1.0          | NOK | http://autobuild.buildroot.net/results/86ca6a5a01ecfc7030c6be0da81924436b41d057 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3af7b9fd6538d71d3374fd9611f389b9165b35c2 |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/27bc01a960cba062803f37466e136d84fa0d6eed |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/3b8f239e987643d3ed31f48858f42a71d36b32e2 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4cb79e99ef8ef680aa3d4e8655451b70a3706e1b |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/5ff5013c7edb723d011df4164a23ba9f3311d839 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/255ffa6c5bb11c2bf3baad4231f00c2dcb31e2ba |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ba24ba65dd75a14e2f52d6f6c966a3642c5e336e |     
   x86_64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/47642e2827cecfe7238ea5f8521ebfa7e5cde781 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6c77d6e0f447c92486ba868d3de91f82242f5484 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/651138237f878b3532b8f1de0594e084f9f9f0e6 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/5e12dca19dbf1458253154a0a383d3a9d05c733a |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0660816acbd3df7a3d4e47506238050bd4c9e11a |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/bf9b635894eaba5dbdadf0a210b0ab2939c33562 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/701e9b0ef83307a57b9f7f8d42ff00618fc4e1be |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/5c6d9a99e6691609670d206134a21a9b9c62ef2d |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6ec9eab5d789930ed0bcd5a8d0a3d9e273013b8b |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/780609cec563478c633bcee0af177c02b48aaba8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/c289fae14280744538972a6e23e5e41f6afdcbc0 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b55a8cffc624afa90c6ed6fff712bbc7c466bba4 |     
    i586     |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/fb12d981f7ebb859618bc17ed5f18a9fee1e98ee |     
    arm      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/97aec12189aa5d8c8d8c643bf32346ff8ec7b8c3 |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/878a2755e2a80f2372e688572c202388c72c809d | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 2 
                 uclibc-1.0.32 | 2 
                bitcoin-0.20.1 | 1 
                  cairo-1.16.0 | 1 
        qt5imageformats-5.12.8 | 1 
                suricata-4.1.9 | 1 
              wireshark-3.2.10 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         bitcoin-0.20.1         | NOK | http://autobuild.buildroot.net/results/93854425df6d7df55c06aa0cb004a21aa3d8b80c |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/61a7b391adb5656a47544ba36423286e6f7f650b |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/53b4eeebe33d2f2c2e74911185803af9728c2c15 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/16fda7936892be752f27b03a29ce2f21b9d3bc4b | ORPH
  riscv64    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/28a9efaf4d2552b2e3291d0a735d3de3abec4c0d |     
    m68k     |         suricata-4.1.9         | NOK | http://autobuild.buildroot.net/results/d60adc9b881bd6a3a22468179a031d37f3334963 |     
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/0f2a74e0432528c73b9b144c2433dd88fca27ac9 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/c77e830532159d40fb685f8bbc5ae6f1b210e54b |     
  powerpc    |        wireshark-3.2.10        | NOK | http://autobuild.buildroot.net/results/968f68da894f1489414e78fd7c7330fabbceb6d0 | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                host-go-1.15.6 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/6c5dad3bdf78f2e2d4c326150e2c4ff8bcac8aaf |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3a36865d91138b7a64ac8bc6cdb898b4acccfd13 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c6bb183f94f486219264db6b61f728231099de3 |     



-- 
http://autobuild.buildroot.net
