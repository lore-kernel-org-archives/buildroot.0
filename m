From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 06 May 2020 06:27:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-05
Message-ID: <20200506062724.2C89A20441@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-05
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  | 12  |  0  | 31  |
    master   | 210 | 161 |  1  | 372 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 14
                    atk-2.33.3 | 10
         host-exfatprogs-1.0.2 | 10
              exfatprogs-1.0.2 | 9 
             host-libsepol-3.0 | 7 
             host-squashfs-4.4 | 6 
                qt5base-5.14.2 | 6 
                       unknown | 6 
                    brltty-6.1 | 5 
             gstreamer1-1.16.2 | 5 
          host-checkpolicy-3.0 | 4 
           host-nodejs-12.16.1 | 4 
              ibm-sw-tpm2-1563 | 4 
                suricata-4.1.8 | 4 
               apcupsd-3.14.14 | 3 
              host-grpc-1.25.0 | 3 
                    mpv-0.29.1 | 3 
             paho-mqtt-c-1.3.2 | 3 
                  rygel-0.38.3 | 3 
                  zeromq-4.3.2 | 3 
                  assimp-5.0.1 | 2 
              host-erlang-22.2 | 2 
             host-gnupg-1.4.23 | 2 
               libupnpp-0.17.2 | 2 
           libusb-compat-0.1.7 | 2 
                 mesa3d-20.0.6 | 2 
                  ndisc6-1.0.4 | 2 
                 openal-1.19.1 | 2 
                 rocksdb-6.6.4 | 2 
                      tio-1.32 | 2 
         uvw-2.5.0_libuv-v1.37 | 2 
               wireshark-3.2.3 | 2 
                 xvisor-0.2.11 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                  c-icap-0.5.6 | 1 
               collectd-5.11.0 | 1 
                   cvs-1.12.13 | 1 
 glslsandbox-player-2019.08.23 | 1 
  google-material-design-icons | 1 
