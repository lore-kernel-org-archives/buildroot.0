From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 06:16:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-21
Message-ID: <20191022061636.1DDBA84D0A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-21
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 30  |  1  |  0  | 31  |
  2019.08.x  | 18  |  5  |  0  | 23  |
    master   | 131 | 160 |  0  | 291 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 56
        host-dbus-python-1.2.8 | 16
                    brltty-6.0 | 13
                    bird-2.0.7 | 12
                host-lld-8.0.0 | 6 
                       kmod-26 | 6 
           host-libselinux-2.9 | 5 
             subversion-1.9.12 | 5 
                  boost-1.71.0 | 4 
                  ffmpeg-4.2.1 | 3 
                  gmpc-11.8.16 | 3 
                      icu-64-2 | 2 
                libdrm-2.4.100 | 2 
              libgeotiff-1.5.1 | 2 
               libupnpp-0.17.1 | 2 
                   mimic-1.1.0 | 2 
               util-linux-2.34 | 2 
                  cmocka-1.1.5 | 1 
             dbus-python-1.2.8 | 1 
                   grpc-1.23.0 | 1 
                     gzip-1.10 | 1 
          host-libglib2-2.62.0 | 1 
                   i2pd-2.24.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
             libopenh264-2.0.0 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.4 | 1 
               mongodb-r4.0.12 | 1 
package/python-pymodbus/pyt... | 1 
             safeclib-03032018 | 1 
                    strace-5.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/8bcd81df209751c0b7723e1a594dcbca0f4824f2 |     
    arc      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/dc7eb7702d2d5d63915246fd935703fb05f34f59 |     
  aarch64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/e9cfabf22ef92c3b30cce8c1614e1a7b77d64bf6 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/ab144331198a88a1da00a442ddd2b4084705eda6 |     
   mipsel    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/54f1301a144a5d4dd8775df7ef24019d462377ea |     
    arc      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/698b3e8e670b19bf889b7e24a33b5536560915bb |     
