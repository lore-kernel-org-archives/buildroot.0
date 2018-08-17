From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Aug 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-16
Message-ID: <20180817060009.8F5B720794@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   0 |   0 |  17 |
   2018.05.x |  21 |   0 |   0 |  21 |
      master | 162 |  13 |   1 | 176 |
        next |  38 |  15 |   2 |  55 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
               aircrack-ng-1.3 | 1 
               domoticz-4.9700 | 1 
gr-osmosdr-164a09fc11cec2d8... | 1 
         host-cryptsetup-2.0.3 | 1 
                host-libsodium | 1 
            micropython-v1.9.3 | 1 
          openpowerlink-V2.7.0 | 1 
            qt5location-5.11.1 | 1 
               qt5webkit-5.9.1 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/df34ac3760b6b806dc522d90ae8b9d56e47300de |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3beaa05afcfbdac33d5f81e787e8e50fa3cccf30 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ef03174d83fa99a7b5e244186c294dfbefec21a0 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/869dbf5370ce661c6521b156cde8c6df18611608 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/622a4f5493d78661195b06fe189731f8b0ca1f80 |     
 powerpc64le |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/61337be3fd7ae95f521f72153a6fa25644e9a156 |     
      x86_64 | gr-osmosdr-164a09fc11cec2d8... | NOK | http://autobuild.buildroot.net/results/aa208a69996548c15d937fc7c97d267162a56c48 |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/4d536ad44e424933dc0889ff172b7e2b161d32a3 |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d02eb76d1f4e7c566ccd291fef9432422c79aa3e |     
        m68k |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/e4b6b783538a3f8ed6ec215c4e941d150b679cee |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/085da95e897bb795c8b5eaaa71e6c77cd7fa7f98 |     
         sh4 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/9c96d2106222e623a379f9995bd059725eb27769 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/7c41baf0632c0789dac98eb290d6ecae3cf35c9c |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/37a4bc4858950884a8bc6af19e9cc09648ec8cd0 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            host-lvm2-2.02.180 | 6 
                 host-rauc-0.4 | 3 
                linux-firmware | 2 
               aircrack-ng-1.3 | 1 
                  boost-1.67.0 | 1 
                cutelyst-2.5.2 | 1 
           dt-utils-v2018.05.0 | 1 
                    gpm-1.20.7 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/d07089428f3cca4def419a1c14f068ff0a5b823b |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2c379c482a81fabac58acd80798d9a6fd81a9e16 |     
        i686 |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/e8248c6ced1131775ae788b6b6b30d8b3245eff7 |     
        mips |            dt-utils-v2018.05.0 | NOK | http://autobuild.buildroot.net/results/66ef9f1942efe4363f1f3786ba0183a0faa239b7 |     
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/227a7edf9304d85645d3e7fa0f930fe2e9b6e752 |     
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/3f9794515ea1ad34610176e157b45e06aa764f04 | ORPH
     aarch64 |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/e540c2c5bc86fdffca55b49d21233354445f2534 | ORPH
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/5f928117c5dee7a4f25e0fd0643fe398cdf861ea | ORPH
  aarch64_be |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/ad171c875890326fd315d9f3b137bf0f2fe39273 | ORPH
    mips64el |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/1f5ecc0ed199ce0659278af2920f1e1bd3977f11 | ORPH
      mipsel |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/f95dd353c17bdfd00fde6762e58aa32e6830b52b | ORPH
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/aad42fcb97c16972676af870748f6c245e02271f |     
        i686 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/b680ea605cd93204b8e0338c62dbdce6b8da7ff4 |     
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/28d1c9e711b64e21b0388b86347f128126cf1e97 |     
      x86_64 |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/5416b2ad07dd8f1f36841c35713b33722aeb2de3 |     
       sparc |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1 |     
    mips64el |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/1b774c2b9e04fc0ed44402eb94800568c71ef04b | ORPH


-- 
http://autobuild.buildroot.net
