From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Jun 2021 05:47:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-10
Message-ID: <20210611054738.1DD91405BB@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  5  |  0  | 39  |
  2021.05.x  | 37  | 12  |  0  | 49  |
    master   | 48  | 180 |  0  | 228 |

Classification of failures by reason for master
-----------------------------------------------

                  daemon-0.7.1 | 15
               host-qemu-6.0.0 | 12
                bitcoin-0.21.1 | 11
                  botan-2.17.3 | 11
casync-4ad9bcb94bc83ff36cfc... | 10
filemq-8940f34e0f1c8f25c1c6... | 9 
                  gnutls-3.7.1 | 8 
           heirloom-mailx-12.5 | 8 
           host-libselinux-3.2 | 7 
                   rhash-1.4.1 | 7 
                       unknown | 7 
                libselinux-3.2 | 6 
             libtorrent-0.13.8 | 6 
                 freerdp-2.3.1 | 5 
                qt5base-5.15.2 | 5 
             libsndfile-1.0.31 | 4 
                libsoup-2.72.0 | 3 
               memcached-1.6.9 | 3 
                     mtd-2.1.2 | 3 
      softether-4.30-9700-beta | 3 
             transmission-3.00 | 3 
              libostree-2021.1 | 2 
                mono-6.12.0.90 | 2 
                 openal-1.20.1 | 2 
                      pdbg-3.2 | 2 
   perl-crypt-openssl-rsa-0.31 | 2 
               pipewire-0.3.27 | 2 
                proftpd-1.3.6e | 2 
                  zeromq-4.3.4 | 2 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
                   guile-3.0.4 | 1 
        host-sentry-cli-1.57.0 | 1 
           libvncserver-0.9.13 | 1 
make: *** Waiting for unfin... | 1 
                  mender-2.6.0 | 1 
                   neon-0.30.2 | 1 
               netatalk-3.1.12 | 1 
              netopeer2-1.1.70 | 1 
                   netsnmp-5.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
          perl-net-ssleay-1.85 | 1 
                    qemu-6.0.0 | 1 
            resiprocate-1.12.0 | 1 
                 rpcbind-1.3.2 | 1 
             safeclib-08112019 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/b55a526254075b8007fbaae4cfb8f802110695dd |     
  aarch64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/8f98505d4157daa340058731c95807c47d52deee |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/045b73ed5fe4f6d35dfe9ddf2cd6f6994a4afe25 |     
    sh4      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/271b0bd280938194b5c66389a9084bdf53d7d322 |     
powerpc64le  |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/1681c716a3d82a4d1dc69ac170867d78ed2e72e6 |     
  aarch64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/a6b753584b009537c7d318e9e852612ba79fce1c |     
    i686     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/ce5a48873c7161c56b24a92ad7d4f06bbf8de1b0 |     
   s390x     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/0852d70eb62c1b722d1f69c7a6c7603f3d32b0c4 |     
   mipsel    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/c95312edc245ffb6c805f3af4e5c9e6a315a0bd1 |     
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/018026492d80ed31a8faf68177c8bcc01436273b |     
microblazeel |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/38e91a7f00c8c36cf4463af8ca0d56519b66e1f6 |     
 aarch64_be  |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/78f598577ff3383eb03ce6923b6d8273d7707fab | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/306761a2c6369bd346ab28d7197623c7152e1d71 | ORPH
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/e5ff4f9ce508be623ffbc2b4ad9da303fd2c52df | ORPH
   x86_64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/af062084865b01c3b34983a111f2c644bfb11144 | ORPH
    mips     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/bc9ea7695856c7249c4380f5e44388d7642cab0a | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/a76c2e08869b5328ba78b0c2ec199fa6f4d08617 | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/ed98d6f29a8f59d631eff286a0072b158e71ff08 | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/2b6621f5398102192c4cf5d884e1de823c73f138 | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/94fcbfec938f348924394a14dd78710324ab025d | ORPH
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/33dd08c4d98c125371dcf7225ccb2c1911fc214e | ORPH
   x86_64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/e9664fb1a2066322972a9b97323d96484f188023 | ORPH
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/dc0a080e0bf0fba49d6141f06aad2aee710d9da0 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4db94a871376f6492b0af9d0cf7de53dde953905 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6b0d14f54b431152b1c4523f92ae6063984371ab |     
   s390x     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6b7a598b44719f66e91155b3a662022658411ddb |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a6b09a50c0ad3d1ca378c206d2a2a5129da0e17e |     
 powerpc64   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0dfa24a46d61307022a723c374de29515f955290 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4f48bd79e6282f346258ea968b2658859d7241dc |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/3918808b147b5cbad505696ca66057b650d7cfa3 |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5a07086e703743ba7d929b3fc03ae70b29311b52 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/4bbf7387324cb86d2cc210c47f7618c52f7dac40 |     
  sparc64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/8858780d443e083c082f2a0324dd13923c5d0762 |     
  riscv64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/3ed6d2cc214c88fd1f6c03c02c71acf6d67f470e |     
    i586     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/1c75383521ca28ea69303811ab9a3acd0b8e655c |     
