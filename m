From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Feb 2021 08:13:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-19
Message-ID: <20210220081315.C6FE2839B4@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  |  3  |  0  | 16  |
  2020.11.x  | 16  |  2  |  0  | 18  |
    master   | 124 | 49  |  1  | 174 |
     next    | 27  | 28  |  2  | 57  |

Classification of failures by reason for master
-----------------------------------------------

             libopenssl-1.1.1j | 6 
                 pixman-0.40.0 | 5 
        host-sentry-cli-1.57.0 | 4 
                  dhcpcd-9.4.0 | 3 
                libselinux-3.1 | 3 
  gobject-introspection-1.64.1 | 2 
                mono-6.12.0.90 | 2 
       python-matplotlib-3.0.3 | 2 
                rocksdb-6.13.3 | 2 
                       unknown | 2 
                    brltty-6.3 | 1 
                        bustle | 1 
                  bustle-0.8.0 | 1 
                hiawatha-10.11 | 1 
                       kmod-28 | 1 
                libshout-2.4.5 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
               protobuf-3.14.0 | 1 
                 python3-3.9.1 | 1 
                    qemu-5.2.0 | 1 
            qt5location-5.15.2 | 1 
                  quagga-1.2.4 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                  waffle-1.6.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/c1a5421f9e53ef3a7de91d96b684797e51907edb |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/364b07fc18b391677e01e50b538938a6f5e77e3c |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/dae392a3ef4c40353003e47e0c99898e23fdd1c5 | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6e1bb3ed7c6388e4ea037b869dccc807a9de6761 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/020cb7aa97e34a14a948e24d1625ef5ee19f274b |     
    or1k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/731841933a6b5c750471d07fdddffcc886c1ce27 |     
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ce1e7e3b8758a849794dde2ef2e958ae24cacf43 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7b078864bcef3b48e9e887cac5cd5123c2872da7 | ORPH
    arm      |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/9904150b8aefd47ba668a9bda01fbe10f1e1d0f0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7decb47e57633007679e079eb0265108bc7955e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3242fe96be076cf958d192fbadfa06aad7c058c6 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58645413d2b185a56c80c21af0c29ef97547364c |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e1830bb67ccd14a2dcabc10cf6358701d5c1f344 |     
  riscv64    |            kmod-28             | NOK | http://autobuild.buildroot.net/results/9df9045ac7724e18765a194b463499558b4aafd5 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/f1d8080749fdbc6cb2085965cf69b46c005039fe |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/1977dcd4eec88ae1979a67e659589b8f4196cd4d |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/3f067217741c7a2c19f13e22429a49953e7deb74 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/36dee9ac94b4b1ad64698e44b33022e58a765660 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/1e55f706e29c3c4ee17e16ff00e8e2b033c0059d |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/59e77afdd4dd7295869816e956ff9419144537d9 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/34b010e76d65cf1d79ef53207cbc00a86674e17a |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/d487a1c2a33f503a9c2ebb49fa393bda0b1714eb |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/bb704380411611fe1035473ce0efd026f58ba075 |     
   mipsel    |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/d81c0ef2f2f26f86a61d7dab34469116f4c76fcc | ORPH
    sh4      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ba2d4ff76bccee8527842d826911415dd84cfc16 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/4d89b3cb67b88fa6b0fbd6342af46d57ba904dae |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/658a04608685c266e1256eda5bef4abfaf672832 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0b9d67ff9f6cf115c1d9b511f9b67a669edc41cc |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e2a08c9bf62705c6673dedd335b1747fe8be8728 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f8b627d50c8040515073e67b6ecf1266127b9164 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/aa1e8df4e396e1e8dae55185302cf7597b0f81a0 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d8711a2b910e8d45a1aea67a816d9ed23940e473 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ed70c6e2aec378f0b31e32bc627f48bd1369300b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/de641700cc501864806a421625c031cc2821b5e2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5cec8bf33c8d67121a909463bc78c23751f61cbe |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/04369cac61d95a97af5f5b8152e21b4cec5860e9 |     
    or1k     |        protobuf-3.14.0         | NOK | http://autobuild.buildroot.net/results/38766412b3d74de33d0a4b7afe271a5f3388d70e |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2ef5648e70434719de54578b56cd8d364ade2f4a |     
 powerpc64   |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/74588f054b62bb6d235785ceca5a1e93eb0e56bb |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/71ff593826f770bd98238ad64aa5b366e9c0f07a |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/19b06ea9e1ae86d9da7624da586909d9f5d16eae |     
  riscv64    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/ee138c1c9f8feb42cda97621236cc1d494fcbfc5 | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/89f0fbc95ad8b3227ba1e824115ffcd4977902a3 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/88d72999977ab056a7303a77fc30e69859bc07b0 |     
    arm      | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/ee8e63af1c099837601786b101262c88f2aa59e9 | ORPH
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8ab9d85973611aecfc7376bbed5c69857e51e90d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/6200b5da273c4aa29a9d164ca75bddcf798c5f52 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/73fe8d8a510e40f4886c6dc10361b63c512a6f17 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d47661ceab339db552813615716db7265547e548 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
               qt5webkit-5.9.1 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/e090dadbbc7a32c4395b7e54abd6f8f49035762a | ORPH
    arm      |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/7373d7504b3bddce03ee287c5befc1dc8977b9db |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d026282738d2fd788dfb5752c6b5f7cd9994d789 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

