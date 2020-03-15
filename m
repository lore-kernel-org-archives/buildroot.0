From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 07:32:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-14
Message-ID: <20200315073233.A1C7F89803@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 35  |  8  |  0  | 43  |
  2019.11.x  | 31  |  6  |  0  | 37  |
  2020.02.x  | 27  |  6  |  0  | 33  |
    master   | 176 | 151 |  0  | 327 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 17
                   bearssl-0.6 | 12
                  ffmpeg-4.2.2 | 11
psplash-fd33a9b3d68c89fa22f... | 10
                  connman-1.38 | 9 
               libglib2-2.64.1 | 8 
                libtirpc-1.2.5 | 8 
           mediastreamer-4.3.1 | 6 
                       unknown | 6 
                   gupnp-1.0.4 | 5 
    host-python-markdown-3.2.1 | 5 
                     avahi-0.8 | 3 
                busybox-1.31.1 | 3 
                libevdev-1.9.0 | 3 
                 mesa3d-20.0.0 | 3 
gr-osmosdr-46698a67e7e06419... | 2 
                 granite-0.4.1 | 2 
                 haproxy-2.1.2 | 2 
                   libiio-0.19 | 2 
             libopenssl-1.1.1d | 2 
mjpg-streamer-501f6362c5afd... | 2 
         python-markdown-3.2.1 | 2 
               wireshark-3.2.2 | 2 
                  apitrace-9.0 | 1 
                 augeas-1.12.0 | 1 
                    brltty-6.0 | 1 
gstreamer1-editing-services... | 1 
          gstreamer1-mm-1.10.0 | 1 
             gupnp-dlna-0.10.5 | 1 
           host-nodejs-12.16.1 | 1 
               libgtk2-2.24.32 | 1 
           libsamplerate-0.1.9 | 1 
               libtheora-1.1.1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
              openjdk-13.0.2+8 | 1 
                  pango-1.44.6 | 1 
                    proj-6.3.0 | 1 
               protobuf-3.11.3 | 1 
                qt5base-5.12.7 | 1 
         qt5declarative-5.12.7 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                   sdparm-1.10 | 1 
              spandsp-20180108 | 1 
                supertux-0.6.0 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/203c3ba1f9ed4b23091fa03ba22f7a57738e9548 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/190190f2d28954cc4157ead79c1073cbe0b8d65e |     
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/28d54d1072cbc42ec752503b60b0c8e0e935c879 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/79ea3e34af6a43ee16c8f03a4ec6d5e0d6ce8fb4 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9a5bbd78382a179780e229050b817a0dd1de4fe7 | ORPH
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/94572d3a7293b8f73164afadeb74b028c448569c |     
  riscv64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/37988abdd93f5cfed2687c32bbfd608dd92ccfd0 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/dcd5dd5335fdbb91496b16e745d6f5c9b876ba7c |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f82a25ca73898ed67707c78f4392c29db0c0b837 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c2f3c21eaa6d286b07aab0f687ef7f2dc8c3bcae |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/42722cda8f7f7ceabda04f2b123702385551aaaf |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e672104810aceedc3791c9235b077e01421da90c |     
 aarch64_be  |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/36c8677d73f994de3c25474d905350f00f880c76 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/c2f481d565152a44d61e5a87b0dec3cb245d95a4 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/4d6eb4cc9b58916c66609e3835f32734dc408ff7 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/75bd1163a1adc2191d825c6490aabca74561f6ed |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b1cdf228430c80404cd7578e94e165d6b42233a4 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/09b79ad10b5a3e3abd463f25442898e0b2a30be4 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/ffaf997dbc0ba9ed518f72eaebf8a59d9b28117c |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/f9977836ae36b6ddaaac269bc22a6b5ca65db065 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/c8d7b1abb18918f2f12757c92c7b44f80c49a226 |     
    m68k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/afb62dca8cce71e7220bf2be363776b7aad2f5c5 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/7a15f75d543d5b8acde244bc91176f01a4dcacdc |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/4cc5f6a4324b1138853c6ddd1942310b06e965fb |     
   x86_64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5dc535f29129987157a29530c7d5de040567f51b |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/8fb98fea52b451cd839f40153258eaa322feb659 |     
powerpc64le  |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/507807a1bb5760e280628629ea5b95c45833f0c7 |     
  aarch64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5c0fb356f905b42ea624cc2f1109b8cbd2d71bac |     