microblazeel |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/e291468021b13cf1e08f473cb7fb16952c621f54 |     
   mipsel    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/fa2f422203a6c8011c54a5b2ef96978848882b80 |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/b287f796b0cd08c853e9a6e7b7160c8311377e7b |     
   mipsel    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/b39621a4af906aab11220bbc6e137d3353b97da9 |     
    m68k     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/055e50518dd922f2c0cab9ed29849c5234b837ed |     
    i686     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/9e7685d41c2ade19d8c6aecc2c7be48258eae7bf |     
  aarch64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/c4f4395b9c3b0ff9ef087b199026aad78e29fdbb |     
    arc      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/d326afc3af3ba5a9eba7db51f3afd2cffa4b092f |     
microblazeel |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/aa050c1f1b5ce0124d6f47697411300f3836f7c3 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/9041316d6582d17b1af7b507b9d4523a26611c4d |     
    i586     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/af3423d76b33be0a55a5a2534cab3caa2dc3dd6b |     
   x86_64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/1564872e374bccbacc7aac4b5644d465dff95692 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/317852df59d0673b6ba9c81a29b725f8831358b6 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1406db0c739b652fe24f90c0590919a996da80af |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7174f125fbcaf087f548de629ba8e81a5e0f44f3 |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/25fd60478af73bc8a28d713b480326f50e4af0ac |     
    arm      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/8091527a1ca6ede1585b5702509ab62e0a294892 |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/cb0b85401dd72e134988fa9098ea64f6b6abd735 |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3775f9c6039b4ebe5a35301709610107959e6256 |     
   xtensa    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/ea07177a2da862218c42e84048c0ed440386b78f |     
   x86_64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/6ba708a40cf8c8eca83e282de982bd9394eddeb8 |     
    mips     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/fe5af6f197267cb687e9e66d4f5ac996a1d55062 |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/f527959e2a7cc2eeeb1729f01c0e8a5a84a9980e |     
 powerpc64   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/bb1b40c2182c564a138028102af1becef8b42d48 |     
    i586     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/0fd72ea22eb903272f76f6d6dc86f3452e77325a |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/ec795c54cdc4c88795fecceea07f48e93cfea36c |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/012fa3a3c35355bb5f0bb73d1bf2d6fadc8de5de |     
   x86_64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/b438de04757a73ad3e38acd102fe005627984351 |     
  sparc64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/cd764b74184186e4c59436942461b45d1bd4bd58 |     
    arc      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/5a7be5839968e80786a91e60b03c4babb7f117a6 |     
 aarch64_be  |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/c6b7772da78dfef229861c3cdba5118ced6d2c12 |     
  mips64el   |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/ba2141289698f11195e1ad808f14762b9860af0d |     
  mips64el   |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/dc0c8e11494c5a0d36ef72342468fe3cf610e458 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/7dc0874c002d02b7ef9e3a73cc5506682d9106a4 |     
  riscv64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/7e3d302bef6957531d6950f76b95d80321e9b4f3 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/bb982b71900b27802488b05b18bf519a472cf6bf |     
    i686     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/613b21d416d50df05a057df5bda6b4ea970e5805 |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/09a7ae73c4a490e1ee8c0b68fef8573a50bc376d | ORPH
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/3487837aa03ac0a6dbd9b48384efd7151b94048e |     
   sparc     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/713372ec619429142b5fbce724592dd4123bc10a |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/8aca8a668115848019e23c2dd21d885973d0a9c9 |     
    i586     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/79607fb9143982bfc889ff5e3d2f56dbceff8af5 |     
   mipsel    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/c1a86fc3af9fc2b4c931ac5ef11b22677e9287e3 |     
  mips64el   |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/71a35f4ed6f31ba0368459413bc86b27f8adb5d1 |     
