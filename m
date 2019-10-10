From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 06:16:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-09
Message-ID: <20191010061620.52D4C88531@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.05.x  | 23  |  2  |  0  | 25  |
  2019.08.x  | 14  |  2  |  0  | 16  |
    master   | 132 | 75  |  0  | 207 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    bird-2.0.6 | 14
                    brltty-6.0 | 12
             subversion-1.9.12 | 10
              libgeotiff-1.5.1 | 5 
                    proj-6.2.0 | 3 
                 uclibc-1.0.31 | 3 
                 mesa3d-19.2.0 | 2 
                   mimic-1.1.0 | 2 
               mongodb-r4.0.12 | 2 
               target-finalize | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                collectd-5.9.2 | 1 
                cutelyst-2.7.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  ffmpeg-4.2.1 | 1 
                  flashrom-1.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                   grpc-1.23.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-harfbuzz-2.5.3 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
             libopenh264-2.0.0 | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
 Makefile:743: target-finalize | 1 
                 ripgrep-0.8.1 | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/97061d4b5a42841e12725c31d36c0207185b16aa |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c110ee50bb22e130de93f9d13a6c621ae38fe8a7 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/5a6043b04fd7d69fa7ce25f18e4fdc3c90578313 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1c818120ea97cdfbfa2adfe173ebc8f8fe8303ac |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c4241073a2f324f2aeae667f95f7ef09991a58ba |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c373750ac21ea0aa46bd5c9e52da9558a12b46cb |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/944750023382fdd365ca2e3097e9553adcc066db |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/7abb7081362ef0f8dc34a59500ff0909762cb301 |     
   x86_64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1553fb48d93595c5a805d78625ff286a202e0dfa |     
  powerpc    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/801b8beea3bb1608b5521ca027a7b4263423e63b |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/90ccf6793183646064c81b72c8ae898f2c7e231b |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/ffc71f9ae9bfcf63f054df2e3b8cbc6ed161766b |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f1b54232d56d5859d37eef9300e1a37e7933314c |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2f16b5868715cecde2cd7a0286b71fbc94acad8d |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/67eddb4f29a28bde4a07d4eec900667f4a1f5290 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/06cf81f55876d10eabc84cf75c44edac1df8d311 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/80b08b0afee6c7653fdb09d3605e239841204576 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/13f2f803049c4e668fdfc11c15a639fd23bbb16f |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/737d6d4bee8899177b403a4e2ddb73711114a584 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/599b74f30763e8fd16282692bea24d7bfc90ef28 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a96d3a4c7a45dc11ce339a23538533b6b2833b22 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f13def0d569bfa32b45762eaa39d62f50a966bcb |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ac84b4d67b4ef47dcc3a959805df795ec674ee73 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/147d25648c4ba09cd9614402a8cd1bdc80559c7d |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/08e6eb974b0c1b7d86d131f0672ed87d4cdce8a9 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b2ecb230ab15df9badc8389a22b24952e324e275 |     
   mipsel    |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/57cd8bca60dc543da25fbf182dc442ec659b7247 |     
   sparc     |         cutelyst-2.7.0         | NOK | http://autobuild.buildroot.net/results/037f707ce171134801c5aabcb12bb196eff24dc1 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/866dd87c6e26ca674364feecc507250cdcd6b8ed |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/c2a763dae5e332440f219517f9e0728196dcd73d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/878cdcb5210db5aa608764627609b76cbbef90d0 |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/359d227d15f8f8fbbfe201bf5591aee2cae310c6 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/f0785d3756570663eac13b5ee8d11a2b4d2f11bd |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ecd51dd07a54e6f705d8a97d0ec2c8d99db2a201 |     
  mips64el   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b6cb0297c115a26240b878a03f416dc1d20603fb | ORPH
    i586     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/31c083df1764c6e937d89dbd70a89a03806f638c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4968fe62bc9873e3866a06ceed5d4038a3e6dfa0 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/2086b5e2bb89da84eeb9f6311e49a179afc47124 |     
  mips64el   |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/3eb3d41d3288c08616b68d52fdc7525c57c8e023 |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/874dba66c3ce1332ae9c25ffb4ef0049a7e8438f |     
   sparc     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/9f380b6f509c28637b89a508cadc125922b60386 |     
  riscv64    |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/77721989e5b057995e6c5f1f184fe368d8a8fa78 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/86445fd9af264544a727877a357e6514a24ff6e1 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/cb7a9f2ac4397dab9a82d23258cbb1314502c7d8 |     
    m68k     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f43a228d2f3ef080c63e2f5601134734da4694f1 |     
    arm      | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/b390bb07680f44445f3037b6ce050c622eb51d08 |     
   nios2     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/147db920d28687a37150144211e803109746347a |     
  powerpc    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/b41cde1fd92c41e53f9e38c4cf35c3a4bd9013c2 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/91c773153d2c55a713c478397e600093b640c47c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3ef28cdd4240b8c6d79a180b87be14046254ea2b |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/f48e1767d3623b5afb92b9d870b452b9381297f0 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/2eb34b1f4d387222bd2acea3ee8804052c2f2461 |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/5404149a572b428ada7fbfc3a862093ff60865cf |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/90e8fb0cfb62c71259849c2451ec402ac58522c3 |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/c473b0084f3b764b2a904602ba20e17cadb1acbb |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/28c6364a89a6044d5a036614f7a6e59815efb770 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/9dc476d91b5a7583a50ac63967b560b4f0a34169 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/91b2268fc5f0dbfaa2717e850e93ba18fa758850 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d9b9f6b4306ea78e177309d8ad5bde8ff57928a6 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e80b14f6282e314b44476d3ed199114ed3cede65 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1e6b4996a1c113b689728ac7beac0ab9b8d7648e |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8fe91c008078e0b58f1ed331e77c0fe54769b927 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/15fb47c2f31b9021ede1870fb04feeabac200024 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/78fc187f10524d6b1cd6549ef868dcfe6a49d999 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/75c515772ba0774f57fa92b36b57674c63d1a959 |     
 aarch64_be  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/824e7f2c0a8889a19caf7bb5ab01c536ff4e2749 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d1d522da76259ceb319bad2d5a6c2d17fb910443 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a02ad50543fdc5621353055ed51b36b355744d78 |     
    arc      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/16c6f0235bcd310d88e379d60ad46a92099442d7 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/835e76464f5b6f8eefcf5983cc09d98e6c47c0a2 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/144d4171a362e8f112c3d721acc410920f9bb689 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/abbea39bc6417ee47ca1248bb0c3d5fb46d33618 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/659ed16266e26f7c292d281c9601736b073760f8 |     
 aarch64_be  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/cae9b892cb890df989142c27c137a178e0929903 |     
  sparc64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/58d1edba52a596f3f92cda7341b0a61b5cce3918 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/7102fb946ee059ae7f1c4eb8bf2561e29640afdb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/099c6c74c3ffc73c5350fccd744660c5a89e665c |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.18.0 | 1 
              sdl_mixer-1.2.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       host-grpc-v1.18.0        | NOK | http://autobuild.buildroot.net/results/b3f9755bcaba08fff54d5d62c737cb638e7dba02 |     
    m68k     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/c800ef60d8af0cd76f2f1de9aff573120ebd8ada | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 1 
                 libdrm-2.4.99 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/8ead7655aa95fc1e7949afd771995f375c6dd407 | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ac374fc64d748e286bd6112c78152fb112d470d3 |     



-- 
http://autobuild.buildroot.net
