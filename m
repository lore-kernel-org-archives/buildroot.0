From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Apr 2021 05:15:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-07
Message-ID: <20210408051556.405CC60D8C@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 30  | 17  |  0  | 47  |
    master   | 161 | 55  |  1  | 217 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                      iwd-1.12 | 6 
                  zeromq-4.3.4 | 4 
                 dc3dd-7.2.641 | 3 
                rocksdb-6.13.3 | 3 
  gobject-introspection-1.64.1 | 2 
                  monkey-1.6.9 | 2 
                mono-6.12.0.90 | 2 
                 pixman-0.40.0 | 2 
                 samba4-4.14.2 | 2 
                      tio-1.32 | 2 
                       unknown | 2 
  binutils-arc-2020.09-release | 1 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                directfb-1.7.7 | 1 
                   gvfs-1.44.1 | 1 
             libopenh264-2.1.1 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.4 | 1 
             openjdk-14.0.2+12 | 1 
                 openmpi-4.0.0 | 1 
            python-click-7.1.2 | 1 
          python-hiredis-2.0.0 | 1 
                   python-lxml | 1 
                    ruby-3.0.0 | 1 
                   sdl2-2.0.14 | 1 
               valgrind-3.17.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/dc2f259b81e23460651a0e70a7a379ed39edb190 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/1ddb086b6ced8a1fcca47272a6f0cedd03183a8e |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ac375c6a295105ace2ba98b921b7cf8b5c669868 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/920b399f99820f356076c30951769d6ea5e6652b | ORPH
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/58feb5f04db7e53630ce24da60e19c714748bd69 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8b006269653355a532350e89b157a32539079ebe | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/e10107c765082fd3504c000eae5da01a8ba589c8 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a3e168990694977534164d9175a63de1e0b5b562 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/3a5ea556fea34bd912a59f21fd878de2d475d22f | ORPH
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/979b645e7733950d1695e4a9c350d7694a541254 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ac22418dbffd74cc9e4088235cdd7a71065fb028 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a0aa90791095d506e9b88fa265bbd78c137d9052 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/93a36728675ec85520a3a4696002f8eb7747686f |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4759eebbe1c7aaa4ad75f3504c51b7c4b0dc371c |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6bdaf33569a34a476ca5754a7f138722978c17e4 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc47680d95baa21fa10c2fa579278c7d8e63563c |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ebbfa6f45b4f0842e5d0ce085f813e2fbcb9f160 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a4bc920c1e9e17bbf8a7004517444d140e45ffaa |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e353614477197f6799d2e07521428e939d8ed919 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8e7be9b21ca86c7a99b01c29710688d615808dbd |     
 powerpc64   |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/cf062ad1804a5dce53954bda163f5086e2688bfe |     
    arc      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/7da50c61628bd6eb9dff47575233df725eb625f2 |     
    arm      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/9a9dbab5337b320ea030b448004b5b3d46d44643 |     
    arc      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/c81d19cf2d0fb3223a5a3fc1e03e36192d9fa140 |     
    arc      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/d76f30fdd3acad0ac1aee2a6f0f13bb2f593c103 |     
   nios2     |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/173afb457b75dd82933a3dc115c2ffecc0c2ae8e |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/fc815695ce75c3e6ba7c3aa8d30f820dc1c22edd |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5351754e55095738f4ef637f82da618836d9080e | ORPH
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ed1aa52e6edc970cab8df65caac89d9c7628fcd4 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f872fc2fc8e561a266578c8c96c7ef695555b581 | ORPH
  riscv32    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/72d2f57bfc31c5c2719678eacf010377cc7f6fe5 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9a18983b3bb9df5e8062cad3ec6378ca31077b8a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a9f958628adf4a41d262728ccd0d184d6a07e07e |     
  aarch64    |       openjdk-14.0.2+12        | NOK | http://autobuild.buildroot.net/results/f151298a71158f9f6fc029468d3f46c0ec04e105 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/918fcff62f0dfe4b6e33a39e21ed83c750674aff | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/162b866b3559018a086d4e4aa7ab9399ceeabd05 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e0ebc9c0e51d46abd33806a20ce19ee3d7d463a5 |     
 aarch64_be  |       python-click-7.1.2       | NOK | http://autobuild.buildroot.net/results/8684553bd1f7c22fc2a853872f354bc74385fa31 |     
    arm      |      python-hiredis-2.0.0      | NOK | http://autobuild.buildroot.net/results/5e007fb8dd0bdfcca59c876027aad1f6641c407c |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/71c6d93afd4ecceb8aed3dfaa02e73f3492c3a89 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/eaf613ad2d4b5b9926c673b63c12f6d2c4ef81ea |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/32c0976f566258a77f2289c01a4578d152ea552f |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9512f0d2f83647ee869b2ee3c24d21d3aec4ef94 |     
    sh4      |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/bc7042b289c52c94e2059958f5877952e221f063 |     
    arc      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/8ba46a89c92f0ad588cf6bd83775919d09e06d54 |     
  powerpc    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/34db91e930e47505f6b09187e9ecf66f3d330894 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/b65976ed03a19011a51a2c48b4c664d8264f1454 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1221e882ddc7e7f51acf8cbc83a901f1582182ac |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5f88adc0d9f7baa76c91150e44a32478c455f0d7 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/8c70e69aee129a18122a20e7826357c8205a01e4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8ac43d6cfd0ab5ec849222386deafae1bd360437 |     
   x86_64    |        valgrind-3.17.0         | NOK | http://autobuild.buildroot.net/results/6cdac62dc831cac6b4b363574eb02b4a33991bcf | ORPH
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/286c0f337d275954b4300d194f0118bc6aafb07f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/aff16e85aff232a36c4bf53dfa7591f831e400cc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f349ac9e5933830f5f1d5dcdd6c57ef1861cdb35 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3e9a9cc9e22908576064760838ec0c96a7cc51f2 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                 openmpi-4.0.0 | 2 
                  zeromq-4.3.4 | 2 
             libopenh264-2.1.1 | 1 
                  mender-2.3.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
             util-linux-2.36.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8e0b88adf9fa91b1b464cb5b1db8108da7ee1c4 |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/33a7ba9c7d94afb296144672f62401eab961e5e0 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7f667e6cbfa159b03f99ee4013ca89fdaff3fb7f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/165a7418c931ceabba2ff3f86d233d419c3e1a86 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5fbc331f6395e28bf7c841ad30c3f605c1e6ef4 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/fd732c1679312f9d6d3f3a460a5451688a749f4c |     
    i586     |          mender-2.3.0          | NOK | http://autobuild.buildroot.net/results/b9259a14b2e6fd39505f01abf70776291c489bcb |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/def7781aea61208477f7ea8e5e65f07318b10195 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/2bfe2dd17a3004995fe0884a1c75cb6f4a12b3fe | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1ef96fd658051d88221782555b35989c2bd74975 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0ceff8a81980cb392cbab7356bed962dd26a4085 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/65d747eedc04fc3f322d93e51a0f50dc0afac1c7 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/fd27403d186dea54a9951c06d6b485bb3d53406c |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/8cf3249c5d585d2d4334267caa118a30ca1e9249 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/add0addca91e176ab443e8fa4725efbb3e985ce3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fcc497ceb1193fe5b7e16724b604a4b47acd64a1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9049295f265419bf60e7e58e0a6def35200362d7 |     


Gitlab CI results for 2021-04-07
================================

Detail of defconfig failures for 2020.02.12
-------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426578  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426579  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426583  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426585  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426650  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1153426716  |      



-- 
http://autobuild.buildroot.net