powerpc64le  |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/9f170fb7eebfe4e7dcb387715bf0f9813c06a85e |     
   xtensa    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/37928fc4e7191abf5d1054f4b96312c87d2697b0 |     
    i686     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b5b1c8a4fda61c861272b21d6d5fe32916e12f4e |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/db9eb5f495ea65a50bcc15b482f481e2a63e0ee8 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/cbd6c18bbde54cb1b238ab970e1ef6664deae014 |     
    i586     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/00aea2155b38ff1acc87a87b67b18727cd98094b |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/39a50438783f6e149bb01e726960bc348cbaaa8c |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3e9d83c877b86aa378f05c7dfc8b7fae79d53bf1 |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/06b8ce29f9a05b6f779efd1f95c1556102b223b8 |     
   mipsel    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ef731ea7c6e7a14553b96a2aa3e4d544947f89fd |     
   s390x     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/620311712b5d6e476b2e2c38b01f5143dc6c37e8 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/8523027dd0f09408481fc57a8167d4ccdd87f05d |     
   s390x     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/721ae30630e07b25c5cc9edfe017881efbf11816 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9a525a651076398fe82167f2cf8634e29561a8cb |     
   mipsel    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/e893b7f7cb81d3267c4cf1c8ee3366ff690462c6 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b496384650930d7637bca3ce1c2bf456ce38296e |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/1ca3a4297a2dcfec86513b007c33dac7f9fdc767 |     
   s390x     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c3ffac900b938c5486055979932950d2a3fa227d |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3dddd1760f2b8f34fa58773af7bcac3ab500d11d |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/8265f16a2e513a0c51bb0528fa5c3e8747af6ecb |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/3b1e07774fa23fe7a3e15a004992aba127754a3f |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a2ac219d547912cd86b869b44fa0b292cb97473c |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/487891f326ff7c75fef4b0b86b08d0b0ce28d8b5 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/0772b641f48bb584fa7b4a4e1813d84181066b7c |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/ad2f5920ffd9cc697423bbc94a608db0df992f1a |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/353b57cabad7eae9cda43f3d3e7451fb870bde52 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2983250b1343a0b3c0f302426ddbcbc1ac2ebb72 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/37eb0952a763256fbf6ef3c668f6c95fbdf2dd35 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/94599608030490152a08e1ca8bb2bb558eeb9957 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/22d840e299678943529315fbb004b7d73a28dc36 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/a93001057c0e7fc85d15a9c5995051066e07fd5a |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/b2ef0b2816368215b5700bbe249f7d68f3badadd |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/53249027d1bb0cb2e1238ecf020e448e02e598c7 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/29684960f9d8323909ead9aa65e0e55fb7a57ddd |     
  powerpc    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/59104753bf0811819514df9d8a0aff3a9d6fcc2c |     
  powerpc    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/b1237aa98677dc6ccf4298e24b4ea85fb455a7a3 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/8cd1c3820bb7610406499c763a237e5d05dfc253 |     
    arc      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/8c8fe0a32647fc8c359c5cd5761b2055d6e2fe85 | ORPH
  riscv64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/a263e1f7f5504970070b6e7734a2903adabd6c70 | ORPH
   x86_64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/d6a96983faec2a27e6fdf6cf2bdf8ea80713d6ed | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/74bd22f84a3e5e307351125ed744e24917575d27 | ORPH
   s390x     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/0ebdd6433b442cbf4eec9cb48948ec7d42950fd8 | ORPH
   xtensa    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/56d02ddb60f2489e2d3a5e26fbb2368535e9e8df | ORPH
 aarch64_be  |      libvncserver-0.9.13       | NOK | http://autobuild.buildroot.net/results/3dd9a97e7faa99bab12d7acb069e8414e17f67e9 | ORPH
  aarch64    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/5f9aa51e0c014f66a1af5451caf90b125e530acc |     
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/c4ddd86bd4b74ba4e4857ee38e3a95bb9b019093 | ORPH
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/5653bbc02ac50ae883bbdc2d1c489187b70ad922 | ORPH
   s390x     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/7aeaa960fdfe1b47562ded31de480036602a5116 | ORPH
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/bc9cb9964c6aee773d99cdbc5e42def9de61418a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/bc89adab9ebc03e0fe05abbb7eb20b0313b27945 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7d4848cfbb4bab236bb42f32408d037596f9e3af |     
    arc      |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/1d8d366115cbb0fb368cf678f4df0d214d556b23 |     
  riscv32    |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/746e7d7e47026b8dba46422ebe611408e69face1 |     
  riscv32    |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/181a7618d66d890b43dd9a4572adfa4ebfb3df74 |     
    arm      |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/dcfcb5928eff799ca041f196a6be525fd6b7e062 | ORPH
    arm      |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/586fa15610f67178c0572ed83375ef61cf12211e | ORPH
  riscv64    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/05aeda92797796687a8c805df47e6724fc3d7a2c |     
    arm      |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/d30e8f0835b33c99aff2e571e3c417e9e544e067 | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a51f42b260cc07e986d51fda19fa6e5a23af3f73 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/fdab26ef587cfac9fb6e8abacb82438772a63fa9 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/31fa22bdcfc2c4c07275cb71841127eea1ba3a16 |     
  mips64el   |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/5b3be19b518c5d9f0f1defd371c338671496b099 |     
   s390x     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/5e437b14b5ac5823258ee4bb343439a0832cc261 |     
    arm      |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/af37c4e6f27c95c4f9900fe6949e302c669e2dc8 |     
   x86_64    |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/efda124ad0b41bb5d4d882bc6b20fcf5a44c83a8 |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/0938cd7290bc272421cf2062fc2fa1e2e1aeda33 |     
