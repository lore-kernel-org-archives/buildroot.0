From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 08:29:57 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-12
Message-ID: <20161213072957.58B2420E0D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-12
================================

      successes : 187
       failures : 97 
       timeouts : 0  
          TOTAL : 284

Classification of failures by reason
====================================

             btrfs-progs-4.8.5 | 20
                dovecot-2.2.27 | 19
                  samba4-4.4.7 | 13
e2tools-3158ef18a903ca4a98b... | 12
           policycoreutils-2.5 | 5 
             rabbitmq-c-v0.8.0 | 3 
                    quota-4.01 | 2 
                     vlc-2.2.4 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
                  boost-1.61.0 | 1 
                  cjson-v1.1.0 | 1 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.2 | 1 
                      icu-58.2 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 libnss-3.27.1 | 1 
                  libsvg-0.1.4 | 1 
                oprofile-1.1.0 | 1 
            python-pyicu-1.9.3 | 1 
                    qemu-2.7.0 | 1 
               qt5webkit-5.6.2 | 1 
                  squid-3.5.22 | 1 
                  stunnel-5.36 | 1 
                 synergy-1.3.1 | 1 
                 tinycbor-v0.4 | 1 
          usb_modeswitch-2.3.0 | 1 
            xapp_sessreg-1.1.0 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/0cd220b2ce089fff838d3ad5c61c2994c0113a37
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/12aa0e74eafe1bcf234e9de48fc001373414d34e
      xtensa |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/dbd4daef05d9fcc7b98fcc5ac625de3f78ec0bd5
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/1e3f5c82e005228f11faa8d61f4155b5ada494ce
     aarch64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/11b06515ac629296d4fbbc48b3cc8f9adb4afb71
microblazeel |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/3477ffe0a40d633fdfae07ce315cb429843b9690
    mips64el |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/7bc202d601c1f3ee1d0d9ea8eb037185cfddab88
        mips |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/55c612b73a1fe7435e14f38566bd6e68654d846b
   powerpc64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/71208629186e18722075ba1082c915f08b70f6d0
        sh4a |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/4aaeb220d057731ee5c7d7bd8101284c7e279b1f
 powerpc64le |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/4f5dfb34ad8abea42204666dceb395da44f966e1
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/296d188d11a0d52789917fd719c9bb4419ad9822
      xtensa |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/1ea790e1d6affce2afc8b7fbe11fda0f83f5f91e
        i586 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/79c438597117bf5fd306ff016084e57f58b38fd1
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/955fc71cc1b621110a58e542cb75a84b684b8ff8
      x86_64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/33de9e9159653c07c33a65c7182e392809bcfbc8
         arc |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/65c14bff798c1e4d4e342b44472622b61bd0af52
       nios2 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/b4cdf3f796e35108fcb233f2aae7c2552d6496cb
    mips64el |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/de3711feee22d74459b03240fe33facba2675566
        i686 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/b6cdeef3c7901f691c767b7362b975bd5a97b073
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/2681172b6759b6cf39a6442a45f1b339f9d0e657
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/349dac14ddcaa4e6104ed586b370fb33ad3bf7e9
        m68k |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/041c1cd38938b7f5e35bd5306077f664ab30959d
        sh4a |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c5da151e9521e44ed68749dfd0c221cccce5b2aa
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ad78c339f93d79f73b352c1a54e18eb284179492
        i586 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/0832b7be86c525522e2caed66246d5aeb365afb2
       nios2 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/43d8e877447731036a3bfa9b55303986900014f2
microblazeel |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/02e17c98d63402f9950209949e499a90a2283519
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/71087a22dc218ef3f7c84a581716d000784a89b0
         arc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/2a82123d65426f321fc5b6ebfd73dde565ef38a9
     aarch64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/31dcf91c5b8e1d95ef83b3e291f4b854688567bd
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/85f2f176c108ab36520f02d975f27c27cddce84b
     sparc64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/26a9038733590b8b876087b8672ac8ed0248e05c
        i686 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/5aa55519e1418e28888543b6b476852a8bc2cf3c
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/f2e6ff214982b71eb956344489dcdc90b2d52164
      x86_64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/091453bb0de5ca4c6aa7708e1f7b8754872bc146
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/d58b94e165191c87222d3605b3d568e07ddfe14d
      xtensa |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/27a7a7da2c67253ab97356e4695d24818e37f113
      xtensa |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/b44f42f3399006ee59e9dc4a113b3dba34de848e
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/ba8be898741d4eb6bce8dd01904250baf287a614
      x86_64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/b863ef48439cf07bacfda1f7aed5548be2f953a1
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/ccdf6d11327d75ffc849218aaec8f39f616d4b56
      xtensa |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/66f4b6cbc968eb9a977ca68db5229aebe9c68a06
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/71e38f4af82cc95d12f10bc2b681a51c45edfcb8
         sh4 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/198179f2880ccfb07e4178f6a4ca871968829df3
      xtensa | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/936a0ce3851b3536ea573dd59feed48f0c766d2a
     aarch64 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/5343901cbbd698867d86e605015e15d1fa158c1a
         arm | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/cc2bcaa9b31c836f4d1907390a4eaeae69387e2d
         arm | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/a7f5c01f6c491787b4594e6dd39a80c4768b322a
         arm | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/2a906024d2766ace6921bb544c6bc285b0781db2
         arc | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/f9c050b437ce7a76a952c1041083579fe6f37439
        sh4a | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/ab6b476cb1497f9591784656cc99503f6f78ad47
      x86_64 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/50528e09c97be13afefc50d50dca1c8bef279ebe
        i686 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/279a313f482d4942cf4594cdf933aff9bd1818bc
