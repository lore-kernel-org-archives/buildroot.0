From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 06:27:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-24
Message-ID: <20200625062723.C5CCE88649@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-24
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  6  |  0  | 20  |
  2020.05.x  | 18  |  3  |  0  | 21  |
    master   | 128 | 103 |  0  | 231 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 40
                  boost-1.73.0 | 5 
               domoticz-2020.1 | 5 
              host-grpc-1.25.0 | 5 
             freeswitch-1.10.3 | 4 
                qt5base-5.15.0 | 4 
                       unknown | 4 
          fuse-overlayfs-1.1.0 | 3 
              ibm-sw-tpm2-1563 | 3 
                    mraa-2.1.0 | 3 
                  assimp-5.0.1 | 2 
               belle-sip-4.3.1 | 2 
              bitcoin-0.19.0.1 | 2 
                  dnsmasq-2.81 | 2 
              gr-osmosdr-0.2.0 | 2 
              tinydtls-0.9-rc1 | 2 
                  umtprd-1.3.6 | 2 
               apparmor-2.13.4 | 1 
                      ell-0.32 | 1 
   gdb-arc-2020.03-release-gdb | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-pango-1.44.6 | 1 
              libarchive-3.4.3 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
                 opencv3-3.4.9 | 1 
              syslog-ng-3.27.1 | 1 
                wayland-1.18.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/7b44985a316055e7474af61d5f7eb02a1542c28b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a06c12afa13182ccb716afc6bc89dc341c3b473f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/543cab6b442a466e07338d026edf80264192aace |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/5102f214090e507eaee77e131188f956ffd29642 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/0145e204913b4ac9d7942801b016e123b326bca5 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e1e957d097c1f7e4da14c85b81e3db617470853a |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/dcfd53a1ceef829ddabebebefe98c5d6945adee0 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/2f5281789d3393f993b904c1cd8621beeceaaef1 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/3aefdb25828fee02159bf53f4d595dbb0b918496 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/bda03f8f86c9c8be392baf31cfb3ed256bc01e19 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/b92d8bc30f8ea8b79540da2302e0e3fac137ddd2 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/22dcf7d7d92e44187680add44cf73f00ccfc10d8 |     
   xtensa    |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/c55d1ba8b3784ac116e3415d2db9ed0fdb9d3563 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/11189a34e5b9170d3deb776d9bded9470ee75d01 |     
powerpc64le  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/c6ba5912dab145b65c38fd41686e4da603002813 |     
powerpc64le  |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/a13d876f84cfe761b73a99cb339108d3182d2d1b |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/cfd7b542305814a07ed538bbb44ca26aa67c17f2 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e60b904420e3b5479b7d982ce32939e7e6a2b278 |     
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/410658c87263922d976902dd172bd9db123beec2 |     
   nios2     |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/362e3977533656f56d1ec0b72888f316b808013c |     
