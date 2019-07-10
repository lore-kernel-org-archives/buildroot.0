From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jul 2019 06:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-09
Message-ID: <20190710060053.BAEAB20450@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  14 |   1 |   0 |  15 |
   2019.05.x |  16 |   0 |   0 |  16 |
      master | 133 |  46 |   0 | 179 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 6 
                  dnsmasq-2.80 | 5 
                    atk-2.30.0 | 4 
               libcap-ng-0.7.9 | 4 
              iputils-20190515 | 3 
               libgpgme-1.13.1 | 3 
          modem-manager-1.10.2 | 3 
                  gnutls-3.6.8 | 2 
                harfbuzz-2.5.2 | 2 
           host-nodejs-10.15.3 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
        glib-networking-2.58.0 | 1 
      gst1-plugins-base-1.16.0 | 1 
             host-cargo-0.26.0 | 1 
            host-mfgtools-0.02 | 1 
              libsodium-1.0.17 | 1 
                   mimic-1.1.0 | 1 
                    proj-5.0.1 | 1 
                 qt5base-5.6.3 | 1 
              qt5enginio-1.6.3 | 1 
tvheadend-8f1de1621d78c9143... | 1 


Detail of failures
------------------

      xtensa |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/a4ea090707cd6100e43dd382e2003a296c1391f7 | ORPH
     powerpc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/fa334166f7339aad5e0366fca279e5e4046a7687 | ORPH
        m68k |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/bc7df9b756171f50e9af4b16aeb58a83af2b27df | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/073c56ccda6c89e88aff3e12748eaffb3655fdf0 | ORPH
       sparc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/1a56a746c401df81717fae40b2cea00ff5001022 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/a4d905313d65025df4a8b807cf66d7786efffc91 |     
     riscv32 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/f036a442de4fc71535381a17a0e72ffd731bac37 |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/7feafa566c86a430d19acd31e36619fed2769b63 |     
     riscv64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/551c5a0da3d6c4ab70def736751c6e9f5164b7b3 |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/c57a7083ea227b38633219e57ecfa47a6ba76521 |     
       sparc |                   gnutls-3.6.8 | NOK | http://autobuild.buildroot.net/results/fb9da6c51ab264b0aa3f7d51882eafd353f61709 |     
       sparc |                   gnutls-3.6.8 | NOK | http://autobuild.buildroot.net/results/9965d5b746e483641160e0ea2ba3e0ff9edfb5d7 |     
         arm |       gst1-plugins-base-1.16.0 | NOK | http://autobuild.buildroot.net/results/961359c6ab76941078290e2a37cb73306c831d22 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/b3a6f8dfa8ab7fde5b144bc4e28e823ceb8f3821 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/247b8bda479f8b62c595e655c58705b0b8b0d4fc | ORPH
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/53ccf95666ebc8a7337898c0aa147b3ebdcc7a73 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/03e2a4cb3c6e9df2c6aaacf2122a919381c9a422 |     
        i586 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/d98f4cd9fc83150dd17454c8232c8851f3cc0103 |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/30a28566a6677fe0f08a026daede8b75b09831df |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/3caeae6582e6bbd71b1b549032a6cf4f91df2154 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/34b1c1ad51ebfb6931ff9335e740f2bf413bb1dc |     
      xtensa |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/e3c62295e316acbe90590a80edc5e71572af641e |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/098b6bcdf9245251478845defd92b7a5450f29cd |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/c8cb4b7444bae20d4c74c8afaed1be1f9dbe5058 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/2bd9eab5a1edf1258b143c9079c290106522c479 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/5f621a3e85a59b7c94a8fc682f0e99c980a2f2c0 |     
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/c24faf5d570846c45c09769e2edd5959853dfd56 | ORPH
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/8072a42583611232a66b6a7721da15c52f71ae68 | ORPH
         arm |                libgpgme-1.13.1 | NOK | http://autobuild.buildroot.net/results/ee80b25c7392823e5320e00cefdfbdabc631f29d | ORPH
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/0ce3eaf3640ea33ae3c00531497ac7d4e5acbe6b |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/2f198116a1e350bc03c2a49ffb7b99ec3d2aa1a4 |     
         sh4 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/41b9317a21a331e8affa100a1dc499382722b257 |     
        or1k |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/9c23424ad07d98c499540e79bdc1fbbdd1e7726b |     
     riscv64 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/cfa0e0c3963261ae2d7aae4b0cba9a1586a3b2cd |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/04c4a2b396c974961e1b99f4b904f5117423ad2d |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3f663857df515ab7b596f3b6e8f15fef2ed07531 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/9bbf7d4020d51a4a34b0e65b28b549a3474acfe5 |     
         arm | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/d2e3014e9c76f55f23f76bcd30a928c3cac892c8 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/07fd7a3138793fa028c2ff66b5847469dbf6850d |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/dc66f4c2a5c0ad70e07121ef775e7ff3e84538fe |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ffcecfc87dfeda93c9ac766056a177884c08acf6 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/e1347f61e4e9e14a61a4351a6a9f37ad410a4ac0 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/2c2308bf0795d1057a25d84a9465bc620f5c0a36 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/2d7469c55975e48dde7180ecdfe81f701bd3a51f |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/5ba575cc709562804133cb703117b8d364e33246 |     
     riscv64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/1cda3d8b4b6285131fa8d3bb2f22cd3be3519839 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/5501dfbe806d3c77dcf79de1b889dff5ebd0bcb0 |     


-- 
http://autobuild.buildroot.net
