From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Feb 2018 08:00:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-31
Message-ID: <20180201070014.B668A21A64@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-31
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 162 | 113 |   4 | 279 |
   2017.11.x |  22 |  10 |   0 |  32 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 25
          bootstrap-legal-info | 11
                  boost-1.66.0 | 10
               lightning-2.1.0 | 6 
                     php-7.2.1 | 6 
              drbd-utils-8.9.6 | 5 
                libevdev-1.5.8 | 5 
             libfribidi-0.19.7 | 5 
              keepalived-1.3.5 | 4 
             bluez5_utils-5.48 | 3 
                   pcre2-10.30 | 3 
                   systemd-236 | 3 
           cups-filters-1.17.9 | 2 
                    gpm-1.20.7 | 2 
               host-efl-1.20.6 | 2 
           host-mono-5.4.0.201 | 2 
            libmaxminddb-1.3.2 | 2 
                    sdl2-2.0.7 | 2 
               domoticz-3.8153 | 1 
                flashrom-0.9.9 | 1 
                   gconf-3.2.6 | 1 
              host-sam-ba-2.16 | 1 
libasplib-be7fac89218a84b75... | 1 
         libcpprestsdk-v2.10.1 | 1 
                 libv4l-1.14.1 | 1 
                 mplayer-1.3.0 | 1 
           python-numpy-1.13.3 | 1 
                      qt-4.8.7 | 1 
                 rsh-redone-85 | 1 
     sound-theme-borealis-0.9a | 1 
             stress-ng-0.06.15 | 1 
         synergy-v1.8.8-stable | 1 
tvheadend-e06ffd87beff16103... | 1 
                       unknown | 1 
wiringpi-96344ff7125182989f... | 1 
                    yad-0.33.1 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/475b17d4b4f8d721ee067a1a4f17882929ec802d |     
      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/1810b81d5601ec05c63a5bf380205a7781b959c1 |     
     aarch64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ffd5693ce4ef0b13db1bc3b87b02e0daf180c996 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/fd3f734eb7cb80d2a23f2b5d2efdc58f4dceaa92 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/719eb988cdd8b3685c38e5661c4180fd165f9a7f |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9ce00bcd873561e5f8362561bcad917bbdb7590f |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7ed07ec414142d74390ee5873f8668ed36bd6fb0 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/fb3ccd063fa020b2304ea4e5a48348758c1d1b01 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6521ccf3ec12572c043beccaba6fafc438de54ba |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/453e9d06c225d9ef85cd62ff8a83f8de921b595f |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/21f2c73376d067b4c787312085e1ffb82083a49b |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/29caf85a6d568d69efbef29aa218fa67d9d9f2fb |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/accc957c3ed2a9460d9b9818852f119cf726361b |     
      xtensa |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/023a53afb005ca17e8bdf11153490ce2fc1607a1 |     
         arc |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/795273ab65d76c699cadac51b1bb0015704f649f |     
    mips64el |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/e2ca9b0e537c378eeaca2b4f9fd4341f3bc5f8c1 |     
microblazeel |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/8f806c6fcef8b43d76165066d31df024bc4b0857 |     
    mips64el |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/e56195a6018bb9a488d9ddceb70a10df2a2095c6 |     
microblazeel |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/513d5915a2d64bef0f4dc5693eb74b449fe63837 |     
        i586 |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/3db0da023f3773249db39298ff0927c315c1785c |     
      xtensa |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/196015784bd4c3e6234a8cd0811a0eb45aaf482f |     
    mips64el |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/5f39b25f966cd59abdc0d70661d5dfac29d0d77f |     
      xtensa |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/f4b9b608d3068e6ce4eb866bd8c751788a3eac4b |     
         arm |           bootstrap-legal-info | NOK | http://autobuild.buildroot.net/results/70508c5c0b2b173715559dcd04bba48b65890bcb |     
      xtensa |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/e0bccf7ed7ec8802ab15233418f2781ee60341da |     
        or1k |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/bbed655e51bfa94f63cd8d14eaf47379c3fbb86e |     
        m68k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/3331420b3780601cc6f11b3846ab0774e705e7ff |     
     powerpc |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/a6d61c7ca8e505509d84869f072d812da79e949a |     
         arc |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/53ea7cfc57d912377b566474b15a47ffc077b047 |     
         arm |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/3a6d7a384e6558156695b6ac46754976f4db7652 |     
      xtensa |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/0576b80240ba439f7c2842a58e8bd418199e6100 |     
     powerpc |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/3f9db30f18b58a6258acb5dfb9301936e5e05bf6 |     
        i686 |                 flashrom-0.9.9 | NOK | http://autobuild.buildroot.net/results/b1f65dda13aaf475822ccaf54338d49a07392c50 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/06bfd1484cd6caed6cf11209457f057f20120936 |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/8c7b98edb0244a2438a0fb26fbb81fe7d251a11f |     
      xtensa |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d15d40802b3241505219279bc583057c3535fa78 |     
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/938fb21851579f2beeec9b331a2258dd121ba722 | ORPH
        i586 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/2e95b40a3d471c9ac30c7bd24d77caafc7f6e2fb | ORPH
      xtensa |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/535a3097ead12d7705c8f3a70021e791a22e1e25 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/cce7ffaf7101e4c0d5953a9686bb5c28bf9a89c2 | ORPH
      xtensa |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/78410ed52a6ed870cb67e4658ef512a73c7f3bfd | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/da0ca4ef050b2afb51ef3a085aaee4c5b23fc733 | ORPH
