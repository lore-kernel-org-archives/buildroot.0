From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-02
Message-ID: <20160703063029.1EA7E1026D3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-02
===============================

        success : 156
       failures : 126
       timeouts : 1  
          TOTAL : 283

Classification of failures by reason
====================================

                  libsepol-2.5 | 18
libuio-940861de278cb794bf9d... | 10
             host-libsepol-2.5 | 6 
               libcap-ng-0.7.7 | 5 
          libmicrohttpd-0.9.50 | 5 
                     audit-2.6 | 5 
                  boost-1.61.0 | 4 
                 lvm2-2.02.158 | 4 
                   efivar-0.23 | 3 
                     vlc-2.2.4 | 3 
openblas-f04af36ad0e85b64f1... | 3 
                 jack2-v1.9.10 | 3 
                flannel-v0.5.5 | 3 
      kismet-Kismet-2014-02-R1 | 2 
                cifs-utils-6.5 | 2 
           libvncserver-0.9.10 | 2 
               libsigsegv-2.10 | 2 
                openmpi-1.10.2 | 2 
                pulseaudio-9.0 | 2 
                  connman-1.32 | 2 
                blktrace-1.1.0 | 2 
                     gmp-6.1.1 | 2 
              e2fsprogs-1.43.1 | 2 
                directfb-1.7.7 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                 mesa3d-11.2.2 | 2 
               openldap-2.4.44 | 1 
                   dvblast-3.0 | 1 
               target-finalize | 1 
               tcpreplay-4.1.1 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
       gadgetfs-test-undefined | 1 
             ntfs-3g-2016.2.22 | 1 
                 mplayer-1.3.0 | 1 
                  babeld-1.7.1 | 1 
                   audit-2.6.2 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                  openjpeg-2.1 | 1 
               qt5base-5.6.1-1 | 1 
           linux-zigbee-v0.3.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                  cairo-1.14.6 | 1 
                     dtc-1.4.1 | 1 
                    libiio-0.6 | 1 
                  autofs-5.1.2 | 1 
                pinentry-0.9.4 | 1 
