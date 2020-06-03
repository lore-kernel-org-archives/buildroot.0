From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Jun 2020 06:26:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-02
Message-ID: <20200603062659.1683287889@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  6  |  0  | 16  |
    master   | 97  | 36  |  0  | 133 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 4 
                  assimp-5.0.1 | 3 
              host-grpc-1.25.0 | 3 
                 mesa3d-20.0.7 | 3 
              ibm-sw-tpm2-1563 | 2 
                 rocksdb-6.6.4 | 2 
                       unknown | 2 
                 xvisor-0.2.11 | 2 
               apcupsd-3.14.14 | 1 
                     avahi-0.8 | 1 
                    brltty-6.1 | 1 
           host-nodejs-12.16.1 | 1 
                   libnss-3.52 | 1 
               libupnpp-0.17.2 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
         python-gobject-3.36.0 | 1 
                 qt5svg-5.14.2 | 1 
                ramspeed-2.6.0 | 1 
                  rygel-0.38.3 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.10 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/01984b9449b9e4cd33ab6b1170d1b0c4fdfacfb3 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/e261226775cd8e6bd1e2ed93c42ffad7b87a7e61 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/0597861a7d3bc9cb25a4f785327d7b61221233cd |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c948cb0580557a2b24f21d3eae8c5a187963d765 |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e18f092b155a57b2c8728e67701e373c3ef94d3e | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/12dee114eceeb3262805f012332c3aad87476d3f |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7e4f69a42c5785297ddde3048cb60b0f43a87fa2 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/81558451fb74d445f8904d6c57f70dc1a4ddcf63 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5d55755a603373c6ee7ec8d3e50becb53a460e43 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/cbb67a00bc2d221e1888c398cf08f38b13675a57 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c3fb50a3c059b41126119ba5b7759a35643f14b1 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2b405ae72d827ece449cd63ba7da1186cf92193d |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/5e01a14f3949b2ded0bd5cdc696576ad42b82994 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/4db875858339b1477191371b0971e400c842e9b5 |     
  mips64el   |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/db5cbc663a4225d80c6e664ad51718f9fe922779 |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/bfc8f3a3055f643e0e09c23118a2799217b9b7d4 |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/f44f1d5f71ccdb3a4facaaa5e73e16a275429f2a |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a9b3da4ff135f664cce8666d376e773065246bf5 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d107be4e882ae57368980750faccd084b8f11632 | ORPH
  sparc64    |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/1b79e3d58bf1ccdc2a4929277cfe13eeeba2541f |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/e42233aaf9104fdd8a7bf731ed377bf85f881e05 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d42115dabf2e36a064ab8da7acef594ccbc65046 |     
 powerpc64   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/d944452dda4bbc8fd9add26528ff1367243e52ed |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b1c0b67a6b3a286deaa61cd2b65a24c104a73dd0 |     
    arm      |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/024464b4ecbb03023d9232a6779eba85790e9fab |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/be233a9aa5bbefcbe5967e6c931173f79f4579a5 | ORPH
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b505817343cc9155cacccc1a11bfe981ac515af3 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cce2a6bd367355d28366e3fad21363f921abc594 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/4e135b86204b1fca0b098469e1e6a608ff0ee6ea |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a02b4aeb4b3aa9aaa6eab684b5dddfd738e39e92 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9e8b6ac8094f5a32e5e1abf08c5c032a989ccb43 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ada83e17b95fd46eafcb5c7bc397316e18396b9a |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/4cc3e8f53236dcbcee990e1c07bdd0f37cb118f5 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/492bd1673ab0d1f821e72825668c915d950bff10 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/2e0cb867a010fa1c5f841bd471ac32606abc3f65 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a9de994c6cf05084cb5bc2e8afb6c82629e1eefe |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  apitrace-9.0 | 1 
          host-checkpolicy-2.9 | 1 
             host-gnupg-1.4.23 | 1 
           host-nodejs-12.16.1 | 1 
              host-perl-5.30.1 | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/5542b09fa9a9c41ce705129994fab1cdb9c94546 |     
    m68k     |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/e80b3bc91a2376194d990c841d322390491309eb |     
   x86_64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/81d8f27d839f6179aaee18e4ed6bfeacf32e4892 | ORPH
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/7baad3c8da4d560ece6768c9e92fece350504b00 |     
   x86_64    |        host-perl-5.30.1        | NOK | http://autobuild.buildroot.net/results/0727c3f48dada14d58be2ab3b77912cc68902fdf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3fc895d4960a82e7ac446004ab658c1e8c4bc387 | ORPH



-- 
http://autobuild.buildroot.net
