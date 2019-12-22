From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 07:17:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-21
Message-ID: <20191222071756.E6E2085B8D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  2  |  0  | 28  |
  2019.11.x  | 19  |  7  |  0  | 26  |
    master   | 153 | 99  |  0  | 252 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 23
                  apitrace-9.0 | 6 
       alsamixergui-0.9.0rc2-1 | 5 
                   libnss-3.48 | 5 
                 samba4-4.11.2 | 5 
                snort-2.9.14.1 | 5 
                tpm2-tss-2.3.2 | 5 
              host-grpc-1.25.0 | 4 
                   dante-1.4.1 | 3 
mmc-utils-d40ec535b9d4e4c97... | 3 
            python-cffi-1.13.1 | 3 
                apr-util-1.6.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
               host-llvm-9.0.0 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                libgdiplus-5.6 | 2 
              spandsp-20180108 | 2 
           uboot-tools-2019.10 | 2 
                       unknown | 2 
              alsa-utils-1.2.1 | 1 
                bitcoin-0.16.3 | 1 
                  boost-1.71.0 | 1 
                  flashrom-1.1 | 1 
            host-mfgtools-0.02 | 1 
                  libssh-0.9.3 | 1 
                 mesa3d-19.2.7 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.10.1 | 1 
                qt5base-5.12.5 | 1 
                    quota-4.05 | 1 
                 ripgrep-0.8.1 | 1 
toolchain-external-codesour... | 1 
                    xen-4.12.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/ff20511f1de28807bf5cce2cd2f8df2013f27310 |     
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/0209394b015a8c08e6c13a0ba27ea68c8e3f99ac | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/28b1b2a6a34974a09dab986af76775eacd8cc0b4 | ORPH
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/598dc55aaaacb24c9f235dd6a449c67134847b2c | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/447465d0b657c52c8bf642b85ed5e5d5e83164d6 | ORPH
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/b270e462ccf8cb50a2ebaaf7f9c5473fac8411b1 | ORPH
   mipsel    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e099d554419a661813e343758f1ffb52e00bc999 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/b0bc8abc88df04daa85799002acc0ff60d45f375 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a2072822aa27cf7be314609f35542cd93e6b5dc5 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/44b00c2bf454622c84a815275d80eb787e46c345 |     
   sparc     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/75dee35ca6121f08c9c97957ac751ec6d0a9ed4f |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/fe947a6c9fc2559c9079f50c62d7f2e29fce4875 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4dc1c8c70e0c8e5131b9fffe3ef80dd18548fef0 |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c48064e60341922253337fe8af8de1b3a9f9e9b8 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/ddbfbf961ad1a26b7379f6afa866930357ef7f15 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/de07e344448d090965135b6fc72559f541c70ce5 |     
microblazeel |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/84f1a0305f245ce2bc867ef697d1b590342ea1b6 |     
   sparc     |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/5b7322deda94d4b82932745414a255c5a291f96f |     
    m68k     |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/98b08804aacbff237812a1439cb6affbd978adbb |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/19a2e78e404ca82a6662af54013e286b8b66f813 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/57c18598ad57005f77197ae3ca6f1848c317c861 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ef7456235931842c142e881d18cb7efa79d8e6d3 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c936aa47e142984801e9d2ae230aa021dcb65502 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/393fdcf7553242478529170a8a062426b5d73934 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/72bc86847d0f8c7bfeae21b61f0e55ed45c1b19a |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bc4ccc120babaa92e62a832c65fedef5bb4cf644 |     
  riscv64    |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/89dd85897f03b83546eec4551fa26a647b750e2f |     
  mips64el   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/a64e29939ef07f57a630cbe14341d9ad4a6651b4 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/88595e394b6cc21ec1240528afcd8f605c05d8c4 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/3324b63fddf3cb4a2827780816f002c80e93b68a |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/9426853516eed1b2558bf9a2652cbb98be1b7c8e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4a6aed075c100cd8863fbbe3ddf50f7001014c82 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7cce956effd17123ebeb9d61020d19d48ea34655 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/39a11d0a4051607eeb8eb69792cd1f93b36304f1 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f1036f662146a438ace1f55bd86d0c8306736cb9 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ef60fd67fb4dfe0ea25558fa9592b314abc9fd16 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/529453c351e568284c9801cf602df5cab7ae119d |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d120039cd8212a8e139466be961159aae19f68da |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/664628ea4c1d37044caadef81f2953bc3a4bc37f |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ebc234216d623036ae64995c266040887db0dd37 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f3f88c2020736fed57fc27b75687577e8be2329f |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a3cdc8eb3420e9dba340a9f01665c31329831659 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2ffcf69ce86140128aa826f59eabdab9972e91cd |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a154324fce4009296eb46e879e6401ca3bc58d73 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/56df646dc163b9a0b7becebe5404557b0b300047 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9458c4c5d683d897285bc273e28b8c3cc473d17a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5a0e42445d1714ce0f676789f98c7ff3b956a162 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8700153069aa1f7508968e71d5f81591cbb9a762 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0e27bbc40d767932c9d7b7157826d4ea43a9b5de |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/612f36469b4ccd04310ee5235cfe07b6cd3394b6 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/489bcf4d8987ffb7dc2770bcb8de266cbac14c41 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6a862be6a883bfb6d5aa101b9a1bee29564646c9 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/053b021e525dc19c134791b25a9fcf43fa650be3 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c136093f7ca08c72c57c5295659bd55ebda7e4ca |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6db401b46f74a33ff0b8e70733a2ea37adb16ec7 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6b1dc42774c35cbd8144a14cee87c8d85bc0f238 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/3b3cee6a8b21024dcda388749e3bb804b81094cb |     
   mipsel    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/f113144ac1bcc5b7a35c7997b9b182a0e76a2369 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/2f603691a849e25b8cd25a7a62f48b73c1df8f14 |     
   mipsel    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/b2efa784d8fc4436e115e4a297cb7492dcf60649 |     