qt5webkit-b889f460280ad98c8... | 1 
              lirc-tools-0.9.4 | 1 
                    owfs-3.1p1 | 1 
             stress-ng-0.06.02 | 1 
                   ntp-4.2.8p8 | 1 
                   zmqpp-4.1.2 | 1 
      host-gdb-arc-2016.03-gdb | 1 
                 opencv3-3.1.0 | 1 
                 leveldb-v1.18 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/415c760a9d3f0a836900900c32822700fda50c0f/
         arm |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/5e85f9d1f63a832b3bf6dfa49cc11841c1253e72/
         arm |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/f5c0d1468f441e5d44753b817bad7390d1e67c9a/
      x86_64 |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/2ff38358f582fb44e32a6511481b2652b79c70f7/
         arm |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/011c342ceb9b02175368f85f2187353ca9578af1/
         arm |                      audit-2.6 | NOK | http://autobuild.buildroot.net/results/2e147b60481cfb8960749a8e012ff8fa05568a2c/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/465b2bb371919ec8326b428d614ca8946f62534c/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/6510f70a23cc4a429e6cc7700c46caaa01b18ee7/
      xtensa |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/682e5d838fa9795b1af29731e9923be981806bb6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a7d03649fc5abfa661a7c134333c55b77a398481/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/19d8ea828482031be2f42e43985a34e2b4e8c9d1/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/a551d7682006c616eb641acca856ef54b834782e/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/52c198457c6a7a0a73766e8b8bed8d70997b80c0/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/5a0e89292f48378711cfd52e35c1bd1c50dd2ef6/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/e3ff1958d67f637d27750eaa58ce109f493a2e55/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/90b1b9f12fe61a1c61dba6d3a5cd8aa59bfa20dc/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/a76df38911af66aaf3ea95b046ccc35d7179e093/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/0a209fc6d0212612a86992150cb60eb0a3bb526d/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/f0eef24b8f07e1a8dd50adeb005f5f52f6af74f4/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/3262ed28f276b1bab20abb8a8a64d6b4ca18ea01/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/40877b58630bb845e1dbba78ab632214d2d7ddff/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3664d0c9a8cb888ac865859ead6250c198f2bca2/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/ad171d5425afa93ba4ca1ca03c89759d8d435247/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/85ca36d0253f505ec73a364fd512e965a3d93885/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/613301f07cff8b1651b9a3fe641499c6c7cf5eb1/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/cfd88dafb9c9f43c74c14c4db0f3286bd1ff11c1/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b49b3a17193382931c2993a1b1701e53e1a95f27/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ec971c06aa6892b8926d0dd5c33e2eaebb70034e/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e48c058684bf070cad60f61ff617bf9bb6c6b2cf/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/905d0435b6fbeb3f18cc01e19059d3c8eaf13475/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3ca6a57ea720af24c59e771764a0fd592bb1dbf1/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/05342508e29cff8f3f177f538cf3116a6cd75291/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/18900de317f2bd0d57ff98014c7afd49f35a7744/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/7f90d9d05e160eb1439f522191465b5d9f9bc9c9/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/065cd8a42bad8fb37a6d5e6667cd55fa5925d3e8/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0316a0fe744c2161719a5a8f0cb6cfcbef9ea236/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/cb8598abe367a609c89a716879fe2395c0c4b447/
         arc |       host-gdb-arc-2016.03-gdb | NOK | http://autobuild.buildroot.net/results/86b151ecdf3caf2db58b937af5c358c1457701ab/
       sparc |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/a9441d6d1a1334f20997afdcd1a51e6e713294f7/
         arm |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5014e0ac45c8ccfa7c0cb05baf83c724e5c17f86/
    mips64el |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/8b64978ce41e91f2792763757d5576e71adb93df/
         arm |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/e02f6a29d7948472ce2eb4a95b50f5abeeaec4e2/
       nios2 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5e8a67516a68f965fbcf58bd7738380100af150d/
      x86_64 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/e1aab05da467ad25d453505392d7858855fd2819/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/eb8aeda286ec127aff4f72ee5f8b38185158f72d/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5e8dddd8ba51ec9dee6c620a7e6cf3b81e2b778c/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f7ddf78303b19f0aad614c6769c0abe9fa06150d/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5198d9917fa82827e8726f291c15de0358f0c917/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/07f6284bc8021d0cb38fd5b3871ef658d21a4328/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/492a4e403b07ca584a66182adb0b1e83ca650aa6/
