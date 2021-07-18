From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 05:52:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-17
Message-ID: <20210718055230.0B6A1401C4@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Autobuild statistics for 2021-07-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 17  |  3  |  0  | 20  |
  2021.05.x  | 18  |  6  |  0  | 24  |
    master   | 32  | 57  |  0  | 89  |

Classification of failures by reason for master
-----------------------------------------------

          host-nfs-utils-2.5.4 | 16
cegui-00b4e1fe174da53b7ed72... | 4 
             libsndfile-1.0.31 | 4 
        host-sentry-cli-1.57.0 | 3 
                   libqb-2.0.2 | 3 
                  exiv2-0.27.4 | 2 
         host-gcc-final-10.3.0 | 2 
          libmodsecurity-3.0.5 | 2 
                   seatd-0.5.0 | 2 
              tpm2-tools-4.3.2 | 2 
                apparmor-3.0.1 | 1 
                    ffmpeg-4.4 | 1 
  gobject-introspection-1.68.0 | 1 
                   gssdp-1.2.3 | 1 
                   gvfs-1.44.1 | 1 
         host-gcc-final-11.1.0 | 1 
                ipmiutil-3.1.7 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libfuse3-3.10.4 | 1 
               libtheora-1.1.1 | 1 
                  mupdf-1.16.0 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
                qt5base-5.15.2 | 1 
                 samba4-4.14.4 | 1 
                usbguard-1.0.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/065e07b9e1d5751c655d5fe7ab1d85a41979ba07 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b82a73fdfbe60c661b0fc77808573143aa8291f7 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b6c229b06379ad2b494c8853ed265c675e344309 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/98589a2d1e33bab4b0f510efde23a8830b21c887 |     
    sh4      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/aa11e34eb97c0a5064eceb4e28eb65b5d43f44e2 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dfb717d72260724cb7b39f8761b1c748f63f642e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0112da4e3bb30ee57b24a3490c757344782bf746 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cc6cdc3f388b3e9e3634e24e2a550c9dbdc83c26 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/060b93b8d496094b10cb4b61d4d15c7b0fc1a403 | ORPH
powerpc64le  |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/22fba35b2ec86a8eef5842bc73f935e05e47ad3c |     
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/6ec655ff738e5b1d3cbc8b7b39578d7d4eb7aa2b | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8159e3357eda6a7493c0b778f2a1eb1c79a146cf |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dcbbdfed861aa8fe79b7f44f2b5a72767efd8271 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/937acff3b2c50621ba57635c6eb75da8a6eadc76 |     
    sh4      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/ff39e93195ed8d6cb5233cf3c6d933320246f6ad |     
microblazeel |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/92e39a078fca2f2d8439bd6537e65c95ca715435 |     
    arm      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/a53afa17997c2376e3e96bbc1978fba90b384e7f |     
    arc      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/83648a39e960d8f4db0e86ddb48db4b7dd9f91cf |     
microblazeel |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/d3ae7192a0d9ba6e9c29a61a14cf10a4b31b5caa |     
 aarch64_be  |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/990b5e59bacea855c8fce4abb0902bc72422c067 |     
    arc      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/7c2757db8789d47ea4e4f8eaf3b352e08004f830 |     
    i686     |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/44d1d696cd69bcad14836390f92c1c39888b01e2 |     
  riscv32    |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/feb3a3f4168fe7d2a91c8b013c0c694a0ce1b90c |     
powerpc64le  |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/c57eaff512f9edd6a9be2e4914312af9381ca51f |     
microblazeel |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/385a4c8ff435cdf9e040ec879df665095ed39de4 |     
   xtensa    |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/55c5754ed2a7a45132a2b96431263748936087d8 |     
   mipsel    |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/760bfa212d34bf5526e999c2bb48e3ee6cfe0161 |     
   x86_64    |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/23a05e8473e5634d0855966f07bfcd662411f7bd |     
   x86_64    |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/2f44a3776061e6e0078bf9c8043784c2725ba46a |     
    arm      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/2c40fce14021196f7b4c71682a37c81bb4b66ab6 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8d71680c45232378ffe1ca109207a65330efac0a |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b07278495699c05cc403c47918146a5f1c9aa404 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5e2ff07b7fa233c83c1a977a87738b0a73e29b4 |     
   x86_64    |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/9aaa855b0dad5b5abb90c35f444800274e98b157 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f632175694cc1e36ca336e4f4207cc86d988daba |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/69425f0b1950d0836bb6116b7ac20c8dcc844b2b |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/01eb9250c661c9cfd23ed8c1ee5b5d9f72047c29 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0c94e90dc660df5fe65cb7ede49a247557f3204b |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/603f0331e812dbddea6fa7b08258656abfa6d9af |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/dfbfece9b21d5be5fcfdce0749ef55bc0bbdef89 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/b150fc1592ab440360b8faf9ad51db37f37e9bcb |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/2a7dc8011c342c810b0b2d095b6560bae0ed73f5 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/aaaaa2cfdd92de53f04b11c13e4e193c45900b65 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/705481d85d7a0f6da1ca714d940e5a65ecc7cbcc |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/35896410ce334f079bd1b419c109fde953a1fd03 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6b67e1f1583c933e64c426a6cd4f377c646ee9c1 | ORPH
   mipsel    |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/c37473dc71912e01bb5c53431a322ce5e95b32dc |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a6e8317f067ec41621e3d2b1f8d9c2ac64247566 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ce35823f06023a6edbf2838008aa5df52330a620 | ORPH
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a243b774e96d120f8c3d77dd51a635756b3c0fdc |     
    mips     |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/abf39ce16b502232ed13f7c46a46efa133931662 |     
    mips     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8a88a4b291ea06237ecb9e33aa3ad5042e2023e6 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0e4cdaacc74b97a0f39eec69e3f61e36e9992ac4 |     
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6a858d4217b8da8b973a64bdf53ea9605410324b | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ee34cb5531384dad558520ce99eb3554caeec264 | ORPH
   x86_64    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/472884c9bf5e621755b1027131ab45be236402bd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6a7864ab46e38679f4544fc66b59b027b3f28007 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6f69ce48b09410e8e18e9c935360cf9fe844b0c9 |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/926a9410d71eea48bb9a71a24fe95db4cf2f3c15 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d989d93de0e0695bc3912d2e115f7792315e0678 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                    ffmpeg-4.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openal-1.20.1 | 1 
                qt5base-5.15.2 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a67d75b9be7953d8cb590c94d62ae589e7d21692 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7f86c217de3ad7c0c052a6d5f374021771c8258f |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/713e0be2468959cb7b6fcb894d082d0a229e7eb9 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a4bf5f4c9fdc2370e15263b94255326b749273fe |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/86bdfd8c7e20eabb9e60e3595bb3b735116231a9 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/12db5f82dd5d050f9cb86d5ed51605063b5a1919 |     



-- 
http://autobuild.buildroot.net
