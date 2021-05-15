From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 May 2021 06:03:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-14
Message-ID: <20210515060341.797CA41869@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  9  |  0  | 29  |
    master   | 95  | 56  |  0  | 151 |
     next    | 23  | 13  |  0  | 36  |

Classification of failures by reason for master
-----------------------------------------------

                libxslt-1.1.34 | 20
             host-lvm2-2.03.12 | 3 
        host-sentry-cli-1.57.0 | 3 
                  boost-1.75.0 | 2 
                   bullet-3.09 | 2 
                    ffmpeg-4.4 | 2 
                 gerbera-1.8.1 | 2 
  gobject-introspection-1.64.1 | 2 
                  lvm2-2.03.12 | 2 
                 mesa3d-21.0.3 | 2 
                    mpd-0.22.6 | 2 
                 pixman-0.40.0 | 2 
android-tools-4.2.2+git2013... | 1 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.5.2 | 1 
            libodb-mysql-2.4.0 | 1 
                  mender-2.6.0 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/9c377209d6a6092944affc6bdad2b552ea4faa53 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/11b199ee94783ff8793f4c06ba7ccee78ac07508 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/16c05bc667f2c4928bee65fbe6405e29bfe22641 |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/2b1158970fc45e9ebd4be4d726352166ed417a1f |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/f187cfbcaa762a8c774fe3dbb82b76e8aa4b7ddd |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/17bff4c9fa9bc8f3f5e3e557cc9bf02b5627f1cc | ORPH
    or1k     |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/62c9c6aebca60649bd6f635125507bf10d63fc05 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c19861ba764e0894a81e516e132d20223aa4c2bb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7500e06009a058c00033d282a335bd14dadfc5dd |     
   x86_64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/b3f45ff2b15d06b6f6a340b0984d14a789c3d9c5 |     
    arc      |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/715ec20caeacf4f82234292f069dc56a0b943e30 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/254706bce648183656c87985e1800262d82a7ee3 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f6e0c587bfaa44fd4f8e8c0836ddd4c2c559e804 | ORPH
    arm      |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/f941b18d301629391e20a53e072b76fd2932a505 | ORPH
 aarch64_be  |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/3c7b550ad309eec08fc79fa3a03199fb44553d3d | ORPH
    arm      |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/d1ff88bfc2c5a4049b4a5ea1ad992ce83967fef0 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c701fa5b6a89820fbd8b817c986f6f54e1859fa5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bcf3aebf4aba26bb014ddcbad3f992948b8e8ff7 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b9b74be7caa4314b738eb2c8f09d42c9b5a27161 |     
  aarch64    |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/f976dc26d9d370477102a2626ef39fdd44801fc7 |     
 aarch64_be  |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/089df5c94ed8d2e6bbbb2d8868985390a2aa23a4 |     
   mipsel    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/326ee08b87349be1a77baa7471bd079f0d4425c6 |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/3837c871a564878ad8b396016a8401f682c409e0 |     
powerpc64le  |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/8c118a47da5b25769682174a777db7aafe3f32fe |     
  aarch64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/937758b9edb0c2e9c1f071183c9acfc1e85df0a7 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/fd6e0d0973e25b3fafd2fc97ef8fd032d659ce56 |     
  riscv64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/f6cd183ad99bde5b40df58d6183526d9832ad284 |     
  aarch64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/47ceb8c24c9ead8a450b7fea3266f760d6b77b4f |     
    arc      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/9f9081e8f0c2b7992e6f8fdbe663af70e15c2bed |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/85d48a0789f2b4f0a899917436d9e0693df41ee9 |     
  mips64el   |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/1cf9dd8f00e2210bf46c0cc955e4c7d413094081 |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/cec769930199b12885a1e0d8c36a9691b2c35c18 |     
   x86_64    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/ebbd48b89e79d050490611fb76edea6b3cb30f75 |     
    sh4      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/fa7ab61fcedf8b38209cc1bba1f8ae3909278f36 |     
powerpc64le  |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/23997741aa88517767600cecb4ecfc9347f44595 |     
  powerpc    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/e11e536f65d88136741506eedf1b1a54509af354 |     
