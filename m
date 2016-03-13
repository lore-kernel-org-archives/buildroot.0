From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-12
Message-ID: <20160313073022.74B98101A38@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-12
===============================

        success : 226
       failures : 179
       timeouts : 1  
          TOTAL : 406

Classification of failures by reason
====================================

              host-libcap-2.24 | 83
           libimxvpuapi-0.10.1 | 11
                     dt-v18.32 | 7 
  getent-buildroot-2016.05-git | 6 
                blktrace-1.1.0 | 5 
                  boost-1.60.0 | 5 
              gst1-libav-1.6.3 | 3 
                  connman-1.31 | 3 
                  ltris-1.0.19 | 2 
                      qt-4.8.7 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                  ffmpeg-2.8.6 | 2 
                  zeromq-4.1.4 | 2 
               valgrind-3.11.0 | 2 
                 mesa3d-11.1.2 | 2 
                   taskd-1.1.0 | 2 
                  cairo-1.14.4 | 2 
                sg3_utils-1.42 | 2 
                libgpgme-1.5.5 | 2 
      ca-certificates-20160104 | 2 
                 libdrm-2.4.67 | 2 
                  gamin-0.1.10 | 2 
                pinentry-0.9.4 | 1 
xdriver_xf86-video-openchro... | 1 
                     tftpd-5.2 | 1 
                 igmpproxy-0.1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
         qt5imageformats-5.5.1 | 1 
          chocolate-doom-2.2.1 | 1 
        host-gutenprint-5.2.11 | 1 
                oprofile-1.1.0 | 1 
                    ruby-2.3.0 | 1 
                  multicat-2.1 | 1 
                 erlang-18.2.1 | 1 
                libpjsip-2.4.5 | 1 
                  apitrace-7.0 | 1 
                    cups-2.1.2 | 1 
               ipmitool-1.8.15 | 1 
                     gdb-7.9.1 | 1 
                   systemd-229 | 1 
