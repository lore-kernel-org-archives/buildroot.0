From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-14
Message-ID: <20160715063032.46DB4101EAD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-14
===============================

        success : 181
       failures : 229
       timeouts : 0  
          TOTAL : 410

Classification of failures by reason
====================================

              host-cmake-3.6.0 | 130
               acpica-20160527 | 6 
                acpitool-0.5.1 | 5 
openblas-f04af36ad0e85b64f1... | 5 
              alljoyn-16.04.00 | 4 
              lirc-tools-0.9.4 | 3 
                  libsepol-2.5 | 3 
             bluez_utils-4.101 | 3 
docker-containerd-1b3a81545... | 3 
                    mpv-0.18.0 | 3 
                    owfs-3.1p1 | 2 
                  connman-1.32 | 2 
             transmission-2.92 | 2 
                  autofs-5.1.2 | 2 
                     php-7.0.8 | 2 
                  babeld-1.7.1 | 2 
                alsa-lib-1.1.1 | 2 
              libarchive-3.2.1 | 2 
                   fwup-v0.8.0 | 2 
                fcgiwrap-1.1.0 | 2 
                   glm-0.9.5.4 | 2 
               libcap-ng-0.7.7 | 2 
             libgpg-error-1.23 | 2 
      host-uboot-tools-2016.07 | 2 
                   dante-1.4.1 | 2 
                openmpi-1.10.2 | 2 
                blktrace-1.1.0 | 1 
                   assimp-v3.2 | 1 
                  samba4-4.4.5 | 1 
                yaml-cpp-0.5.2 | 1 
                  cairo-1.14.6 | 1 
           argp-standalone-1.3 | 1 
               libgcrypt-1.6.5 | 1 
               libglib2-2.48.1 | 1 
           libmemcached-1.0.18 | 1 
                flannel-v0.5.5 | 1 
             ntfs-3g-2016.2.22 | 1 
               runc-v1.0.0-rc1 | 1 
                   lite-0.8.10 | 1 
                    cups-2.1.4 | 1 
                  stunnel-5.31 | 1 
                openssl-1.0.2h | 1 
                 jack2-v1.9.10 | 1 
                flickcurl-1.26 | 1 
               linux-pam-1.2.1 | 1 
sconeserver-bbb384404575f8a... | 1 
                jemalloc-4.2.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 omniorb-4.2.1 | 1 
                    lftp-4.7.2 | 1 
                 mplayer-1.3.0 | 1 
               target-finalize | 1 
               qt5base-5.6.1-1 | 1 
                  gamin-0.1.10 | 1 
                upmpdcli-1.1.3 | 1 
                cifs-utils-6.5 | 1 
                  multicat-2.1 | 1 
                    urg-0.8.18 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/629e7a5200bfaabd7d02942babe4e2266b566e21/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/6a99d436540e140dfd28a2eca20f387b38c61519/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/515b564f1b2ae321b5fff616de0e32214dd37989/
        i586 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/59be979c11c36347e94430d7305fd72d40cad65b/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/0fb956a04ae1c68c8102f85ee9a1eff001f02491/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/474b8f54f6b24566c9f9cc5506f745e4d16fa72c/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/d7ef4bda175084744dc3c9c124ad7c3a9bb8db0a/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/15c8ed32718a2f4b658002959cfb83fe3c90dcd0/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/8dba7aba07df7390bbfc81f4748375f3dc311b96/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/03e578ab285900ebdc16cf6ca0cd1f9fda798eab/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/c1e01308da41f0d2a55b706d5ffb55fb289931f8/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/2259d39e261acbc1d8ee44903c6a8a64d4c92212/
       sparc |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/b07829567c2926671ea2efbe0d843c5436808de6/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/f308ffe3a78f7d24ec481d8620a2e5baa4314f40/
       sparc |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/e895baac8926caa4a8ee4e27547340691fc54db1/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/e36011c97295116cddcd68391a08c8c20a6df826/
        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/c1ced0d759d147809e905ef70cbe043fef3c14fc/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/ba65c181579c17882386ced63cb32ce0d7ec9381/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/4eef6f508261e70e78fb4d2b6dac45a941a415eb/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/615d104df52e5f17094d2d92b163ada24c6cdf2b/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/bd037002cfe3672c4b8a90474699b7daec03c5c9/