microblazeel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/06364e268a2ca16c3a571bbaa02bcc0490f5cc2f | ORPH
        m68k |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/6ec0ba2c806a1c03b66c8bc4d558f944791bda8b | ORPH
       nios2 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/d5a699fad054e1981076210f887327fde53d11ab | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/ceaac4f3bfee0b0140e8a5285ec266320205e65f | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/a09254a464140f7d9599cb366915a25833a48274 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/89aba70c3e9ca3108060c752710a18de1ed2e827 | ORPH
      mipsel |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/f453f37cea222d29a365abcc6c7073d86aae0c67 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/81e2a5e823f47893c5aa6f649fd499859c73d9d3 | ORPH
      xtensa |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/c5f02e6a3ed1926eb0a1706862b66990807b996a | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/baba1fbaa8cf80d942ef8e00e8d01584bf32866f | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/bf69aaa0ddbf434e270ebc2bd18bcbfb0f6c9fe8 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/14e31df538fd2a318a7bad09a2611abab92c08f5 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/295be0d66137198ece844132dd0d0f8846cbc1d0 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/6d69e6446a41c167385e316e3f007f0ab73d7883 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/7ae6cea1251a3d73c663daf3360014a88bb247b9 | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/da222e9ad50fadb319edd33b2a9f63da9bee377b | ORPH
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/7377134d42dd40e01b2d0f5d6d230e2a9007afdb | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/b4588bf772b02edb31988aad1c7aebf028e0a649 | ORPH
     powerpc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/eb67f1f2fc70a75935bc5375f428532da31eb10d | ORPH
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/e078fdf43415fdc2cb5b34681fef4afb8e7dfac9 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/d6685d67f3f6102814f9e738bb6ce2813e1939c9 |     
     powerpc |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/499b19ccde25e5c4049049c0a75eaa194aeffab0 |     
         arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/3136199a817ff6c7fb492c6f13d3717fad3e1219 |     
         sh4 |               host-sam-ba-2.16 | NOK | http://autobuild.buildroot.net/results/79eeebf8c5a112a702e16aaa957a82e2025b26da |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/627ae43ea426590a411e74b1ed80d89a44581cdf |     
     powerpc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/cdc927a06485065ae183ab36d5fa31bf0db26524 |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/b84a136d9466cf0a783f6dd28af9bbbd7a2c2c4c |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/17caf4a5eccb8308f252ca914c82091c4f59ddd5 |     
    mips64el | libasplib-be7fac89218a84b75... | NOK | http://autobuild.buildroot.net/results/80674950ce5ad97ee3d9dbab59ecb49f49f79811 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/986cf5b65a56869fd74f3f4c4cf69f7c7fbe9143 |     
         arc |                 libevdev-1.5.8 | NOK | http://autobuild.buildroot.net/results/0ebe6a887b3b99ba642d9222c7b2d1d3ae6a55dd |     
      xtensa |                 libevdev-1.5.8 | NOK | http://autobuild.buildroot.net/results/f08db77a2a9fc266ebd134f570f6a98828b3f8ea |     
        or1k |                 libevdev-1.5.8 | NOK | http://autobuild.buildroot.net/results/d4d7a1b3279c80934c4b743ef10ed06f1dd2f8c7 |     
         arm |                 libevdev-1.5.8 | NOK | http://autobuild.buildroot.net/results/f6a9eb61840e464a078fb0948a4a9bef405b61c1 |     
         arc |                 libevdev-1.5.8 | NOK | http://autobuild.buildroot.net/results/056499c565fc3ba68c84de5441157cf037739517 |     
    mips64el |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/cd99322097563c44c67448387d718560c1772756 |     
        i686 |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/186e914b6137d465b22cc9c8c12491b02041119b |     
       nios2 |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/03ab747bf93d6830498ee40418bdfb085e22a632 |     
    mips64el |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/0e6c67fd9cb432192e8299c5c0d129b9d3fe2fb5 |     
         arm |              libfribidi-0.19.7 | NOK | http://autobuild.buildroot.net/results/08a47d63855069d61e4f79d7c87fa3fb09701518 |     
         arm |             libmaxminddb-1.3.2 | NOK | http://autobuild.buildroot.net/results/eafa59bffeadb43d61ae97fae06a50adfe54761d |     
         arm |             libmaxminddb-1.3.2 | NOK | http://autobuild.buildroot.net/results/3e653a5fa4cbd714980ce0f1c3b02f3abb6d558e |     
       sparc |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/baa2595e1acdf4e795fbb940ca57fd136c827da3 | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/85ed93064312ecba16b6ff468e0ddacff18d261e |     
      x86_64 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/e5d5b557a9b065817b8930ef19f937cd739af156 |     
      mipsel |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/4a89b5a61a1e0753c5e145aaae1f3c430fadc24a |     
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/4dc751fba37a13c8dd0892ccc76f986479c7b1ca |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/d2e23f9df918e11adfb5d20a1e6694647b60e922 |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/7e2cff4bb877daf5d1f06ba0a3108d5bb8a16514 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a9b9322acff8c8d3e364721807be9dbb1973586f |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/827ae53e649ce799128c034de3f197f1af4bcfb9 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/2e8f2a5b279ae9ef60b22c28b73bdc88f366989a | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/38dd560b27c60028d0e98031b7d4084e237b6441 | ORPH
        i686 |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/679529c25b3b69360ffacb3cd5c5ccba26c4095a | ORPH
