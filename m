From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Feb 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-06
Message-ID: <20160207073021.12C7A1017F7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-06
===============================

        success : 196
       failures : 115
       timeouts : 0  
          TOTAL : 311

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 13
                  boost-1.60.0 | 10
                  lshw-B.02.17 | 7 
                   fio-fio-2.6 | 6 
               pax-utils-1.1.4 | 4 
                      icu-56.1 | 4 
iputils-c8ff6feaf0442f8efd9... | 3 
               valgrind-3.11.0 | 3 
        ltp-testsuite-20150903 | 3 
                       unknown | 3 
             util-linux-2.27.1 | 3 
                  cairo-1.14.4 | 2 
                  trinity-v1.6 | 2 
                   erlang-17.5 | 2 
                   qhull-7.2.0 | 2 
          libpam-tacplus-1.3.9 | 2 
                  connman-1.31 | 2 
             host-nodejs-5.3.0 | 2 
                 openal-1.17.2 | 2 
                  gamin-0.1.10 | 2 
                    sox-14.4.2 | 2 
                   mplayer-1.2 | 1 
                  stunnel-5.29 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                    cups-2.1.2 | 1 
               linknx-0.0.1.32 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 qt5base-5.5.1 | 1 
                   ympd-v1.2.3 | 1 
                 rtptools-1.20 | 1 
          shairport-sync-2.8.0 | 1 
                 igmpproxy-0.1 | 1 
                   kexec-2.0.9 | 1 
                    mosh-1.2.5 | 1 
                  samba4-4.3.4 | 1 
                  qlibc-v2.1.6 | 1 
               trousers-0.3.13 | 1 
              libraw1394-2.1.1 | 1 
         qt5imageformats-5.5.1 | 1 
                 mesa3d-11.1.1 | 1 
                   portmap-6.0 | 1 
               host-efl-1.15.3 | 1 
          chocolate-doom-2.2.1 | 1 
              gst1-libav-1.6.3 | 1 
                mono-4.2.1.102 | 1 
                   hostapd-2.5 | 1 
              rabbitmq-c-0.7.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 libraw-0.17.1 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 opencv-2.4.10 | 1 
                    quota-4.01 | 1 
               libcap-ng-0.7.4 | 1 
                  prboom-2.5.0 | 1 
                     vlc-2.2.1 | 1 
                 setools-3.3.8 | 1 
               libupnpp-0.13.1 | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/feb2a9b9824e54743eb1c69f8596ddecc21a6cce/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e0a57f0f2cab689042fa7c44a76f955e8690c642/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c3625dd9a438535f6dd852a82a406e90b841e361/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2aaad7b6e89a7960f38c5a845b8f9d2a70877517/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/152c8da17aee05c018a795d53622403e90e35d7d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b336484f963f59559655ad7368da878e11409666/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/964fedf4711bd5846937d249f574969b2bd4fbce/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/653c25ccee35d646a8693501b6b01a140868ebdb/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/539391f955996f11106499161ebadc73a5a8232a/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/69a70948d27f910cc5b17b2e4a7d06661b7f96c2/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/e4e69cad3af8eb5c328137be4d5e3c0d0e153ffb/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/0db401710ba0d571861e537d321584b95e9456be/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/aa0c2026d50b478e225a283fff0f213d5a19698e/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/532b8a13e885001fcf1c73dcc63a601c1f39d54f/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0762ba8b1705677edd0c771076f488b67afd7189/
        i686 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9febe524dbd790c997b43b01943c741cc84a602b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cabbc8f10e91b704ead6074d66fa376d4d8fc07b/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2dbd05424a34abd9fdd313844ee5dbd165c07dfa/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/8492b762e4774c2133d34f110d58b2102404b5cc/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d6a43e7be3a28a3c82e6c714bb752dcc77676204/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/d9286d79910426e45b3bf81411ac482e066fbd82/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/3d87c501986f7ac248d6b3d3d97cf30744799413/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b9382f5d2a9f88bcafd6ad2b8706c783186b1c5b/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b9000c92c7c120da7aa2a4f15e4515162f0a2384/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/129cc12ff5cb8725822a2219939c36e2b998b873/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/258c48df69a7d0dde5d1f3e7ef47ec83f85d9dc0/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/1a3e9cd404af7fb30acfc049b518e88fca572aab/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6a0330c74409b94bdc0a371bdece374289822389/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/2b1155adb3b7a70e44bee0fe2b3cceb5cadc3044/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/fe747301b7f97876e44269a1ba444fda23844aa8/
      x86_64 |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/afcefb03542bfb5beb93b8108cb0ae6143a02471/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/8c594058bc4f7fc11754d94f1497325cccbd2040/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/7119a54b065f832e8b07b0e2acd5be22209ecd26/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/262d5e1a37c6378538c7564bbbcc287e0ddf426a/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/0631ef19703313d9b1fab399a0bf057e80b9352b/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/f665fbec01446913ebadfbcd24946496022de059/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/5bc60f45922e247516944b3636311766e1728e5b/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/8980528137b963a62193ea2d4f139854ad107d12/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/0efb8a6bce1620789da64a83ea6b12cb082cf4c8/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/9cbf9e128a8b1b5820e9ae511b4fd7f1abe0bac2/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/cf3849226dfb65a55a6728621a3e7dcd4e62ebe4/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/f602c7360f2bf30af8e418adbd079f25f30ee382/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/e8f425f8ebea3887b094cb5c99fdadb5cb7c7047/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/24a3bdd1f2a9be8c06577cd6504a0ea56971c9b1/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/ce74d9bd84e2f6048b0c15a3e3650dd54228c1db/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/e918a0054aeedc6c2ce8d0dfbcad80cc4fa43612/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/57bf25249d0a85b934e0af568919134c9c837cc8/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/62c44092fb9f3ff75434d9ddf314d245df65aeb6/
         arm |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/b2db7f9c2df0db4c4128af671593def81dce61ca/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b3a9e7eb3d93c6897a546fe99f6e51c2ddfac250/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/a14e39bb09e906d3014aa167d0cac08d48ff2a09/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/0b6a42a96ca500eba0a59e2f41d756932f71362c/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/513e21886c95646be78f1b4e6c965345c85230dd/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/43ee33d82ebd712b117098422a00101ea50d8074/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/d135add9af44cf6cb80eb31bff6dcc056cffd88d/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/6eee3749e2906121025a2ee434643c8f62827cd1/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/6d2d2a1a176bb950cd03b404574fa91531397802/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/d0543e98dfcb91e07afc10afbdf92339784adf14/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/86067d8c8dea4ae4ef9b11ff7663dfa2ca4c6f68/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4889629ef66123f3ff3be279846ca83ac2ba56a6/
         sh4 |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/81927de0e2892959fc2ae111a10f459f0f2429df/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/82664f67078bebcd19ebf1d0210e1a53c971e32f/
         arm |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/972e6ae2d09d66508ecd6a34a8714f7c3c7a6d85/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ecb03323e9e55f7349cfa1e9934e63d3ac964438/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ba64fb40ba2b7a5b60581401ea6d8ada1f786c48/
       sparc |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/11a4aaae35198fe002706017216b50fd79e143af/
       sparc |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/d1c745a4c23c50482349701afb75dbe845951dd0/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/7ed2a50ddb898cd3eeb6a023cc7a0896379035f7/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/0bda7a5dcc0ddfd9912c1ac5f61d71d265d7aa74/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/1d59ca70e94a72579127e188eab0f74bb39933f0/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/41af71cbbc7408128a3e67cb66dc1165215c0859/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/aed5afc5da1e69792a70d4cc61974d413b51d8fb/
     aarch64 |                    portmap-6.0 | NOK | http://autobuild.buildroot.net/results/b47eec4356b2aeff48fee84f8c977f6d07c96f95/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/876e7eeef47bcef67a6b7e7f1d4ba6c6c304a9d4/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/114a86b870aa762424c1ea77ad65e7dd006c5a84/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/74276934eab7b953d139cf59c87dd25b86b7c600/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/8322154ad31144cff37bca184088953067b84423/
        i686 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c0329d7d8d1f4643738a87dde0687c4a96dac8e1/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f398025e51b186bfc5501a75b0517ed727dc6538/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/cc78f92ea699a4c96e3d6848a87cea9c7bda4770/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/7f6efc3b56145286adcb500ef9250031308acd4c/
      mipsel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/51011ec1903d8e9770e9bf38669601f6b9a1ecc5/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/188eb9c81dfd27b01376caa28c9ec4699149ea6d/
     sparc64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f6a9875bdb74d80dc3ba021ac69dc9e91214560d/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ca91435cf5b96f0648e518f16e3d7948db159bbd/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/85ba61d5a8fdab64eee69c50853fcb97f270598c/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9d6c7b0a51f241c0a74efe62613bd90cbbaa3249/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/4ae68ca1176b6ea11b5e3492d2d201a9ebe95cb9/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/f2d4020e11c069f5b337dca1d5412383942ffa28/
         arm |                   qlibc-v2.1.6 | NOK | http://autobuild.buildroot.net/results/8d3dad2dcf5b3c7fa94cc759386759b1ac9e3287/
       nios2 |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/6b0debb56e10f8c1545771a177b89d1a1134ae3e/
     aarch64 |          qt5imageformats-5.5.1 | NOK | http://autobuild.buildroot.net/results/13f13342c20922c9ad769068ecfc34407ff99db0/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c58d3fa9b57b0489e560c56ddf1b8e1c0888c7ee/
    mips64el |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/029867fa25fd28770a8363cf6b6ef158c5b25b5c/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5e673c759d61ace596398e1be8b172c1bbb6bb7d/
       sparc |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/0d0fd9d2a132a40a840bea5df59c35d8573ebf45/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8c79234e5668ef08358b4447529da9746b2b4940/
         arm |           shairport-sync-2.8.0 | NOK | http://autobuild.buildroot.net/results/9bcc27461b67e718f49419ba292afd28f1152dc6/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/fcc3d01e7707756dc63dd6578da8b63c945c3270/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/aaba998a6dad6b12ae3310a5f14db3b731bd9d03/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/e19ce75a22dc61622fe689a03bd1d658c1b16d04/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/d063f80d3a185b8b91aa74147f20b4fb641dd78b/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/49161af686ca9ff74f11f7e1514f530f045e0b9b/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ffecccb62375ede14ad8f859d91a23b6bdff5713/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/ab1809f4fa8cf29208f9503edd90aca87fe397c2/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/f4ca24ae8ce8e1788a8aac774a2c384597a1a203/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/4961fd111dc39f236b5f467efce734e1c7b9fa3a/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/87d989bed6362ee0e9e93f10dac1b309824c0898/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/3769aa6f848a168dd6200c607c3f7fc046ac3efb/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/7e17bf5f077075a51cfa68a1b0baa2f07693ea79/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5d53f7f7eca040b302e393dcb23019d229b234dc/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/9787aef9d88f0b6a041bc5cb6a477d2865426ae6/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/8f7921651040920ad20a8f6dba6f4dbdef5605d2/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/f38840015344a1271eb5f25fd40dfa6d794b9454/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/30853c1011544f8b6a5d3b3852af93bef4c0f5cb/


-- 
http://autobuild.buildroot.net
