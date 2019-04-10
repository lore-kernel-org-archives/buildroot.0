From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-09
Message-ID: <20190410060040.2A8CF2306F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   1 |   1 |  22 |
      master | 232 |  28 |   1 | 261 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-android-tools-4.2.2+gi... | 5 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
                   mimic-1.1.0 | 2 
                   netsurf-3.8 | 2 
                qt5base-5.12.2 | 2 
              qt5enginio-1.6.3 | 2 
          qt5multimedia-5.12.2 | 2 
              spandsp-20180108 | 2 
                host-go-1.12.1 | 1 
                        jasper | 1 
                  linuxptp-2.0 | 1 
             openjdk-jdk-12+33 | 1 
                   tor-0.3.5.8 | 1 
               tpm2-totp-0.1.1 | 1 
               wireshark-2.6.7 | 1 
          wpebackend-fdo-1.0.1 | 1 
    xserver_xorg-server-1.20.4 | 1 


Detail of failures
------------------

    mips64el | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/84ce4d5a54aa2626d4170c59bccd897eea2a66e6 |     
    mips64el | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/f8d66e3f12f32634c06b3f0f3f0896529fbd9abb |     
       nios2 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/43aef9de3b4a625d807f94ad32a2d2f5d0e5b8d5 |     
     sparc64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/475a0a1f68ffe6fa6026b2a4b6c71779b22ed2be |     
       nios2 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/8543eb3815a67747349a2e60654d19b9804a3a89 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/63c97f349a16b9cc1582e71f19ca9385f5925786 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/eb3347de82dc6cd7f705a82f38d18e3ea96986cc |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/48feecadc00e5d07327fa93169685833e2ccd37f |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/51e18cf9d039773f89de57dfb61ad49dc435878d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/a3fda6e304909b15f30728f90fde703ac69aa294 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/495f1086f142f009b45b19c364e8cd0a977c4fb8 |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e71a5ac9b93db9740329c4ab8820cdbec768bd12 |     
    mips64el |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/16d8b9ab007b3be6510e975ecc2e1eb6756e46b7 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/250ee406ae04e937070978ff12fec5b0834c3485 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/6e380f6188b8974ed9b8e2601a7bc085f6dc7102 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/59790e0332da2ffa2bf033cf6132234325e1ce41 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/cab81de17ca9de29ee2ad77d0f73e76934ff9242 |     
    mips64el |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/bc2d7f9b2cbb2b1642cfd8d0a49fdb44bc26caa6 |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/331f2dc27f03b726ca311889d39410b243796873 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/173675adfb614c5b4bafbc6d3b0b8cbc70c291d4 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/ff7364392b0923a4b4d83b697b04bee48cbc5a0b |     
       sparc |                    tor-0.3.5.8 | NOK | http://autobuild.buildroot.net/results/4b90b7d02e354ebf3d8f95023547bf4a18e0165e |     
         arm |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/6c9bb17920749409e5a0c3388ccda411c6c7cfb4 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/2a7b63660fac307301450bc075bdd88031d58943 |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/81430334e11318d1fae91e677ee3ce0b110afb5b |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/db4706b67a1de1c30f1f09a53974dbab994ec1f2 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/f3c862461207276184f37f719f7d6dea2803477a | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/975e07978de4a582cca01443adafdaf7f7f19d8b |     
         arm |     xserver_xorg-server-1.20.4 | NOK | http://autobuild.buildroot.net/results/95a5004c9245f1f90758631b02e17d3df12812ec |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

        i586 |                        netsurf | TIM | http://autobuild.buildroot.net/results/dbc7c5c7f86d73772a465dd1b525bbd075d8f722 |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4dac69d68de190d4655dedfeca931dd484ba9e5a |     


-- 
http://autobuild.buildroot.net