x264-e86f3a1993234e8f26050c... | 1 
make[2]: *** [code/CMakeFil... | 1 
                 rtptools-1.20 | 1 
                   perl-5.22.1 | 1 
       openpgm-release-5-2-122 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 mono-4.2.2.30 | 1 
             webkitgtk24-2.4.9 | 1 
             stress-ng-0.04.16 | 1 
                 lvm2-2.02.144 | 1 
                    yajl-2.1.0 | 1 

Detail of failures
===================

      mipsel |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/f30a678a8d16a7f49a64b3dcdd8135f77b483908/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/8bdc925bf8f9ecaa6dad8451101c973979f4d523/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/87444c3eeb42e0026c66d71207025fb9a1b0d547/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b5a473df883662ac5f27128705cfe491de8f246f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c8f9946183f5a953d2d4400df8e510840e8f8741/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7518074b2b55fc954dc237b0730be8af294e8a4f/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f15212fb883d27b4ff1f504cf8cd2aca77f5c94b/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4e651ab27689dbc508b0dbdb55f217592043f9a4/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c2e3775994a22320c18f820a022fb84d57005d79/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3e6e598563631315d2196ae27934ba335e5a4a22/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a3160203a0cc57e1abb94b435ece5d74e70ac7be/
      mipsel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/06ee9109811bc669ad763a5dd9e33ee54514f54b/
         sh4 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/931f38c6eacb1c7d56546a0053e948152d1d1b9b/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d7031392ca4802ec8dadf27246bb7c725787bbfc/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e20bd1ef6f9ab79765b696861f360020582eaa9b/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/cc1f78f6c43e3a7bf3ed80d759d9c4d7363d0e48/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/166cd7c58eb832f97c243dab76061e9973f4b490/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/387a52f2ca8d29e43d318ea51a86a6953641605c/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bc147676c355782b1e1690d97928fe32f8fac97b/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6ad41c014723f1a5df23e1dbc829bb93cb4dab26/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/9d5b3addc01216688c8963f6aba23387142888fb/
      mipsel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/bd5bda8e282b886d5b0c3714fc97c17af8e5c72f/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c3217e8c011c7c10866f8aa5f749852d58a08571/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/fa77294997d70badd107e892647f3133a03eccf1/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/9ec74cbf740e41de8ba360f8cd0c523d6e17b58b/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/1296154e1a6f46edc63e600345a029cf6abdd1ae/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/1428675e1eda9eb5b76e04956f820152b8c04896/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/6743377f2850cad801a0ee806ea866774929ebb4/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/13b36bffaf77ce30c6e518f15bd54dbf167c2b67/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/59d3c1d3f57a272c42b887ad35b731bf21690f86/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/02914e0fa683da82b31c4854c6799463e63a723d/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/c4dca338f88888737e627299853a2f238a975a96/
        i686 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/35cce0bcd05280aacac71558b1a3751d8d8c354a/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/ad70dfca168088b64d957f51a8241a85a78d02e0/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/feb0dff58e240145467795d3bad24d03a28f8e57/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/8bb8da5312d987ba7391ba315b0f6e294310fd99/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/76093eea4e76b840642fffd5a37f5ae8a345526b/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/56ffe57a845cf23206bad766be2075697b67356c/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/245dd1eb1d6d05af127318dd0ab9401519a3f9ce/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/e297d9d500f8e63aeac4f8472c4ea46a2115c1a1/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/df253f63ab80a3c8e9e47e0ab015439891f21408/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/8ea720d7ef0594b0856f5ff6eeef05ae7342774b/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/00650e9c92bd2c8d776f7fac413ddcb929f41e2f/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/ef6f55434bb8f1574df866719eeb0dedcdbb3aef/
     sparc64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/d46c38d9bfa5074ae878aed4145eab65d398543f/
      xtensa |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/7e7bac9a120ac2239b164f73e8e8c03ac43ad859/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/24acde2ca7a41f7501f51b4aec0b4268f1a66645/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/78030fab8c5e27e19e3cc4fc691c21614e53db23/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/134f2b8bd878b14da103e72b6dfc26f4e75ebadb/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a9c6fd8e29438d74e3a7717f912a1bd2540825a8/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a552bf6d1febb87f9815f6689910c830641b11d4/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/21a84418a8c05cde914f799d042ef95e03e49837/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/031d9e5044ce3167885c3fbcdfdc870bd4a66017/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cb764ae758fd2ed7bedd0796578c2332e434efdd/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9ea40f1a90e23025b10e3d45a517ed92437f9863/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/208c17cc0d2a85068baf1462874a706f4c3a197d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/df8683894c395c2bbc64fb058ed8695e11e486c5/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8dc6484e93619021b03b951c39354d49d81ad5df/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7ddd58959eb52c70f8ab099802817affd3e06f8b/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6c9a21c44137286d9f48688a962f89b3e018044c/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/12dea4f9d3d5bbe312451880f572e90c7210371b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fdaa04dc40f310c157687beb17eb091d0082f88e/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/817ff66d1c9525dd13f98f16286680264dca7361/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7a4bbcc8eadcf83510b868642e44a63498b6484e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2a8db1d697b09a15980f03f8fb25a71865a6402a/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/382187a038e3b7608dbc8e9ec0c307a8bdb96b4c/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a81c8af0b1cbba70ed66bb5e206640af0f709034/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0cc4b4947052a3b296179e2b96267d8b4ffc0c7e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2549df50c8a141ea80cdd34252b53f01d7e0fe1d/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/165b2280951014aaf719af99b9d1d38bba5930eb/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3ae7c1a6d66693d20f16be18bfdaad3b95ff6927/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f57096bf69358fe632889053a738f9cb471a8e30/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0db7d83e8e642374776223aaf440f69ceb6a00e9/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/047d8272edd223a43cfd583865f99c93b3d15592/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1defd107335cc90a900cea69d7cdaef5d53c8bf2/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/80f27aa552ef37ae6626718542d10347038096be/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e1592f5685b0bf4ef9cf9b46b5579984d4a4ed35/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/170653159ea49520dc00e14a7c7afe49fe91f386/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8419039bdb6769f81d591573eaf29f63e4dff0cb/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5ed6a049d793356125ca0ad26931e3b806dd9251/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/48f9e519158dfb21a720ba394cbe7cd64a5373b4/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ceef5cb851718750c21bf5f8c12d23813793215b/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/711756fd52f3fe2787085c2432eadf0195ea159f/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8328d5e04551b8e461b6cbf9b487bbbfd317a0de/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9c988f2285b99dae7e37a1a8f2dfa15fe15407ca/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a48db12e5bb04fbcf6bf891fb6697a0c614a7d3b/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b7a03922f9fe5e249ea18c78b8af5d77d6e6d579/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c0256463e6003b40cd27f90e344978ffe4d9f35b/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8d055fc382dd1da373cc872e34645707938efece/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/294911820ee968035e0c47f5cb64167e54c855fa/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/598cb4ce67c7b660b54665668e961da06b796170/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3d8ce3205741b2797658a75bb20589746fb032a3/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e079cafef583a4ee225328013b96d12d1020de50/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7afff62bff57be68a993ca68f0b35416fa02eb3b/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/094d2b3817bb4edb140e66ad6507b00f0106ce5c/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6e2e1c5f81562e4c906bb39923b2baf9dc84da57/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/87c45808e8ec5981ab4cdc1d7e871ea486f84edd/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e3a9c4abb6035cba58fcb03ec33f28352523bb91/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cfec6896c64d185a7390fa95214d4a88be28783b/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/08cf96aa6feb0a2a0203da193c2f0c6bbbfc7ac5/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2484b412c377d9290714887a079f24256a151eec/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d0bebd35e865c8872753e846ebea883b1295fca3/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bcfd3180f8b40e4b3005a3e66f7cba977f3146da/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d08493df17cdfd852d3a79e0cc2baadd0906df80/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/54e208073e6dfb89d91f0f85011509cb4482a7ae/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4eef23605ba6f8c29d1f19357b92c080c182431b/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/14bb588383a79038731e2859439af71ed73d646d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2ae2cb03362aa54afa3cc1dc2c4d67fffbf0f077/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9c6e04063e25a7da15e74f17a6a423d6af67d807/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/99275662542d9ccf458a93dc846efb28583fab1f/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4cb9bccc4f4fe2685445d859760ebd822975b277/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/79716a98977ed45653fc1abe1320a1ef6060ae57/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/46399cb6ebe9e3f82ee06fbad06998856ee9553d/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e04c047c826dcdb9255d3cccbea391fc8ce68956/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f2dc9ad69118b668f6a71a5067d5aba7c2b77d4f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/edc4614b651ce96969d4f52e1c3ee9cbe1a89c61/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/20841e616ad2f1a5217db6ca2416edffac144834/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9edd941e79049585e81f8b1081e49dc5f38ea8ed/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9669ded7a159cc16f2cc9f1d86edc0d254782c24/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/352dfe7c67c0eb13176615e81d10c6412254111b/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dd91fb21a70cfb93bb7587764dbe57602f635d79/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/68c572424e502fe601e525affdee54795261147b/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a8980c1fcf670b27d35edaa84bc550b264b34e1e/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/29c04eea1f0c6381735c0a5988a35b8008605556/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5518aaf67dec54bcd96fb27c81711cccab0c9409/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a7980cff3d56a591f8c225ec97cc34b0136ace26/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fbc4f3c4bdf7e3cc1c444da5915797b5e42c7e53/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8073c75abc59049e9d1fd670a6c20c394977f010/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2f5321a6a54666c5ac3cb7b59639d4cf65d8e8fb/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/bc0b0305713c5d5e00f67734c745a33cda1e8e46/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/e5679103572d751de66d29c4a35a8f93533fb290/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/27087c09f6a463fd187938582e6b6d2e093e6291/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/74a7fa8554dbb79d906b0e63210fd7e9d3e29451/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/74b5f36a1a77c47f13194350a77b2186a6a6d398/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/1c7fc4535529d795292f06580dbdec5f97d5f3e3/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/bfcb0d52ac8b59d3151516c8e80d23c60f576c82/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8c95457cbb7435d5590d8e19d2397eeccd071a2a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b81feb863b7768de291bd463454c9af81a167491/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3324d29d4ec79220c9dc8f5b29c23a8740c83c62/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a7ecf40f14e7929ebf16cf195cc397521a72ec29/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/26455387824a34961b4982cdbc046dcef7ce11fb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/138fdde7445d021aca1cfa146f2a6cb354eff5ae/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e2dfb6186251bcbe3f4998a7e380ba763564d21b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/4bc9f92a80521aa29e296a82b0794f0889f49250/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/57be93030add6b8bc3e366d015f4bf74a7c93c42/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/49c6488c9413805dfd610ef3e1feb554babd7305/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/bc61f48d3675700d306d8419736d04f0c2c05903/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/06624f354264f80acae71371162e619c6b4c2a7b/
    mips64el |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/f269cd196c24abf978974bc606dc78336128f0b0/
      x86_64 |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/82102959778bd6c556fbb9d232672b139b9edf33/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/27070b299e81968d9a99918f438197a7c493ac58/
microblazeel |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/33d6dc8e1f57b5a02b07c50e5cefa272c6d992fc/
       sparc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/b4ab89c3628dd648683e25f9e3c6238f13871aba/
         arm |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/2bc0fe1e1a446eb3ba1859ca6090c6b3a8c0b31d/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9763a16c65c32017378a2a6f1c73eb176c9dd628/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/746f4f146fd43016f60f5277ea39ba5eb2d123bb/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/c8a80bd8a1708b597e396b6674a210b46ecc0dbf/
         arm |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/c8d6253845025dccc05001fca5b56fa16d224fda/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/680ee27b1798e100a8a2807c7b8ffe68ce05bcb0/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/079fa9b2f5a6d758fed8412038993b205f398575/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/36df93d3ac369eacfe7d8c06e52ebad985f9f14f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d87452d2fdfa72432a2afe0f2324e0c69d74d53a/
     aarch64 |          qt5imageformats-5.5.1 | NOK | http://autobuild.buildroot.net/results/9eebb528f5db3480e220528d67b318ad00b46857/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/878ee089bdc91e85e905569bca8a7efd3f5108b8/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/661ec03889e943c2dade15a56cb506770131422f/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/9ae5161bca66fcffedaf84b8debde2d41c8ac489/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/32f986ffec3efd7e4a69b58b8f91010e3dc90d3f/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/62c1ea0a4e0ca4f9649df1319fbcffb6aa0f403a/
        mips |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/1ca5f80892001b1691eecc41dea76d27386b1905/
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/a8e0911ab25cefca8b8d2e90a9f9bd0d970b759d/
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d3ce9d778d98fcd22d23550fe525bd8217345610/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/0e61648be14e36701d13aaeae38163cf95e00290/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f58fda0826ad4ccaf5fb3fe729624bc02c45db59/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5f0db44ef32a92c88a0c084139607b7511a82aeb/
      x86_64 |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/58b416d2015413f2b6facb541e0dc01ccb6dc1d9/
         arm | x264-e86f3a1993234e8f26050c... | NOK | http://autobuild.buildroot.net/results/d1bd7cd6075a8a953f79e94a046f138f0c3502c9/
         arc | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/a404b46cb59e39d33d2aa8b080b8ea7a4fb75f04/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/21b6ec626051d4c6d8cc15ac2dfb0c7588c4d98e/
       sparc |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/db8f59e52e101752caa591193881a521dbd0de0b/
microblazeel |                   zeromq-4.1.4 | NOK | http://autobuild.buildroot.net/results/40046a7edfc638cdafadc1b76d0a028a4416b001/


-- 
http://autobuild.buildroot.net