microblazeel |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/9ba20d6f2ed2f845fb46d90cc876b9dfbc6449e4 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/0f0516e8b51a6e2478e406b42314897fe4250b98 |     
  powerpc    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/2b80022e25ae6a0db52c3a919d1e6b8e5a6edc4c |     
  riscv64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/7b056c7898d2748ad6191d9e3657f0fd70e5398a |     
    i686     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5d33f910efbfa64b26ce286f94acb18d21a93858 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/e8056314f847df66fe3a89c50517084746b9d963 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/690b99081bc73b3e579b405bbff5947feca7257f |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/998b2de45d3ed772f56a9e893a9003e2be482744 |     
   mipsel    |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/7ac9ffe44d622b0f3e72b3c7fa0873a7fc58af67 |     
   xtensa    |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/e250c00812609cb732088297c090fc23d3cb96c0 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/959fed67fb485444f09a41721137c8e42421608e |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/af3d6b209d13580974c1bccb8dfbd854c3c1c4ba |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d124fdbf22a974ef2ad354f96bf408201c0ce841 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dcdfacd00e1486de938ce40cc489f136abd8258f |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a9c76aa986f3d3b2c457443c0d50ca453bc9f90b |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/445c7f4a76346485154979f7dc556a4dd7000413 |     
    i586     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/34f9d59481066b4515016c32fb09545ce98ff052 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9a89125a1a9053afd662c7dcc8e5986f91c25586 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/557465caea63c2e4b4ab00f35cdebadefbbd7b7c |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/934249cf8c0e294190fe8e0ee047d9e0b4589ab7 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6404d411b4076c06bcff5ac243f84d1b23013318 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/122ed9ad2fa393462c376a17f5fc838a32aaa5d4 |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a2144621d1517e6cd57729f4dda483f90bdbe539 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/e5fa7aa9314ed7241f9b32f90d8271daded9bbe2 |     
    arm      |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/9c087023293eb5ba9500c61ab9df9989f14b8e84 | ORPH
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/d4cfc0fd7191c91e4da93e15edcc00e8d1a24c38 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/257da68e2a65c249564d9114fae2fd446423322e |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/da6477cff58806f654c0d2067d7e7517856b22c8 |     
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/624a16e5ede120714e590200ea07fa3a6a969158 | ORPH
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/7094a9f08ef9f5cb4a0825be983cc463b8cc9943 | ORPH
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/3f78fe5a750931200bdcc86d6dc78070f3341957 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/a47dcff632dd0eaec1d6a5f2ca1cef4cfafcc34b |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/76366ad3d7caedaed11e0ed7ebbb56223cb661b7 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/c456fcaea94c8f6de4448489335533adc357407c | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/63a9bd03e626cb99663358f675a6e508202f8786 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/da481ea60d0a6b9fddeb6d1d1abe192ae84f37b9 | ORPH
  mips64el   |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/16ccba6bfce1aa52604d791da942eef0add1fe0a | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/ffb003cd188fb1bfa902762d06935694c1cc7660 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/b1f0de4e666ae922937bac28586536c308578a6a | ORPH
    m68k     |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/b4aa27fac10f6c8b8509d33ec0a1e07ad3e6e219 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/16b4f865f39339cc05fce289b51a602f95d6e1fe | ORPH
    arc      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a8dafa9c73e6e3aea5322653b68d91a766e1e6a8 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/902c864de96eeaa4ddaae8080b618107c8c72417 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/d4689797ad9d21bdf566939b8b3a0815583a45b7 | ORPH
   mipsel    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a6a7c093c7b04368806010c7fccaec0d7b60e6c4 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/31c8abf6d1a508fc570b14587955498d77d7deef | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/975617d39652e3a087da0e4177b63e3d121f741f | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/112047e90d67edb9e9d5f79c6d272db0edcf26f0 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a7da8bc3f7058af80a4b7b9e9bee47123efdd343 | ORPH
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19853e9612ca2df5579e461eddd4627f1dcdba37 |     
 powerpc64   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/5f049112df69bb0d07f844ac8200f1771c463a10 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/3283c4f1c65718b283edfe2c481bef9f19711dd0 |     
  powerpc    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/ff3d47bfba611ce2a5b41c5aa9a04fb39641a859 |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/62434e84dc256e967bd4fdd5192abc28d2b52f10 |     
   x86_64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/30712f9eeb3e52bf3cd4e7a79ea8053f166c2e8f |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/768d3a4914b323cf237edcf734f7aec686a5c47c |     
   x86_64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/e5de5f3055c860ee42a713fe12818ab2db06e70c |     
    i686     |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/214b5eb8e5aacb46fbaf1b1cd755f0e3bfc06eed |     
  aarch64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/f0e5e4046904a62ae5edf9fb314f3d72903d2c7b |     
    i586     |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/7a119ed582fdf82418f30c5cd7232cc4c5c9020d |     
   x86_64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/1038c1b6dc2d7c751c1cc98fd70aaac1fd39a405 |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/35a09836e9f2ee89225ccde78facea8539397457 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/59270af7ba523d9d1d1992ca6da8111c17b30ea4 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2e9b58cf8d4c7e93080cbe67201718ab650cb687 | ORPH
   mipsel    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4c89df3bea5898d99637f27781232677ee9f823f |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/8e7c57e07e1bafc0dd706fe83c10ad8841f90b62 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/eceb542241458b0f508435bd77336645a7e3a0bc |     
  riscv64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/5a313c6957769cded32e7f9be76901e407596ae5 |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/b9a60c30a00b33a7ff34b0d15611db0b3d3ff51f |     
    or1k     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/2c9f11455dea52ef14c9c60f87d251782e59d697 |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b87c50471990bb6fa73cf922d07a4eeba9d8532a |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6b6548ac5f94656af9b747168885e55ad5e390f8 |     
   x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/b87e53e48dc877661617d94fa714b0019b0f6b40 |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/12f30d304a50657f4010fc8e7651b0bd25c2cd2b |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/9c661a7ce079f1148fe0d25e5c49793de58b9d0d |     
    arm      |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/64e2ea0b65e73f982ed49b1f795e9a9e9a672811 |     
   mipsel    |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/41aa9d7058beb978a44fa51698964337877ea06e |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/e3229693dab1af10df39853103adc1c3936d19ad |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6878620660caf9dca519c3bdb5b112d68b1e63ab |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d13fbeab3998c99b7a1d57511c6466522790d171 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/04dc125a4fc8cfa22fed67cc18727352c50bb520 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c3d765cee3bb3a41868b9d65d26c3dd1690b0dd9 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ff67ae2674ee3e54d09deb047d45a39b60141708 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d6ce17dfbfc99f6d097b97daecec685ce9d79e05 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b90a09310d0003bede592733a58ff0f97517377c |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e57ee3c514ed935cee6e13aa17f0226004681314 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2c118a96d35461a685a9cd9f37a2e058ea5d0025 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fb92b67ef629ff6daa25a661277cfd3ea831ff2c |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ad802302ee30022ca306125eb37435a94b4bdbc3 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dcf504a63fc04e5179b9363abe71cb0aa12b4096 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b70bfe835be48184e8587fd75a08dc8c1e04176a |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/06aed5a1d4c8293fb635f57d4213811b635546aa |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2d019a6d54a4fd1ec5606de8a9c1dd5deeb87b73 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/81fb4879da70c686b3f7764338b55aeb6256ea47 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b83836579b1735efb0168665680036a3d993ca26 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e7c8612caa3179df3fbc04d15ea499f5060d36ab |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ed5f9b349e070df9b3d5b8f8b51dae444f24f7b7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c10603ab3533cf0a52f93d78a73203692833dd06 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2dd75a335ab4f93febfe60740e26d968a50d0f65 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f7cedb41ac236d8f1c047fa8118444e47ba8cf21 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/12fc62709a5f026b31b74b7fce4bed609a5c2aa8 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/681156fbae6f12d010f0198018504445e722f179 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1268af85b5beb2b2be1378564731bd6f1f7bcea6 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ab3e1390bc128f244150f9013e41eb55168c1028 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e659ddf2a4ca6b86dc52582390878492de83f4c |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8530a086e18bbed3d313d6bedf800d66f6fe0513 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/80bbd78f4c6e48927b3fff8b568ad9d4e48a242b |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d6cec17b1f3f4ccc98f1271d3077c9d34df42b21 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2b89162dce7573aea1dc99f5003544d8a4c50018 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f4ce33e71f1d5a2a543a6e7690cd97c1b9b853c1 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/fb02f5a2e352a9564a7767553df8bf3ea59d7bc7 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/33970f4f8dff0a00d4a2ac05e635e46c3cb0d036 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/372a7c953e19fb65cc3d3effe8ca5bc0f074291c |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cc8e0c171ffb8450fabbf7dab593956d5ae9584f |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4fb43e33f62c415b6455360fce66b73605b18368 |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e2b28083db4b5aead59d7c871e0b6c2eb980f14c |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3c31095c1562f1649784797151a8af128d131c42 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/50cc727d214a34aeef48e60535a2125297dcef3d |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c0da272e17b8e80d72dfbc8675314e77f64582eb |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b6788d4189d95551e21320c465524b53de97da72 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/515a2a2f1915765cdef1bd56e69aca5d75ea3afe |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6591af04ad5324b3df0fae5845ff4416adac0a44 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d01896cd5fa213fe3199b25528438450f402cdd0 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/43bfc63d3e4024692d394b7bf42a3cd9e0108e1a |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e497f106a141ec384040970c50bceebde5dba902 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b6e94719e603296609777d8b9d6ba2d69390bbdc |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3d998d616f99628d093d5c7588feddd7b54a158f |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0007e6025a67dc0dff71128ad9571014201e6a67 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2664cf4b1b86d518b6c0d07fd98beb637dfcce55 |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/728106d1cc3408b9ee90bd1e5f61662f798cb8f0 |     
    i686     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/0a00015d0f3a592e76d3bbf2c90bb4f3e529a142 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7b436acaffd1d590328641570f91e6a963025a93 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c6fb6dcaf0cdd19d41bd17a0b17034f1c5ccad0c |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a8593137c2252285c4270cd7cad221d1cffae45d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/1f124a611735f710f454297c74788f0d78f7bee9 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/91fcf744a1701922ecdd687de9006a5f42dba2b1 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/0bc68a73a07ba789848cdbb580f35b6baa702419 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/7185e190db1896a2e4b71a88f174dfcf14d69b1e |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/506719af1002ad044e8e52bf5b84558ffe46ff18 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/87d662a2f502b8f018d1352b90bcdba4c874378a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f2cce45d02b3aa11421afd7e722f42d3ce2727d9 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/92cf4e148a18b05b43ac635d141dbcf967963547 |     
  aarch64    | package/python-pymodbus/pyt... | NOK | http://autobuild.buildroot.net/results/7be6cb7405edb554fbeb795eab99861e719062d6 |     
  riscv64    |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/c93804009e96389fb19d119faaf1ce5891ca2999 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/3ad3241c4dd2b0edd1435b6957ba279ca8f52e33 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/dc5e80ab3ebc102beaaeb9a03beef19fc0dd8c8f |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/cb6043b8cc821098bd229952075b36747822535a |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a175dafe2573494e74d8249dc1d18c4ae3b70e5c |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/eaa15232356503241b815f7ad774644a8bf13d6a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4cd221a8e053dd977a76a68674c84d86be08b1cb |     
    m68k     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/eda04578d8d35e1e4cc39d18a217b92f19f66e8e |     
    m68k     |        util-linux-2.34         | NOK | http://autobuild.buildroot.net/results/82f9712bc90377c625caeb5b175e83a03d5b9d75 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/76eb38aefeb25f339960e173e8072c32f9deeb21 |     
 powerpc64   |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/43bafe8527a953f1cb2c56837b964da754613ff3 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/57873b70348e78f3e77df1333e8ac64b9d4c58f1 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 2 
                    ffmpeg-4.2 | 1 
                 libdrm-2.4.99 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/4ec42d94366309ccb723ae7a96c74b73e1482706 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/dd5849dd64deed9a4402d686ac0de4eee7430c3e | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5e848db24ba9a2d1d1d6d35358ae876ecfea3fb4 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ce26245c0f20f66c585ef840f9f12f9d521562a6 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/05b455e0bb58869059c73c6f81de202d16feff0d |     



-- 
http://autobuild.buildroot.net
