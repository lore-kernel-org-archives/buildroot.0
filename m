From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 08:01:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-14
Message-ID: <20200815080146.EBD3186EA1@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  9  |  7  |  0  | 16  |
  2020.05.x  | 13  | 11  |  0  | 24  |
    master   | 121 | 67  |  0  | 188 |
     next    | 30  | 23  |  0  | 53  |

Classification of failures by reason for master
-----------------------------------------------

              keepalived-2.1.4 | 8 
               libglib2-2.64.4 | 8 
dvb-apps-3d43b280298c39a67d... | 7 
                  boost-1.73.0 | 3 
              host-grpc-1.30.2 | 3 
             kismet-2016-07-R1 | 3 
               opencv-2.4.13.7 | 3 
                rocksdb-6.10.1 | 3 
                       unknown | 3 
              ibm-sw-tpm2-1563 | 2 
                 opencv3-3.4.9 | 2 
                qt5base-5.15.0 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                   cvs-1.12.13 | 1 
                  dnsmasq-2.81 | 1 
                   eigen-3.3.7 | 1 
              gr-osmosdr-0.2.0 | 1 
                   gvfs-1.44.1 | 1 
             host-elixir-1.9.4 | 1 
    host-mender-artifact-3.4.0 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
libcamera-96fab38e02792a109... | 1 
               log4cplus-2.0.5 | 1 
                    mpv-0.29.1 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
             qt5wayland-5.15.0 | 1 
                supertux-0.6.0 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/2899bcd58dcce8a1b820c1f310e1af7ebec1e1f0 | ORPH
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a9cdf1454920a264447665a241d0904a83a2fd06 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b31aae410feaef5ff70a8b644b1be337e4e27338 | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/84eb9bb82255878d6a58772cb96d253a5c02f625 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2ddfabda83a42d06b6b9689bc83882c59d1b8db6 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/ce3f75b5a259924924c934e784b58feed2705be8 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/81e50a5b565fba0b5703730671d9e9dd86db3b93 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/119aeffa1c3d1eaad929cc40af073c71b46cd17b |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/b2e4b144b4270cee0e1efb29ca86da322e403213 |     
   xtensa    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2ac9a7f329289532c8a3a75257f349e5662efb70 |     
  mips64el   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e2ea73ab636d3493ef0c1db07d2fb4fba1bbbbab |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/44863a6c6bcf0021298fcd9dba7b2b10ef1dbc93 |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/5cdeb12ba89285a96c4eeefce47bf72a86e2d1f7 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e71f315ebd29230c746f687e457e898b75fbc464 |     
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/d6001c4f5e294524739ff422e192786f76fe8a92 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/0b972b4e63cac9ae95dcac78e031d7b19e2e4e0d |     
    mips     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/3bb8d678aaa782b70c14a8f9cd3e1df2e55bc613 |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/5cedf537d2e947a2a7f492611ec4a8323c6e2b97 | ORPH
    i686     |       host-elixir-1.9.4        | NOK | http://autobuild.buildroot.net/results/a3a37eb724ca5689f8e83c9b2af04d07afa80315 |     
 powerpc64   |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/37847b16d8ece2f4f6ed34ef15c0a185e13a9055 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/b920d98e17e99f32c535cf046dd0e83d80271dd7 |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/d76edbda32622ff7cae2e8ac7a39e3fb46590796 |     
 aarch64_be  |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/6c2fe35b309ae06eb4ada9a9292e03b7aa77a1b5 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d01139419fdb0976754ee69dd35f8b8e78716820 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/139eec08e9a138f59dcd8b91503716e73dad547f |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/453d38d0ef5b2a3825bc5f923a6b59055c651b11 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/34cfaf0e7dd459f62792fc414df604c8ff04fc86 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/79bde26aca95860a2e77cc9d70de97387c6a1be0 |     
  riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9b2ef7932c9fd74d72214b831ac203d3c74dd4ce |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/5dd83b33ef54a4a6ecf0be47adb3a4672a5bb067 |     
 powerpc64   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4567e3b0a0510e8a615781178ff5bbbd835a92c3 |     
 aarch64_be  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bbd1597534df46895a6736629ffc44bcc0150618 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/c8e994a3d78910a2239211386b4ca6688ad8bb05 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/07dca0689044777cd6533dfe244f22abc7c3084d | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/50e314b341fb46acfc81c84b6aff3381cb89cf75 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/718dd77dd44cd4bc43761900c1e0746074de038c | ORPH
    arm      | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/7777cd9496e8f8cdb093c3f82c550eebedda0b5d |     
   x86_64    | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/c28500d4cc55fbd2bac87f2c11759ddc9163bc91 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/2f05d672560a9e9dfb4412146b73f36667fe7e29 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/4ba63b6df6229462cee9be880bec89216307acb3 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0839ee8b268dd010bef243d4b91a2a86f6e22655 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/be8ce63d6053ecff4e51e210dfaf58a4a8f772bb |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/79d035ef9ae878d593c330f4b2e690d05651673d |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0d1525c2e73a03650a1999c118108cb19fe7673d |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/5ee78c831db40d3e7fbe11d3538f9f311a886969 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/e1c56bce298ea0276edb46b48b8d0681d2b539e1 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a7732fdb2ba526a114d9fb759814236c5332f8d7 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d50171c7a90b38daf6b1c7af97dd61c816fcfac3 |     
    arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/949630bb8bd63eed740abee4600deb238a6cbb0b |     
    arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/db622456c121cef9ed54931abb5c59603b25e1a8 |     
 powerpc64   |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/52d99beb5c7512429264e265545ddc0f05d53781 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e21dae6b7680d720b00558212a42206f6aaaa107 |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/87a49185211d0238aeb028f0c3607f3fa05e8c61 |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/a1bb21a275e78de450f73e30821cbadb3a796d95 | ORPH
    i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/48165633b841ce6468b7c34d7e47a6fb2a4555ef |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bcf68bf4cbb7cb6d1bf902ac6c288806d6c50588 |     
  aarch64    |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/f673d4bd730b029bda29357f0b1442cc22475895 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/7014f905b9a678cec0699f4bb1d9b6d61535704e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3776d2302f389691db972de35e077dcf2a07afab |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/72f6f1aca4f1c9e19850ceccef7fed756af0e403 |     
 aarch64_be  |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/0f02877a665b2281266df4b23c72a7c113906c31 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/028efb98838163b0c697bba30cedbc4f0704748d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0333faabe50ac103324085cc219fbfe06a1718bb |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/542e97923620b2135fe5c846ad97c324cc108f43 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/93d88fcfe723e91846a68a9d87de585a741f3c5b |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c3b67d8a5faf7ff06b08a0591f22b1fa4963c2ee | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/538474abda90082eec91ca9017e91b4427e4f54b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
