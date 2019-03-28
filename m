From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 07:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-27
Message-ID: <20190328070057.B218D87A43@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   1 |   0 |  28 |
   2018.11.x |  30 |   1 |   0 |  31 |
   2019.02.x |  31 |   5 |   0 |  36 |
      master | 228 | 100 |   2 | 330 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 


Detail of failures
------------------

         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/1f69abad0c8359b1c7ec55cb8c9710ae4aeb9e02 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.2 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/dd2728acf2f13d4e8e377a1a6a9a9074e276586b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                busybox-1.30.1 | 24
                    putty-0.71 | 10
           uboot-tools-2019.01 | 7 
                  ffmpeg-4.1.2 | 5 
      host-uboot-tools-2019.01 | 5 
                host-lzip-1.20 | 4 
                   netsnmp-5.8 | 3 
                   netsurf-3.8 | 3 
android-tools-4.2.2+git2013... | 2 
                  brotli-1.0.7 | 2 
                   glm-0.9.8.4 | 2 
                host-go-1.12.1 | 2 
            host-pkgconf-1.5.3 | 2 
                  linuxptp-2.0 | 2 
                  aespipe-2.4d | 1 
                    bird-2.0.4 | 1 
                  boost-1.69.0 | 1 
     glibc-arc-2018.09-release | 1 
             gst1-libav-1.14.4 | 1 
             host-aespipe-2.4d | 1 
            host-autoconf-2.69 | 1 
              host-expat-2.2.6 | 1 
          host-libffi-v3.3-rc0 | 1 
            host-libtool-2.4.6 | 1 
                     host-llvm | 1 
                host-m4-1.4.18 | 1 
            host-python-2.7.15 | 1 
jsmn-6021415cc75e7922d45b12... | 1 
                  libogg-1.3.3 | 1 
             libopenssl-1.1.1b | 1 
                 libyaml-0.2.1 | 1 
               linux-pam-1.3.1 | 1 
