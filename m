From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 08:00:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-18
Message-ID: <20180219070017.C3397207C8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-18
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 178 |  38 |   0 | 216 |
   2017.11.x |  18 |   0 |   0 |  18 |
        next |  53 |  21 |   0 |  74 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 9 
                     php-7.2.2 | 6 
tvheadend-e06ffd87beff16103... | 5 
           cups-filters-1.17.9 | 4 
             bluez5_utils-5.48 | 3 
           host-mono-5.4.0.201 | 2 
                  cc-tool-0.26 | 1 
                  dash-0.5.9.1 | 1 
             expect-2014-05-02 | 1 
                 mplayer-1.3.0 | 1 
                   pcre2-10.30 | 1 
                      qt-4.8.7 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-237 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f5f45ecab0286a0ea880a482d6c5420ae98bbc33 |     
        m68k |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ddb9b573d904c0ebccbb51e4a68bd165791cc29a |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/a09827998e264ad73c2f83f6d77decb728103d0d |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e54603216b988212ab88e0c7160d2ac8a52583cb |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b19c58b2a77e4c97560751b84a63963c2395589c |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9eac85c15194b4105c1324420cbe0458eaa89e67 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3412fdbe7453e6db117cf3dd81b72f9b7b617c23 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ad403d2f6d81e7e7c92fdf12ff10bc0242f0e078 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7bff68ab22210f9a1ef8e711d4726a52e7544c0a |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/842c4674da20155279d57966a2d5b986ea464c61 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2b541f978b1258cd6528c71831ed2a2d1c20dff9 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5488a13a91d7a546a9a045ff3b9059d4856b8428 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/61ae2f791ae0cd0a5856d1b4ae222c1bfe48bcef |     
      xtensa |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/ad565c0ab7386a96ef1489cb537233385e73ed84 |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/5e6aa29aafe0420b43287187075a5233f135589a |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/928c998005021a5c2ba92c7d2f59f148a792ce65 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/59cda784f2bf231209a9828e925ee21440db8c70 |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/12367267735b9165afef77289460c247aaad494a | ORPH
        i586 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/e2e2d59cdc64576d60a7869bf8fdb030d2a17411 | ORPH
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/7904d85d5532d3506d2736925e6ac968eea8b14d |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/9f163fd3e3e226241fc17d8069eb3da63c2d18b0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a02ae8f702194c323e10c2a4ff95b8c0f7347a36 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/d8af809f3eee8e48639746d5f7dc3df2c5ce44e6 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/093d96cc70761e72e1ae2cc46b5d63c680e64d6d | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e27abf6235fcde844d839de1d330532a20f98414 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/fb438fb4e196231a0e9b05aaea9ff6f7b69b8a17 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b0c79ecc935856bb8ef7513bfd2fcd16b3c2b9e7 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3fb27b4d8dfd7b53488e7c88d79fad9ae80239ea | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/fac2cd32e417fba5efc15e4578060a48b3e87026 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fdd6dbfd7a82aad52bcdff575d569a00ee5233f9 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/590be40e61e4c485d199a859e50d3e3aaa820e3a |     
     aarch64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/3519126176c01bb66642886bf316ebf827845865 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/edabd1ce3c43afb8b775140b4dca0914251c8bd6 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/d90bf655f6bd778fbd8a1d89e3e20094afab4e4e |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/efd374a6353536b6a6921a9de7068db7dbdec2e6 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/443a81349919b990dfd64a7def256e2c953db79e |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/e6372eb55a2fbda5cd5efca6505a19bd328cd65b |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/dcfe12dce669a5b0a2bd805be973acfe6b0df8c0 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 4 
               lightning-2.1.0 | 4 
              keepalived-1.4.1 | 3 
                     php-7.2.2 | 2 
                  autofs-5.1.4 | 1 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 
                 mesa3d-17.3.3 | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.3 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/5dfa71202daec3ffc8b179381a15ca7a04cb56d9 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/75b21b24e9a66bfaabfcaaca08ead20ccae41c99 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/fc4300a264b80dfb7592cda043a7f950adc580f9 |     
         sh4 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2c571435daf1db9035ab74b25d95b38f76dc7764 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5afc2749eff05e21fe38bdfd621e0dfdba65e84d | ORPH
   powerpc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5c11399b09f1fbe2a04b183b4f3ca8b68d455ef5 | ORPH
microblazeel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/22f915c00c84ba4cd21cdbc69cda5c15598927f9 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a15ee2cf331271a6d2d583c996c377820537dda |     
      xtensa |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/e250259e6b0bdf53fb8130eada98af76df2a20dc |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/0742ba377ebc36719b5206e7d767e62127730c45 |     
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/cf4731add6183162620502f8ee1e62813aeaacad |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/26309fdfefa91c7a7b4da01cecc5b3f7733ab776 |     
        i586 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/e1b9189fc7d371e8d8d2d628dbe4ea380d43cdcb |     
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/b603c10ffa62202a56d494c62f0f09825161eed1 |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/01d2ed60194e174792e30095c32d1f3f8e76bcfc |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9b9ddf4aa92c351c2534cf51aaa30fc5711290c0 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/76334716d06baf02f19e27dc654682ead0f052ad | ORPH
      mipsel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/808990e404edc0b90ac7b56a1b915643208671af | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d05c74fb15bb9e59f30c5426a3a5433849c03c36 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/14784d8653b32811c17c7cee3e15a8378fc7f31e |     
    mips64el |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/ad44244465f88e185221d64174e44358c53e0c08 | ORPH


-- 
http://autobuild.buildroot.net
