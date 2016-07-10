From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-09
Message-ID: <20160710063025.E92C5103221@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-09
===============================

        success : 179
       failures : 99 
       timeouts : 0  
          TOTAL : 278

Classification of failures by reason
====================================

             bluez_utils-4.101 | 8 
             transmission-2.92 | 6 
               acpica-20160527 | 5 
                   dante-1.4.1 | 4 
                alsa-lib-1.1.1 | 3 
           libfastjson-v0.99.2 | 3 
             libgpg-error-1.23 | 3 
                cifs-utils-6.5 | 2 
              alljoyn-16.04.00 | 2 
openblas-f04af36ad0e85b64f1... | 2 
               host-efl-1.17.2 | 2 
                    pppd-2.4.7 | 2 
                    qemu-2.6.0 | 2 
           libmemcached-1.0.18 | 2 
                 hplip-3.15.11 | 1 
               gst1-imx-0.12.1 | 1 
          sane-backends-1.0.25 | 1 
                  babeld-1.7.1 | 1 
                 mplayer-1.3.0 | 1 
                 rpcbind-0.2.3 | 1 
               qt5base-5.6.1-1 | 1 
                     fbset-2.1 | 1 
                directfb-1.7.7 | 1 
                     eudev-3.2 | 1 
                   fwup-v0.8.0 | 1 
                   luvi-v2.7.2 | 1 
qt5webkit-b889f460280ad98c8... | 1 
              kodi-16.1-Jarvis | 1 
                 omniorb-4.2.1 | 1 
                   bdwgc-7.4.2 | 1 
                   cmake-3.5.2 | 1 
                   lite-0.8.10 | 1 
                 clapack-3.2.1 | 1 
           argp-standalone-1.3 | 1 
            lttng-libust-2.7.1 | 1 
           qt5location-5.6.1-1 | 1 
                acpitool-0.5.1 | 1 
               target-finalize | 1 
                    cups-2.1.4 | 1 
                upmpdcli-1.1.3 | 1 
                 liburcu-0.8.7 | 1 
                  libsepol-2.5 | 1 
             host-gauche-0.9.4 | 1 
                     dtc-1.4.1 | 1 
                  boost-1.61.0 | 1 
                  gamin-0.1.10 | 1 
                    mosh-1.2.5 | 1 
                     php-7.0.8 | 1 
                  autofs-5.1.2 | 1 
                  samba4-4.4.5 | 1 
                 gadgetfs-test | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   ncurses-5.9 | 1 
                    owfs-3.1p1 | 1 
                   assimp-v3.2 | 1 
               linux-pam-1.2.1 | 1 
               wireshark-2.0.4 | 1 
       qt5imageformats-5.6.1-1 | 1 
               libcap-ng-0.7.7 | 1 
                      qt-4.8.7 | 1 
               binutils-2.25.1 | 1 
                   fio-fio-2.7 | 1 
                   duma-2.5.15 | 1 
              gnuradio-3.7.9.1 | 1 
                 opencv-2.4.13 | 1 
                 log4cpp-1.1.1 | 1 
              e2fsprogs-1.43.1 | 1 

Detail of failures
===================

         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/a7cc6187451f944e6846d3f6b5cd3aac700796dd/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/1513178fa87d29eee5dcf0b6b0306f6fdf5172f3/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/4f1d26ecbf517f7ce8d2a5578d05f4cdb1de8ece/
microblazeel |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/53e38f278ad6d1a7d0a48bce74976f59475b1a99/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/781e188b5f018bb8af54971f6caba168aa4b32ad/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/5294ee565b537b73ae891460444b575e4634006c/
       sparc |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/54086295e20c2d44d4da3cefe08a5b86fb8f81b2/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/c08b7be6df48b4ea0e68b6001cb424b5c45a8380/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/4f458e6b6836840e3cc19f5a0769d53463927d6b/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/0771c502225cbc5c39045aed5b09cd7ceed14644/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/6a8112b412558116be45eb958446d6c7e2a21c08/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/cb4085b548a905ee8d51a72b2f29395cac0f72b6/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/dbcc9e83089c68d17c5e97c1173da889d9395903/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/1707b13914e28f9a07213003690b46d0c3e1001f/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/b10c0621e15f636dc6544e197e936c87b82bc80c/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1788cd009997c022fc2d3ec2d173ebc45ab2f537/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/4e57069e6c75d3c230c5fda7336a8c499d7843e7/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c52993567083c93f0e5485d00dc57b31cd749198/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5153a575ae3abaef5c372bfe695fe49ccdaba757/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3c750940162618258ec892cb7ec678f1ae72f51a/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ba25e0a9be9bed60095d641a4a21cce03cd50ac3/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/af04297dca01c6204115e54525d436b68673d6dd/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/911a148b7028108d1998321165374dfa2b744ba6/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9dc5efdca9d6e38c9cb5d99b992daeedb7c9602f/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/dac1d650acacba6f980ff5dfb967c0e344b3f810/
      x86_64 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fbafa88269a292d5ce8d9793549c5ecf0d0df02c/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/1463945bac52ea42bdc45c82b1ac9366e2e57b51/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/65da76a5ff62c41d2974e1137160011e32c67ac4/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/82a36729ad4d7c1b7190ebf5ba882add69afb51a/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/dda88f000a7c41edcddebeee665bfc8dc2fee33e/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/5b20e34b9da5191fefc7b116ca7f8effc7a409de/
        sh4a |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/0a37c0b71327027458180875426ae0968133d693/
       sparc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/536d95a46ef9527c6ed38b397f7e1b33f4b7b5fe/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9602564e0448e976d97067147107fcae8f910b99/
