From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 06:26:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-28
Message-ID: <20200429062608.7E7A4875BA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 49  | 15  |  0  | 64  |
    master   | 213 | 109 |  0  | 322 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             paho-mqtt-c-1.3.2 | 13
                  assimp-5.0.1 | 10
                 mesa3d-20.0.5 | 6 
              exfatprogs-1.0.2 | 5 
         host-exfatprogs-1.0.2 | 5 
              host-grpc-1.25.0 | 5 
     python-argon2-cffi-19.2.0 | 5 
                qt5base-5.14.2 | 5 
                    brltty-6.1 | 4 
                       unknown | 4 
              gr-osmosdr-0.2.0 | 3 
              ibm-sw-tpm2-1563 | 3 
                  stella-6.1.1 | 3 
         uvw-2.5.0_libuv-v1.37 | 3 
               acpica-20191018 | 2 
               apcupsd-3.14.14 | 2 
                grantlee-5.1.0 | 2 
                  kexec-2.0.20 | 2 
                 opencv3-3.4.9 | 2 
              pcsc-lite-1.8.26 | 2 
                  rygel-0.38.3 | 2 
               apparmor-2.13.4 | 1 
                     avahi-0.8 | 1 
     bandwidthd-2.0.1-auto-r11 | 1 
               belle-sip-4.3.1 | 1 
                   cegui-0-8-7 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                    gcr-3.34.0 | 1 
                host-go-1.13.8 | 1 
           host-nodejs-12.16.1 | 1 
               libgtk2-2.24.32 | 1 
               libtheora-1.1.1 | 1 
make: *** wait: No child pr... | 1 
                    mpv-0.29.1 | 1 
            pkcs11-helper-1.26 | 1 
               protobuf-3.11.4 | 1 
              spandsp-20180108 | 1 
                   uacme-1.2.4 | 1 
                   vlc-3.0.9.2 | 1 
                    wampcc-1.6 | 1 
                  weston-8.0.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/8d3c895602b97bd983b0862575bbde01ce987fed |     
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/815e80dae2e368be379ae8be18dbdf7596cc8340 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7472fec82983f5b9c2f92578b2b20b746a8d20ae |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f28481f26a2e074baf5713b7fa49ddb621358621 |     
  powerpc    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/ca8d3071d888b5c1cfa3e275afaf05415e19627f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/912878328641b1f438fe17a471efda5a3e9f5cfb |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4fe2a4b1af4df0d072dc4f29d8b216f1a3625fa6 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/2d8a30c33a46c3253a933f4594ce9b0a24f5fc28 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b6275242fa6f3a38d39fb5d395a7c858828bca9d |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c502e961124b0d66d66962c469d64db428d92c4a |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/dc3c0a49afcff66b5fde877c4ee2d3cd1ae7f830 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/24865880933522a76bf49be3cbd5ab7fa798ce1b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/1daee751f6f9d5cdddd6d96d4663d56a24c93311 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/83050223624e5b1992d0c2997549e8460eaa752a |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5db6075516a6a9c22d13f2bbd20a476dbcfee170 |     
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6615bda7238bbb9ecb931ac6882857abaff01945 | ORPH
   xtensa    |   bandwidthd-2.0.1-auto-r11    | NOK | http://autobuild.buildroot.net/results/3d75e1b83aaca1f99b06f0180a0c62efbab1ed79 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f26eb564f8a33973031314f07ae7e3f6657c28df |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8163f5eba5f967b6d1ed323bd7e6b0cacba885ca |     
    i686     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/5ddae92d5dce32f61cf6f6911a087f79dc5f1a53 |     
  sparc64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/5f80b6e472629233d1c1df528c0e30a7f475e804 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/1d1e7e14f3f6fb44aaa4278b243830d59ed937f0 |     
   nios2     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/48e330828ef5fff647eea36d53e64b2ba26a155f |     
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/f051bb883057fb77147ae93a3c1b46aa376dc16e |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b48dcf17bdce104983598177cee2ef7cc2230eb9 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b499ba416fdea6c95828ef113c3113c6da355c43 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d321a168241d6d748580c60790d6dd96ce181f96 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/bad8dbd0e74cc49263cc5e82a34ff6910ef015fb |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c1ce3829d1871803f83660b8fd1e7ca8765a4d4e |     
   nios2     |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/344612d55a4f0d1bf08630d55be303479e60dc71 | ORPH
    arc      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/082745edd9dcc199a28c2efc2ddeacd1fe0ee416 |     
   xtensa    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/5d7e38ef70b93554c3e9da6a986fb6c8e0f53092 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/91911297eec3d53425ea96b5b2d084802b05fe9d |     
   x86_64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/086fb406a045e47682744ba4eac1ac2732d66bb6 |     
    i686     |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/1f06e52b8505d746d4123331c0db1dccae8cf4f1 |     
   x86_64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e64f2586fca267c9850acf08f4b9a479dee49dfc |     