minicom-19ab49422f3431102c3... | 1 
                       netsurf | 1 
               openldap-2.4.47 | 1 
              pure-ftpd-1.0.47 | 1 
                   qjson-0.9.0 | 1 
                qt5base-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 
     toolchain-external-custom | 1 
                 uclibc-1.0.31 | 1 
               wireshark-2.6.7 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

       nios2 |                   aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/343aee68c6e81e279a490f5c5f4e907506285007 | ORPH
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d3d6679cfc8afe4467368bd3d31483172c1032de |     
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/8bc42e8e5c69c5f6206432d55a0f99365e04365f |     
         arm |                     bird-2.0.4 | NOK | http://autobuild.buildroot.net/results/e1f879cb34f9cfbbd14b75f63d25897c5bee53cd |     
         arm |                   boost-1.69.0 | NOK | http://autobuild.buildroot.net/results/f42f8fa5adb2bf7c03e2e627e37eadb956ce0c74 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/61406d1c7fdb28aa168c9fc01e7c141bc90b0102 |     
     riscv64 |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/6a6808ef1349fd466e6bc1ea80d46655c4181f33 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/bcc5bd68dc1e0b35817f8ab82dc06b34289bf955 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/f6cd56ca53edc55b822a9e2ab4531f737af4b87e |     
 powerpc64le |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/841c4aca1caf1aaaf7627b86c5fe9c51e2dbde07 |     
 powerpc64le |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/a576ba6b8c045db58369eca1981c25943d5d87c4 |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/876eed7023d51989eab5a2131e545f39e7e7ebc8 |     
      xtensa |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/b10f4760eea6f34f369b5c0c855115fe1059ca18 |     
    mips64el |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/46b12783d74ecefcde8d46098a7f32ad4798ac71 |     
        i586 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/45c6aeb5959aca94032380701ef6f485cf431435 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/da7da983ffcd37a67171df998a2461194123f17f |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/284992bada61f0d121acafcc2e0ae7745d5e906b |     
      mipsel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/37e01783056c8faf6896894e2d4b5408b7a1f6f7 |     
     powerpc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/875c7a10dd200702e89185b934dc8dd4948dc7a4 |     
        or1k |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/dda41438361fa47c9010b570200b4cadf80055aa |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/2415f14280d8c8863e05eb73a09caa3769a5a66c |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6ae6a37db8b1f94202636c1f37408b8cb8c73ca1 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/3249fdf013ea64b16cafcbf72077eab8f0b9ea65 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/1102b2e7f90e8aac1abe60123befe77a51f315e3 |     
        i686 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/78e138a4bc1447389fc106e378112c8acd3bb64b |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/721b5bb5aafcf6ea8bd9bd8bb09bbbb60af15568 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/82c75bb74974b3d76e595e1688089339b73356a0 |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/118a333aa0e3734d9f3f9ed8fc9da665aed6e691 |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/76eb3ec5b947528ecb6be5a4c8e3e7e72c48c439 |     
        i586 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/b32cd9cd6b6607e3b82aaad4cc0a257b4da0b787 |     
        i586 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6bc747469edbae061dca8c73cfe4a5ef32b0da5b |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/c757bd0938a264613e650d9a1afac53bf866c4fb |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/8cd8d72be61f2691095362c71fe320b5df2ce016 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/00364600a767f9de4d74cb504a6b7ca169878358 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/c3cb92a03a91e79773b211d17ecfd2602ee13d3b |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/346b494b7c37304ad6b72fdd43518738caf62716 |     
         arc |      glibc-arc-2018.09-release | NOK | http://autobuild.buildroot.net/results/bb2e4bb000c8f7d31cf37c7d765d3554e7dfe3ea | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/9eb4e2f43b5ead2498aac298891b1ded86cf4a3d | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/2d7b6ac4d2ac76f908a3931ea07e9ef769a44ac6 | ORPH
     powerpc |              gst1-libav-1.14.4 | NOK | http://autobuild.buildroot.net/results/f0867c1361766484483f5911a3b070ff76c7eee9 |     
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/c210dd10d60c25b71acaaf1ade484f146be4f0d2 | ORPH
     powerpc |             host-autoconf-2.69 | NOK | http://autobuild.buildroot.net/results/937a1cc4d1698f95fa5281aeea999fa01491d63a | ORPH
  aarch64_be |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/83913cbb28fd318c7be874c1f2c691f4b08514c2 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/df3f302f59dc99db48034b653db8740bcb167f57 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/5519c4f32370197c6c1ab5ba5fe220974403db04 |     
         arm |           host-libffi-v3.3-rc0 | NOK | http://autobuild.buildroot.net/results/7c45a9809e1de552c96a262f8e9ed9065dd063c0 |     
       nios2 |             host-libtool-2.4.6 | NOK | http://autobuild.buildroot.net/results/5337a2061db58366793787627282677b91459b64 | ORPH
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/6a7c2451768419af63b9cffa20032d952678ae35 |     
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/d9e9aa385758cb46fad8fb46440932879b8166f7 | ORPH
    mips64el |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/02736d014aa52138da24f311df1d10e4024176d8 | ORPH
      xtensa |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/f20d6ba427f924bc0748189f32ac95602f3daa09 | ORPH
    mips64el |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/5f531fa2e4eb610b2834dcd4967903293e5ad9b0 | ORPH
         arm |                 host-m4-1.4.18 | NOK | http://autobuild.buildroot.net/results/5bd4c69f17545841622f9cf350d16b4e18422d0a | ORPH
         arc |             host-pkgconf-1.5.3 | NOK | http://autobuild.buildroot.net/results/882332ad0e806b04cc9223c5942861e611add4fa | ORPH
     powerpc |             host-pkgconf-1.5.3 | NOK | http://autobuild.buildroot.net/results/a2be450bfd18610bae06c4f6745922a943bff36d | ORPH
         arm |             host-python-2.7.15 | NOK | http://autobuild.buildroot.net/results/1ff92c212c8b22b8bb5ffac2c6a38db15714e0a2 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fbc90f8886a1a4778891cb4438fa90eeb41b5edf |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f4343f8c9cc309a0945cbfb6ad3ba6d8345e1744 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/33799b966fc348e35656b1debfcd95b6eed3aca3 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/369dba6d311c9820cafaeb9c668aca8b30aff2d7 |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f83c559205989836ab3f2a7ce44a1025acf6580e |     
         arm | jsmn-6021415cc75e7922d45b12... | NOK | http://autobuild.buildroot.net/results/f74e0b931515a68364dba6cbaa11929059699c9b |     
        mips |                   libogg-1.3.3 | NOK | http://autobuild.buildroot.net/results/8357e25bc906fa969f3b11bb9bd5e25b180c6b78 |     
    mips64el |              libopenssl-1.1.1b | NOK | http://autobuild.buildroot.net/results/4b201c1476e99f5929a4b134ca74e94cd96f1771 |     
     aarch64 |                  libyaml-0.2.1 | NOK | http://autobuild.buildroot.net/results/8124fbf65577b7a8d5e9ce1e3a48fe541761a066 | ORPH
  aarch64_be |                linux-pam-1.3.1 | NOK | http://autobuild.buildroot.net/results/9f306a70e8961247d6a1e2f8cb8a8d1337b2c1ca | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a289d84d734b27bb45d79dd0c05642424f2507c4 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/cc1d961780047711c86f2b1cfdf4b0446ed012f5 |     
        or1k | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/258bcc28bbfa8958b2a44614a474d236046ad50a |     
        i686 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8289a31db8d1542fc3fc7dbc13cf9d706e5309c6 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/530f89f5d75a986b67153be084892e99f859709f | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/ba2c974f3a6019e0d4e7a21bebf62ccf3e03d670 | ORPH
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/61acba5cc3df8bb4365665fd587e16651d8c087a |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/372c628dbc3451e2075814e8105039083b1a540f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c97c20561758f3704aa753b28c66f414da481703 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b4d5cf30ba7149cc3620d407100d15cafb6a7aa7 |     
        or1k |                openldap-2.4.47 | NOK | http://autobuild.buildroot.net/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6 |     
       sparc |               pure-ftpd-1.0.47 | NOK | http://autobuild.buildroot.net/results/eba8d344446b0db6327c0588c456c14594984f76 |     
        or1k |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/674e394cc86553bffd0d246e015679913071f6e8 |     
     powerpc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/7e474d82951b1de6c69780f12840669704851093 |     
         arc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/778c0865e3e03ff4ee8402692ea5b3263bfe8351 |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/038be6043c2aeb3ead7d3d41a6b4c1f8cfa2b5f4 |     
    mips64el |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/710dc079c0698d285e305e61af6f42657f4be109 |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/287200c1c55e267a1188ec23e289a386c141828c |     
        m68k |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/74f678a93864d6843f9b7660ffe1a4c2f30f7be2 |     
        m68k |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/14772ad9d51c49d72469c5d4d3be69d3f174542a |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/61d493f1986d00c92a155d92a7ab1a8785258c6a |     
       sparc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/c4ebb6ef52cff444f06827af6daea08756ab56a9 |     
     aarch64 |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/1fde58c41e38fa96beb3c5af972eb22971f191cc |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/23a838d439b00d616fbc7c037d07070469557aed |     
         arm |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/d43e70091ce680e47d4fc172580189fa20729008 |     
 powerpc64le |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/eaffd613983c3289884c2db42388ad075bf053ef |     
        i686 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d0d1f0f57b5f3251e98c03511380cd18aa7bcb3a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/540af0524782d8eb76f9ef36135e4133d7d0dd21 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/03c14463e1f0f39bddbe85bab9425e1510b67c1f |     
 powerpc64le |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1389cc2a22d4ad993f1bd6554ff61297c193deb7 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3a6a845684b7f9b3bb46abc2c27c156f5c7f266e |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e7ec0b085d9f64da47f111294af537140c0373b2 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/205703cfa5455d508f556910e540717b2133e9e9 |     
         arc |                  uclibc-1.0.31 | NOK | http://autobuild.buildroot.net/results/d26a913230855ae549280d0db3e589e2bacba0bf |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/20a485f5e1704d94757ba6d619716a780836ff53 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/19a2f50d26ba2fbf12ec60cf0596a71d4f781f57 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
googlefontdirectory-94dff3e... | 1 
                      gzip-1.9 | 1 
            host-pkgconf-1.5.3 | 1 
             libsndfile-1.0.28 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/692c1d272123b1ea39125be7a67351c41af10924 | ORPH
         arm | googlefontdirectory-94dff3e... | NOK | http://autobuild.buildroot.net/results/3383a934f16d812502c9f3d23d79e4d1dc302674 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/50279f81c625a495ec7fc14185cd9c6cd455bd70 | ORPH
     powerpc |             host-pkgconf-1.5.3 | NOK | http://autobuild.buildroot.net/results/e0be247f8096d64ac172289de8ad6859ac608487 | ORPH
         arc |              libsndfile-1.0.28 | NOK | http://autobuild.buildroot.net/results/6d32bc12d905edff223a2d05a593be8f0213ff4f |     


-- 
http://autobuild.buildroot.net
