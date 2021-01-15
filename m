From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jan 2021 08:20:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-14
Message-ID: <20210115082102.8715D2038B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  4  |  0  | 26  |
  2020.11.x  | 11  |  2  |  0  | 13  |
    master   | 141 | 70  |  3  | 214 |

Classification of failures by reason for master
-----------------------------------------------

                      ell-0.35 | 11
                 uclibc-1.0.37 | 11
        host-sentry-cli-1.57.0 | 6 
                    mpd-0.22.3 | 5 
              asterisk-16.14.1 | 3 
at-7c74fa1aece6bc6db351763d... | 3 
                     host-mono | 3 
                    qemu-5.2.0 | 3 
          gstreamer1-mm-1.10.0 | 2 
              libostree-2020.8 | 2 
                openblas-0.3.9 | 2 
            qt5location-5.15.2 | 2 
             timescaledb-1.7.4 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                       unknown | 2 
                  bustle-0.8.0 | 1 
                ejabberd-20.07 | 1 
            erlang-jiffy-1.0.6 | 1 
                gkrellm-2.3.11 | 1 
      gst1-plugins-base-1.18.2 | 1 
             host-cairo-1.16.0 | 1 
            host-libusb-1.0.24 | 1 
                 libusb-1.0.24 | 1 
 Makefile:753: target-finalize | 1 
                 midori-0.5.11 | 1 
                  ndisc6-1.0.4 | 1 
                 open62541-1.0 | 1 
               target-finalize | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/cdc668913404f8d221d1fa19cb93a8f94ffdeaca |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/6a9bb1f14796b280e97c3582e97577c628947baa |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/a9b9517198f00fed7f3337e6a248ccb1575cda66 |     
   x86_64    | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/62f7380b1640c0783415d18bc94b9f7f33e1f4e5 |     
    arc      | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/778f76deab7226a3e2d22fb572a6e7dec839eb76 |     
   mipsel    | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/e614a03455e04f63bd4843fbccd6b890075b1508 |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/b59abc6949d070503ba94c9c5a1a435d62ae8212 | ORPH
   mipsel    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/28b0a493d39c4e90f68b46b612ddb8e3216768d2 |     
    arc      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/8d37e5e23bc6575f2f8ac703dd4871b768f439e9 |     
  riscv64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/7afe23b8294930147f8c7f1fd2171d234580156b |     
  powerpc    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/761425220715ea740664d7213050616141bdb12d |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/61a1a33d83cc7010d8b854bb1bffbdfd0941e620 |     
   x86_64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/263acd13042dc63edca926ae8faa50111642f43f |     
  mips64el   |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/4ed2c67469626306d584c15defcd0e924be3b908 |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/83838d1323b3875d97f74b367b355e88ff6870fe |     
   s390x     |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/3772fa21b0403dc5d89f32783e8fd41a59944aa5 |     
    sh4      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/131f2c656b94d7eea53b133ccec0cf0b2bf5a54d |     
  powerpc    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/67459c1ec38ed0aa434eef085670a8d765988149 |     
   nios2     |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/ca8a06dbfc3e0049c38fb9ab3f69fc57b65ed4c5 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/da10ee78ae2a2eadd4decf91f5a1b2c8d29b97ef |     
  mips64el   |         gkrellm-2.3.11         | NOK | http://autobuild.buildroot.net/results/c5dfbaa7f285edcd1636f3240115421cba336424 |     
    sh4      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/ed7d25284a4dfab6fb963c295d2f9a628749d75e | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/71227dafbce5c36894ba640a0a3e6ef32d0ea5b8 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/16f5d01608fc668d71b134e321c131475f35c1a4 | ORPH
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/ef63095a54b7be196323ee6151b6a1dd23fed404 |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/22fc93746b45a197cd64bfd116edb33494756bda |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/16fb3dfba224d200d481645100e4b786bad6560d |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/76bd6ff3e7c1ac65df24d5ddd916cc37395467d7 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/9ec4dbf0b784b94a4b9b9ce5e00b2e2bfb25978f |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1fb4e60b4030c73faf801f03b1bb8d46a6f8cec0 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/38f5a374255751819f64541bbf5afc59f780635f |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/967a42eb19895aff4a899cdf82c1681674fcd1cb |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a7de329ada67205ce03857a28d666ffc96ad781e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5a582e5ddc6e283269dd40abce4e786f330aff88 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/208d0bbca31631a36b5b4ce59a8be796d6414953 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/e89446e29a6a5d1d8669ce54620070d1cca8c1fb |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/062d24a7ed302c65c9de9f134dc452f1c7645586 |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/ed8706a1ead398b5097b046524e710b1d3d0bb1e |     
 aarch64_be  | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/22e6139a221e64ce96e23d68a58b60074fc95473 |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/517546d62b1458438e5a906066fa262536a8b868 | ORPH
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4dec5afba6047b00dd7d1fef72835badfb47ea60 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e42a1d0cd808585a755754f839fe7d2080547191 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/31a9add54e2cf2fd42d0d69bf6e636dd5fd2f27d |     
   nios2     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8410902e22bdaed52947ef903fb32be4050dc05c |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a430f66bf299778b5f12ec214b2871ace0d3669c |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5b8e9f069e2bbeeb0b35beea0155711b5fcead8e | ORPH
    arm      |         open62541-1.0          | NOK | http://autobuild.buildroot.net/results/fc619cf6d1891b63008221dc662a69501649bc0e |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/f24e3918409ce29dd7df19596449c0a37d3a2e91 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/4202fd866d8e2cfac1dd5531b3ea02ffa8e3b338 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/d33fc2598eaf8ca5f7ba6f6cb9ecf82dec0450a6 |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/3abd69834db684fb2f19ff706a7e0b2ad7685134 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/331a188976f55f1bbcb6cf360ef97f11bb1dd883 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/981e47c9368171387d0f1280f292fc0e270ad8a6 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/5ff6c1a375eb94c5cff744d7e3c66990245da62e |     
   nios2     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e50ec7418a71e875c5b30493aee467a4bd7fc525 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/08de068e4c0b0257ac0e909e3f7debb8ef3b05de |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/aad1ff412c16a9399e865cd4cd07e41d756648e8 |     
    i586     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/ed3f930beaccdb801696ac80ab22baa2594f5b9a |     
    arm      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/e9fb55bc0345c5beedf555267b9f6a58bc395010 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b6e2167b1060b366934b3e565a0e7e91811d403d |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/dc3e04d65b3a939c5246eb9f608dff4e85d678e9 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8cb007283a476873fe577941d7ec172ec1dfe066 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a0e9670276eed4358b0295d3e9d9da194d345c61 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f7f4a23a13f8fe4d363773c0af78e451a518d65e |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/fa9dd9644691aca529104c9083999c099c94ddd8 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1b3262760b3909e8f10bcf0491f20a2d678662aa |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2ce7fa6b94c464b9c0d55089635926647c0d2ff8 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/2d8a3d1696063bf8fb276b5b09b08ddf28e41f8d |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/97adbfe71ff5423ac7f75e65c7cbda72529cb6b7 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d6d15b99af8f904772c53ca8d65c209a20adfd13 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/573b36d13b3a72a33b32749ab72e7559f001337d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a8f864e56ebb546e8a477d8a1e1f5cbb1e3bec5b |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/cc6d62a8502e0bc945e4cffda1cd9c4ea6635683 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 uclibc-1.0.32 | 2 
             libnetconf2-1.1.3 | 1 
               mongodb-r4.0.19 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/7dc30f2c39c096c56af9d82f6795a12cbb751ad5 |     
    arm      |        mongodb-r4.0.19         | NOK | http://autobuild.buildroot.net/results/a100fdc82909dd8761d20fcced61902289f288d8 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/372685d46add472524c517953f492059c77fa815 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/1563528e8880c28ac55203384cb51a3378465f79 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 dmalloc-5.5.2 | 1 
                   mimic-1.1.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/cfc111076c955dd5c1125c6e34a161121ea11200 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/535b5663e0aa35e1af7697cb3e58ae6ae286338c |     



-- 
http://autobuild.buildroot.net