microblazeel |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/c38ec904e060d7150b644d5cb6ff71ada03f8206 |     
 powerpc64   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f2073555f29af4ff30903aa261900ac2638ce279 |     
  mips64el   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/bb47b0651560f5554d235959e5371c00832b10a7 |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/041db02cb0551460c1daa1958863f7a6bd18a667 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/2d1af7a0d9c0debbf128b05831f54a594a28214e |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/e4b152b0ed2cbbd7e40cfa3a01ffc7b3f81be007 |     
 powerpc64   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/d394aaa2c181845334e7bfd47143c12de63c8ee9 |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f7c9b5d6e348e272605d142ce59d814dd223f68e |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/49b9b42db03bbbb461c8a16e27964febee882590 |     
    i586     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/a71bf1985f811e3bebf5dd117964233ffbcacbcd |     
    i586     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/a89c95b907bd1230c6482e3c21083bb0ecdd0f1c |     
    i686     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b8112306a349fd852d24f72a58db901369593a4f |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/7b883d4eac21fbff43de50764239de4fc62ea54a |     
   x86_64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/a9e88e3c22db4fabdcae119537e559c38f8d8364 |     
 aarch64_be  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/9d6ba91c54fa9a183643f577fbdfd93dd9a74294 |     
  mips64el   |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/2ca4eee037f0b9ca3f214db72590fd393334e314 | ORPH
  aarch64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/845b780baf1b233dce9d693b40f8e15dd65ad614 | ORPH
