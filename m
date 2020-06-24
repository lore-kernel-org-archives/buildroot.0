From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 06:26:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-23
Message-ID: <20200624062639.9324087F84@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  3  |  0  | 19  |
  2020.05.x  | 11  |  3  |  0  | 14  |
    master   | 115 | 109 |  0  | 224 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 31
              dropbear-2020.79 | 15
          fuse-overlayfs-1.1.0 | 6 
              host-grpc-1.25.0 | 5 
                     avahi-0.8 | 4 
                  boost-1.73.0 | 4 
libcamera-96fab38e02792a109... | 3 
                  umtprd-1.3.6 | 3 
                       unknown | 3 
             freeswitch-1.10.3 | 2 
                   gqrx-2.12.1 | 2 
             kismet-2016-07-R1 | 2 
                 libnss-3.53.1 | 2 
                openblas-0.3.9 | 2 
                qt5base-5.15.0 | 2 
                wayland-1.18.0 | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
              bitcoin-0.19.0.1 | 1 
                 dmalloc-5.5.2 | 1 
               domoticz-2020.1 | 1 
                   eigen-3.3.7 | 1 
              ejabberd-19.09.1 | 1 
                      ell-0.32 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-pango-1.44.6 | 1 
                minidlna-1.2.1 | 1 
                    mraa-2.1.0 | 1 
                  ndisc6-1.0.4 | 1 
               pulseview-0.4.1 | 1 
                    qemu-5.0.0 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
              tinydtls-0.9-rc1 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ef46580c858de2cdc9b7fe41e5c2058cef9172f2 |     
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/aa97a1ef844bb1c015c3a769f64b740f3ed55c08 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/82ffa6635cc935fd487d486ad5eaa602a900d0af | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cafabef43bef29b596913b91c7969f67284b54e8 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/892e4fd7a2840529b1a2c9f3a047fa1e54dafd65 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/28ea58fe8d959297705750afe13a75d55353d94d | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a510c54f8eacf3f212341993f5162139a053a584 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d652686b2f1bc58965efabf72ba629971ff87470 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/c86cd2093520fc98b247a61c22932945acecf85d |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/883f33b8438a0ba1a1a1a8a5d70f7b1707c339e9 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/9a0a4aeef5edd97b2cf6e816372a4a16898bb100 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/59a3c91a1f35d18342e5e6feae8bcfc7c882a80c | ORPH
   nios2     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e410cc30f2218011dcc649793fced34d2e3460bc |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/27437b05fb6bd62da88294a79a4ab164459dbed1 |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/2167b2ec6d12c199153ba7c36053ad2eaf36f93d |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/d5bb0c5b4d44843536ebfd2639debd9eb49fd642 |     
   sparc     |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/8601c391aad02aa27ac2706714fdc1b7146fc29e |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/534a7526e8bdbe1f68f22c0c9f6b1bec027f5f45 |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/832efa6bf2c52466fddf71f448b15edb06e99d3d |     
   xtensa    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/fe7c903ff1b86f7ef7024a939443a61f44c73295 |     
    arc      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/dd4657ef0e0e366f8d92170c8915f9e4c8d37b15 |     
   xtensa    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/e5887b823936ceaf576d357fc2a7abe65c4695ea |     
   mipsel    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/bcdbde76a96d83c7ef23f1ed1b726b7802807f02 |     
  powerpc    |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/bf5313f46212b5960484e14942bf03381e8ba9b5 |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/74acc8482d9006ed8a36b94b90890b828c619b66 |     
    arm      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/51ffe3bab661f86552b39eacffd0e28ebbb5c747 |     
    m68k     |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/d6d783da2fb834ce21475ff54f82c07873246826 |     
    arc      |        dropbear-2020.79        | NOK | http://autobuild.buildroot.net/results/f323c6d6e500f34566e87bd037c706e3e7dc91b4 |     
    m68k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/5ac85d8fa6f60698ddf65e00b215970483361b85 |     
  powerpc    |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/140abe28ac07ac5ff5644c0d2a805a83639e40b5 |     
 powerpc64   |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/dfa14cc7f589db1ab24ff9629eb6a4c33f875af1 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/de5426d7906e897c8236b4ee05ebc42e56138a0b |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/185b3a749e9313e7199978739f2504ae6ba1ad14 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/ec5c83e609291bd1d793528c20e571b883eb4db1 |     
    m68k     |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/12a1e42731123509eb0ab9a1a0f6fcac74a20098 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/b8d9de798f415bfd996554f057e9b6d08f0a8f55 |     
    arc      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/1c51b321fea4cca0019213e410df0af960c7537b |     
    i686     |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/713968ffb30a8c382848a547e146487a0cd4450e |     