microblazeel |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a0272731a878784c6d4264616c32c1f5c6256de3 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/9443200996b0a051d845f780940e116da646c22d |     
  powerpc    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/0e3c3c6fc6ce1d1914a8c9e61898082359cd8a7f |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/c3499c303523c9d0c5a5bacd913a92d1eee5d95a |     
    arc      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/ab23d126fc2259289193ba517b3a33e79e86a8ee |     
   mipsel    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/5128824a5ab822848a21e248a9881d6a522775c9 |     
   mipsel    |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/9aa14b755c562f4de8ea17ffba88d66ab14afc72 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/54ad770060eb9b707c7a2fad183b32429577b365 | ORPH
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7a0ccbe6a41802447a8107182dfbddda43731ab6 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5de95fc74261fa358013f8c7891a72c71e99c324 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6438c4e86739a641e5ca031683df00f28dfcf2df |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8b4c899a4aa3889bb72c39249caae6f109f40840 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8ee6b6f90199f82bca73de9e677a3f6d3805608c |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2bb4df8744f09da9485e690e99ee07eee1143130 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2521fddc8323bce3151131cc24d3a17fc25775d0 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/50d3c43f98e5aeff89e513f544cbf3e4f392a80d |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/f6b38811d8cab3d60a98180479c18544e9f69e45 |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fd8bc0a79c09ac2c9f16d2a8f8727d54498fe1bc |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/288bca6b54732f6233937d2dbe11c2f1346d11d3 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/1615c22260ea5b0a438a863c3a6295fc6d349bc8 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/988f0f850a7973890a40dc7182692b3c1a2ccea5 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/270ec757b4052007e3431e9518c91827625aec7c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/42593b8d7311e5223d0bf45e0088f82250b5cdb3 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9cc03da344b8c5b0af81fdd55ec06d7dcadacaa0 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b0035ad45546c32b3c7b1b7e09d303e1abd344bd |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/358ed693dc199f91ee92ef11e69624b1bdcf9828 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6e3afa7f8d03700df624ca8514ed931c12f16564 |     
    or1k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/f7d79a429c9a7e0a47a277b0defe25cd3e0ca6c6 |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9d73b786c8ad6de335b6881e59b94869a953a071 |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/18e303ace81930e02138b257fc13562cb5caef62 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/1426e7150e750a4725bc8949fd6f488a8c25c5a4 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/aa99f3180e9903d03797a9f146ebbbd6ff4d5a8c |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/31f67b36bd3e20ae876e83eae2058f6be93eb415 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d149ce2d9edf8dc2fb31087a328c96607107444c |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6c327fb84884270a102cac342d9d01b0f3edcb33 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/402ddf46f7a0b3bcbbbb067dc495b79bbf1117b5 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0213208d60f99903351393563d60f0f4b8706922 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/bf9a926c003f82f2e57bb04b0a0e5cab6e89b1b4 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9d64149f3c213ce91473780b1e944e0aaab0240b |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4040ecb48cb350f1aef3b1c01c264898fc2b52d9 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/69c209fb87bff3813f092ef1016db786738e687e |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e281f58ca471fc45ae068d578e294ae8bbed44a6 |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7e49e3c9e6cae7fb4508eeb72cf8fc60d13b0374 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c2e4fa560aca75ec443c30b2ebc521df8537dd9d |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/55e0095e9c41ee71d42bc4ad874bb896c4d2b6ce |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5c39629c6f75989f0f6b37d01bcc6e1f4950523b |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0d55b17e554fe39a9d428f648c8075cb04125243 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e569f8cf3c1c12383526f3263aedef236938a982 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2459629e8f7646cc6562f3caf1f7c0df9112c7a8 |     
   nios2     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/8d2b02110d73a01361fde340530062234306113f |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/d6cec1140703e9a11bc2099604823b2a86939b4c |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/04352142583670b18b58b59c4e9815f6626c3930 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ff5dc7168196cc1cf3f973e1a3a899515fa03cf5 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/73e0d935536ab483403e1a3e2ac8e492d0af81f3 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e403034ca0b94e8cedaf27e57043489a55bf700b |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/85b9ccaf5cd9f852f7918823191b0c14543ec3f4 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2af33b8bfd6ff297b94e87c8251ef1a2201a1b79 |     
   xtensa    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/9554447ec7e0b6da4ef7860c694f0c638d3214a5 | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/100211cfd2d3319800d9d2c55bb051e39f649066 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/32f43f3418b0d5eeaefc91fc51a8ffcd92061aff |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ac31c35acc2ef27b3282c6d367eb6869ec854f71 |     
    arm      |        libarchive-3.4.3        | NOK | http://autobuild.buildroot.net/results/1664ea9b4ba4fd15700e97c89eee1626861c3683 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b9f2ef4c7c05338bfa33a6d243e07cc533f460b4 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/d21f17cc9938e7177757c4f68502e8a879019ddc |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/773e3d41dc8c6c3d75b0f686c74a5b7e655be963 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/30c64baa9e3e723459eaa4f19307105cd3ab4287 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c8acbeab8379c6563ba48a14052811b4aad12d5e | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/bceefd3ad1148c44068cf44ea034a50356f477e0 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/2b5d7644fdf4af4c351b379c16f88946c3ea7500 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e28ba3e761472c2e48deeec5b29ae20f190bff4c |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d587268c88530ca3a67a35ca3925c0b31aa8b61b |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/abfd63ee013ee7d6e2f59eda926b6162a6431e52 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/63f744861b74565aa8be53f730a5a6ef46477c01 |     
    m68k     |        syslog-ng-3.27.1        | NOK | http://autobuild.buildroot.net/results/b26a58aeaa2f999b07630d830a07369770c0cd2d |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7ea0879971d34d84d0cc7ff2a825c3f19610aa3b |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e61df8330e56e9750ea85ba79854fcc08c168662 |     
  riscv64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/0e225247c039d16d8a488e7d69596c07a263d576 |     
    arm      |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/dc6634623c82622a20431d0230a430a5d78752dd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a24b25858eb1325cbb55930048dd3cd40b3deee9 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/ba14d617bbf34dc3718b12170cbd031a7a298110 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/10b141f262f2a6efaaab41a228931cc2eb20ecfd |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/24c1b1612833903d6677427eb58456ac13e548d8 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/120f71b77eacc7849fa9a14d70d41693a499db30 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 1 
                   mpd-0.21.19 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                   vlc-3.0.9.2 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/28a465a6447fdcd988963544402b4ba5e7f80a04 |     
  riscv64    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/9a50c337b45e16f20cedd5788f4009ec85ad2b0c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/c3e58db67bd8704d62d72ec74b8200ea38af7e80 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/fd25a2186ccb7d46e7777ca744e665437eaefdcf |     
    sh4      |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/6c93a3a8d8477df35fa7c73cdccf665af75908a8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/3c5f597015166ca35511eebcf6f9a78af22866a2 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

       gst1-plugins-bad-1.16.2 | 1 
                hiawatha-10.10 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/9291600cc8ac40ce9689f5ef92a75f93fa37520a |     
    arc      |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/bccd6ae240783f124b5d70d9a64db69643421d06 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/197a54206a8340a8346c615265e7b0c5c1748825 |     



-- 
http://autobuild.buildroot.net
