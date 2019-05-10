From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 May 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-09
Message-ID: <20190510060041.0D59E86840@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  25 |   1 |   0 |  26 |
      master | 206 |  39 |   2 | 247 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 16
                cracklib-2.9.7 | 6 
              qt5enginio-1.6.3 | 4 
                   bullet-2.88 | 2 
                   netsurf-3.8 | 2 
                suricata-4.1.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                  brotli-1.0.7 | 1 
                host-libsodium | 1 
                          opus | 1 
                qt5base-5.12.2 | 1 
             qt5location-5.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/4790c30b75cdec18f67cda9c6afcb6971ee27608 |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/59aae12f81ec44105e939819f12da840a18db929 |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/43d0a2295cf545247169eaf97df0229b8f4805dd |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/2f88bb85423ec92fc80c5f9d656918a2f1618a8e |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/dda70b5b88c75d36c61fbf1cc5fca16ea8414582 |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/159771209c193995f47baae95181bf6499d8e8ef |     
        i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/21ab1d19a273be350c3b9398e82056c4035ca0dd |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/77583b3d2a7d03eb1cf290a24525bda0856bef2c |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/d8d06030c1777da874a3211655abb8c3cbe9f7f2 |     
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a63aa75ddac49a274e7dda47a190e5af28441d7b | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/34a988a1cb8bddbbf2933c0284a9f80ed4d168d6 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0378367e61614c9ea85354369dc4f01c815456f5 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a5d19ff545131f6dca9841eafb63a3bd0943e7c1 | ORPH
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/754ec770b13a8e1f7d493fa21564794058308fe0 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/717a850d9e51f960f0b0f8a4884b1d9d7878bd8d | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e04ca77ea94a0a5bed7b7747b96df367db8bc78d | ORPH
       sparc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/52feb5e2631c12e29469e25666c8fe9394ae6557 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c0f0bf86ed5782962f5589d356f4f7adaf377d57 | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7f8831bd3a8d8ae10219f664a71c4be9448987ab | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7244eef25b940f5101b847940a023cf44c7fa51b | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/9d35eec70d783e89de788ebdd12d0ab84583ca36 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3900d82d38ede3e4b0388404bc60e5158bafb9f1 | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ad387dfc1f867acc48b03968a47e643ffc4afb0b | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/46726551159982da7b136fcc731089de115930cb | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/85a93d95920e452fe36bcc07360f6b0c2eb7b9fb | ORPH
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9ba4fcc9717cde7a815f2949b8b5349292bfa178 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/28b43c29e241080e23c87145797ea00dc4b3970d |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0bf1ac2029c8e9591a55d6adfc2cc0b33b404775 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/3ba4e8d2f6111bed3b212dbcbd0fc007e0d83be5 |     
         arm |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8dd68e90337e6a9098c9bb0b6a6689261d21a32d |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/ccd430574792eddde6b82fa959ea0c24d00e3d09 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/731dd9eed45bae0fdb2c2af9dbf223badb412c13 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b6b5447b21b35933f06d5e48447ea0637164da8f |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/d9f77f03334bc693b38f83fc6b70fac2c072d036 |     
microblazeel |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/8351e3fbd6a39d05da6a6e7a978329d718dfc109 |     
        i586 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/de26fd4f5ab130bd87ea9d7709d9568290362758 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/bc0fcbfd7335a43191310ef12e791220e229f2a8 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/f45e2660622df557ae01826d5dbc8adaf04e3a39 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/5d3e1a961a0f06592212687534b5f679db22e754 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/5a515bdbd16e1e5f9129fd138f5290544f261b0b |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/7b9120014df6e888d3c497c62a57ec5df0d8dedb |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               openldap-2.4.46 | 1 


Detail of failures
------------------

     powerpc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/c63778ffe9ce51f204dde72d572775bf615dd522 |     


-- 
http://autobuild.buildroot.net