google-material-design-icon... | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-efl-1.22.3 | 1 
                host-go-1.13.8 | 1 
           host-openocd-0.10.0 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
             kismet-2016-07-R1 | 1 
                 libv4l-1.18.0 | 1 
               log4cplus-2.0.5 | 1 
                     nmap-7.80 | 1 
         qt5declarative-5.14.2 | 1 
                 ripgrep-0.8.1 | 1 
       shadowsocks-libev-3.3.3 | 1 
                  stella-6.1.2 | 1 
                thermald-1.9.1 | 1 
                    vlc-3.0.10 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4da325083422820491bc21f01a0c8292bc29d5bd |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cabfb2098f5ef7a9407fa1383c3a22460c45fdcd |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/db3ec98817a0c138699c50023a0d04954b114d42 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/279d5db66266d1eed508e423178772f0d61ae7cf |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/f5b3fc367e7bf52aaaea160ac92b386922ba21d8 |     
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/72a88be42f4211b4c47f503a2f271988d87e00c4 | ORPH
  riscv32    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/604f13277f9b138c9f6588cf51262f8b7f884e7c | ORPH
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/23cd0d880b094039132f852a0343ec8b5e2828b3 | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/afb979e6c4198d9f3e3d8800cc0e6ab5a44cfb03 | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/899018778c602357d90f15a42b2d6f2b24490c17 | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/8a3cf77d60ebb9b5af91db303bf70a5942e887b8 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/4133cfc1ac8a13bfa935d5845a81716950bf4e3a | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/b7fc757c2804f9d6799ec594423b111db50566f6 | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e00ebd475fef48532c9a99517e4ac6526da4a128 | ORPH
    mips     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f9a1fcf4b9c0dbbec8f6fb282a9fa22298a94808 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/03d26dc327c54ca023036857777d35c85967240a |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/ceb21359461922faa68b925e68a686d5748f68be |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c9c5011f16966cbce8f56b47c335bb07d5d76f4c |     
   nios2     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/36013ceb52525d4fd4db20c85fd0ce8235552b76 |     
    or1k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/a3f7749980900686799abeea06726f5ec7b34b4b |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0fde8d0ed595925b3c32a9d3319fe99a8f221aba |     
  nds32le    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/e2a29467f3c79b09cc6519c5d6515fd846bb29fb |     
    i586     |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/7022e46c44c42f35187bebbffdbc3f35dd8a643f |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/c96e2ff137436990501b8b4f6e550691692fe80a |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/9887a766904ea1db36cce8c949ea20f83cc03819 | ORPH
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5ccea89174643d21944b8542993ba66d650ecb5a |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5f5892df820e5e03b79f8b4795ece4c88f401df0 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8b5bb890451e5906814e703a9400e921f5196885 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/bedbd6a272c4ae1c34bc8a43f36cf715bbdbfbce |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/76225158a5dcca20db669c5cf03119be909a5233 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c7cb63263ef28b60f210f50d81bc0dc0252a0d55 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/1e99404b47ba2da9d69c00cdf9400af8dc06ca59 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9617e6d9207b5b4f183060535fa45ce1dfa94949 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9ded0eadf4fcadc5cd25929baee6e66f01c60718 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/180b9580628fc2b299379e3f2ca9e309e4df2f21 |     
    arm      |  google-material-design-icons  | TIM | http://autobuild.buildroot.net/results/249e5604ec6e13178697070a0cb6b8ea8effad59 |     
   mipsel    | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/138ce36a686cfdcdc2e5f0c6fce43fa3babf1a0f |     
  riscv64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/a13922b27ab7ed61bb4bf4036186de4e8f6916b2 |     
   mipsel    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/a4b49de3aefc486d3076493e64d895fcad9afe16 |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/170b1d8caa78df6f8ba5d7bf50f419cb27dbfc07 |     
    arm      |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/2e76cd80e26838bea89e40451cd1ed9995fceddf |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/6fe213eba43dbba1c884d7791cc3682fa04c3569 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8b56ef689cd7018cb3538e9282731e7c9e5ebf74 |     
   x86_64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/63f2d1897a8f581ec107374bf2cbb68d3add4109 |     
  sparc64    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/70fd534e8d42c01b23149dce17a7563ca73b4923 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/3324ecc07e7a7ff1b6591d213420bdaae97ed822 |     
    or1k     |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/6b94b0bfab33682c1cde3d6f1f561f88570bb888 |     
  powerpc    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/16747d96281313fc59d3e162966d727484cea1d8 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c5d5fa21eb9ecd7ea3cdaee97fc718d79eca698f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/bbb3f7f757eca322b3d9c73d0bf9ddde31efdd0a |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/841372bff92f9b36b6cf3f7922f52fe345e956f1 |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/88db5ecc0789a1eeceabadf1a2bee2f44d6b9678 |     
 aarch64_be  |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/45fddfa8378589422e382607405cf7d217045120 |     
   x86_64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/40acd4c2b08ecd41b1c9ffa2bdfa026a6ae3dc03 |     
   sparc     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/cbc7c82cec0d030e14286d5076ca574087339de3 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/b41add2f8e94f4f24c63593b2a3f047accf441d8 |     
   mipsel    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/f59d38fca19b72bcb864c70c60abca3a93e01f70 |     
   xtensa    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/857ec9909c92834ee921cd28223e1fa5434d9f13 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/7fdf629fad80bd93146e9ce1b0dc896203e311f3 |     
  riscv32    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/be24e982d9efe15b23d7db6072ea9a0e44f61593 |     
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/235f58911ceeab508622afeed4713399f0190fa5 | ORPH
   x86_64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/0563edf520bec5099c714c88063e04bdaa899fec | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/6184c2fe47e64a6df083d10a67ed6ead1fce48fe |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ad255ab97670fda008abdab6300afc6c66c2d229 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8c372a9c6b6ca3ae1bdbab599c29565b8137d773 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3696ce6f810438eae606b8eca9dc00aa1a19a2e5 |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/f4a562c752bdfc225f98cf68c391b252bb8a2b58 |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/b8f8f27de913006fd2e13c4d7ad00c00655f0f7b |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/b34c23158b006942eab07522b980027c826cf245 |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/a13d152c0e2585416350f786f4155808d4201424 |     
   mipsel    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/33dfa5c6b828a5e1bd3ebb17a241853c84d3e63a |     
   mipsel    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/31832bfcd898d411fc84be5370d04a2742c7075a |     
    arm      |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/d529d84b6ad451a32c04812587ef536f8146e289 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/bf1f62e4696c4af63caf23261e2092672fbce0ea |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/9bcc6e6cd60b59d0f1a35a8f0392f602e0136fc7 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/dfd1499300e7d652ab3ce11b0c2373c810612a76 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5a0432bfca61d1ca592002869993d3d7f52a7abf |     