microblazeel |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/2f68131c6832eb986b5e2eca37909a7bc2b9d269 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/93ae73969904acb9a8a1b39e5bc9c940ec163295 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/97f557a42349c8fcb3fb2209ab841b4f90a67476 |     
    m68k     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/0146501d2b0909b0ad388224d674eeb5a0ff3808 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/6065cb0e98ca0f918b8d439d1b396247561084a4 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/522a48455cf1aea7954c43a0aad6711011add652 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/932e90ad0342584bd57fc524bfe5f961bd7debaa |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/79b39bc660d15ac6785608f8553909d27a0de100 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1c3327ec8571bd7fde20b7526d72f110d89dd12 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1408a4ca11db94551a5a9db6416e62ad5529fce |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b96e3f85571b12cc74c4c293d33d5f216ca529ee |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b5cb347a98dc64f77982633c0fc48d14030aa5b6 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/4c1f81d7e24971c7de87c26dc16ce1f59f56c054 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6ab56d34992196fdac0c31e9c18ee1f22c5a08bf |     
    i686     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/babd58ea5bddca0071bee125450790b1beafc96d | ORPH
    i686     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/855a3984d9ffafea61c55b99781de03438844f46 | ORPH
powerpc64le  |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/d68aff6bb59184a2f751b6a1792fd8154826c1e3 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c0b755ea07dfff13d34c761d607209c9096a9af9 | ORPH
   x86_64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/b71f6270df55eab0d4af2dc9d389df030f14a927 |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/68947ce7e23dd6848708b57b14d78f83971a29d6 |     
  aarch64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/1e51d31f420d76f4986b8cac79fa2453eb53f808 |     
   mipsel    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/85f2c6c9bd3d5a06bbee6fb014fbfd4ed342f894 |     
   x86_64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/4d3a8afda36fa06f2f9c4ed60abec6a89be38c77 |     
  powerpc    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/bc0c32a6daffc1213caf2ad7ebcf651b2305edcf |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a54f04874ddd3f0c9d159086b087290c076073b6 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/109f20f759be14e0a4d7c6dd3f613f99b872d62b |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/d9f1ee667843a5aa15f85f5cb19fc2ed51686ab1 |     
   mipsel    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/2646520655ff69378d0a3ba9bf80aa32274f5efd |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f4d29a78f497240f2f7724051a5d3b9bd522036a |     
