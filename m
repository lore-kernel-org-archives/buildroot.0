From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-14
Message-ID: <20190415060040.EB399873DE@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   0 |   0 |  18 |
      master | 194 |  36 |   3 | 233 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               postgresql-11.2 | 5 
              host-clang-8.0.0 | 4 
                   netsurf-3.8 | 4 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
              ghostscript-9.27 | 2 
                host-go-1.12.1 | 2 
                libkrb5-1.16.2 | 2 
                       netsurf | 2 
                  brotli-1.0.7 | 1 
                cracklib-2.9.7 | 1 
                     gdb-8.1.1 | 1 
               host-efl-1.22.0 | 1 
                        jasper | 1 
               madplay-0.15.2b | 1 
                   mimic-1.1.0 | 1 
                    most-5.1.0 | 1 
                   mutt-1.11.2 | 1 
             openjdk-jdk-12+33 | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
           qt5serialbus-5.12.2 | 1 
             qt5wayland-5.12.2 | 1 
               tpm2-totp-0.1.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/d31bf4e86c31165c552c00da6cf6cdccb9721d03 |     
        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/f8464541ea105a39325d67def447d662c0916203 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/fe07493ae9eeffa17ecd65e2924f7297648af000 | ORPH
         arc |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/4228da9f5cd28590b5767b94e823ff8a31380142 |     
     sparc64 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/4125f556b51d7a41a418e6b4386034c952fc6527 |     
         arm |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/dc2302844a1d274e63da72023b6fd7be993f97b7 |     
     aarch64 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/c0382aaefaba79ce6ae5963c84f4c8e3bb397599 |     
         arm |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/d20f74950056e8a99e1a9624e445ee2d845c5063 |     
        i586 |               host-clang-8.0.0 | NOK | http://autobuild.buildroot.net/results/6dead88212e98c19a7b9773cf83d47c3af0ecf0a |     
      x86_64 |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/18ac3fc5dcdda4264bef415bf45c0ac6958ba500 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/645945e1d12cbb94a23d63976c03ccd76cb11ee6 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/20c297a2e5da731abb6760cfd0975e4f1a2d1073 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/1847e62f5362fb1ed6d8e73d3e5e9a553274c75c |     
         arm |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/41150b7a70ceab08474fa8f1a99486c343f58e21 |     
         arc |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/a12a53b81d5db4d53fb858a2ad2dd79718cf082e |     
     aarch64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/0bfb11a42b8980b0289f6b27ae969bd67789f294 | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/44526032754f4c2dd394f5f71b3ec85cdf243d79 |     
        mips |                     most-5.1.0 | NOK | http://autobuild.buildroot.net/results/c7540203a8eadad3f324f0d7e7fe66a526d4a2e9 |     
         arm |                    mutt-1.11.2 | NOK | http://autobuild.buildroot.net/results/c9544b4f1a0252e260a2ed19218fa950f4dc2d2d |     
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/91b2bb033eaf4a67a84fdfccbd22180fad153b92 |     
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/9feda5fb7e98322d90ab7e801a115e36dd5a8547 |     
        i586 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/624165918b0d62734a1e7c19493d5a022d356aa6 |     
      mipsel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4c4626817fcdb3d1cdaf7a6dcea19b76051169a2 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/061a950f650ff55d0eae08e0b52b413bdd7ed291 |     
       sparc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e567bf61414c661f062814aee8252889fc3a3830 |     
      mipsel |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/1059026c9b5f503684fe1589cd43d25a8484290b |     
        i586 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/b8c20d47d8267d5905e05bbbb8fc2a6e179b01b9 |     
      xtensa |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/6387298883d3610b0698bc6abe7dfa2b0a9b068d |     
     powerpc |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/def35ec48821866cfe2526281cc4a361eb7cf325 |     
      x86_64 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/64cb202a4aa7f13a2180ec8b0c4aaa27d950a041 |     
        m68k |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/88d3ec255206aeec9b073e8a294aafd33d790c47 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/d717df03ec3a248c31d9c7972870e868647f9b98 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/baeb2921cdd9c1395d6b6979e6a813ebf1c87b9f |     
microblazeel |            qt5serialbus-5.12.2 | NOK | http://autobuild.buildroot.net/results/98bf3c5c17a629e8bf907ae8d37f37fcb9efe2a7 |     
     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/6c52b625c4c5faf232a8ed55bd3925b2360f7ff9 |     
    mips64el |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/852bfd7d2025b703406b379559c07eabbc25920e |     
        mips |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/3e0b45ff10ab08409653350cdfe124fd200224da |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c6e4e52b67f8485c137d55c7a4c475cdf7189286 |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/9f44e0a12348c71c9f77f881fbea74f181e77b6a |     


-- 
http://autobuild.buildroot.net