microblazeel |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/e2a6b591d7b0aa964c489633920e64a529f24715 |     
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/badf9864fa77e97f9355fd182668f0c0f08443ea |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/f3892be2c17efd32ea50df965f755ee504889540 |     
  sparc64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/4f13a3c1132ce04abb9cbaacfe00f177ba3539a2 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/042ec547080be09bffe89a0f63a917c03a637322 |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/baeea6df4996fae728d1a6550f8be3a4540d221d |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b0fb1ac1f7a1dfbeec26a9fb6e66986539b0fd72 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a1e5c51b90f3b59ec9306ab1f09acc57a9faa351 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/f7a5b8ccf9789f5cebad2bd78abf8d3387225d70 |     
    arc      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/ea3af7d5be6a4b354784d5796e60de606860fb6e |     
    sh4      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/6fcf8adc05f4f6457d0794148096278cb624c6ec |     
  mips64el   |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/c58cc95d3039c2e8409affaa5823be7aa55706e8 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/270ae96858badaebc0dd878548552c994073cf1a |     
    arm      |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/efda7699435018c1de4fb5c9b4fba10a355f23d7 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/63033825cd9733585a0bf425431e8dd27e2a6a7b |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/e6f213366d0c43814c1d0c6f1b0bb897da0eb006 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/423f99a07460790d87102eec1388e2d7e0b1389a |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/4633e5280cb412e7d1fc6ea405ca375a0ed183a5 |     
  riscv64    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/e6560bf7d50749b41a319a770548f4f6e46a21b3 |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c0ce044ef77f09cc12b0815614fc7e2553cc4ae8 |     
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/c8fe24fecf763a77b64ca763b55185ed6f130407 |     
   sparc     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/0e084644d1418b05ecac60890b0bb2aab309b9ef |     
    m68k     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4 |     
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2748b7de628bff43d1fa047658117a38b6f7e661 |     
  sparc64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/e035f2fefeaee8282325334616c4481f53283f58 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/cf98e67cacf595e16ac7afaa00f095a823eac000 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/07713413c563ba809c63c3886420142cac55b19a |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3fec6827bbcaafbcc09254d28cf6330b2558e5a7 | ORPH
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/97c0c3a9666e7327b9346ef80cd4a9880faff0bb |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/0da0bbea4eaf55fdeb5e8dda44c905ec62aae06f |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/d390a1886688215dc7791876b03100d0fb4a5b1f |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/9fcab9df72bb3fee174abe4e13c86e409b4a4f29 |     
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/4c6c9827fa2d76e46fa9b7b4c4dc874487424fde |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/9049471bc7255271701dbf90098614f2cb736099 |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/5cb636530113e83bf8c2dfd994440ed5501c6716 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e51b1da965179d65a52d72837a61b9f18c46b87e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/766aa1d9a03daeaebb3476bc5497d689e365f6e9 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/b985ba41d59a41ce96702ba6e7ac50cab4048352 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/30c254cc467efd89e9cdf6b031740d0f0415e2f0 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/2a51d5f25d91be8936b0499b3cac48ba76f2b00b |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ec6bc878542140b14d145beafc83ffc1dea2abc2 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dav1d-0.5.1 | 1 
              host-grpc-1.23.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
                libgdiplus-5.6 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                 ripgrep-0.8.1 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          dav1d-0.5.1           | NOK | http://autobuild.buildroot.net/results/a99be5fecb21c4e1c7762ce702554d1323a7ef07 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/915da8f05501c497541915df7f9dc3a5a164d2f8 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/dc4c782086ba00d39b281401b421a3d38df087cf |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/710d1968a9680ce5b61cab1250d432ca8a1c2ee4 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/62054559821d9e747479c51e97fe025672958c1b |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/90f45f0dedc8361a099b384bbde7b0efad133e4e |     
   x86_64    |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/d469e9ece75b5b466570cb0857dc594fff3cd193 |     



-- 
http://autobuild.buildroot.net