microblazeel |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/d443eef5baf72198a3d894d37189d6b034250824 | ORPH
   xtensa    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/dda47d73dae5b0385581ca24179a5ae7b6256f89 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/1575ef82157c5a8bef914ed392909957cc8e473a |     
  riscv64    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/66e2991dc27ab1b58f20f19b3fbec31c669d784b |     
    m68k     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/501bdf99679ca70cee408ade4c2c24557b2bbeb0 |     
   nios2     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/f87936d0ff026dda7d2c508324e7dce5311a7184 |     
   xtensa    |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/48cee85ce6f7f12d68c2554d8f9095cf3bf058cf |     
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6d006291ba03fffa2efc7a88d1d4746d8ede43cd |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/77f031df9694d0be82a93e3e8c988769b9a0f96c |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/838ac4ded6f82ba5a0530fe7af1bb77792b9f889 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2ab6ad9ee28e005320c4c3b87bd557a8d1f83e72 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/af2b64d8a707d60b3280d72141f15b4f8f006233 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5eca6c1ef1cf67c874dfb7e407e04eae90359be7 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/a7c0238444113607998c1b9b1f34440de2edef68 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/28b5c0f38b3c6ee9df3c3a15d191ce7070013254 |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/e4136f649f56e85368ef0b6875381a40a7833f87 |     
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/4a3d1664642c355a77d6bfbfb6f6e31e8d3ee3fd |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/0552b70aea60c67784df3eb56c12e88cc70474fb |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/20b97972d83b533819f6bb29721f494868e0550b |     
  aarch64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/f83fedcaae9f1709b969d2db7a706247f8d7fe08 |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/2ce58c09ec6d64d08383491117c042a0998aabbf |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/610091f266e1b3252f5a7b58426fa18fc4e43354 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/283b3bc974609366032395495bbab18e39f8a72c |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0890f4c5a7b50838530963956cb2f32c870ab10e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/65f0b3e166249ebc8680a63b055f43273c32bfd9 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6f11395e0b5894db882838085c70de8ade1f8235 | ORPH
   xtensa    |           nmap-7.80            | NOK | http://autobuild.buildroot.net/results/da9469e24390c94fe74f133152dc320c21872159 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/669db7a851f5e60b0b176c3436c3858de07e423c |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/034b4619d0be3845d3d9cb8be91222125def1782 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/392256f35ec715706e7c93b44f580f7ff322c23d |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d947cdebeb016706586d8656c02152e0e48fb861 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/bb7d7b9fb0534d1dc46043c1289e7c0f76ab5466 |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3e5cb9247e3775957b364f172dfddc7fa37644d4 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1d8e89389638b14e722e80dd7d40f9cc18f8061b |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/52fbc14117f8ddf96957ecefd5e95f01ffa38c5c |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/774780886b9396a3872b03006ef7d48a2398942c |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/494ad86112035f8e4785875a71d4d39c51ff9a07 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7a1a62b5875dc54b7ad642f937be6704ab997951 |     
   sparc     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1a6ee1db1c6b7dfbfa20f298dacaa791d2b2c4bc |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8c8adf7589d4206295ef6dd5fe42d52d2929bc59 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/4de1f790b829d7179c79fcb8edeeb6eaba2a18ed |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/250297fe83e1264c55a19d1dc080e7bdbcd2bfc4 |     
    mips     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a2defca321059745b4aa7084d953e29e5489b80c |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5ca3eb8cc74497417878ab09aedaf5fb3cb539a5 |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e71ede39485c08af9680848328ce7b62903f41b4 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/bac09a20bdeec821a625e7d09731766d66d8bdc2 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6b16afd3227c626822177e08f6398dce1cf13a39 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/503373663d1b101ddad746ed8f69d1225fbc0811 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d8ae606a8254de6485f61ee21d7f34bd7bb1a8c8 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/06478666528317f18a5f92151cf60766473e9989 |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/56b5d94098db8121cb3572ab57c38001a6a07d42 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ea1d6bb5affdf8f0f298872f33f526ba62a91f27 |     
    arm      |     qt5declarative-5.14.2      | NOK | http://autobuild.buildroot.net/results/a0bbc5e859710cb32120aefd4326c66178380b53 |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/49b3f2bd6d5a8c16bb07da6005cb39a273621f08 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/74ea5cabdbb5e02bb477d8d17f8344aecf9c6183 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/fcfe504bc498bd3a87caf907272ccaddbf0e4e0b |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/bd047668245ee990cf54a743c5df7c05fb45bc3d |     
   mipsel    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/cac8a9b769788685ee51b3e35f16f6d65fc47a10 |     