microblazeel |                  leveldb-v1.18 | TIM | http://autobuild.buildroot.net/results/3e7d9f4555f35a4ce59bc89c64c18bcf96cbd540/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c1d0884851706d978033731c4b66ddeb1fda945b/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/0667bfa7cb0ab82b4872127521d83291cf493416/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d9ad8796cd7450959c87fa6e7c074f5935497b86/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/e023ac9e5cb5346ed50f786028e969f72b580143/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/0b98645859d02891ef5ba6acb0c627eea931ed22/
microblazeel |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/cfc70094d8f4008f4e660250b1b90a35a2ab384d/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/8b549bdbb248ad60db335c28fde6a5ecf4d2d3b8/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5d48d240f6be57ee1ea30c120d33010b931e29ce/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/6b86903d0afdd30b21b6694d44eeb55f036a121b/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/4da6ad0d06be6d8e2fda741152c24ba569df2aee/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/1fe9df621d5e40294882e493f82bed3f4bb0e774/
microblazeel |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/16de40e9fcffd13a3e3bf8ce8964c11b0225dabc/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/7f3f4313e61efde7b05b4d3c305a8dc38b908360/
      xtensa |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1601d18a64650afc887c49d06071a86049f9793f/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/adf527972b7790862ec24710d027fb4f11fe4a2b/
       nios2 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/529bde8cdd5575604524fa2fdfdecf222fee4bf8/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/68ca4d6861ccddc0c7b04abb2ba5351c4bbb1f15/
    mips64el |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/757df784c9b752137aa86f8df66e81c55d9ae202/
       nios2 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1076725376e6a69b79dd804ad11f557a1dd75b59/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/428243ede75a07a7e028eef8687510022c6bf1ee/
     aarch64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/acdfff5c70ce4010cebd8631f436f322dadb129a/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/b27573735763ed8e5de2de92f710f913cd4f16f5/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/3124937de57eedc82f6151a3fe46b0ebd8fc86a7/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/580037bd376188e18a4a58927c929d21e9b2b03c/
    mips64el |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/176a5dafbe5ff0b310b61b4ba4031d2395f20ae1/
     powerpc |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/928728c4a5417070ed24026702f4fb5ab772e44b/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/f0522a52d4fa16ec5e00294a6d4a12fd6076dded/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/ad02aac05c0369032e1409a24fc003878bb58719/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/e234a8dcba64f66ea26af82dfa8021e5d2228653/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/dd94c0d4ed3c42ce554a57db9d9f41787ef8a6ff/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3e6356681e121feee8f5395b2df10871e5a5e910/
      mipsel | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/a380920ee62458c9e963d8603ce3f94b9326fe8f/
     powerpc | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/2c6dd7c61f7806528d80d926bef78a44cd96be91/
      x86_64 | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/29439dc9edd4451fe4203cadca785847d7d09005/
         arm | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/f2c7413270a16e8ca94b71e9f54519cdae992aa9/
         arm | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/7023104e6018ea46c54073ddbe5119d0f66ae5a3/
         arc | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/7f9d923d1f3cb380d1618fd5acc59ec849072490/
    mips64el | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/8f715b4e9b826dac13f3d49da25576e6e1d79449/
        i686 | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/155b5194a6e33d7e393920958a63dd76b44e751d/
      mipsel | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/0c2154a613fd6e826505d8e242939150bbaa1593/
         sh4 | libuio-940861de278cb794bf9d... | NOK | http://autobuild.buildroot.net/results/e522ad04617e6eaf0d5145ba0876699ad39e558d/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/923323f8ee9c7f5697f9f08f6011b1f3657648a7/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/dbe287cde259af9bad172475cf5a44f888d6671d/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/72e899ce054909123f343fc32af6082748034f68/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/feeb6883a8b2e928db3568254a221ef54311e824/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/2f976292ddbb8eddb58cc978f209f4f445b5b756/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/55bda83a0263ec7128da19b4c3101483b4555941/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/7a2b1eef06004886be28744bf1c53d027f8d0123/
        m68k |                  lvm2-2.02.158 | NOK | http://autobuild.buildroot.net/results/89a94b164235461511feb8c9285f2295cdff4618/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/5c649c0f0641a6cffcd1e29aaf555646bd9944ac/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/4d985e4bbe83438590eab6098e825ce8b4ae415e/
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bc98fa585399b53ea181dbaf392b93424145911d/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/a1ee6afbdf5b36c9cbdfab0f45d70dc873c2cb23/
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/93f8e11a8ab8c99c4fb41d999e887f89c1def685/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bcb47406cc8ba736442796120c123a93c831b619/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c33bc1525324ed9e76d7d143dfe55b978fe94c22/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/88ec1bc5264887d013d523d592f3a8c309131fd3/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/8eefd8c93f7c247853d21f59c557fa3f4d5f6d01/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/78e2c4f48dbc84aebcc537e24193de6ca0332e28/
        i686 |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/421872826a140b38380aacad495640b81f5c8586/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/813b38cbf67a9486a33e1714d8311cee03245877/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/33a547bb31e75cbf4ca821fdc0110fd8d0fe72e3/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/5acd3640d7a149fb3156394576a458cc4fa3275a/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7ac314471d296d5e3f1b2b356622d23a2e7d73b8/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/a5457f3f25c19a9bc87b5a6a49dbda1fc6b2806f/
     powerpc |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/812b437a96ea9216907d22134e3989b7bfa86ec5/
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/30ffecf996fcfbce01e0c1e5d0f012b47b4fa0be/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/74dfb32c75d7c82670a4205b26b7d813dfccf8ec/
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/e965c773a51371bcb7f4832e676ad430edf74cfd/
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ac36c46d82a811ae7257be1fccf1b091c6ac164d/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a84f998ba33398a28397daf2ca479f22accd68a6/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/9f426021b4bcb59630385726038120ccc666bfa8/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/fafdc796a5ef761417278de4084e552d78ad4f4e/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a18dfa832c8343afe15afbfaa1581b9dbe3adac7/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7fe91ab4af8b1f3e1535517d08a7ebb41ee38087/
        m68k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/4066037c41fb2ea2848529cca1a2bdb8fb691fdf/


-- 
http://autobuild.buildroot.net
