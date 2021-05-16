From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 May 2021 05:46:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-15
Message-ID: <20210516054607.156814042E@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  | 11  |  0  | 35  |
    master   | 86  | 48  |  0  | 134 |
     next    | 19  |  8  |  0  | 27  |

Classification of failures by reason for master
-----------------------------------------------

                libxslt-1.1.34 | 16
        host-sentry-cli-1.57.0 | 6 
                  lvm2-2.03.12 | 5 
                 gerbera-1.8.1 | 3 
               pipewire-0.3.26 | 3 
                       unknown | 2 
                  boost-1.75.0 | 1 
                   bullet-3.09 | 1 
                 dc3dd-7.2.641 | 1 
                    ffmpeg-4.4 | 1 
                haproxy-2.2.14 | 1 
             host-lvm2-2.03.12 | 1 
               host-qemu-5.2.0 | 1 
                   httping-2.5 | 1 
                  mender-2.6.0 | 1 
                 mesa3d-21.0.3 | 1 
              netopeer2-1.1.70 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/d185e8e1ef6357cafbe58c3067996b470b6bb2e7 |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/1209f319b088f0204ab630a109a14f57d34c72e8 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c1959ca526c98f72a32fe41195ca158a86da43b1 | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c7c196bae15c2ed2db7282e121f33669de7da445 |     
    arc      |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/bbd38eb942d758f3a3fcc6874cc950d2ef458d90 |     
  riscv64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/4537e94eb2a94ca04218382f7bf9fb64a429b1de |     
    arm      |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/e9b0e6a809814c5a7e2c9cc53fb80dd0c47fa690 |     
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/6403170a5aea5f54decd3332ddc0ff5f144d6aee |     
  aarch64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/151db062078ec7c8400fe82d502463111e509528 | ORPH
   nios2     |        host-qemu-5.2.0         | NOK | http://autobuild.buildroot.net/results/1777bccc6653e1a5437a58dfed73499feebbaabf |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/26af879f0953e22f0311c0b5455e6afc08aa6ea9 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3c0d685c16c80c252166e92d6c50ca5c2ae1ee94 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d9e68f81bc9bfbdc011f07cfc05a8b5f5323fdf3 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/961126edf081493f1f394e8a8ad9577b07ab0cfa |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7323af73a5ee0f6a967bcda9bd938a3cbd2c969a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be1421c54e0cb2759691163409fb00207431f2aa |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/dba14707dbd831e1c7d6ebd4fe077b524e5b1efb |     
   sparc     |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/5d8dfcf88567e62441e3897e3eeb9cecea66faa1 |     
microblazeel |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/234c021f63ff56bc61528784efb448fd67cfa0fe |     
microblazeel |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/e5158a575ba3d985eea2838ec844583e9105c013 |     
    m68k     |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/b5c3842046ab7f8116d7dc764a8ca8113eeeaf95 |     
  sparc64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/190e78bf54d801a9d3529cdae6ff5083d954d185 |     
    i686     |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/49d98ac4c4c9100cd3074bc9d14d8df6fb9898ec |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/f9d78f3124b63b8bea350b82a44143a7505e6e65 |     
    arc      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/8195bd5daea768bd3ece50de8abb7e4b695b85fa |     
   mipsel    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/ec9763f06c1e4aecb0722d0dbc8dd5f41eb03b07 |     
powerpc64le  |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/d21b87c201c866238aba3d1743c1d92142afd089 |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/10da592f6a51d97fcfb4f0962820fa357b9c2bce |     
  riscv64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/443e378275ae3e52d84b6ab6b40cda7608f17bba |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/2dd0a1cf896c216f362c97c6f811f65b0551295e |     
    arc      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/76b539f915908cad97229a9167055f0c35f9b900 |     
    arc      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/0b9b5313b326315a7f8527caa4cf0d930edb00c3 |     
    arc      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/11924d0e3634b684c1bac9bde7e848812b2aac0c |     
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/47d2b34aa175a982041b2f2c870abe599927a1f8 | ORPH
  aarch64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/f44ae5369d4aa3c68ba38551e7123a78330b8d7b | ORPH
   sparc     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/753ef4001b0e4415a01db6bdc57e3e9520e8daaa | ORPH
    i586     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/40b738790dc6c137d9a13d2ffb1679195033c722 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/495a82676c47b92831f76bad54f91173d365ff91 | ORPH
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/4eafa3805e6c9c5a0bd8c77323945a6fc0560c7d |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/f16ac020970fe7d404089d59afa9cedddeaf6bf7 |     
  riscv64    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/522dbafc6225e662bfc3319ff28d28d06b55abe5 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/5cc2b8b92b18d0ea2a6fb35036dc9e6459077f47 |     
  riscv64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/5307419b92a510aeb60cb0b936dc78061244af4e |     
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/f368479cf481bc7656afe8b55d5e1ac1b0bf8ea8 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/cbeca71df2901feec02e4799fe7b1afd01eda244 |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/1fa9aaf60e4fb30266d5ee8f67cc7881a39761b5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/112171473beb674f576413a8fd9fc0ed11f863ed |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f5965e949fcf8a304f92cb20f426c9b4ae7c15aa |     


Classification of failures by reason for next
---------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                    ffmpeg-4.4 | 2 
  gobject-introspection-1.64.1 | 1 
                    mpd-0.22.6 | 1 
              netopeer2-1.1.70 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d45826a9c6fa650dabd00ea8cd7f61ee4eb47223 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e564f919ae81f411dabd0a5d7d2728476ece58fa |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/4b3c6ce56a310bc8d2b36d31a3223c226be83dd5 | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da38518f99ee3214d9be6e923009be706e2781d6 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/98ce6a558ebeb58f20e0ad09e653edd4cc87dffa |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eb91d6352097ca87215cbabc4cb902e200cd8d4a |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c49848db1253c4c6be31d579bb7036607cb9a93c |     
   xtensa    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/64286a084ac3a832ec1faee22f51d8f47f11bc31 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                libxslt-1.1.34 | 7 
                 dmalloc-5.5.2 | 1 
                   eigen-3.3.7 | 1 
  gobject-introspection-1.64.1 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/bff5920c90532a30123275c9c12bf555ed205f02 | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/05642abdb6805070f7092ed450d1011e119d6db8 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/195221df1806bcb23d6614ea520a6d8f68937aa7 | ORPH
  aarch64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/fc5f39ad26d6b7fbd2ef62428a83645ea8ac3b5c |     
  mips64el   |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/6ad95330a1e70b0f9db8070638c955502bc3e373 |     
    sh4      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/b1cf2242094850d79715757416dfbfd78985e1bc |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/609aa2259ccf767e643e399dd6fa01380e22e2e0 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/a9a2c80aa470f9c330a5a803af754a8dbfd8380d |     
  aarch64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/c66e86008e0762f0094ae26c8812c3b6d3291a0c |     
   xtensa    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/e5cab3357ac967a1e12d3471fa21957dcf4af584 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1fefcc1a119495daa684d08b2c92c21e2359cf76 |     



-- 
http://autobuild.buildroot.net