microblazeel |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/bfdaf1c5ec3cc2a87e1b0b9bb6e4f51b2dc19c98 |     
    or1k     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/c85206080298b2ac954e1ce5da6601bc2b0d13ea |     
  riscv32    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/2645261598355562f0a518582fc6dfc002622f48 |     
microblazeel |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/3abfef2d481668b2051b0ea2238c8303762c5245 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/92933ae79ef84afaf689d0ac3e60b7c4bcd2e492 |     
    or1k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ccf143bd509041c67e165fdf34108d3a833c953b |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d19453f3e699fe8e9980530a7c384f284670792c |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/115a4f7a8b1a788fca3cda503b6de35db0276735 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4436384aa63645cbe52bb04f88e196aee30c7037 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b94d4c2fcf3c70561f7e26638787428d6acad646 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/c8e36ade110c51dc4c2962c81ded7d7a3e686a8a |     
 powerpc64   |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/bac6c01817a24ad1607c8fc4341e1ea35a9e225d | ORPH
   mipsel    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/3bc578699acb7a6263c1136126a678ed5d590574 | ORPH
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/bdcd328c31a4dcfeca3483057a866ab6b3c32935 | ORPH
  mips64el   |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/2de0611df2de6730cf5eeb734141b359c2f3ff1d | ORPH
  nds32le    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/64313fcca7a131be3ba7d8fce9579f6d0572e544 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/06298bbca9c812b3b5d4e7aa71d6d6407a814ddc | ORPH
    arc      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/4592ebff7c16c044cc537acbf0487dbe7b074876 | ORPH
    arc      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/fd5c3a0e0d41daba6528676d8b749866d9926ab2 |     
  riscv64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/caa75098853d164e9ad53a7f1edcd14c08564651 |     
 aarch64_be  |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/0aaffc2b0a71f8b0333e39287484ef003c3c698a |     
  riscv32    |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/ce601fb26d143e03adb39c41f2fdfca3b3191127 |     
    arm      |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/e51996fa0539f4514516c0bfeec641b58a9d62b1 |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/320c5603a61d81ba8d4b919df0ac6283a82954c9 |     