microblazeel |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/0535f27856c809de7e651a8bd9064e989c03d694/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/bb8e0f370574cbab3a3be2006045daee9cbba016/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/07bb6affd471db078c1c1a68c9333991a9ce1e4c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f683264797bd12dcdcab8132c580f7887bfcae7d/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c979b7b91b04a901c413d274e2aefa76573fe253/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a1aa12f194b3415e6f8aa371150338592a986319/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/863ec69867b8e1edf74aa4f3a050bbeed841f8b8/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/c4b244a4baa3cf3b5251df8d01ed0213feb835aa/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/03a202b6882cd0a0c0f3490c73615e53cd4caa9a/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ba21593b7a26c0a3eb41bd487a085cf26ec78671/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/d77a2e5228b1dff51945ce9837c08750da8f4a44/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/58baa0f7a18a638dad68e457e465f6d1a542d624/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/3ce827e806785e95b65915b7ecb21a2a6f806801/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/21a0a5db54d36c948a9a98585dae436c1d40e730/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/93a2ebce86c0e3fa5a76ea20810f61101a5929c4/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/ee3bd16f7e30d1caa4ae131c8d18ace8fc61bdcd/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/18ff96032be1872aec472a88bb24b85a0542dbbd/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/5501082ae021ca5525c5527a424640661effe535/
        mips |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/6e07eea2f0e4a1ee62ad220f1328f4beccf97c99/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2a5911dda7a7ca542a006b21ccd7a8d1b1b29edc/
        m68k |                 flickcurl-1.26 | NOK | http://autobuild.buildroot.net/results/41546e5f90bb49e3301f2e6b422b11e5ef5791a8/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/85b718484b25107e053a9edd67a18284adf6797c/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f15fd00c60f0fc2d2958dc1e701de5bb642a286c/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/fa4ac57f248fbc1080f3c12b547ed5306fc38b49/
        bfin |                    glm-0.9.5.4 | NOK | http://autobuild.buildroot.net/results/08eaae5042ce8c3e8cbab598505dc0af4a7c5abc/
        bfin |                    glm-0.9.5.4 | NOK | http://autobuild.buildroot.net/results/661a07884fc2d19fcd9e718ee16683c4ff9d7b6d/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/230e1cc333178b86ad0f9b43c65b5515ceb6aad5/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9236b8926f4cd269fcbd67486ffd0ef7aee530e7/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/96a57844ec75ae7adbdbe2d11df403762a149c15/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0ca6ab02fedde47861f34982679658ef15ea4da3/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/1f818bf5ddf84768affa160da92529c257e00abd/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/cd35c9e88036d7cc8f4e6b599df74e1a1a68f076/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9909204b6758a928a716304c0d235ffb06ebea2f/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5c6b73bb7beb3fc56f4ea1f2c0718c484f33c05d/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/adcbc9346e761bac475cb6bdd1a8fc725d36e565/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6076b246a62bf12ac0d95e15e81117dc4095bf82/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0630b42ec52833c971c4b300452b253b07611e51/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/05d970458860835d8f5013d1e8d3b7c9365f9813/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6f55470286d4fce087d05b08f0ac91c61b39d039/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/bfce1e58e6641110f780cd679afeab6719210b65/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e1139ae6fed1d3d365b69c33510e5c3105a74c22/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6f7cfbd9bcfa09ea8e1e65eced9103d5c1d031e3/
