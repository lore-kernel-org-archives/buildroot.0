From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Aug 2020 07:46:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-09
Message-ID: <20200810074646.3ADB986447@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  4  |  0  | 24  |
  2020.05.x  | 24  | 13  |  0  | 37  |
    master   | 113 | 124 |  0  | 237 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

librtlsdr-d794155ba65796a76... | 26
dump1090-bff92c4ad772a0a8d4... | 14
        libabseil-cpp-20200225 | 14
    host-mender-artifact-3.4.0 | 7 
              keepalived-2.1.4 | 7 
               domoticz-2020.1 | 6 
               libglib2-2.64.4 | 5 
dvb-apps-3d43b280298c39a67d... | 4 
                       unknown | 4 
          fuse-overlayfs-1.1.2 | 3 
               opencv-2.4.13.7 | 3 
               apcupsd-3.14.14 | 2 
                  assimp-5.0.1 | 2 
                     avahi-0.8 | 2 
               host-go-1.13.14 | 2 
              ibm-sw-tpm2-1563 | 2 
             kismet-2016-07-R1 | 2 
                qt5base-5.15.0 | 2 
               apparmor-2.13.4 | 1 
atest-895b0183a89c15f5e2305... | 1 
              bitcoin-0.19.0.1 | 1 
                   eigen-3.3.7 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-systemd-246 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                  monkey-1.6.9 | 1 
                 openal-1.19.1 | 1 
                 opencv3-3.4.9 | 1 
                    strace-5.7 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/7d732114633248a2dcc7faa42424c4a6fbada84d |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6ab4e8021aad13bc153a6c22e87a77bf2bdc21e0 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/d2f8642e169658aef61f4dd4e2078cdfed704649 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/dc36b5790f8f4383a8c2202ec1864fad0795209e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/67721aac3f9325c6783d6fc8d7c95a71c7cc3d1d |     
    arm      | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/887c466b3703449239eedaf86f3f4dd2a2dc8afe |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/303db92de575b5ad611406cfaf15ee5df852cdd7 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e81eb5807aab0075dc5369f269b90c139d4b4a16 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/435fccfc7dc49ccb0c89338ecc77cc396a1d257e |     
 powerpc64   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/26f88c3361b4be9ea86c2b9feff6213521079678 |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/48e0b204aa298f9886d58459ac03c3acff52276c |     
  riscv32    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/44f081c33a327b4569d77cfa16868184fcd31e9d |     
    sh4      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/8ecee2fb5dbd50262a79e39708dcad4f3cd11d67 |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e73018dfef555c1f5788c84eaa416fc779bb21df |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/b7cc451a886a31e4c5e43108174727d04c9a8087 |     
  powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/96700a4c8cfeddf39e82edd1e6fb9c54a9208322 |     
    arc      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/384e24de400594f6fe18d71d483a987d5cfc9a62 |     
    m68k     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/0a498179bae30bde6a4313bee056753a0a155473 |     
    arm      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/b4cdcb59cc61c51c024197a64865ad4b60023d0c |     
    arc      | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/2277dbb788a9dc3ec1fc6c4e6dbdecb3616475ee |     
  powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/8d63b7088c956517b5da106f02570c2aebf60c11 |     
   nios2     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/09ba2e4c33921779ec0beedec5765f94cdb1cbae |     
   xtensa    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/5610d731ad2e8c77f9a67fa6c6b77b30a429d318 |     
   x86_64    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/745e56900e4fd64a5876ce41cbb2456d8645c2a0 |     
   nios2     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/673af05dcccc4773fc7535f34fb258f28b62d4d7 |     
   nios2     | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/3ffb48aae76f8b7b26aa909535c64f6077023ad6 |     
  powerpc    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/510900b9c2061dea6e87de72cf59bc0600ddd1c0 |     
   xtensa    | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/5c750951539a08fc1d9da6361caf2527898e6d4a |     
 aarch64_be  | dump1090-bff92c4ad772a0a8d4... | NOK | http://autobuild.buildroot.net/results/60dcbe34d59fa2325c5c6116d15776482abc5127 |     
 aarch64_be  | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/b32c5bd1a428f5972d7fd1e43b5de5a40a4d7591 |     
    m68k     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/4776e63fe6caa70323d3fa1d31d56c069f626f9a |     
   x86_64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/649dd75b79935ed5f53edba3e10f859355307470 |     
    sh4      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/798b5e80bc0a2d54d6e942b4f065b4e5cfbb95fa |     
    m68k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/455c676fad978d2be72896afdc32f9c1d6f0286e |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/901c91874192102e89a9bfbf1d416c84dfc0d183 |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/28a0064c59032df07e35a1394b6720a40b63de3b |     
   xtensa    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/e74b93e5ab71f7a3200dec4d901e888b24234e3a |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/63ea05bf840a67e530899ff5de748a8955e5b51c |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b53c487f177393dbb83f88cc2158ea08bb36312d |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/a92c52e049788d0f77b7ae18a7ef7ff97ae35eb0 |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/bdca5e2fcd45de959b564f07ef7e2b474fae7801 |     
    arc      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/4995d7d2f68a84ca9d00015dd5e36cc99c81052d |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/a3445c2a6f6afc73f08e0492d70cc8c6267ec8ce |     
    mips     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/62e7c2150e8e9e3545e94e55057e4617a05f59d1 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/e54350fbe7e684594553a3985acc206c404c496b |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/7699c44110abc9b5f90d052c656ac8c1e5bac754 |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/6083834f661606a89929c7834bd158c216dcb07f |     
   x86_64    |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/79ad09bde8f7c9c11d76e06d5a6448b270dac3a0 |     
  sparc64    |        host-systemd-246        | NOK | http://autobuild.buildroot.net/results/91bac1611ea4040b9c11576fc594f6e71deee3c9 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/58108ab8024ad83da3541ced371d2cd618fa115f |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/29421101ed118a73898d54da41719ad000a23dbf |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/711bbbf9c228bf98c212b80a54810dec3b32c71f |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/1b2e3e8ca79ef10b7feac7c5db6f30db1da8e7bc |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d0c89ea95b852d6ef20b307bb31039c47301e463 |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d50afdd7106910f6b161cf76c7208b4176eca6c8 |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/5de80496fb98201ec10edfee3ae770dfa5181778 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/11e732f1b6837c137b1359a4c75ac5d76de302bf |     
  mips64el   |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/7f20fa33e2c1523c93052b4da419ef7788b70b8b |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ec7bf9b43dcf11e1d39f416c8179b629e192e74e | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3ae76ad793263e21210d8b55091225d63e2a4eea | ORPH
   sparc     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/3326a0a8b8ecc2dd740a3212ee49995e12ba410e |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/2477890a16cc67ba9e0686e6f0718da3cdbdf7b0 |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/bf8f206a6f64e37281a5d18e14684a8560aa258d |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/42906ef906ae029cbababe56137e1af096ec9c23 |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/472055d23ba6c1bb4994b20db1c00ec1b87cd22a |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/c3fca9d6272ddcd920f7a4238bcaf5c0ea2fd549 |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/11ba4bd0385bd7463e6bc002681b7953a298ab4a |     
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/ead7fb0c59fff5c72eefa0bc75d460d24735f282 |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/8dd0b885c1c00ab2f67a77d610b98d4d608dddc7 |     
  riscv32    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/f132538434ff79f60cf27d448651e50a492900e8 |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/195584896a84f3a9337434f9e25edf8a02574686 |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/81a8e337b0af726faaf22fa725a87c288f67b895 |     