microblazeel |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/5f92b5f81677358db88b086939fb1a0990e6568c | ORPH
     powerpc |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/435d9381e1cbf05f5a2e1235e6564487bdf5e1ff | ORPH
         arm |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/e0224b66395f2b7dd84c345e06ad7cbeb203e6ff | ORPH
        or1k |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/e4ed69b4a2822be0867846ddeb82521efdb303a7 | ORPH
         arm |                      php-7.2.1 | NOK | http://autobuild.buildroot.net/results/4f0c8d9604c940826c0465cee5a66d7734089795 | ORPH
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/9685b56bfadef630fdf05922dfe595fb5e806ee7 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/464b7f735883cd4361b87fc88160cb7e5209620e | ORPH
      x86_64 |                  rsh-redone-85 | TIM | http://autobuild.buildroot.net/results/5bb62633deeb73659188f379abf77cd6e80562d0 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/322f6542a2f614aadc5ed07df0bb3a3fbacc3973 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/5977c69ffe489d9514af790b20e6aeb05e67ac5a |     
microblazeel |      sound-theme-borealis-0.9a | NOK | http://autobuild.buildroot.net/results/8ce9adb89a632c4f4e6a8b7bcd1175e6fe97a587 |     
    mips64el |              stress-ng-0.06.15 | NOK | http://autobuild.buildroot.net/results/a68d9ee1599cb4c481597b90122f728c909013a5 |     
         arc |          synergy-v1.8.8-stable | NOK | http://autobuild.buildroot.net/results/1abbbb4f1d37e34170b26005232145a0fe3be727 |     
     powerpc |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/65845996ed8cf7a441cc5743c480b95ec75a8328 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/df00c0ecf08e9571fa72a360d5a8fca5d01d0194 |     
        mips |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/533989fdaea722967b40f88d3cf76f59bce4c1e5 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/c382d914a24eaaad6d508e43759412456ed67173 |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/ae66d86988d8c7c0ae19597fed9dee4fafd48f90 |     
         sh4 | wiringpi-96344ff7125182989f... | NOK | http://autobuild.buildroot.net/results/0012ca8481f440201932da32b0bc2aa5c76284f6 |     
    mips64el |                     yad-0.33.1 | NOK | http://autobuild.buildroot.net/results/21f66a61fd5633d2af672944b23f1970d0273bbc |     
      xtensa | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/1a3b5474c16bb1066a8b9e56da6ea144c5833561 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 2 
                      axel-2.4 | 1 
       directfb-examples-1.7.0 | 1 
              drbd-utils-8.9.6 | 1 
libasplib-be7fac89218a84b75... | 1 
                    php-7.1.13 | 1 
  refpolicy-RELEASE_2_20170204 | 1 
        wireguard-0.0.20171211 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
------------------

     sparc64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/39fcd2229a000afe36038c28b22a1e1585658fa4 |     
         arm |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/38a434f1591d9eecef6440efd0327acedecec615 | ORPH
microblazeel |               drbd-utils-8.9.6 | NOK | http://autobuild.buildroot.net/results/8d548e1e745506c162cb3bedf88780495c9e4c7a |     
     aarch64 | libasplib-be7fac89218a84b75... | NOK | http://autobuild.buildroot.net/results/5040d4ce533468deed85590c8f67f0e8dabb1e66 |     
   powerpc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/cbaeb40d3203c7e57df822acec98afe8bd25313e | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/cf7d2fc3f8ec28ac1de6f980ce709ea29e739a73 | ORPH
      xtensa |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/f4a3758095a6fc500353902e22b9d3fb81aca58c | ORPH
     aarch64 |   refpolicy-RELEASE_2_20170204 | NOK | http://autobuild.buildroot.net/results/24dedead2dceb4eaf8745bc640f1cabf514329ac |     
        m68k |         wireguard-0.0.20171211 | NOK | http://autobuild.buildroot.net/results/7b191521689da8b8baec7558b96c94133e648122 | ORPH
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/cfd226ebf8958a7bd2041a2120cf3addf458e2dd |     


-- 
http://autobuild.buildroot.net