microblazeel |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/7a6263d4d769d39f94d12da70124baf7a6429008 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b7e75df5ae0433639a4d1d27fa2e724a7f96f3e4 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d16429774d9ad980768422f5ff9ea5deb9f90608 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fe4de15cf26aa8341aa4daff4a43365dabb69071 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5f1543b5d3e062b120102f3913c273b957476ab9 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/83ae1b5666b9839739f08d646ab182ffd445bc80 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c1e537bc2421fefafdddeccdc4c014a9521a4774 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4de4635efa9d1eb3d81ec6fe0fff0b8b5f789bf8 |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6387803a6e053834c30aa8c22c05c72966409350 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6ac82ce7b6fddad2d0830917930027d19ab9656b |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/c212b6cb9e2d1286fe60cca66f1857042b046ef7 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/59135b6cae972ae68e80493241e03eb20e7b5579 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ca0f091d97731af617d5af2a420c55cd58ecdf13 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/bf60ab941647495d66b8da4c83d0cdb01f9dacce |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3a0037836672043968e630f4628ff15fda1b43d8 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/951733c4c2b542365f38b0a19db91d1c93b4a19f |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8b4c226110f2feb3dd3992ce2a3fbe4d3b129f96 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b5a38a693477b2ff6ddc8f2219c557d1d95f41ac |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ba10fb18b4a9280e99c4a7f1063d93ea178f1ed7 |     
    i686     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e8977a032d3937d1a11a3ead1b925c6bfdcd4fa6 |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/addba97b2d1631c1fb92e7fa50ad16cd131961f7 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0dec5dbf332b345a811762bcdfef83ef02db1741 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/7703235847dbfe71ceca6acca94f73d9cf619660 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/fdc09ede323c8476ac4b95659cb12386d0d7b3b2 |     
    sh4      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b90d7b99001893244c4e3d70e5c510458dd68a64 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/85688a668983e14148564973d1d0a26486f49cc2 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/3247039cc414487f575865ab21cf669ea2b99b92 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d1ae17580bde17de8f517755a3c6cacf70af1f95 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/ca52de986dace4e991c817efb084cbd3fe680e11 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/82e2efe8aef3c0cf03c82f75a7793837c57ef04e |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/88cbcc98701967a2b558ee7be9d71f4d86ef29f4 |     
microblazeel |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0979af7a459b10e6cc87ed495d614e55477d45be |     
   mipsel    |          gqrx-2.12.1           | NOK | http://autobuild.buildroot.net/results/3a036221dd9d83aaefc6d18f458cea5d7993a863 |     
 powerpc64   |          gqrx-2.12.1           | NOK | http://autobuild.buildroot.net/results/1ffdae7f29fb3663cf40a0ca44881ab8458958a3 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/8578aedf6f9dbb3b4c7905da45571db3d70bc57f |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/99a06af48208f9949b0422aedc7f7b1349ae75a8 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a748c1be7841cd980233f25fd41d330728b8f72f |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8da9bd6bbd73e1fe2ac4b4db068ee88e843fe4d7 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9df963daf4bf282ef26f44e320aec26bd1ee9374 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3197c5b48b64498ea296acc015bdac4cc344fdec |     
microblazeel |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/ee96875473da7800e3c28f48fcf734bbf3b2f4e2 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/433480ad12f14f028d42b7a5a2108a3b7913867d | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/55fcf0ced57a77c5cbb0959d6a46a718d01e2b4e | ORPH
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/0c6647e0df1c531d278c5c099a33469304ecf640 |     
   x86_64    | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/03a83b88d0f541f567e54cb2b29ed4bca58a52ad |     
  mips64el   | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/e0fad5835baaaa2d86f355385dbd68e92287e495 |     
microblazeel |         libnss-3.53.1          | NOK | http://autobuild.buildroot.net/results/4cbf4c35549a3bfba06222ba509d0263f23a3a2e |     
microblazeel |         libnss-3.53.1          | NOK | http://autobuild.buildroot.net/results/c26c7f5f3b2d33dad536df81787dfe0d67e139a3 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/9c8d32368599b4280565f665b809a91d351ec742 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/07db61efc3f01fd80409e456a3321d9fc0e48aa0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3178df6c72795a4867154efb14b4f5a7ca07b901 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/cb85e139da938088e3dc847c88f1611cfa601728 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/299e77716f907d0c10a213fa1cc914b9a55b123d | ORPH
 aarch64_be  |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/5d086d10a10ac48d484733aa1e339293b4814b56 |     
   x86_64    |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/5026575081b4b9a65207052d77acced5fe0ecbf9 | ORPH
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/58c08669a4b23fcf8c8132b3ca0421dd7ebee908 |     
 aarch64_be  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/6a4b55d55593af2ff759cd13d1930f12798f4ea4 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/7557231f3cd45abe6d9ca38c6b1beec957fdfef2 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/8a815c0b02f42744ab4813722f660d4c4c450d79 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/45d197ad043b54b9728b317422906307de71fea9 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/cf5dd69020dba7465cb66d1ebc8a9c01965997fd |     
    i586     |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/d1c21b141045a14695fb71566fa41f12c6fe3621 |     
   x86_64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/0b577a2f0582e38d33bd41a4d8e4cb7ec6eab52b |     
    i586     |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/e03fae4615ead3a28affde8e74775724ad90fedc |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/37b36f532d5c28c17954136ed4330a05abb372ee |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/125f489618b2c2a77585ca1e0ecd4c4b37a74ff9 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ba810149466dffc79822823cee5e20e9ffa8bea4 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/2dff63453e3ae07cb7e3af72bee1f219dfda3fe8 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/8a8fb16c8c80b0b1a132a5f87004ba82b6a55dc6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/40eabcea28b576307e0b9784bd1b77f78467db16 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0b0fd1748c8a0899205ae6019de706fefc2229b6 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              bitcoin-0.19.0.1 | 1 
                 ripgrep-0.8.1 | 1 
                 samba4-4.11.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3151bab2973c990ea78f93644fab4814279e9915 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c4d164552494c52a9793522f0578cbeb63cf4275 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/6877ead3163bffa9e5d612da03d3de00a8d3e9f7 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               libupnpp-0.17.2 | 1 
              supertuxkart-1.1 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b4ef04bf84972fe5c5a066023e46c9dc71bf05fa |     
    i686     |        supertuxkart-1.1        | NOK | http://autobuild.buildroot.net/results/27ec67ae7015e786cd6c08f311f687f29a49d4b0 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1928dbae0be70590e23ec91e3834013f21393b12 |     



-- 
http://autobuild.buildroot.net
