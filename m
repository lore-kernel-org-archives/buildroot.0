From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 May 2020 06:26:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-08
Message-ID: <20200509062658.8653286B88@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  | 13  |  0  | 30  |
    master   | 122 | 110 |  0  | 232 |
     next    | 16  |  8  |  1  | 25  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 11
         host-exfatprogs-1.0.2 | 9 
                    atk-2.33.3 | 6 
             gstreamer1-1.16.2 | 5 
          host-checkpolicy-3.0 | 5 
             host-squashfs-4.4 | 5 
                 mesa3d-20.0.6 | 5 
             paho-mqtt-c-1.3.2 | 5 
                       unknown | 5 
                  assimp-5.0.1 | 4 
              host-grpc-1.25.0 | 4 
                  rygel-0.38.3 | 4 
                    brltty-6.1 | 3 
              exfatprogs-1.0.2 | 3 
             host-gnupg-1.4.23 | 3 
           host-openocd-0.10.0 | 3 
                   gssdp-1.2.2 | 2 
              ibm-sw-tpm2-1563 | 2 
              mbuffer-20191016 | 2 
                qt5base-5.14.2 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
                  c-icap-0.5.6 | 1 
              gr-osmosdr-0.2.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-audit-2.8.5 | 1 
              host-erlang-22.2 | 1 
           host-nodejs-12.16.1 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
           libusb-compat-0.1.7 | 1 
                  matchbox-1.2 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
               pulseview-0.4.1 | 1 
         qt5declarative-5.14.2 | 1 
                  ramsmp-3.5.0 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.8 | 1 
                      tio-1.32 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b76c6e311454789a82349b0ee73f1987d4300847 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8059cf3334b401db9c8de32fe43d5d47ac8eba79 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c621d0fab42fceca57f246fafdf3c457ac16b413 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a29883472b5ed46f82fd42882365bacbf4b1b78f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b56094a6d43bfa00f5529cbcad9234832aeef3c4 |     
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/ed77f3168c6ad13dae2c033b8e0ddc79546fccb0 | ORPH
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5b138333b71ad54297023644367c0954d509e43a | ORPH
  riscv64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/16231f1a94a5e2eb731feec5785f82b85ca577ad | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/bf70054bd9d6f2ede4ab9312db1933db4c299c23 | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/9f839b4575c631f269e6bbcd649c355b0e0fd4d5 | ORPH
powerpc64le  |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/5adb8045246cdf52ea0b2cb6ba397f2cbfdf987e | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/2e687aa06764be84e1c948c6fc58179465347cb8 |     
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7bc3baaa5e541e3803d961ccb80427f36815bf24 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/4c77f03cbc7ab9e5ae9f24fe6eead1d76c50c743 |     
   x86_64    |          c-icap-0.5.6          | NOK | http://autobuild.buildroot.net/results/ddb57462945c5c2340cc375aa6fe2848d13d7001 |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a7364a6b3801d7d18c30c7242c6faf19431fddfd |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/bfd9a330b6095d63072cf2df307d1697e8481f0a |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/3a7b8b76b62a484f0b2fdd64c67741b4a63afc83 |     
 powerpc64   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/4a6d06bb67fe36fe9343dc1a425b562aff035bf1 |     
   nios2     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/c0561b9ad124d25989336d016ceb319c45b8bd4e |     
   nios2     |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/9157626aae3a2388b346ddadecd94d59e2cbdabf |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/c7e9165f68ac577bfbc311da61838e0f12702bca |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/8ec34ebcdfb40b255d85a070b2ddba67828a0589 |     
   nios2     |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/17990cc20052eb993967fdf9fd39ac6ee0e60786 |     
  sparc64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/850a685e2b52aec2410fa68800479af4fcce458a |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/dac16999940d75a31fc8826309112f1523c53934 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/02f3801b8e80358acf4751c43ae0e61fc85ff25d |     
   xtensa    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/513f6325432bb2424641eadc5d1a4a51e9f13053 |     
    arc      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/7ee14b30c222c1b955bd0dbb9e29a4ace0d89a30 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/58f7e22b299c480a6147f46396db47484ab5d9f8 |     
   nios2     |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/d3a344c71b59d5790bcc501ff9fb9bc71297f260 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/e9c1d4fd81a7fc418d366b15a1c4f10842edd95f |     
 powerpc64   |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/878d17776774f209123e10622233a553002df9a8 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1f6f29c73a7b3a30299a6708a3b5d110a37f598c |     
  riscv64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/d9c5d17de03f5d0316d5f54f9cd579b79d311d03 |     
    arc      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/0620abf26e567723f73f701c72ae8ece96aa1de5 |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/8cf8ee882438e54873f01b846455706a5b933700 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/f0a8ccc5e6c77d2baf373e181754a26fdf7bd8fd |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/49728b58e61fa38ab7426b0bd62d8113188ea201 |     
    i686     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/78be9ea4b00025badd718b3dfd6ea554e4df9aab |     
  riscv32    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/2eb6dba64bb5a7d2874141e34e1eef50e3092e72 |     
 powerpc64   |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/b04b308a380ef1b8fe7c869f24d8585e6b98eee5 |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e37cde8ae3b73af1e7e507628d61886a537c4f20 |     
    sh4      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/ba6fc3ae832be9a563f2748cad68426bcb701ec2 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/685109153d6b949e8d58cdae716ca8baad4b2a1c | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7a033fb51a4e02a0463a4fe5d8a20d5a56235545 | ORPH
    sh4      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f4979c17cc82b01cd8488c11ac121e36d4f4a084 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9f5448b016bb4f9b17c37376453345b4ac027f1c |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5100c80f79d122fd11e617448225eea311340e2a |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ff0f566cbbc117194ae1385cde01619ee60af07f |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5eb5f2f0c6ff9c8fe247612cd1ea8fb23f179113 |     
  mips64el   |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/7fa3f62bfb462dbee79c4ce15dc50c6c1f5a65f5 | ORPH
