From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 07:26:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-21
Message-ID: <20200322072631.DBD83887CC@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  | 10  |  0  | 25  |
  2019.11.x  | 22  |  9  |  0  | 31  |
  2020.02.x  | 12  |  8  |  0  | 20  |
    master   | 161 | 127 |  0  | 288 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-4.2.2 | 11
psplash-fd33a9b3d68c89fa22f... | 8 
                   bearssl-0.6 | 7 
           mediastreamer-4.3.1 | 7 
         xkeyboard-config-2.29 | 7 
                      iwd-0.22 | 6 
                  connman-1.38 | 5 
               erofs-utils-1.0 | 5 
                libtirpc-1.2.5 | 5 
                       unknown | 5 
              host-grpc-1.25.0 | 4 
           host-nodejs-12.16.1 | 4 
          host-perl-legal-info | 4 
package/perl/perl.mk:113: h... | 4 
         python-markdown-3.2.1 | 4 
                libevdev-1.9.0 | 3 
                     avahi-0.8 | 2 
               belle-sip-4.3.1 | 2 
                   dav1d-0.6.0 | 2 
                 mesa3d-20.0.2 | 2 
                    mpv-0.29.1 | 2 
                busybox-1.31.1 | 1 
                  cairo-1.16.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                 gnuplot-5.2.8 | 1 
                 granite-0.4.1 | 1 
gstreamer1-editing-services... | 1 
          gstreamer1-mm-1.10.0 | 1 
    host-python-markdown-3.2.1 | 1 
               libglib2-2.64.1 | 1 
                   libnss-3.51 | 1 
             libopenssl-1.1.1d | 1 
              libostree-2019.6 | 1 
                   mimic-1.1.0 | 1 
              moarvm-2020.02.1 | 1 
                openblas-0.3.8 | 1 
package/syslog-ng/syslog-ng... | 1 
               protobuf-3.11.3 | 1 
        qt5connectivity-5.12.7 | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.36.2 | 1 
                suricata-4.1.5 | 1 
          syslog-ng-legal-info | 1 
                      tio-1.32 | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 
 xdriver_xf86-video-sis-0.12.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/bfef02c58121830651a347dd2c29751561c912a7 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/86417af32474cb7770af6b767b0890988d1ded8e | ORPH
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e4852bcdde6dedd9ed2e04c0d54ad460dcec6dcf |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e7f54876c66840345773f96022187550d67c915c |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1bb4b7e3f126a11ee7f27ad082d9f86f8c843633 |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/fd85768259db38eecda4ce9b79e006299c4fc1ad |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/02d36af984e80cf04b7ce6263720c0075a55a61d |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/91a23835432a083b34c27cd85cf9f8870dd57a38 |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d792c1d40443aecf9c94dc7f526031ae68936373 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d1cb4a3041a735a6f9783f477ef8622983a94709 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/4d05feaf8283078609d4fd0773768debc249af12 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/70a1475ee82be12b39ae1f1f53a78cf5ca05aba1 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/d1b8e752bc3a44552ae35d47e5c857c0f2714a97 |     
   nios2     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/f507f83cc76805b1d802bfe231e58760b8c08289 |     
   mipsel    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/089af0f7cfb0b400dcc75c36a8742ffeec588982 |     
   nios2     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/b414c00f281d69abcfacec5b3dd78426ab9ddf67 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5ba929c0b624ac57f6b9541a1e04c9523b02123f |     
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/a392f93b1d2101a38cb2e2d4cb1a4c2b7ee4bf0e |     
    m68k     |          dav1d-0.6.0           | NOK | http://autobuild.buildroot.net/results/4bad2933b531db7341b67797ffdd37bc6d786060 |     
    arm      |          dav1d-0.6.0           | NOK | http://autobuild.buildroot.net/results/c82b6e3c1cf968c644f3dee376b16760fb4593bb |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/5e61a573301aa9b161d0616a8fef6c2d24bb9e3c |     
    i586     |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/6396d0221ec8e6e537cf288a9a27b79f0d6aa6d6 |     
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/94cde707bd2a3775478f2c687e0dfe091ab7aa46 |     
  riscv64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/383c831e3bc2105e8c8936bcb8dcb2ec2cb51a59 |     
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/9b921c5e2334afdbcd99c47c998ab800c6f0cd03 |     
  riscv64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/850a962bfa5ad071c8ecb46a6a4ad659f527eeec |     
  powerpc    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/9b0adae05f6a7748a0c53ab0b2a2899ba80af0d8 |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/be149d11eee1fe9e073db7ed621189ddd67deda0 |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/66f5f8e4f6ccfb091cdade01b2e5596688c4d89b |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/9744f53b471557f5b5d63b75fa77f8fd7920c0db |     
   xtensa    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/0e26f8448a4324dd5781d07424c904e4dbe1308c |     
   sparc     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/1d6860c18a55bca40c8085a27ae21940e3a15f81 |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/adc901a03fb6f335c672ff3a617a38e67b058c54 |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/4f81148b27d13269e3f3ec6a4362e170dbdc5c2e |     
    i686     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f2d6caf30b4b3458177b37782fe58c3a041ae29b |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/59da2c4c030cd3db9eeeacdf470787ea7cee1e28 |     
 aarch64_be  |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/0c4f62d3c42d924cc8c0ff1ffcd178bc03b642fd |     
    m68k     |         gnuplot-5.2.8          | NOK | http://autobuild.buildroot.net/results/be9fce7be181ba2f3423b2b20d3e50d212879fcc |     
  riscv64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/449da19621c088ff8df00c8a20cd40a0e208c0cb | ORPH
  riscv32    | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/1dd02349afb1661547ede63cc65649e1b2769d3d |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/eccf6823dfa2c32b19d9167e176b4c5bc4ba778a |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/409add56b85b56f21cd2f3f217690925652d5c0c |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4063c8432b979226e952b10eabecdc764aefae53 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bcde72ddec9211210e63af7c6fd94c3e5048b6dc |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2b90f043ff7e030ce85059dbec8682ff98306a39 |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b6b3bb9be5b2f48368dad456e4e8474d5da5612f |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/2ce1af4662de69a6bb62eb049ac30ef5475c80d9 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/fa7ad396b0cb68bb5026c9c37e99da5683665eff |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/5858ae966682d3a8958547c31bd6c1d2e1c942fa |     