i7z-5023138d7c35c4667c938b8... | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | i7z-5023138d7c35c4667c938b8... | NOK | http://autobuild.buildroot.net/results/0fb0d4ac1c9935c78599cd5ddafc035afbb9e84d |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/9f4325360ef180c1ca2a0384ecd1eb411be94bb2 |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 5 
              netopeer2-1.1.53 | 5 
        host-sentry-cli-1.57.0 | 3 
                elfutils-0.181 | 2 
            erlang-jiffy-1.0.6 | 2 
                        bustle | 1 
                 dc3dd-7.2.641 | 1 
             libopenssl-1.1.1i | 1 
                libselinux-3.1 | 1 
              libxcrypt-4.4.17 | 1 
                 openal-1.20.1 | 1 
package/libxcrypt/libxcrypt... | 1 
                  perl-gd-2.73 | 1 
                 pixman-0.40.0 | 1 
                 python3-3.9.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                   xlib_libICE | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |             bustle             | TIM | http://autobuild.buildroot.net/results/fee492cf21e4eadf63e7f31d647ac2a3bff991a9 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c8feda4fa33a0047ddfd31efb0099ba3e10998f3 | ORPH
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/222280e0128f61444a3f3113df936317f02a6fd2 | ORPH
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/234cfec096eeb925aa4721fee9c06419daa9a26d | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3b489c819a5f50d3df1b0dbde3601ceee777817e |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cdbb03a8d6f38620ca033747b48fcacc2946cf14 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c4608ee97c2a3d5f9b5342f8d3a78b48e8d159fe |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0c0ab311b8a0ae6bc607689635a8c3c84a477e9 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c672e8fb7fc23beaf17b3c3c1fe9b3ff37456085 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/39f3c08394be80da3dd3bba6cd8eabd2d8c0bf82 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/43db26a26b6a7293fd2b62f0779ff948b144617a |     
    mips     |        libxcrypt-4.4.17        | NOK | http://autobuild.buildroot.net/results/e9a058a8c98daf197cd9d7ac632e0cb5707d524f |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e0cdd06b14000c0ab223d8ad36c0ce6aef2fc475 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9d3b1df9b8374a5aa53a9fbe8ff9a97c57ad1b04 |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e00e05e36effd47a99bb554d67665ff4ad40a170 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0a2bd788ba3ed8f299cad4d821897ade3c474122 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4a2f3338e8b3e31b4bcc492cd6f461104c8a151b |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e9ec1b819613b27f09dcae6c2ee908448cbbf696 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/bd006579ae89e41b385405fe0cb17f1f6f7d1215 |     
   xtensa    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e8d4c28e71c05b59587032414864d3c79865b7d7 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c689a8d6f5935d2a926af6dc8d3c2046b5824a2d |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1ddd0ae7e003a6a1aa2c2f6ac6b1768563c91fb8 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6945878d13e22758ccf57863b53b7b8f95c2c846 |     
    arm      | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/f531ad4f794593172aa3c8d293730f0372696af6 |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/8babda92f8a9be175457e2dc1249bc6d093ccb55 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bf994283acb1adc8aa399bd9304920a428584a35 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/7da3e5c2de406e1b8f0ebac820f09fbc9a6d71f5 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bbd76b9a36df6680c038994971f76ab01459efaa |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b98e21fb72775519726819e0c7a9fdf8fff6db7b |     
    arm      |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/12b86ce794d77564bc27d7dade4c8654678361c0 |     


Gitlab CI results for 2021-02-19
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1040469047  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1040469211  |      



-- 
http://autobuild.buildroot.net