microblazeel |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/416faf45d7b1f597feb975d2dc55f14010a2e572 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/45ff37062e0f493210fbf0aa6b69e4b22d132de1 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9b930998d106ce6b185ffc9b96cf8258eced73c0 |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f3e7887ece13abad0febc236c057286897927a89 |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/3b0f143397d748cfc8c38461dced49db532e8213 |     
    m68k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/9a67caabb08cda741a7d6e461951817f9fc7b673 |     
    or1k     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/7c8ef5db51742964973808e03c2d34cc523c9486 |     
    sh4      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c8872ea7013da3459b598be12b1159435b81966f |     
  powerpc    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/d67e7176ebd4c5478f14d4959f73c66c08dc7b49 |     
    arc      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/8388fa052b70ccb4605a22939d53af3cfd42009d |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/405366b445c801d627e8c81e18cb04196759fc1b |     
   xtensa    |        pcsc-lite-1.8.26        | NOK | http://autobuild.buildroot.net/results/54d193843b8b46416d670af12141893188d4b967 | ORPH
   xtensa    |        pcsc-lite-1.8.26        | NOK | http://autobuild.buildroot.net/results/31a00cf074b2fd2f1863a098f1ea77a8496270bc | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4672f5a0a96ecf198fb719aba4b6a6ca8957abc4 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/90fb8362fa7aeaaee2b1383f888f534968f4b797 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8b48573cfc6cbb296471fef8930b2899797f7ea5 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6da0cdb803266e2899a1dc42fb77c745405d1256 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a90fb70aabc5e603a2f11f2ee5f1893941ef6850 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/09aec70101af24c93eb4c7e031b3f473bb81053d |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/52653921537537f0682828f4be33b7026aa2083a |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/06139447dc09c797a3d74421a7b85cc9aecd5409 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c2c918a816eaa306288666fc9c63dfe80f092594 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/64992d82cdfa3440077d0a0bbce42b0106ed1e23 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f2ac9cbeaded058955144d730b7ed298cce7b83c |     
    or1k     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/44ba6d30629032b09ae8dc7f8ff4bf5949f967ab |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/d9bc7b16d7c59425cb95f9e1e19c4d2ad7175a88 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/06d8de17e2e9a4f1891405e4af909836e906f3ff |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8a032ade491a2eece2283b93b4e8cf6c80e583da |     
  mips64el   |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/4296167efce151d0e69cb741b305a7daf3c2aa13 |     
    mips     |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/739e5f96a389129326e874b39e72d5a88286195b |     
    mips     |          stella-6.1.1          | NOK | http://autobuild.buildroot.net/results/1bf753aa3e2d7bfd459f7781b12f1a2830b79ea3 |     
  powerpc    |          uacme-1.2.4           | NOK | http://autobuild.buildroot.net/results/779ead0be6ddd411db414845a145780c918cc194 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/16b17f8355f8ff4e37b3a545e4ad679d4dac6ca5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5cc5c7fbc5c76239366afbbbc684ed0649311bdf |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e279f5ce0996ab0e4e7438524289c4817106e6f3 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/591f456bd94d936f62e526b30f5b79f67d0437ff |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/69a670fcd680ddeed989876e186ce0e9214159ac |     
   xtensa    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/ab6954a65fd6d43c0674cb7a38a941102cb0dfe3 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/4a75bd62e3bd024606d9a07f08b0d6cd85d7c5d6 |     
    sh4      |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/6de3206f25831a50685fbcee23eb2958f67620d6 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/0e11ca995203bcb4d3a43e4b4ca5d171f3708023 | ORPH
    arm      |          weston-8.0.0          | NOK | http://autobuild.buildroot.net/results/8b05b0d42c95bdc2deec97d86720e6c2fc390bb2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c58fd0e5ba34a14864e31586ec7e04036edbf38a |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.7 | 3 
              gnuradio-3.8.0.0 | 2 
           host-nodejs-12.16.1 | 2 
               libglib2-2.62.4 | 2 
                 clapack-3.2.1 | 1 
                 gnutls-3.6.13 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         clapack-3.2.1          | NOK | http://autobuild.buildroot.net/results/215098387812325b6094b374e1d946d6c4d46b12 |     
microblazeel |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/e188585567b60f607e058a9f343cd3bd734431be |     
  aarch64    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/1d049cd1e4388bf8c320fb393297fab5ee6805c4 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6969fe67a7fb858ae383fa1de0ad6a030b8ca261 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/13906fc5ed6519790df484e7f41af29fb17e1a71 |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/e59a972f83a16dc70797df1496919b9d70fa6b72 |     
    mips     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/3efd934609db57098253e21ae6fbc9c2af4a297d |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/65ea408318eff4e055e382c9459ca93d0d32ece4 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2c0196e163ef093cfff8cbffaa8406f38b38d6cb |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/22544cd3d52d2387f9ff80e2e9748f1e107e897e | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a59cef6993541c12b921245f231dcd6ef9c72f73 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1786cc6948dd0433526f8e00c723972814d71d81 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/da5b873447fddbb1e2d30c2de27c383002469fe7 |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/5d38c47c758f7082fe2f032ba8cdfdf0db8dc717 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d65ccd5ef072fbf3ec1ccb129bfa7643d7007e87 |     



-- 
http://autobuild.buildroot.net