microblazeel |      host-perl-legal-info      | NOK | http://autobuild.buildroot.net/results/c2f3be22d46b37dc1defd11e5135de02951bca9a |     
   nios2     |      host-perl-legal-info      | NOK | http://autobuild.buildroot.net/results/3b124aca123207460a9d025f5afd23f5f67fbf18 |     
    arm      |      host-perl-legal-info      | NOK | http://autobuild.buildroot.net/results/abd0e9ca9516842ddfebf49681a4153aa0f225c7 |     
   mipsel    |      host-perl-legal-info      | NOK | http://autobuild.buildroot.net/results/b79f055d204c71c68944e451333bd4f339b227d7 |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/94248c83a77d5287c841d45038e90f2b8d523386 |     
  powerpc    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/32899d7e1f7d5abc528e5627f8f66ae5c9733342 |     
   mipsel    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/a0a4387e5319d792658f6d82a63fb17a06848d10 |     
    arm      |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/6ffbc9ae1e3ae6a8a195aa033ed33d52a32d0c21 |     
   xtensa    |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/7d02c966518e44d798b83ac36b9083a8041b09ec |     
    i686     |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/f7b27ab243e6b35445d9cb28e4747514fa7d98d6 |     
  mips64el   |            iwd-0.22            | NOK | http://autobuild.buildroot.net/results/f5d71af640812a58374374e178cb7ff225e69c19 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/9b52b28b7c09b37eb9a7a662ccca8e1dd2c24355 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/141c979216d25ba3a8891564f04b0cdc32f37db6 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/1f4a38089439f3af9c299dfad5ce85c949c77369 |     
    sh4      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6f3b6a0fef2eb667af0296f49a30cb4d956f7e91 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/a5cc7d4057b6f51ac4e2bb25a878d0250504889f |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/50c824acdaf84e1169bd3f0b4d941f8581a402e3 |     
   nios2     |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/39825fe9f0a2738aac6adbc7c709ff8ea22ab63d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/7201ed77095b17bdf0b3ba49d30b113d5925edf8 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6d661c238a65aca218b068a1a50e35b7fb67cdd6 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/30bca7843aeab2361bac473bf57358789264a669 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6a4f7c11198bafc567156e06e27e5b63a3c0e844 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/aae88422f8bbf51598e809ec848879c0c522f93d |     
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/883318d706ce679a7a185cc869b924fc33269c65 | ORPH
powerpc64le  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/9df3e5767b5463f544c8c7a86975208de45be3ab | ORPH
   xtensa    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/83e4e242a7ef1b8a280104b018e8ff5cb72d6498 | ORPH
 powerpc64   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/0d6833d5bf20ee5c5ee665b8ec21a2fcdb298fd2 | ORPH
   xtensa    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/8db36417e8f48b61309ecd3c598d91f2a70e1e49 | ORPH
  aarch64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/91fb4a2bdbb323f7380b7a740194b947cc94e10e | ORPH