microblazeel |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/9047400c1b0bec95b1bc48d5c01d1459f853df1e |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/38702157c398a350f9dd9f93cd1bd6871e257466 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/cf66f91607ec9fc82fc456eb23a477f341e12d99 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/53c58b80ab79b759ad3b990b6ad9cf6e0ccb8c77 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/a4c75ae4b5644609dbddb6adfd1a9c091fbc8013 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/a62c7e6c6f74f2bfc41f1f80eda68ac02ddf2abd |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/89d25206315efae85184fc814271b64ca9d02368 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/8a6ade45637e8c0dedf86c30d6ff27b799cf2ed9 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d6a92d7cfa29d6449da9ee6d6ed443f86d903378 |     
   nios2     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/47833d28ddb9fda1fbbc358a5a428dd9caf6c803 |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/63a15e4bb076d8a6ebb45aa2e15a0519edc1e6ca |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d64e91e5e03f31baca3e4ace7c0543ad30b710cd |     
  riscv32    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/7b02c5c13aaca6bccb4675537f61cfe65631e6b3 |     
   mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/6d5330281f739c1233a00dc229ff687ef7255164 |     
   x86_64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/a7ff641e91aa598e29498562a262783bdb73bbe0 |     
powerpc64le  | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/b0c5ca1c660baf37745984d5e25c1c0404371a36 |     
    m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/e1df401c0c88195eb429d07d7adf0cf40ba93165 |     
  powerpc    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/e85ed29b2a162fa3fcb0dcfc228227000a40e948 |     
  aarch64    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/783140fe13e7c6856c00936eb134e60e3d242121 |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/d31aa29d144d5402ce4eb33e4c534bfb5a67af0e |     
    i586     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/affee936410b064a4270abc97f45dfa2363673be |     
   mipsel    | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/ace58d298ef703979d9743731edf83b40233224a |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/99d1a9e5ce1581e29e6d54992ff851f96cb368c6 |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/2e6202b1342825ca48e29c3eb4cd5156f7715f4a |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/8bbaf0ba4482dacfc340998144d07766a595eefb |     
    m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/24cb7a93d3fbf622d8faa842b79fd64c96be6b70 |     
  mips64el   | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/2fb7fdbbc9e6bc6b6280fd1292213d80c4916db6 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/2c144bee18499f289079d34ea2dc0a1cc7e56bfe |     