microblazeel |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/7925bbc9b84c64b185b4917cf0b1405480548da7 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/a1f170b9ff25b818d1f628d0a94f97e4edbdba07 |     
   xtensa    |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/209d6312b4e13ce68d36ab0930c84ebb883431e1 |     
    m68k     |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/9219d90d5c14be011765be2f01d80652a4a3b88e |     
powerpc64le  |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/f98461e5aa1441fd4255e2c54446e55c9eeb13cc | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/51faa12486ccf48d3ddc6fc8a444334de9b8f4be | ORPH
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/b5f95ec107cbe38cca28fcfa12ff6103c3062573 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/87bf6da507598ab2b1d1e50ebcaec04f102d9114 |     
  riscv64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/3302027793910d9955392b6da83f2f24e3879387 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b4beda0046fbf0e18bb853fcf718f07bc4e763fc |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/cd0eda4e0ac237a2e1c076aaa373cdb5bfbe0b04 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/e1c60aab418852b5ca150383f19a719cf9a583e5 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8b710cbb5b1fe6e9a2562ec3738c20a75f90c212 |     
    m68k     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/ae7d079448ff4d70fb769139053a954144c29b9a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e492d795db80b15f69c839bff77c6415684ccd12 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4343aca546da52d82cbc909d5af8deb7f8e704b0 |     
powerpc64le  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8dce9d5e89c1cb1be6f154a8a9f8d12537f46b4d |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6276ed48630e800be4e1eae56f85ef1ff933f017 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/31a643426c46eb52a58908857e84e0804c9e0539 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da7c0e32f8fb417cfa0355a19e21ab299686e3af |     


Classification of failures by reason for next
---------------------------------------------

kvm-unit-tests-kvm-unit-tes... | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
            docker-cli-20.10.6 | 1 
            erlang-jiffy-1.0.6 | 1 
               host-qemu-5.2.0 | 1 
             libopenh264-2.1.1 | 1 
                  lvm2-2.03.12 | 1 
                  mender-2.6.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c837284afdfa0d5f12025d7f31157ce24a225e09 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/6d9007a09c7c1fb4af101c31a8686bb364f99f34 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1c1cd4775241ee57d878cad5c978413d4b4a8736 |     
   x86_64    |       docker-cli-20.10.6       | NOK | http://autobuild.buildroot.net/results/6a93c83c379552ed43f408ff28101deaf609554b |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/671b451f61b75386244a775400876fe43e3f8e6a |     
    arm      |        host-qemu-5.2.0         | NOK | http://autobuild.buildroot.net/results/dac0e32baf8fe8c5363d1eb41b61a14b1be8d086 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/791599217c97e6e5fa1bb83a20bc12f5ff885a18 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/54496f3651e3bf69dd6ae2857d240ad448e3183f |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/0b7b9ddfed57d971215b3508441924ba945837b8 |     
   s390x     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/87ebf918fb051fef11affc2dea4b002c018c82e5 | ORPH
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/d8a55e2e59bca23038289ab3896e23e243d51296 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0281fc430dbfddbbb5391ad779c37985c980808 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/e38b7e7e1abd3ed361ab2922de80b1bbc5c9bee2 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
        glib-networking-2.66.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libtheora-1.1.1 | 1 
                mono-6.12.0.90 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/aeb755ad2b1e74eeeb0f893a93c47c309536cb60 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ad60a5a30029fabb0d5e8ece9e14bdefe27d8e6 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/576173bdede8631fb759ee253c733afe772635e4 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff6fb99bde86a1309755c6da6ed9ac6a6df38fb4 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3e3d6ece194c7529eae38e75ec16984e9a0acaff |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e238dd125dcefe264ba6b2cf680f9b5802a800bb | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9961e782358ecd74af53470e3445e84168ea2cde |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/39740a4ae850ef4d42da324e3f951df5eafa1139 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/585dc9e0f9dede89f6dae5d2902ec410570bb4e2 |     



-- 
http://autobuild.buildroot.net