microblazeel | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/70d55bec93890f4223388eeac0a962f57382c26d
        i586 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/008e036d13c9f1b00bda7bcea334c78fd4ef16bf
        i586 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/b29b62679b4af16d18cbbd53081c1bf880d5e48f
      x86_64 |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/6caebf0f6c4adf66e67bedd0f04155413a9aa7bd
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/e97feb4f5855ec76322f4f269a1cda146f924e17
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/59273ec0c7038f1cab5165318f76aec21508ae8d
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/5cc2e8d9927c01e9f1f4e49534412265201f25b8
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/78ea4c6b2461e08e7a36c719137438da314184ce
        i686 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/f438149e7d83475d425e1c1f17550f3cf5f69340
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/9b49cbb4c10d54ba37800a6c0a19c115f3382125
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/f7f0d660102957888e4a5e01939453c3ee614e16
        i686 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/d03a067406cc8abf889d3efd90a5210efd805a18
        i686 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/4cb70d776bee01f1284e0c0be5b3fb5f1011353a
       sparc |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/7dab3b5fe56ea53171eaf76d285443916962c2c4
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/5e227e1c09a85620a5b7cfc1a63e163170e8a014
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/a945726ab9823b996d235d93f5d14771a5f8c84a
         sh4 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c9e2dd3968bccc15ffc8521acc3b791a022c84ab
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/11f1dd5820ddfc555e62a2d47550ea8a892e781e
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5283411a53915a8f51c759c7a0ff6191c00b5980
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bd471c84a4a210eac6b8dac3b5a9c9600545a143
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2cad3038fc3f33e23ba33d6dae5a87336eb7553d
    mips64el |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/6a1c609247412a243872f7fc6e1efcdf7ab943ef
   powerpc64 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/303727862ced49129d6614874a0471a205d2f3c5
    mips64el |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/0bb68a46b564837c6b73a16798b59784e71704e8
   powerpc64 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/54c6f066ac899a1f4babcd5d8187a218c4592613
      mipsel |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/2be222f3240edb325b079007644713be0b25781d
      mipsel |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/3560936edbf5a902df9a40938da294cd9deffb8f
        i686 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/0fd335a12cb707fa4ff3979c549011ae022f6f4d
         arm |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/028c49694e29ffc50987d1a96b9f231c27acf728
        i686 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/6b5deeee0361dfbd073c6c7847bf310561b9bbc4
         arm |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/2c2faebfca771deef07bfb2aa36e5bd4ccfe8991
      x86_64 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/2d72c00e2e5e3ca2f3987f965a5a83c61086312c
         arm |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/675cec6cc4a8dd2b4b2f7684c8dbc81f6d131f5d
    mips64el |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/f6bdd8fb60fc266f5b2ff55a8e8f68d89bb8d4bd
    mips64el |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/d59210fa1823239619d45936d95c1f2506aef928
    mips64el |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/267a94c9e552c4cb7f5010eb92999b327971654d
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/def2292b18bb5a7a3ad20c128ff6fbcdc5810df0
         arm |                  tinycbor-v0.4 | NOK | http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b
         arm |           usb_modeswitch-2.3.0 | NOK | http://autobuild.buildroot.net/results/5e983768427f87096d51cbc97e6789df56b8dea4
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2bc57bfafdd34aad8c9f1f2e0d0fb75aed5c9a6a
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/48226625f7e73ed341dee5f3c5a391b2bf5dd409
      x86_64 |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/4061193e5699b37eaf904a912f7fe9592255cc87
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/6c024caf723a1c41fb1c30ca483c1fee6d815f4f

-- 
http://autobuild.buildroot.net