microblazeel | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/fb4bfd19bc46e613992a54fdeb0dcce2d63fc585 |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/3923a88292350f9cc9b7240e939639b770206013 |     
    arc      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/78e3814c218c17052e86c527a9ccdb3f6b86beaa |     
    m68k     | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/a83faf395f53484d0e6d9d4fb56637cef26b28fa |     
    arm      | librtlsdr-d794155ba65796a76... | NOK | http://autobuild.buildroot.net/results/da17ccf604cd82654aab9a5ff91f7ff20b9e4781 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/8868f6eee1297d5f30a5b132efc2c07f9165d758 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/a52c24e708cf8bd80c721080397a1daee4c11295 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ea2fdcdc162a4d50e228b396d4a94407ca333f64 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/2f9cd5574967558ceed2039f400861e5d62e6ea6 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/00ecd56ef2ed79d5acac39b8f93ed6b7c63deefa | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/481b1125c330e66cf4ddb5296479629605c226f7 |     
    arm      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/940ed77018d5916fbfe5f78c4a5f00a76deab351 |     
    arc      |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/05f3f5f3de63aaccba92fb7f0144d3ce3c12d668 |     
   x86_64    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/344e8b88fe33a13b82384b674552b5ce24ecff16 |     
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/320de1038a8789649ef67759dd8ea130d7bda503 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/388c1204e091b175b89417a3238ce2c12f960928 |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5361a5ae231b5234cc2a021de7279c889ef0df9c |     
  aarch64    |           strace-5.7           | NOK | http://autobuild.buildroot.net/results/79a8132b6283d85ef34f74d8e453a429346199a3 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bdb5a9bed075c08fa8a0a0ef07af41a7ba8c75c4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/79cadf909bb27aaa4c8a1ec386c443e25cd87e04 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5c3555777de06c6d05f637bc7b66dc8f331c6df7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/12a4f90fdff75389813d91038b7901345c8cf21a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f3b7d37010fdfcae2b23f9b0d2a6a803ae1a2271 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b12b3cce85a5d59a707cbada501d89e804687893 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  luajit-2.1.2 | 2 
                 augeas-1.12.0 | 1 
dvb-apps-3d43b280298c39a67d... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/0634ab882dd65162aad7c8581b9e74c80bf64e36 |     
    arc      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/be7aa059c6eb2801dcb68614c626ef25df020236 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8a8408c5d71b93224fc656c3c4e8c88f3246e45e |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/85e6f1b963b0af36199b92af8c7574012d351ec3 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