microblazeel |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/25d624078d8fea1a60f5eef51f75d41927921e93 |     
   xtensa    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c7340ad2443dfcb29a6f569ca864514b1e5d42a1 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0f0edc530b061798db2a31ba365263f62b9e922c |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a53c959c4c8ef8bbc5665df68fe9dde8edaef200 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/1ebe9ad32ceb7590c5fb18961a10f8323854f037 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e59472cf46f77f1b1e86874be9f8b7e90d06d022 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/15ffeedd1d01e2a95dee3a3017ff4a09531c7e47 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/fb3f5cf030cb4cf7a63bc8f1de0156893242effa |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1ca348d2d619f91a9826ee14fd1d7051095ec766 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f703f2f0d71a720ed7c25a8af1cb000470df06b6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/039f1f690009669f1d78af715c26cd5546732ba9 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                rocksdb-6.13.3 | 2 
  gobject-introspection-1.64.1 | 1 
                    mpv-0.33.1 | 1 
                 openmpi-4.0.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/500f8f0cb9b2adc254b1e2556928137077a91fd9 | ORPH
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/72886862b66bbc2dbf3088c435a141503eee1dc7 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f7655ca540f42e56bda373ce1f4c2d4c96089bc8 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6e07dd9da3ec89c946691ddda9b3b1565bb35e9c |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/71923ec52b504767dfa1c028d174b691fcf4b5d3 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 mesa3d-21.0.3 | 3 
        host-sentry-cli-1.57.0 | 2 
                mono-6.12.0.90 | 2 
                  zeromq-4.3.4 | 2 
                    ffmpeg-4.4 | 1 
                    ruby-3.0.1 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/011208d6e4eeaac08010437f8491181721a30bf3 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f7b25bfe3fd0c98bfdc1e3783ad46aa9b0b7b053 |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1cca64f6bc6309bb849a261cf4467b7b0927577e |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/31a716c84f167412726c886074eed80ebbbb3743 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/a7ab3fb6cad558eedb9abb3c2e5f93156d428ec5 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/62d4d75eac885798489e436b83e24143a0e5b1d4 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e2cb62f6ff56a45465123c08888c89da101a9c37 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7a184c991fb9ebb86360206ae52092c9518ef61f |     
   nios2     |           ruby-3.0.1           | NOK | http://autobuild.buildroot.net/results/27d7c73001996d87912afe48654de1ee09e51831 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/a7060272e397f1c0fdd05521f5ffd11b984141ce |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/13acd7997e3a4509548f2b5bc86c52ae8351adb4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b05e8f0514734dc5be3eb98c4419f8038bf333e3 |     



-- 
http://autobuild.buildroot.net
