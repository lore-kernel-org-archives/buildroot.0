From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 08:29:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-10
Message-ID: <20170211072911.4D2BA20B9E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-10
================================

      successes : 189
       failures : 46 
       timeouts : 0  
          TOTAL : 235

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 7 
                   ortp-0.27.0 | 6 
               openswan-2.6.46 | 4 
                 qt5base-5.8.0 | 4 
                  lcdapi-v0.10 | 3 
                  samba4-4.5.5 | 3 
               bctoolbox-0.4.0 | 2 
                   ncftp-3.2.6 | 2 
python-libconfig-b271c3d9da... | 2 
glmark2-fa71af2dfab711fac87... | 1 
                  guile-2.0.13 | 1 
                 libnss-3.27.2 | 1 
                 libv4l-1.12.2 | 1 
     linux-firmware-legal-info | 1 
                    mosh-1.2.6 | 1 
                 mplayer-1.3.0 | 1 
                 openssh-7.4p1 | 1 
                     php-7.1.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 rings-1.3.0-1 | 1 
             util-linux-2.29.1 | 1 
                 wiringpi-2.32 | 1 


Detail of failures
===================

        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/5f1e9768fae771f2eb1f5c550e4738dbfbfa972f
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/4ad76e8ac972ba32a79ed3c1daed5e74e7bb440c
         arc | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/ba9622b3112a35c6075e278864505de647267d0b
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/90e45b86bf67e5910c324855957eb2a83e129237
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/5d0de2f215d45a7ff0ed12b12d180639a80761d1
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/0c5f16a311bb4d78c7e73428cc12295a571113b2
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/f188c0295a60b3d85eb2d32b31892b056c0d95a5
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/48bf8ac7475a8d9a6bbf91bfe886f8154707a15e
      x86_64 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/76b5dcded54725c9a5c6dfbff6464d67c7fda506
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/3aa5d0c3fad7b0e29373d9e998dca05cdb711c9a
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/f5d8ff9dde69f64f024749ceb67c7740136e43d2
     sparc64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b465730cc7eb3102865ee8d5367b7256043f902c
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/c3fb1d30ebef65023113dec32ec1cc0bfe1a7665
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/56ee7a85c2d044a82d6e08fd9fd9a53ab527685e
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/dd7c2ca67a4ecee688a85d2d9838bc6151e87f6d
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/34eef8deae57f7efcdac0e001b7671dcb1f0156c
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f24f153e5b333bb4ad2100c755b0e6d9dbd47dfa
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/7849b665e3c2004558f7871d9de69c62deb1f366
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/260e97e2f6b7cf0b138ac1b5a5e150d7f2dd2b93
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/5c8d56e1804018725dd9815eef760ed5f70f06ee
        i686 |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/fc5fa1c98c1e07b142876ee5e2ef5c3247725501
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/b4ade3d14cdc6c97cec4b219ae97ad6562766808
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/aa3a6909d25c4a4b14d11d71588c6225b2ab2836
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/c7e6909470b0b1e1269d8f14d5ffb798a4250d00
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/a2db4f870db54f8a4356df46fe9ded9cada908fb
         arc |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/9daa173d8726af1c738b8fe0466ce08f64abf499
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/eb3259fb72e584ae7066ec63118ff306bb53b5a5
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4f1aa67c8f6a0ae266e11d8a49bf88673027d6eb
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/70ec5dcc8c8ccd517dac8f056f2c5c30ff9708d3
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/880430226a910bc5a2b323a18509641748f22a8f
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/69462f6db1cb2e6ffb4ce69160192c5ea8bbd766
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/1f775dee9da72faab5652a92246a36dc7d4c10e3
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/19e32a5772490232a7b06dcd9965091e0375f25f
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/64e805ec027abddecdce1484a89fe52b4b7b9b25
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/bc9232b6afc3aa5b2370cb5dfe57262a66a447b8
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/36c414a4d6a24a046034a939031d35dc0554da61
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/4e4ec7a2d8177fea5f3285268b024aa842bd5d0f
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/738d20c8b93fad86cb86c1e2adcc98f4dcc43f1f
        sh4a |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c4899ecf9d4c575bbd9b6076450ec31c6f9c18d0
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8737439ff86728ac5bda13c7f86c2e3ab2116c89
     powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6b39cfdf9846c74c5dfba55ff196fa202caea11d
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6266e1cb883599eef93af6b3a4728e2f0a69d5ff
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/35eb9ea2ecd705b0aeac59e44a93f33ab538a813
       sparc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8e644e9e5f388fce317ec0d03fe9c23116de290e
   powerpc64 |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/544e8da290d40424ea3d1bffad7e0b8a566de495
     powerpc |                  wiringpi-2.32 | NOK | http://autobuild.buildroot.net/results/b905617dda0e120d04c54daf7cae2bad236ac767

-- 
http://autobuild.buildroot.net