microblazeel |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/0389a86292e9ad07e461b84d28a43060e56a6bcf | ORPH
microblazeel |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/53561cba51f4b6dd7185c31d6b1b1642c0a3985c | ORPH
microblazeel |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/2eb1688dee0d2ce2ba6999ab7f86029857afeff2 |     
   sparc     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/6789b668898245926e0a3a3e7caf823dff515d71 |     
microblazeel |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/1c92cd8b9df053648fe76cdc46c4b9e3cc9dca21 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/1196939448aea97b271f1cee90416fa978ed68f4 |     
    i586     |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/04e623f81280a3d37ad82793d06c3d07ce5d2f6a |     
    i586     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/7343f1c8460a2000255c69006e3830083908be32 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/3d07558dce00de7046eb4f0fc987491ec8b5c17c |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a0de711b7ce3a691f7e2599685fd42da23a15514 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/9cc3170b013c239285c3c7e5a89fa2d9783bd90d |     
    arm      |          matchbox-1.2          | NOK | http://autobuild.buildroot.net/results/37021f1d7fcfd890011068a28ce6181dc509e746 |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/1a7fe7ac8cbe9997bc5d1e9ade24bc2ee6ac6abe |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/3f8b8e7bcff331f65bebd222949ced8b8865b252 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/2af202f5e093690bfeac2c40abfbc4968f241d41 |     
   x86_64    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/c5a14572be1780b4ee107d90c851f8002361dcaf |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/e11725f4229d08038df380c150cdd3d1cd20ad67 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/916b147b92b49410fa30afb18ce4588799810dac |     
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/96cccb541f8f393256ee9c3b3ee0287dbf4e8bc2 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/bba746de0da7e3e82b6673f6dd104e126453ffd7 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d05d5471d10a2b6634711ccad75d7f86d222cc31 | ORPH
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9ae6d9224680e41e8a7130839537cf762a576cf0 |     
    i586     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/5f367f2ce8e215ef60dd95696bdcfd938f9b9599 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7931c0e404a087bd105d881eada90cb1e4762292 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d7c879906a90eeb647fa02535c672f3b32b57325 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/fed6f3be22a4b060afa6146afcecc0b8d9b12b11 |     
   x86_64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/62a9350d5911d895c1c60a32b14a06d20f28c0ee |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e4d03dffcf19aa7effe80782abc16eb1199d8dbf |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ec104ef89e0441d0e7ab21e0a34595e4872d3d8c |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e3773872e7e43df516a4ed3018a4a011a9d05bc1 |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/558f551fa5f21d3b1dffab273e3c2fb571c862c3 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/149bf36d4f26aad0529959895072ccab46233778 |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/66bc5dd64b7df38d4d5d7f194cdfa6d822e0da89 |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/debbb5df57ede06ca3e1c18be031b31b38e3dbaf |     
  powerpc    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/adcc1d4d8da997eb0d72d27ca28ddc4dc913ad8b |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8967d9690c1dbb1e99a3aa66ed182c32fa8443e8 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5d281bb123a86b89d741c3f2b7ddea92972a4920 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a451bf2c826047304d0df280232a23acb480a090 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d6f192a42e28657a4a36644c9d9dc894923b2170 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a391aa564596d536f93f7536f48a393ec937959d |     
   mipsel    |     qt5declarative-5.14.2      | NOK | http://autobuild.buildroot.net/results/fe45fe6d86e2b219fa8c7005da4a137dfe649301 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/86dcf72ab52f776b9b99444e5e3dff5d6263af96 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/16985f3262721348d513b87bea0163d76b6e8987 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/87adf2a3d3fb91bbdea66113871115de523c974d |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/ff1c759652d335cbbc2e3090baf098c42be58bbb |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/74e5b9602e9ef56d2a1b0c2e0c23a4a8b3cb96be |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/c97ece4f0f49c538c241f3a5902cedd1ac44c02a |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/c5ed48572f60f198fbf7c783f65a8dde95e05a81 |     
   xtensa    |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/c4503ccb06995b7dc9ab7fb83c96e7a5f40a333c |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/076d5f166631450d25f25916381f0bfd6f1d58da |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e38d0261106983d9c5a579fef253fa7d70e88ee |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/2b8cbf43a95e27ddac5220ea615105a785c2fa70 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/66564d8d7caabf00aa5a64b459ef63d53db49765 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/277f6110379743d22f67c92348f72b467cfd8ed2 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/b27e19f872cab51c0a01d187e0273daf80aca241 |     
  riscv64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/52337549b678f8e107adf9923131abaca15f4ef8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/573793765e6e2c255ca886720e464d33db801d8f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ff7cd778b63eb912f8c5498ca39b398920feeb03 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 2 
                       unknown | 2 
              host-erlang-22.2 | 1 
             host-libsepol-2.9 | 1 
           host-nodejs-12.16.1 | 1 
           host-openocd-0.10.0 | 1 
             host-squashfs-4.4 | 1 
                    owfs-3.2p3 | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b15ec538af3f5129724b2bcfb86ef277296ffed0 |     
    arm      |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/2b8d8e0943f23978aee83a453b56415741f7d372 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/30ee8aa8edb65138c7470f3b076e0840b24e1f1e |     