powerpc64le  | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/5a52788f571a0e05a3db799ad32b4e3bbab141d7 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/79ba24b573e1b8ccce9570c35bb67dc991d17549 |     
  riscv32    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/e1bf1369cca68ab3f1ac163837f5135fb1f74743 |     
  sparc64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/e108c1f8074311bdbe31f8a76e706255c10c08b2 |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/0816a941f31bb7baaf1314465416d5c5958a9c50 |     
 powerpc64   |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/83cf5fb2387dde68c3b52c490ba826a445c128e0 |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/7fc7357160669182a97557c4f5621bed58090718 |     
    arm      |       gupnp-dlna-0.10.5        | NOK | http://autobuild.buildroot.net/results/d8c71683daf6223d19da4187b8ed4d798f42b9d9 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/c6db8bfea33abf208a862cab87bab69b0d6cc171 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/242853598818c6b36917868b609296dcdc1e1d2e |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/1f3f4d3269a472aafbd3cf51bf483e4a381d1c84 |     
   mipsel    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/a827b524412c88d3dd19cdbf2154b4ac18951769 |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/432412684a9a15b6f7f058224f6aa60ce0e876f8 |     
    i586     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/9614986e3954ce7f0cbd1bac985ec416e238efef |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/917a04da3d5ed6edd757557401805e68d37126d1 |     
   nios2     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/12891fff7601b26bf6c3195794b6cdddc62c01c2 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/be207f6cf2f8b5ccb87ce7844c48b2956de2fda2 |     
  powerpc    |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/98fe48f9bff6de779a9d6ae2375c4e853b5009d6 |     
    m68k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/8e93802c04abdb8bc78f67cf0eacbac27082f5ec |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f7f5fc245cedf29b151b226041416b13dacf59b1 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/d44d38993902a8ee65c08ef1ea2ead2f9d8d90df |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a1dbe9dae007808cf891ba91b1dde863997a3bbc |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/38a7bdf6427b03228a9ada7fec7a12b787125d85 |     
  powerpc    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/cec0595f444c62c694bdc4220ebb5d4afce4dc5b |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/5e53044b021aaffd76b3231d8219417af4599309 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/ce87f2ba5128b81b7dd68588d26e4d8e1a99cd95 |     
    i686     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/cecd42e55ba180ccfa99bc507dcfb52edad89205 |     
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/acaea708dbc5fade9b1d8de96a7a8133ec14671b |     
  powerpc    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/be4a935a4019cfbd82b430fdb6e9dc0105839ebb |     
    i686     |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/8f019a3f1f1bb759a12a08117c4b74c5e22beadc |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/a42656cbafcf6951b849bc9bea5ddd7b2acf2bf9 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/6707eb463a2d09dbff61466afccb557eb40f740a |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/9903975310c85cbc4d3af43ca88343c84a315328 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f3d2454b213491dcb504e61cda86f497ba8e3b2b | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cb5f0267172db829659ec8c238eea5bbf0562494 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6ba96b8129b589d5f03918333e76b174eb1d7fdd |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a892ff8c71b613c8c8feb3727a9a0099af32afe0 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/321849afc3c66ecefd99f71a260b30145c90b23e |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/445c169a3a9ee1f0c90c5e34ef9154059f0231eb |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d17b6d456d397a91e6da8648140b0308919cd803 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/01f02346749c6ad84b1c4d7809bf1cb84303d473 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5bbf601deebd6b4716ed0fcff84ce6ea8cec1bc9 |     
  riscv64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/52dabb7fbde62eec4c807d8c6a30910a030518b1 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f1f352afdde45b96b3956bd269592e55025898a6 | ORPH
  riscv64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/bdb24536c441c5bd8479f77d099831e0c6f80992 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cf30a6f8773d5172bdb3c8d9d17d86c27a490f18 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/1cba2a12270fcb1d2d214df5f8993fc1bc24a08c | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/98694d4c1512a9b112b4922886f92338a348738d | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/0e71e4d72b0494e20c1930b93384982422a45ca5 | ORPH
  powerpc    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ee3506e39dcb5ed854a94351ee77cc7509d81cca | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/4cf9a663b6aca05ecfdc4b838cec838d65c480cb | ORPH
   xtensa    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/927e20c97ee492494ff7a729c01ca89fa794de15 | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/ee27b14babde1af4bafe07ba85a5500e627db0ec | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/18763af787244aa8ffcd565e44dbdb459aa8c67c | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/930175d45df5807ce7d0410cc6d51b81b960b38e | ORPH
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a8693e4d1cc725a5165ebccc3f1a361b90972cd7 | ORPH
   sparc     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/cc838437b722e0b6957a30e5ef862ded3bf7ff03 | ORPH
   x86_64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/c54afcb9ca2bce4e890e0eaa3f3a7ddfdf8baaf5 | ORPH
  mips64el   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/1943e9869c292e2c78e94a4f9fd3c31609c77051 | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/4d66f2a7b15ea192caeb9d0349713febad121b58 | ORPH
 powerpc64   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/0837cede8c30043eab0b0fcd0c0af62789bc8d50 | ORPH
   xtensa    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/6dd8e96a5752428c49ef0e7a5bde2ffdbc9eba2f | ORPH
   sparc     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/05470d14eb8953b23c613752a28b6a5f49125559 | ORPH
   sparc     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/6835407f3b8bb458521f8a72207cf6c28bdeb03f | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/368f9f997ddf581da53012c8d3e5788624defdaf | ORPH
    i586     |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/2dab0af9e40e651c53416280634b2c6c8f362388 |     
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/be50cf29511a395d01800fb5229c4af4f4f521f6 |     
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/e54a4a7a570e42ad7b31811edbe4e29282c50b0e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/762719fca4c394385cb43a056ba4955bb80bf7a1 |     
    mips     | mjpg-streamer-501f6362c5afd... | NOK | http://autobuild.buildroot.net/results/0c8714dbc85e390ddbdb7ad3daf70170acc41827 |     
  mips64el   | mjpg-streamer-501f6362c5afd... | NOK | http://autobuild.buildroot.net/results/58f348742e8139f73beac9238eeefdeaaa771b45 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d42fbb09d2c489684a29b8c688715693c2f561a5 |     
powerpc64le  |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/435688cf9cb46c0491a44d36b70e6e972af1c02e |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/1540fe12cd60dd5d21e0f218f5ed7c1eaaf20317 | ORPH
  aarch64    |           proj-6.3.0           | NOK | http://autobuild.buildroot.net/results/71787bfe3359ae299de680fd4b49908b268df3bf |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/8b99479887f0775ea90b433aacf87dbb4640624c |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7e08a20d80faf7da09a0357c7aac2eb45e8c7c9b |     