microblazeel |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/9d8bb1f63c2908598091334908775362e1f52346 |     
    arm      |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/27c67eb61a1d62dec76b663dd53eca339ad14ea0 |     
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/14974d53efdb6200d990264b97ec162d04d2aff5 |     
    sh4      |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/b8db7f8f27cb9eaa2128fecc2bb55fe4d0e088e7 |     
    arm      |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/fcd2790e6c09cbb93be9b5a4e11a947db9ea13f4 |     
  aarch64    |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/f7a93ba51272390b3a9f980b336ff36802d4c1df |     
  mips64el   |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/8205e7a1cb5faee771a0e3feede3b4d091732080 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/ad9b10b94451e2ee3df7558e1cefcfaa04c18556 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/38487e5285b3104670fa3e330c8f9b9f7f3ba66e |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/27548d2d346c452f3a2098a3d094a6a6b8bb42e7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/270c8ab7af64ad5d06513b133e9b1aae84e1af74 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/70cd7aaa11b6682aee3495d3c168390ac5aa1829 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/d73cdc9acafee9e4843a99e206a408bed7146249 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/61e7c355e94a624438be51277baae11f4da846c9 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c9094bef50f3f8cef12970fb1cea24b6d9c01ea8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/854497074abf78017e8770ad468531dff4198992 |     
microblazeel |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/eee81f024579161c63d3bb0cc88f62dba4f23b22 |     
   mipsel    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/4152f8ae703a1ec9de7619a4432eec5762459f4e |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/e7726a8556ac1e3f51a3fa7f4460c3cfc190568b |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/2fe42237f973c3c35008f8dfa633d9d58908c52e | ORPH
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/f14f9724a4ec5df3cc848e0d04f9b6dabb765e08 | ORPH
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/bd56dad601a50e7790e5b9677f742f0b27dc74da | ORPH
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/4e25902749a37143053174e65ff916c906bd9bc4 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/237726275331dd24518919aa7f83cf3170a71cc1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9665aa4f8b769521050541b493504243cff0dc70 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f379cb6d3b0282ab3b3b3c821d85d0fbf299893c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3d1317f77dbd92aacd9b4c1b0488bb3c8a3bb14f |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               log4cplus-2.0.5 | 2 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-gnupg-1.4.23 | 1 
              host-grpc-1.25.0 | 1 
           host-openocd-0.10.0 | 1 
             libopenssl-1.1.1f | 1 
               libupnpp-0.17.2 | 1 
                   mpd-0.21.19 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/42862d91d7da3e13010b58e4144812937310f39a |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/3643b26bbff140284c8ada9dc688f56490a2e34a |     
  aarch64    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/a77df268bb9df85190b3d89875f83e188e9bcf0f |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/507c27e12d1c08e4ce304fd3f272583d65ce562d |     
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/b80012d7bfc9cdfcea32569816ac201511670631 | ORPH
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c968485370b8e7594ae2a6e8ff5924456a512b3e |     
  powerpc    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/51a0ac9aeace346c4e40fbe5568b3c314196d0fa | ORPH
    m68k     |       libopenssl-1.1.1f        | NOK | http://autobuild.buildroot.net/results/1acd36a4a58579c8ab246fe71b79207ba2b241ab |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5192ccb28fb9942de417710344cc08bec75eee18 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/018b34e2e4790efd0c266ba1ab19aec604181c0a |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/5641241d72d928bb51fc0482ccf46b899acb7c68 |     
    i686     |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/26a217fd87d9aab76bac3ec2d2660e61affb541b |     



-- 
http://autobuild.buildroot.net