microblazeel |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/be00b23a215a184db08c1616dd87896d9f622fa1 | ORPH
    arc      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/7f456576c9feec2f301493348e35b87c9f3b6a52 |     
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/bed756f6a169a96e568f8567057f2570ef1ff6e6 |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/191c14b52b0d2d3bd6fd5ac50ec8db0fe1181494 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7093e9a9a073a8e1c23d76270213579ae6a0cf13 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/058e16ecb343f59218d26ecd6c280b1695cd120a |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/50c19ad2529ee13ff11cc5a3d984d1bb0ee89964 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7fdb49a623918f5e025cb0c604e24ee8b8672eb8 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b43fc58b6fa855db391fc83ba97273e9a3f4023f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d6c1836bfd26bb5b6b5fb21541c8d7714cb9efa5 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  apitrace-9.0 | 1 
                    atk-2.33.3 | 1 
              bitcoin-0.19.0.1 | 1 
          host-checkpolicy-3.0 | 1 
         host-exfatprogs-1.0.2 | 1 
                host-go-1.13.8 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                       mongodb | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/19692b0bb8e6e651e862b317c24cde109df7836d |     
 powerpc64   |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/75e7e95ff760cd5b497986fe2c647d25411f8432 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/17496f05cd9244ad8f7804e1909b6d876753b519 |     
    arc      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/ded2aa160c5a595327387796dfa3d29c8c57666d |     
    mips     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/3b776046d4ef896a6a71a008112e8277594851c4 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/8fcdc1d27d5639912b45910e4a2ccaeb27134e9a |     
  mips64el   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/477310ae2506fb75afa738e05f06ca6f76270fcc |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/a069c217d2080929646f83986b7a89d002dd3e03 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/779090d93e95cd3e08296e3a7209f09f6f31e5f4 |     



-- 
http://autobuild.buildroot.net