microblazeel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/121d9177780b3b3e37df7225620db09d8c75b7fd/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f0a48cf5a3ef4518f243a177183079da55eb01f9/
        m68k |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/825aa7b84427dbf0dec52d973a288ea2b0f6a13e/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/7ae0d5e4821c70077fc1731f578e8222e9d6691b/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f58b5f8f5cd069b63aae4249bc7aefb145789b7d/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/3ec97b733a255e8be15057f8f4c8d645b802c243/
        i586 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/90fc7954c532417c2ceaf9ab8549099d84561a42/
         arm |                    fio-fio-2.7 | NOK | http://autobuild.buildroot.net/results/8507eccf5507bf657c6de346956d3aa9771a8ce8/
        m68k |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/258a932673388e966be0d894f2ef00178ef493c8/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/4519518f8e9ae2d8874da519307642db89ecd021/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/7b0d6b94d07441a5d554054bfaffbfda31099fff/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/eb830496ced7d72f16a8957aca421c7ba3d96030/
         arm |                gst1-imx-0.12.1 | NOK | http://autobuild.buildroot.net/results/c3c236d21fc4f2bf0461b2de3e4168fdc266e46d/
         arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/379e1b2d1e537a406f315333e5b8acab4a6f1131/
         arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/4a6e2267e5af5a84c1b4d43863513d03e5499515/
         arm |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a762223e5d58a63b8c6bf9b797177c56b5fe0b17/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/5fb17fe3935616d3a8562b4fced67a7b01dee0a1/
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/544ebc8680050e2959ad1635f05d54b3f9c9124e/
        i686 |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/b76d7076a718c3614b58a2a1ff2320667485141c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/cba6ec988de93f28cea2d70060557a040ea47622/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/96a609f6263ceef6b4bea08272dfa2cc944b90d7/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/3723f17d12a9f133500960ae357d9136813dccff/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/1923d0b570adba494f83747a9610ea6ec35f5223/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/0495d60556139de8f3f6df420d9a226ee8a432a0/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/93edd94a929ca523b3ca295267dec3eb166e5c25/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/0d12423877b4aac2a18fac651063de98774b5108/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d75cda01a25d8e2d0be01e4324b249207b6bb7ff/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c8b61923419b380538f4e1f07889fabb7fdeb05e/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/69985b57d40298e60ed59ce8e0d32d026b4adadb/
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/b60882c40bc9f9a13ba1b900bb7575a492180914/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e7a790fd46e91f529287c3ec90b3e0f706465e94/
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/176533aa5dacdb56b6c67014b98b47b1f8e17a9b/
        i586 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/1867632f30531da69f06b965bc833817400f618f/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/f08a9abe9201f12230f9eae07463e62d901365d6/
      mipsel |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/09aa7b1172cf9fedf467524652814c3c8394cb77/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/212b9abe85516f18f31ed95fccc20985787c8800/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c8a046b29f6a7ca193f280493d79fb12574622a4/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/01f9325f02cdaa99d5588bd01ccd1d212ca057e9/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/e11f86c2b733e68313b3b6fae46b8fe3d2f34e3f/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c0d42f45e717dd48d628c72b6de355dac885b9c5/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e69f79d15f715a6c6d30288c6983db7963151ef4/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/dd8d7278216dadb1cee24127a28578f2d2084d2d/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/469dd7d37715eb98c2565b90be391224e4aee1ef/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/2bf5b355e6ad30262fa1968c09b609b9b13663c6/
        i586 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/37875702539076089effcff4c45d245b167be4bc/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/f0e2de72f370351051ee2680e67c2f60bbf71278/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/81b2e29513390786b7b4c392fe3361bbe958de7e/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/01cca3ab03350eb4e8d5e876ea185509419b988d/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/72746fdbb38f36680b129a0084c1d11c090d4518/
    mips64el |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/79065871c4ed1f93d546af338774eef5b51e4dd7/
     aarch64 |        qt5imageformats-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/ae74f93f09e61151553a54b9d3a6b19946e42938/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/5c10808ece36033e85aa28cc0cf24a884b360fde/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/400d2f75c423f2aa403df5ad747c717e39970aa4/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/34b426a04bdf62e5f359dcd1a48a3281e2c91d75/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/3b49f3a4d0b88a16fb66b6af1d8f573581ec378a/
        i586 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/db59f0ea22001210574f18dce32885ba7f8f71ea/
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ca35393db46d6b08d3e0e9eaa55ff575c8cf36d7/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8a1fa799fa289941b8a1d9eb3fc4f84fb4b189eb/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5a55ebe2ae726ddbaa6bbe0e10778f9d03deb964/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/025bfb5224e0f88403ac5391ad01f36476690a71/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/787a69fbbf5c18c7d36a04278037c6e4d01f86bc/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/bd1afc74c6722c777b9cdf4183863a1b754ca9d9/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8f0068d19aed1ebaad24138989ca17a5e8e316a9/
         arm |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/9ae5c773e62bbe84f2d0495f074d659fa3dcd55b/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/675e35aa8ca7d86e28f8633f758198e4e3de3a94/


-- 
http://autobuild.buildroot.net
