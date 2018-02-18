From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Feb 2018 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-17
Message-ID: <20180218070036.8E335207FF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-17
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 186 |  19 |   0 | 205 |
   2017.11.x |  21 |   1 |   0 |  22 |
        next |  52 |  22 |   0 |  74 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 4 
             bluez5_utils-5.48 | 2 
                 mplayer-1.3.0 | 2 
tvheadend-e06ffd87beff16103... | 2 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
                    gdb-7.11.1 | 1 
                     gpsd-3.17 | 1 
             host-gauche-0.9.5 | 1 
           host-mono-5.4.0.201 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/fa8d4746782d4b4e19b140213178548dd8f1ebe6 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/9d1c26514846c90196744e70a9079e0a2e37c1e4 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/11f016a48cd96a7ec06f78aade2b0ec1fa83fe63 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fb46110ad4d7356143726fc168f7085d54403045 |     
      xtensa |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/a750f9bdc62310ea55f7b01a454aad2aafa69d15 |     
        i586 |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/18230384d8225fbd7fddabfcbd685eaa38e31b31 | ORPH
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/bd4e1011662cd5b7f302c03d180b29f822b12612 | ORPH
         arc |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/9ac519eac334ceace3d576c6455eb2359d3b348d | ORPH
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/85bf9f1f75984a37cf2846298857ffca83b17ab2 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/acc4dd09b32acc80ba9b2dd0efbf4fd6635a00a7 |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4e33faae6c56aebac082d538574e7ba2da7dcde9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/25ca716c3f1b6ecf4020ecc8450b84ab5378b6a1 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c11c6e466e37640416c619e8464c2bfc6437c16a | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d714c82284a273be3ef745d39db023dbd0e272ab | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/db79ab885d6c481b8f0d0f186cc4e0f48da8bf86 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f7885d5e8666d6ff698e270562705e01311daa05 | ORPH
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b83e4ca097be13235c4dbd1d2a4896b83f4e95d1 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/8c988859b85dcf63da5839744bb4556e2b98623f |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/9541db2f92747a8f65dc48c2ee55e4f23bc21152 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                     gpsd-3.16 | 1 


Detail of failures
------------------

         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0ae873a572d44cd7e2a2860e83b0132c1393608d | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              keepalived-1.4.1 | 4 
                    liblo-0.29 | 3 
             bluez5_utils-5.48 | 2 
                    htop-2.1.0 | 2 
                  udftools-2.0 | 2 
               domoticz-3.8153 | 1 
                  ffmpeg-3.4.2 | 1 
              host-erlang-20.0 | 1 
               lightning-2.1.0 | 1 
              lynx-2.8.9dev.16 | 1 
                nftables-0.8.1 | 1 
open-lldp-036e314bd93602f73... | 1 
                     php-7.2.2 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/63598f3cb74491c35546e7f2e999742550fffa62 |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/273b097033b568c7e93946c091d2bc6bf6d7ccc4 |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/cde6d6f298b75c9481930ed05b917a226425d6f5 |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/ae0fd8b17200178208d5d9675ddb7ab090c98a25 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/52a6318a45a346064659243eca2def09c0595848 |     
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d06f917fc71a0e357efa364fbc8a98fbf51d5fb9 | ORPH
        mips |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/389858d9a3a9db5afb0ad89ecbbfd14ca340c450 | ORPH
     powerpc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a7c62905dbb6b83896066f558a4d01d83129d29c |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/65a78feba5b0c9b52a5cff90f57c68866f743f2f |     
     powerpc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/9044d7c7c02d6d092b34481df075d4e3573d3a36 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/22be965c68a59b99f55ece1178832465896f69a5 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/7dd7ed1bd3733981e087f4f027578e5cd5f43523 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/3a3d12cfe46a4147dc0e68539fbdd37eb651898d | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/41af0ffac95c74f4c21a464bdd0d716aa6c7f037 | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/b6cdb916f294e5e0eec1d979fdfbe308ea45e10d |     
     powerpc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/3b9f270ac13172733b200a88ac2d9bc4c7c06b84 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/923ba6bf0673c6c80917d7e63c7f6f017e2a0024 | ORPH
      x86_64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/a78068c762b1838f2d290c255ffd0142c48c6d39 |     
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/af9c1fb3875402872af8cc48547a91ddaab4a7bc | ORPH
      mipsel |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/034e943abb59d0e21df5c5f265b86b51c020f1d8 |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/e022d6cc9632af3b87e8e544f8b49983c7035c7d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/29f3dfdbf5c1ee8979214d65b48a46cd6c646457 |     


-- 
http://autobuild.buildroot.net