microblazeel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f019a03c8d08249bfb9190428fb3dbbcbda66304/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ea5fa066fbcf5eeec656735851b474c334ebc22d/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f971d3063e75f7ddf2c335e7a3f7563bd615216d/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/66701bcef284938e6c91302a54e29835c349c12a/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5900193422d7d347c9f9d6fd74e62df52b071d34/
        i586 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c8c4b14d04fe4bf9ff103debc850f423a94ed67a/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b39c2b1c748be9b98724e613d87568163aa4ff62/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/3879d06ecd80b8f314eff78f74bdc9fc161f252a/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a81fd6f43a921ba42ba93552c029575e442ecdea/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8910145f69f3d00c69d960ca48e8df048141c060/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d61eb8984da6dc2b90431ae32a1e61e00a5de4b7/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/02626192839a8e0a8aaf8340dd32bd2382bc3600/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/befb3033008340fb62e35c415fc78e519a17379d/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/feec97aeb0b2232623bf3200c6555c11e2f675b7/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/55f99fd023f6ab0cedd9e299970b717e5617ef51/
     sparc64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b6c61949c9db0e4a02415c4e6ad049a14d4af452/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/461d3f69ad5883b8f99d0bc14a35cc748fdc07b3/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/7b9cabc766d4e774ddc098485059d9cdd37846fb/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2849edba6b84d389572769e82849b95bda0fede2/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/7aa651a3266000db19307afcb85963b12f59ebca/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/fc401fb77a175f40d5b5ef94bac15158d2303389/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/38e0c819a3992e1f606fac37423928086e9e42a4/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/8e08a161cb1131192715b380607845514df304d3/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/cdffc48692440493c53779b48c60f2b07ef5cc3e/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/86595a4dfcf5b0d332def198338b631d905f119a/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/fe798e0de47a2290d1eab29401892f6f09237aa5/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/67a6840d4d8fbc713ee053da4cdbdc91081ac070/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9030c08af5b92d95eb48a687a9c48698f9e232c1/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9e55cbc039d782ccf69d6a3a38acb77b7e496738/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0a98c1df1a1904ede0240b5aa2dab2baa161308f/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9fb628b7944f03770fed4c647232a91f7f329505/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6aca74bdbe676a0375f882a4f651181a288328b9/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a0d6894f9ddb86d60fbca00f065e834861cd1d59/
       sparc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/704767c0983d218be509f8c6d729da0b4218bdbd/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c13254f79fdd054fbaf0c9c888c61637bca5402d/
        i586 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/528344d1ee82fd7758a6519dbd305dc9fd2feffe/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9cf7b896a5c2fd23b119c0df90a681909d624f5f/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/558eb622bd017ddfc884f0af3de2e4e6e2b40498/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/85f5e9329047c9d40f7fd35c645835d83a5fcef3/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d1ea35ee70e86e7a2cca0cef597312c5cfe6da70/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/75e6d6a3fab86e5ec197cf9d572e83d6c212f16e/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d2f606f921f06c586a3e920eef71a36b83c32241/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/78b48ef2fac1ca335926a9b13d5a4977bab09cb1/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ed207da007d48c1229eaeab30040279239ad8733/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/a77a10cb72ec6123d320365d1242b5a9cea00103/
        m68k |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/56e8e6a96f914482edc0640a0eb4a344202eb00b/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0a7c99c9b31df16ccbbcc5ce6c9ef74491fdb0c4/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5beeffefbf6e40ce1882171d1fb62142d9de0cb3/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/89fd8085da9cacf612a6aea585eb1ad6941f146b/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/344b990537731d04cd87fc2debac172c76e69de0/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6eaad1653f327e9e2b192b1fae46f8e6bf553687/
     sparc64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c2ac450130bcac38b6a01223aed802a48a919dc5/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2efe4e85110854ac2c019878b8b9f4ce30f94c91/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9583611c01d0e9d97c6852148c6b68a2d49fb27f/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f8c335440e3132ee7e01fadd03c4d18e0de767ba/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/193e88df98230554e304a8c550e5ded97e3a4177/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/aa5b00c81b6766379ffa4dbd9d6ee058a66c7f97/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/0e20fba81740ec1325e6ffbdf6d17375656471f1/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f4495fe7021e9ff1fa73dff981bf7ec0e37fffc3/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e88cbab0b44dba3bf4e545ac7b2dcb6cca7847cc/
        bfin |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/11b6ad29c78bd1c3ffa8bf93b8e0245a89cae581/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/da2f1c20c7f2171040863d5a6189102780e3386d/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6fb76780c70bdee8af4032bc4568a1433e2db721/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/896814c3700d01db5488b551f6c33bcfd6e36c81/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/42ad095fc231638a0ad5475bf5bb4c091fa34fb5/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/ea8b8261d13a7a4c8062e3f727b23bfedb9460bc/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/af80c1fa4fa7a3d6893760004afd6b5c7c93c927/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f96342d483a6d8934a775cc837c8dbe18bc9dd51/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6b8dc34d247997c90da45bca86565a9d7751b9f4/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/485aba5b2fd899362d4ead3d627f496fd1cebabd/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/198db8cb909c1f5314e0517b205e661ff1d3be8a/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9c1c24950daab6ff0f2694e10f8a91d4113de3c6/
       sparc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/290d979d0dfd60881c123da7a7b00af199c7a3d4/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/59396b24f4bb13ed0883eaf607d7986d24412cf5/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c1573630bdc5e8db53b591ddb7e597d79d50b795/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5faf4a88461049270070c8dd41d6dbbb2b112df7/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4949e9a894eb50fa571cb4d4be9f8c6f14a69bcc/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c83799aee2ed83a73812a602acdc477ed7a0881d/
      xtensa |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/72f8ad1c6f87586b42b1b75b5be049263847508a/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c6c003b3692be17750b94979e7d8f75de8f8147f/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/4bd3d47a784e000658ec7b49ca07e73d10443067/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/85ad3ff6551089bdef0f92affec93ae330e14920/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e3645efc0c265262081fb659f0690e3be582d6b8/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/eb384b30d81ef6519477bbc3ed7d74831c9cefbc/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/9b5be63a3f3357ef71c8100e39dd6d867ce08e66/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5cb253d72820831334c903078425d916e92c8dfc/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/06e0d0f73b3836e3a3c3d52350ad4fde0b585ea5/
     sparc64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c3d6a6d382ba6a22cc574f50bedec0f149b69f27/
      x86_64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/cfb767ee60ff0a0442ee8b06e3754530cbda0413/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d62daa54ba67f853f6af4028875591874145b0ba/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b7814fcd53b59aa393999b6f78f2433ad28a7417/
         sh4 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/6f417ba0bcdb11975340c49aad82b26afb17abe6/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/99ef42957002dcb1fbb42030c02e80db14d8667a/
         arc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/d63fe4f0827fd29ed52de0d71fd5bb12985ad893/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/e4004297b1a51063d7c33fc5f44f85c31f0042f2/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f235a9713efee43b46b08c740657c29d5afbda96/
        mips |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/44df02db61c15649914ea372b379efdbf264f2ab/