microblazeel |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/37b305bb560910a421ce761ceac19677319ca1f5 | ORPH
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/a99c7081af370b1631b721ed5eda0bc8c40746d5 |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/1881daae69992e30a9c1fff1f639d57f82e6ee19 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f71ccbf8bee8b075c6303ae87c733c2dcc4b48b2 |     
    arm      |        moarvm-2020.02.1        | NOK | http://autobuild.buildroot.net/results/c6aebf17fab6be074712e78605e1fc699cf5b334 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/67595c83bdbec3c23281827848d401ca0df61ed3 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/717c006a2c6b6ca4e389c82bc8073db39b798e24 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/4149e39b0960318f4e9951d84e00796205766393 | ORPH
microblazeel | package/perl/perl.mk:113: h... | NOK | http://autobuild.buildroot.net/results/a37708b4e836496725d5b40223327c4b3ffe0043 |     
  mips64el   | package/perl/perl.mk:113: h... | NOK | http://autobuild.buildroot.net/results/a7cbcb719fbffc988a02e1d08259b2ec8ee5e163 |     
 aarch64_be  | package/perl/perl.mk:113: h... | NOK | http://autobuild.buildroot.net/results/36b9510ab5dc3e8226b9aa3c73435096d8066b54 |     
    arm      | package/perl/perl.mk:113: h... | NOK | http://autobuild.buildroot.net/results/2754b638468614aae3ad01d6ab51ab8ed0c0af5a |     
   x86_64    | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/bfecc87ee53c20009c0ef5f21a3d9fa291a5acef |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/704d0502ea336a4115e824563b988508b3abad07 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/72fd6dc7a3854601128dbb248def8c8d26db5c5d |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1026eaa57d2d8d7720be0fa5a2c07fa832ccf414 |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b85442495839a21f33a16c635e0bc0edb54dfaad |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2a46e00f99322168a42987df7166f085a0ec8080 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f06c04103d52959381bbeb3d2f8c94378d0c4c9c |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/feaa590d6e9e204c0914e6058143062105dde636 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/66fcbc6eec4a330783bbb74a052cc5d7d08dab32 |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3803544f1f3754e6dffd9a0cf2f637d454b19146 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/ee148569a856435b3319340d0b0137880470cdcf |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/4b81b7de9939f02fb00e5f31bb668ce0f5c28500 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/7a6a107d091cc8a54787dbc3db285b2e16b37898 |     
  riscv64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/fd770d53dff687f002e89a6941a8d0acbd424d64 |     
    arm      |     qt5connectivity-5.12.7     | NOK | http://autobuild.buildroot.net/results/1991b13a78e44733125a2180963af3056f814fa8 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/2ac6d83983f8b3abe73a507f22d48d9890a37294 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f10017717c210dac882629e2918fc95848231cbe |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6a194427e06dff1a712544398eecca4fc472dd43 |     
   mipsel    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/b7e83afa0f073a3020887004a1780b8a3ac09227 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/3ac6f3209454f15e1611afc62bfa2bef4db97195 |     
  mips64el   |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/d6934542e8f7471914fbbd659070ba368750098a |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7f93991355fd918f7e61aa91865b84eff7ef0cf2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/5aeab4eb5013d6582df96129e1ac05d03f286ffd |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/e43d7199ec63f0d914fea2a72754becf6d73a9c1 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/55f5ea829cd6dcb0712dd7549a6c183fb4117b0c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/734120c284c1bc1263fefd1303b816df663e99ea |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/d44e786e62a481b485e4398600cbd2545956729f |     
 aarch64_be  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/3a684355dff31b01a6f8e1ff803c5d45c1856bfa |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/d828ca81dcf57a1a46cf3c316de460a109a307a9 | ORPH
  riscv64    | xdriver_xf86-video-sis-0.12.0  | NOK | http://autobuild.buildroot.net/results/1ae38a6279993a7862b45d081085cf48036685de |     
  riscv32    |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/945c505eb7354a4d9aea0300471039f569c19d73 |     
  mips64el   |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/f4efe292b7d387925cab03710dda8a66ece51694 |     
    m68k     |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/dadca805dd2860dac89f6afae57d7c34397f8c3d |     
  mips64el   |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/9cc6cf3f669ce02fdf54742862a1fdce1e68c66e |     
    arm      |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/7b75afb3a037b8e073c1fa7d1f6c6939a5afbbc6 |     
  riscv64    |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/c6bf0ae11a19f3c6846a55fac76a39c6491e36b2 |     
    arm      |     xkeyboard-config-2.29      | NOK | http://autobuild.buildroot.net/results/7c3cdecc2feed62d7e0bad0e790a8bacaaa34cb7 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 5 
                   glm-0.9.8.4 | 1 
                      gzip-1.9 | 1 
             host-grpc-v1.16.1 | 1 
                  libssh-0.9.3 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/7d5e0e7881cfc3b0d713bc3ee557d875aca2890e | ORPH
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/5ef672f88170820aa5600411c2fdced7e8b8b5ac | ORPH
   nios2     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/0def3bfc8dd4bf58d132d53905342ed439e70f83 |     
    m68k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/2d52c5e2d06bcd33ca89125cd5f736a29c382a64 |     
   nios2     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c9f7210e57c3675acf5e045068cb1668248d3a5c |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/2f32a98b9a720a553fc8e23c2531f6eef6328d6a |     
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/bf2c265d69719a41065c7e6881ce5c145021c1c3 |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/aea63959d7ad8b35e4cdd9dd00a99bcde42dae23 |     
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/71e07f0bd99da68398eb3baed0124c15bfdec258 |     
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/3ddec13049116968e5e5a65819c46bc66cf4c5dc |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
              host-grpc-1.23.0 | 2 
                 dmalloc-5.5.2 | 1 