powerpc64le  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/382e6e3ecc43b106fdfa715b1f8e08e4a49d38ca |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/70bf143358b3cc84709f138295cc60e6cd5c8b7d |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1a413b7235d4a4b9f03aff8e68a129d7ac0c6019 |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/0e8ffa9a333c30293ae651ac5e54743f418532f6 |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/af140304f77fe062d28c9bdaea20fc8a7de1ddd7 |     
    mips     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e75c103a59435f345667042c54c94d7ae1e114e3 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/eca8f7e5e8bf2401e4014da3c007fb445813e55a |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9121f1d276642959ccd2c9c8545283178c5f1e1a |     
    mips     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4e466dadf10d99893d0f1fd06639a49900ad5ad1 |     
   nios2     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/fb2fe47c9fca6bae0aff7c031ae820185b68b197 |     
  aarch64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/aec4128a4e9b1bed2109fc910b4489e970740426 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/93c62615323dd4f7b2af2bef01ff6d633ef9496d |     
    arm      |     qt5declarative-5.12.7      | NOK | http://autobuild.buildroot.net/results/9c7c66f6fd6a409b08c19f80582b1d1659cde601 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f741cd4e6a2a8efa76b171f9268821c81c925191 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5d368a1791710db919f28845adf1203eb813b94e |     
    m68k     |          sdparm-1.10           | NOK | http://autobuild.buildroot.net/results/30331dbdcd87a96a5ccf6a1911e2f31b484fe2fd |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/cea9603a4fc45328c92a7be8ff667cbcf5fbc8b7 |     
   x86_64    |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/a43720492d817e4555d728546da9114e3ccba952 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/40bdf45bbc7dd3bdb8b1c8b5d53ab0cffaeed059 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b8398a279d181784a11629b8877df0192ec91d55 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/24bd2251916dff7e310ceb2913e632d81564a7d1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d7d5e1087fc4f3bedae642b8f1ab8b37f46a66d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/d7cec6043cf24ec217dee53baf7c1c5212709314 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/90b65257b2ae5cd05f04587b78acd0c231cd604c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/cf44d8704f96c7b7ba67f97cd83d288ecef27c9c |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6f7117da615c7aae8e6fd82230e5b7aa490a7c96 |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/9bf135a9ec3e9026ea26f4e78dab14b0f1fa4480 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/ce3887b06b6dbaeba74cd911c226ff9c45d75d21 | ORPH
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/b9bfe769bab495be43fec34b5877e0ac83467a27 | ORPH




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 5 
                classpath-0.99 | 2 
             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/848c60b81296579a1e46a2db91c1d3fb793a1515 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/33cc5a1a918e3fe1880645ec7face9a72fdaa185 | ORPH
   nios2     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/bf241fd2f8145011103a520de0bddfced43f6023 |     
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/74799299c91ac192605bb0731d22a90e452d4077 |     
   xtensa    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/eb3b40d1682f29b59569bc2f6ecfc98ed3cfc500 |     
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/644357713d9c51324a88e88a50f8fa6103d92cc5 |     
  riscv32    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ff87711a829d58ab64e8181c7c7efb11768befca |     
powerpc64le  |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ca02818dc20d21fe686a1da7ed7139e86cf47aca |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

             host-guile-2.0.14 | 2 
                  gmpc-11.8.16 | 1 
                 host-icu-64-2 | 1 
                libgdiplus-5.6 | 1 
                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/87cae41a4ddb2be839a9b8eec13d9b41fcf4804b | ORPH
   mipsel    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/95edf57ff149bbac5d6fda91051dab192c73f064 | ORPH
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/506b6dfb259afb78db7f8c1badf0a8644d65cf8d | ORPH
   nios2     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/fa2b5616acc1ce8a2b6d309d3ffc702c99dca42b | ORPH
   x86_64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/fd5fce0a0413c92a43cec309423b6a70dc36385c |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/667a9a190ab123a88b5b2f59945a06ffa84fbb77 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 1 
             host-pango-1.44.6 | 1 
               libglib2-2.62.4 | 1 
             libopenssl-1.1.1d | 1 
                 opencv3-3.4.9 | 1 
                oprofile-1.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9f8d7a812e8e48b0512a054eb35a164985b954d6 |     
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/702200095ccd8fd654978ad84dd9dd312fc6c237 | ORPH
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1e3f721dd7d3bb910f5e78c655542918f9df0a25 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/52ecdc2f0682a5f3d59538f6a286ea940eaa8f21 |     
   nios2     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/93e608f804cc3fd8d4ada518a02d8bc0942ac84d |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f3ed1bc9e08216b91a21a60b056f2eb256ef5c98 |     



-- 
http://autobuild.buildroot.net
