From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Apr 2021 04:46:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-16
Message-ID: <20210417044646.D943940139@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 27  |  9  |  0  | 36  |
    master   | 121 | 55  |  0  | 176 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 14
              skalibs-2.10.0.2 | 6 
                rocksdb-6.13.3 | 4 
                  monkey-1.6.9 | 3 
                       unknown | 3 
                  boost-1.75.0 | 2 
               capnproto-0.8.0 | 2 
  gobject-introspection-1.64.1 | 2 
        host-sentry-cli-1.57.0 | 2 
                mono-6.12.0.90 | 2 
                  zeromq-4.3.4 | 2 
  binutils-arc-2020.09-release | 1 
canfestival-7740ac6fdedc23e... | 1 
                    ffmpeg-4.4 | 1 
                 gerbera-1.6.4 | 1 
                libkcapi-1.1.5 | 1 
             libopenh264-2.1.1 | 1 
libplatform-a7cd0d5780ed80a... | 1 
                  mender-2.5.0 | 1 
              netopeer2-1.1.70 | 1 
               protozero-1.7.0 | 1 
                 samba4-4.14.2 | 1 
sdl_mixer-d1725fcb7c4e987ae... | 1 
yavta-583bedefc2a247d2cfd32... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/efe89261c27f6f1305276bcc21d2a79b6f0a4591 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/942bcb4ea7605f9387aadc5cbf0d7d0ed2d9e1e8 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/93df65448596d2f881d3c0c32263e7c957d40af6 |     
    arm      | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a6660a34eade77cfcaa27d92bc05449765a498b7 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8d5a1c39516d490096eb5264c7559691aa2db390 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e7e0f9d09167a8a3f87ca0bfbc5e0f5a13229974 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5de050158af2664e5f439629e641126adef067bb |     
    or1k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/69b4c957344fbc3ba552fcb4e201f3f66d6a6638 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/37b35db733ca3f19228ae75c63b410a6e4638916 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/08ba470cac91d584f6d30c930663b52996b65a3a | ORPH
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c665192f1adb687884eb0c7618cee51f637ffd4d |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/758a88fb4b8c932944ec20598077a5a23d24280d |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/fff8176476b10e98fede2eac1e9d4eff1a2dd21b | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/e9a000a0e3d9fdebec31d24326b7efd9ce2ccbea |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/d27411e651be4abc64e024e1c42e502162383113 |     
   x86_64    |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/ace31e31bf585c8d6cb9389da95b47e48ac525f6 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/09ef0a944321d58e7ae7ac427b802c17f6707fc1 | ORPH
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/502cfa9617ad26326b937b9378547da270fb20bc | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/46bd19fb31aa90f3182b198f59c448388846162f | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/315e006cad49df811ea671288828a816bc0e075a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e1545f2f83598d5a568d772702abafbe13d0ab69 |     
  powerpc    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/86ef6dee74b645682354ab26f59d0b21721a3779 |     
  powerpc    |        protozero-1.7.0         | NOK | http://autobuild.buildroot.net/results/1cd24b757d87b963c70bc7ff927c6d983d0b142a |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e05f7b750b816fdb60bb512eb8f8529a42a19fee |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9d6f18530a142a903e83d21f490ac419220b6830 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fd626ef0031595cf910ee9f9a8e9daa1a82ba63e |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1f2a929b9f4ac595992ecb1874879edffd30dfb4 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/c5895c8a21119d2fad88a2c6c1d6c6b7be83f159 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/a67b7b5bcc6dd27d582b970c47a6aa5fd44aa981 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0aa6117270f4b5d31311b1929425943c2b900d53 |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0d5cd18e893490d8ee745cff788075aff5cae036 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/381319eeae3d43b2b5d27ef247a1ed0e0855e807 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/f191fdcbf3cccc8147e90fe44f544c60d14153eb |     
   s390x     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5f6b2b0eea332e6a242ccbffe40fd3065b654233 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/416a4ad982cbaa78b53ac16eb6a819da8d938a3b |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6c5c02ec75d295076d3defd881f2b3d4dbcea58d |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/46e027f2b1b1d501ad00d38e08bc57c5c30f79f7 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/90d17a184309c274d849eb38f9473390f646e962 |     
   sparc     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/27df6642e9a8cfb870910ec5a68be592d8857ce1 |     
  mips64el   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/db4891b2c34fba80d22858313ec21c63edadbee6 |     
    mips     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0f7cf6aa3c565c6f0753f4e8a1fbbbfa67e5a6be |     
    arc      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/c21601f8c924c29a47b5db7f1be33f674c48a229 |     
    arc      | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/1c7241469928d4cd526135781f03027a0789989d | ORPH
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/79239eb504560808363d1e7acc7e5a5dfbafaaaa |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/1a00a5cf8456d958319483ea5c0de9448cbd4cbc |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/3f758f6c782bb79b13b067ed133eeb19e66c880f |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/c8fdada938be607eec6362d77ccaf44d08e54dc1 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/dc86de5eafd80f78c679a51d782407bde9775fb6 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/90a6f0960a6b77becff8bda5b4809123a2219893 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/44c8e1bcafaffe9e31200b241d3ad009189e9b9f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b4c9a7b969a1f4dfe4e78636436a82e257b92220 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/69a4e52141da8c2b03cc019c5864ec13b50add8c |     
powerpc64le  | yavta-583bedefc2a247d2cfd32... | NOK | http://autobuild.buildroot.net/results/aa4abb496cf8bddeba5f66064563293092a1b993 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a1bf5898db712c73eb958610d26b9a9d80430965 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/30fcf7dd93859d14f32a77a8f2bfc60c64ba8608 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
        glib-networking-2.66.0 | 1 
           heirloom-mailx-12.5 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openal-1.20.1 | 1 
                rocksdb-6.13.3 | 1 
                 samba4-4.14.2 | 1 
             util-linux-2.36.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2848767311458f86c17e9001408149b5e20b9200 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/b13b426eae28a4fc0432240697b0869fd60ef7b7 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/37519db35d8196b322af048d53111743a44d1c83 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cf2b62d1be51a2a86434a2701a6b5d48c06b7c21 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/f68da6627294151ce7150198e4b37796858f93c3 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f9574a90c5537be4008149dccbd21b0eecb2a202 |     
    i686     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/cf23b29c28a4c9734a95a08e4fec035a36baaed2 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/e6fc903f95e19d89f12c496dd7674c333fdabb09 | ORPH
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/812538e60158ce20808bd6ad2df8489ee48fd570 |     



-- 
http://autobuild.buildroot.net