dvb-apps-3d43b280298c39a67d... | 4 
                     avahi-0.8 | 2 
           host-nodejs-12.18.0 | 2 
                qt5base-5.14.2 | 2 
               apcupsd-3.14.14 | 1 
                   mpd-0.21.22 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fc9d238591562489a0c72131deafb10a30d32dfc |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/dccbe304ed61515239045037aaddb8bc2ae916b5 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d941c7a95097307a2bf3e58036f2ab3ca70d6bc4 | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/950081ef7e3be17f3877edd893007311503eb8d2 |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c1515d1c089dce467e2d98d9be2e8b30d66182e5 |     
   sparc     | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2e48deb9bc7d3c5f910328b299209062448f0538 |     
  powerpc    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/8048c7ec1eabd62cd78959b3854c6aa184b01d49 |     
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/088957bf1dd3e006128d7c7d11140a9c861e58a5 |     
  aarch64    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/22b8884814d6f7740045530ac75060f9e94dcfa5 |     
    arm      |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/3652a8548021fa4ccbe79ea676ccfb99c7ea4830 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6c19d0a49b241fbc0d656929210b77b6f366a1f9 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4485e2ef0c878fd6249b4fe87c6822f5a63efad7 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/09cadc20d4173d59b1a4e4c27edea8c9b42463ff |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  DISTRO  | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.7_SP3      |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200528     | 20200717     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r41   |     
                        apache |  DISTRO  | https://release-monitoring.org/project/01335 | 2.4.43       | 2.4.46       |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/07317 | 0.7.0-1      | 0.7.1        |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.10.0      | 17.6.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.37.90      |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.37.90      |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_02_20... | 1.0.0-pre... |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.2       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.2.0        | 1.2.1        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.65         | 1.68         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.5.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.20      | 9.17.3       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.33.1       | 2.35         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.6.4        | 3.7.1        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.1       |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.73.0       | 1.74.0.beta1 |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-alpha1 |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.14.0       | 2.15.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.7          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.7.5        | 0.8.0        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.10       | 3.7.11       | ORPH
                        cgilua |  DISTRO  | https://release-monitoring.org/project/58440 | 5.2.1-1      | 6.0.2-0      |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.15.1       | 0.15.2       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.1          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.2.3        |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.18.1       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11       | 0.5.11.1     | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.6        | 1.6.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.18      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.81         | 2.82         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.11     | 19.03.13-... |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.26.2       |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.4.0-rc.0   |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.11     | 19.03.13-... |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.8.19       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.1       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.1        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.180        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.4       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.17       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.5        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.8        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.25       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.10       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.37       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.22       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.37       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.8        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.20       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.43       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.9        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.7        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.8        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.7          | 5.8          |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/94441 | 1.0.3        | 1.0.4        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.21         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.3        | 2.1.4        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 7.0.2        | 7.0.3        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.14.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/00834 | 4.2          | 5.0          |     
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/21436 | 1.10.3       | 1.10.4       |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.07.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.1.1        | 2.1.4        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.6.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.28.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.64.3       | 2.65.90      | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.14      | 1.14.7       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.21         |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.0        | 0.2.2        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 5.4.0        | 5.5.0        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.30.2       | 1.31.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.37.2       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.2       | 1.17.2       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.2       | 1.17.2       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.2       | 1.17.2       |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.2       | 1.17.2       |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.2       | 1.17.2       |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.2       | 1.17.2       |     
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.16.2       | 1.17.2       |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.2       | 1.17.2       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.1       | 0.7.0        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.2       | 1.17.2       |     
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.2       | 1.17.2       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.7.90       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.2.3        | 1.2.4        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.45.90      | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.2.0        | 2.2.2        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.6.4        | 2.7.0        | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.10        | 10.11        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/01318 | 0.14.1       | 1.0.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.338        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1637         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.11         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-26    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.7.0        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.2.3       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.2.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.1       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.490        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.7.0        | 5.8.0        |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.4        | 1.8.5        | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.6.0        | 1.7.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.3       | 0.10.4       |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.3          | 1.4          |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.4        | 2.0.5        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.14         | 0.15         |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.8.0        | 3.9.1        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.3.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.1.5        |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.8-Leia    | 19.0a1-Ma... |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 3.0.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 3.0.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 3.0.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 3.0.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 7.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.6-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 7.1.1-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.3.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 6.0.1-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.19-Leia | 7.0.5-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.21-Leia  | 6.0.5-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 6.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.1.1-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.2-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.1-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.2-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.2-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.2-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.2.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.4.2-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.2-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.2-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.3-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.4.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.3.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.1.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.2.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.2.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 562          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                       libaacs |  DISTRO  | https://release-monitoring.org/project/05562 | 0.10.0       | 0.11.0       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20200225     | 20200225.2   |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.42         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.7        | 6.0.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.9        | 1.0.10       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.4        | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.9.2        | 3.9.4        |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.37.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.4       | 2.65.1       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.38         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.13.1       | 1.14.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.35         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/01639 | 1.35         | 1.36         |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.41         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.0        | 1.6.2        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.4.2        | 1.4.3        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.0.7        | 4.0.10       |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2020.3       | 2020.4       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200718  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.1.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.26.2       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.5       | 0.20.0       |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.49.3       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.5.0        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.1          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.1          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.71.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.7        | 1.2.8        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.14.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.14.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.38.0       | 1.38.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.10.0       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.8.2        | 1.9.0        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.20       | 4.1.0-rc1    |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.6.0        | 1.7.1        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.176      | 1.0.184      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20.2       | 2.21         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.5.0-alpha  | ORPH
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/21114 | 2.0          | 3.0          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2020.06.25   | 2020.08.09   | ORPH
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.16.0       | 3.17.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.1        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.1       | 2.12.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.0        |     
                   lua-cqueues |  DISTRO  | https://release-monitoring.org/project/11726 | 20200603     | 20200726     |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.3        | 4.0.4        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.4       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.24       | 4.8.25       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 170          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.6        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.5       | 20.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.5       | 20.2.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.2.0        | 5.3.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.2.0        | 5.3.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.14.0       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.8        | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.27.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.10.0.104   |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.24      | 0.21.25      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.2        | 2.5.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.0.2        | 4.1.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                          musl |  DISTRO  | https://release-monitoring.org/project/11688 | 1.2.0        | 1.2.1        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.14.4       | 1.14.6       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.9.3        | 5.0          | ORPH
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.14.02      | 2.15.03      | ORPH
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200808 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.23.2       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 1.1.34       | 1.1.39       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.rc1    | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.27.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.1       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.0      | 14.7.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.12         |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.8       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.4.3        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.5rc1     | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.11.0       |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.0       |     
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.2        | 0.4.3        |     
                      oprofile |  DISTRO  | https://release-monitoring.org/project/02570 | 1.3.0        | 1.4.0        |     
                      opusfile |  DISTRO  | https://release-monitoring.org/project/10353 | 0.11         | 0.12         | ORPH
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.21       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.5.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.4        | 1.3.5        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.45.5       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.11         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202007       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.33.0       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
       perl-http-entity-parser |  DISTRO  | https://release-monitoring.org/project/13850 | 0.23         | 0.24         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200708   | 1.20200724   |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.25         | 1.26         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
  perl-posix-strftime-compiler |  DISTRO  | https://release-monitoring.org/project/11891 | 0.42         | 0.43         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010003     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.1.0        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 77           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.9        |     
                          pixz |  DISTRO  | https://release-monitoring.org/project/07490 | 1.0.6        | 1.0.7        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.1          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.117        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 20.08.0      |     
                          popt |  DISTRO  | https://release-monitoring.org/project/03689 | 1.16         | 1.18         | ORPH
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.7        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.13         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7a       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.0.1        | 7.1.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.4       | 4.0.0-rc2    |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 2.2.4        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.6.0        | 0.7.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.8       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.10       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.7.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.3        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.6.20    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.0       | 1.14.1       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.0.1        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.4.2        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.1.0        | 4.2.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.8.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.50.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.7        | 3.1b1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.2        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.3        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.1       |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.0.2        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.4        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/12002 | 1.0.1        | 1.1.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.5.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 20.0.1       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.9          | 2.10         |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.17.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.17.2       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.3.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.1        | 4.5.2        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.0        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.2.0        | 8.4.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
                python-netaddr |  DISTRO  | https://release-monitoring.org/project/05586 | 0.7.19       | 0.8.0        |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.7.0        | 0.8.0        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2.1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.4       | 4.0.0-rc2    |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.0        | 5.7.2        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.6.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev10  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.4.0rc1     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 0.10.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.0       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.13       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.55.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.1       | 19.0.2       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.7.14    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.8.6     |     
               python-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.23.0       | 2.24.0       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.3        | 2.4.4rc2     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.1       | 2.10.2       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.14.4       | 0.16.3       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 49.3.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.2       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.3        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.18       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.3        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.3        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.48.2       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.7.4.1      | 3.7.4.3      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 3.1.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.9       | 1.25.10      |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.1        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.17.1       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.3       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.61         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.1        | 2.3.3        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.3.2        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20200430.1   | 20200711.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.28.0       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.5        | 3.9.0        |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
                python3-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.0        | 5.7.2        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.7.14    |     
              python3-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.23.0       | 2.24.0       |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 49.3.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 5.0.0        | 5.1.0-rc3    | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.31.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.6        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 6.0.5        | 6.0.6        |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.1          | 20200710     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.4.0        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.10.1       | 6.11.4       |     
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-beta3 |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.3        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2004.0     | 8.2006.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.10       | 2.7.1        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc10   | 1.0.0-rc92   |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.40.0       | 1.45.2       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.40.0       | 1.45.2       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.39.2       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.4      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.10      | 4.13.0rc1    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.30       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.0.1        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.1.8        | 4.2.1        |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.4.1        | 3.4.2        |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16.1     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.12         | 5.0.3        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.0        | 2.4.1        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 1.20         | 1.21c        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.5       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.7          | 5.8          |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.9.0        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.13.0       | 1.14.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.2        | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 6.0.0-beta1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.7       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.66       | 1.4.70       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.4.0       | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.96         | 2.97         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 4.2.1        | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 3.0.0-rc1    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2020.04      | 2020.07      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.1.0        | 2.2.0        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.3        | 5.9.4        | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.2       | 2.36         | ORPH
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.49.1       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.4.1        | 2.4.4        |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.1412     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.11       | 3.0.11.1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.3       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.28.4       | 2.29.4       |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 8.0.0        | 8.0.91       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200623 | 1.0.20200729 |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.10.1       | 0.11.0       |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.6.1        | 1.7.1        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.28.4       | 2.29.2       |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                           xen |  DISTRO  | https://release-monitoring.org/project/05181 | 4.13.1       | 4.14.0       |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/15059 | 1.0.3        | 1.0.4        |     
      xfont_font-misc-ethiopic |  DISTRO  | https://release-monitoring.org/project/17195 | 1.0.3        | 1.0.4        |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.7.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.4        | 0.8.0        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                    gdk-pixbuf | CVE-2017-6312    | https://security-tracker.debian.org/tracker/CVE-2017-6312   
                    gdk-pixbuf | CVE-2017-6313    | https://security-tracker.debian.org/tracker/CVE-2017-6313   
                    gdk-pixbuf | CVE-2017-6314    | https://security-tracker.debian.org/tracker/CVE-2017-6314   
                   ghostscript | CVE-2020-15900   | https://security-tracker.debian.org/tracker/CVE-2020-15900  
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                      ipmitool | CVE-2020-5208    | https://security-tracker.debian.org/tracker/CVE-2020-5208   
                        jquery | CVE-2015-9251    | https://security-tracker.debian.org/tracker/CVE-2015-9251   
                        jquery | CVE-2019-11358   | https://security-tracker.debian.org/tracker/CVE-2019-11358  
                        jquery | CVE-2020-11022   | https://security-tracker.debian.org/tracker/CVE-2020-11022  
                        jquery | CVE-2020-11023   | https://security-tracker.debian.org/tracker/CVE-2020-11023  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       librsvg | CVE-2018-1000041 | https://security-tracker.debian.org/tracker/CVE-2018-1000041
                       librsvg | CVE-2019-20446   | https://security-tracker.debian.org/tracker/CVE-2019-20446  
                        libssh | CVE-2020-16135   | https://security-tracker.debian.org/tracker/CVE-2020-16135  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                         matio | CVE-2019-20019   | https://security-tracker.debian.org/tracker/CVE-2019-20019  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                       ncurses | CVE-2019-17594   | https://security-tracker.debian.org/tracker/CVE-2019-17594  
                       ncurses | CVE-2019-17595   | https://security-tracker.debian.org/tracker/CVE-2019-17595  
                        opencv | CVE-2019-14491   | https://security-tracker.debian.org/tracker/CVE-2019-14491  
                        opencv | CVE-2019-14492   | https://security-tracker.debian.org/tracker/CVE-2019-14492  
                        opencv | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                        opencv | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       privoxy | CVE-2019-3699    | https://security-tracker.debian.org/tracker/CVE-2019-3699   
                          qemu | CVE-2020-10717   | https://security-tracker.debian.org/tracker/CVE-2020-10717  
                          qemu | CVE-2020-10761   | https://security-tracker.debian.org/tracker/CVE-2020-10761  
                          qemu | CVE-2020-15863   | https://security-tracker.debian.org/tracker/CVE-2020-15863  
                     tinyhttpd | CVE-2002-1819    | https://security-tracker.debian.org/tracker/CVE-2002-1819   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

-- 
http://autobuild.buildroot.net