microblazeel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/718032a3e3503631ca5fc8fa7b84658283bb237e/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/56ab699e801faa62c1ce8d1fef42fd727797f60a/
        sh4a |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/853c67739fde1dab8113c75579f5dd95d874841c/
      mipsel |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/adfc4e29ff11b982789a2f21afde8a29644c25e4/
       nios2 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/71bc39829801824c26b9662aa3b00f6aa267135f/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/511e0862b9e545cc8e2a978cf4bc5fc4f24ce508/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f94cfda30f8ecc227116b3709d2701424e6e9269/
     aarch64 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/f9dc76d28df5aaf3df1e734fce1a29cd298db5b4/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/be050f88fd09bfee4a515d544698515bd1f60dc1/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/5191b0e3634ef40c427963d3b9c2144cf44cd16e/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/c19ab38b6c1ced0b83da24f04af98977e385864b/
     powerpc |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/b97d51a0b958436e17e7caa52b744e82dc2289d0/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2b7353be68ae65688d74c5b13c095f22447b27fd/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/3b727f2a1b0cbb2fd40aed48a78f33b4fa453084/
    mips64el |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/480d510a79fa0c0c5d19a4918bfaf98f046d8d36/
         arm |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/3e11d7f39ee0841ab0a6ebd142d9f0e778a780e4/
        i686 |               host-cmake-3.6.0 | NOK | http://autobuild.buildroot.net/results/2fcd90327755dc15febf85fb409eaa6237245774/
     powerpc |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/189309132e35dca71cb8c8c3fdd2f6310e8cca8e/
     powerpc |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/8e9cc25e058c2f91bf05d6e004c4658fd44b9c89/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/9026a97e05ff239fd9713d18e0d0faf0466f8008/
     sparc64 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/6b6f3c510a04e7223f9a54c10dc953519737c9cc/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/8e67b09638347e06823868055179f8a09a6352b2/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f6bc995b15729ca5d9d49b98f8c2d80eb591a78d/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9b4a05df8fd6f08f20d7228b13fcbea00b1a74f0/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/baf531c4548b2aca8ceac320bff83ede87d92591/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/a543165e95af7f8310354f7f0413925f0b7763b6/
        m68k |                libgcrypt-1.6.5 | NOK | http://autobuild.buildroot.net/results/374158bb0a0e6a16af5d0b909cd05ec52812aaa3/
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/417a60b39d3706035735763f7842e290b8be0925/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3a93244cc2cf6c42ff837fb07405be646b6e3d25/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/7ba88353d3a342f8ad9d2636dadfe5c53a0144a9/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/745a63a012c5018d934f5d4caba446955de85611/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/362ea9e813c12e18fc4ce0f47cbb1fa7babd6b1f/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/9e1d36776ef39814e73598a2cebb5fe5efb5edb1/
        i586 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/4d3bd7ad79622114d7d02655977912aa5ac72b2c/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e72f4022f27a4e9fc5f961c0a77d79f801c307d5/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/650885ae31ac9918b09613d3fd4db98b45b5f530/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c6ad7e13274805a9bb983c7aaa601c102c87c983/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/1361326e121d77bc21304a4f42ae9365b162db27/
      mipsel |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/3995def29b524625fb93dd5b6a2c730a151730b4/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/80105a244a12b577292dacc69262d5946bd5e6ca/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/f90dfc63dcf2300c766a5f289de6a51597f7838d/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/c648b15e2cecc2639f5ef015fea6c2946b650561/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/dc2ac87b7a0e530f5f8f273bb131c55835a9ba0b/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/bc701c165b6b9d4003104a9f479049d62500337d/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/12e746f0e498237d9f9668afe8b6dc7817d67b44/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/7bdc407bd7bbdd596327f38a05526a8737c0fd75/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2f175fa6af3cd5ee28001975434f9dbbd5eda83a/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2029d1f8bea4e2b4c8b85cce49a7a884008e509a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ed391fae8bc6398b56609443c4951e315554c397/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e43a35a85a49c361eb46987a13340b879573ee03/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/886e8704a1f6f07961d6e471aa392d5d985d4f1e/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/05f1ec0161bf4b28358ea0139402db772263ea0b/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/22f9bf540ec0bfb138b7a949a0da6bb3f2444f48/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/a406cc45cc36585a4b5328c028a2fc74cc379cb7/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/7446857b569d0a39106da7d547f1cfe287da05d8/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b0e28f784547e95ed4e59d7772e75aa5c44c0f77/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/7e14c138cb2de665f5cc462d93882045c1567a78/
     powerpc |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/f0f2b11dbc3165d184fb7dea1d0ab4be65283fa8/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/439cf8d383f31c55bcf5c47aff90e38c18da9af3/
      x86_64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/d70b963dbb83005bcc5a7a6c70ed2db664e1502e/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/b998b29576076ec17a006db37737bd61ee2defbd/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/5d51897df476552995c607cca8e4d2d225c8c803/
         arc |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/01e9064b29af44010329c7e0d7dd26d62c035cdb/
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/2d747be5a7289d127d414244698deb7a8bbe0afe/
        m68k |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/28a607afee3dd4ad9451767197d0d3c7275c3561/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d2825371ee34b4b57d3c06220e2b24526773b490/
        i686 |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/739d0169ff5ccab6c6b6ad317d9180257219bf42/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/79f32dc4622cfdee799fe1adce90593d264a17ad/
        bfin |                 yaml-cpp-0.5.2 | NOK | http://autobuild.buildroot.net/results/321263c314762cefad9eb0e52984bb860103ab46/


-- 
http://autobuild.buildroot.net