dvb-apps-3d43b280298c39a67d... | 1 
             libopenssl-1.1.1g | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 
               wireshark-3.2.5 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7b024a5d29e8b34b1cd4a38748f0cff50d190cce |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4cf5f67c209f0b57b8258b5b17904ca89d20c4f3 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f861127b08d8e6834ef5095b3ce3b41f937570fd |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/215e654d0cc6ae6a92f3bb76afdd9e08eff81629 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/5d7de599f661a25bdbfd8671dc7d2063c4b534b1 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a6c02123389dc5fc904b8ef6641238396253c7f |     
  powerpc    |        wireshark-3.2.5         | NOK | http://autobuild.buildroot.net/results/5c23163da760a12045d060b3e0c35733f8c2d909 | ORPH


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                qt5base-5.14.2 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
                  assimp-5.0.1 | 1 
              luabitop-1.0.2-1 | 1 
              spandsp-20180108 | 1 
                    strace-5.7 | 1 
                       unknown | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/1c95733bc05c123fc745128f9e1c9e97d2966505 |     
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/68c77ff4779a1c092e4e70b4960e1507c05ea74e |     
  riscv32    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/f6b4dceace9b1bed639b3e88cb119f6c8152b385 |     
    arm      |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/1df8908ec3df76de491f91342ac575bd3b950a98 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/52afc5803d8af0dda4466713816f855894c6c8c9 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/65102b89f3b05bb9d75a2b5d950647cf3cf45b6d |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b97b53fdb5229ed3c17ded85b72f397d89db82d9 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4709b532d57758751865c565233daac376c1c669 |     
 aarch64_be  |           strace-5.7           | NOK | http://autobuild.buildroot.net/results/499efc6a086e1ca89bd97df4ee2fb6906fd6c448 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/a08f91365e6a964143769a0b0edc579dbe7ce32e |     
  powerpc    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/cb30ca01f748750e5b65ce61d0129384cb6382c1 |     


Classification of failures by reason for next
---------------------------------------------

               domoticz-2020.1 | 3 
                  assimp-5.0.1 | 2 
              keepalived-2.1.4 | 2 
                qt5base-5.15.0 | 2 
                      tio-1.32 | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  ffmpeg-4.3.1 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                   guile-3.0.4 | 1 
              host-guile-3.0.4 | 1 
               libglib2-2.64.4 | 1 
                 opencv3-3.4.9 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                rocksdb-6.10.1 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e981ded75b0eb7ae32c9344f06b433b93c935a09 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/dc01116c400ce0cfb1924b4fbe381b4a0f75f684 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/08eb90470d677c19bb26ef6979f235c54ccfbc1c |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/fb518a6b146bc5acd7c58f649107bc5cfef13a03 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/f460ecf1b1fb7833f07add07fcf672922941be2b |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/38abf582fa15642bef86909fd2591671193d3dea |     
   nios2     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/641893d9a672849b3309db67a56ca715df0bed6a |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/30dff1af8a34a6bcde3c90596b7534bcb3c41547 |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/5c7113a8c615265f38b5f2559f11b9a49c6c46c3 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/e1782b001b083f013b6eb010f74b1531f90c7b8f | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/1baae0947f9e66319cc3b0e255132e1979c724ef | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/fcfdae77e267751eed73bcbd3cdf74231d5ac1b4 | ORPH
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/28b699878d686c950ce4d1370eeb5723139c5428 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/19113d8f234cdbdc5bd9bbee217022b6aacf67b2 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/3a7a916c36e66fc4e640ef3199ca876ee8022625 |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/fbc153427c64746581af3defda0760ed46fd0668 |     
   mipsel    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/06e01ab680ee2a3b501cf4bcd1c748f1e048adf4 | ORPH
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/56e560e80edb01ef62c7099ceb9ff1cc9c193ff4 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b68818b602e3edc5731128fa0f98c429c111217e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/1635c35a5d20f9b23611b90732536e4678268e8f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/91f174b4aa0341c860928293a783282422b19440 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/37e108ffdd835529c604afd0d4ebe646dc8f937d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/7e39e4fd11bfbea2be95030ebc1e74316414d522 |     


Gitlab CI results for 2020-08-14
================================


-- 
http://autobuild.buildroot.net