google-breakpad-7515ab13768... | 1 
                 host-icu-64-2 | 1 
                 ripgrep-0.8.1 | 1 
             util-linux-2.35.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/b1084968e0cdf424ea3e1edf7305f8f60b0852be | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/e39bf197c796f1894b68034e1dda13efb227b405 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/11d6ba4d3b4a27cdb6e6573bd14464c83e3ce70e | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/1b0e735f436b20e0ed9ea53e2aed3438f9a95bca |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3adeba9b489cd0e7cead41a35abedae94980118f |     
  sparc64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3227adfc5c9a7b5ca171332597e886e1f5ea27b6 |     
  sparc64    |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/4b9ae3e2e8d982b026254df7dda9817d4fec2520 | ORPH
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/822a260f6444878943bdf519a608cdb0d84e41a5 |     
powerpc64le  |       util-linux-2.35.1        | NOK | http://autobuild.buildroot.net/results/9b5d0a9e6c37ed4457641bb4a6877f0002b97767 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 3 
                 opencv3-3.4.9 | 1 
       python-matplotlib-3.0.3 | 1 
               qt5webkit-5.9.1 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/6a5b354d7e6c3b235dadace2a1431158ddedc7d6 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e8fccdd93bb4fd53504d5b46e585ecb42825322a |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/40ec8b4b69390098c5ae2d7c473e15e2476ad9a1 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/67b439d2cb7eba3b0e44475b6e00f5cf4d113962 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/8155cec9a24edc17ae98cadc17342a16b012b767 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/15063c2c84b13fcce7218eb69a73db2bc954a362 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b319a022bb29e7a5b0a3c89670748fe1bd9e0ea0 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1bd28e2e0605661deeecbf3e2a77c37f9ddb3326 |     



-- 
http://autobuild.buildroot.net
