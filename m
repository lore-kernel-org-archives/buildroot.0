From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Nov 2017 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-13
Message-ID: <20171114070011.5E8C320503@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  13 |   2 |   0 |  15 |
      master |  88 |  24 |   0 | 112 |
        next |  24 |   3 |   0 |  27 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2017.07 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/32492d90f7a5df15bf861e3225a954d01490e7f9 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a2f14198761ff933a7a89a3f2c267e10be15bafa |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mp4v2-2.0.0 | 5 
                      qt-4.8.7 | 5 
                 mplayer-1.3.0 | 3 
                  fwup-v0.15.4 | 2 
                  boost-1.65.1 | 1 
                     gpsd-3.16 | 1 
host-google-breakpad-7515ab... | 1 
           host-mono-5.4.0.201 | 1 
                   libnl-3.3.0 | 1 
                    mpv-0.27.0 | 1 
              pcsc-lite-1.8.22 | 1 
pdbg-77158819158d1d7053a737... | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/9fe4c4d7fd46c00cbf26adab20ce43b679fc7c20 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/a1bd5084309ced6c2d1b311617e5d9f0c362557a |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/4d31f45f366ff91332b6b0f4d307723454b2ed6b |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/93b19b726fed62d7b669f7ca17dcf03ab62e0640 | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/58a8e2a1c554feb1d0e37ed4c31bd163640b9b55 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/6c83259ab73bf27f7381c0ce96fdbbb7901b85f2 |     
         arc |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/0ae0d6eba6e2cd8d2298cc4ba6380b8c3e9dd86a | ORPH
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/1812a237e908709479ff36514a8e0052a84c3603 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/3884d8e7caf6e447a6fea6d3d1cbb76aa6c7f805 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/b0e68ad2aeb7c191cdaa9856a36bd2cae4bcd5f0 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/dbf91eb65429e72d2a28d01c3659a7fcd953d04d |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/a66c89e3fb3f1d9802581aaffad87a547c6e67f5 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e8ea11686b4a513840dd94c864288e8987603237 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1f9baa1e89e9c8166260f7fc5f03cb5370ac1aba |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4368a00df31655fb15fa79e092b031266ed678e9 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/6c650995adf794d58912094f9ab5b5fc34567d74 | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/fa9bdad8d8b57d1db7f22abdb063ade470e9f938 | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/8c9c7efedc521e71b19ccbbf2f1a6e47db3f26f3 |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f3a4fcf96d67f039d6173cbbdbd1d0cea5736e9d | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/18d1e9ec0519778d0088cb5eeb0526e6c60053a1 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/629795418d956feac903c82b35a5e22ec5e302e0 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a2d12a49703012bc6a01a0356e2a1226fc8b435d | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/282f16eca4ac9e92069bd83ce16ffb3900b6b4f6 | ORPH
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/161eaa49a419a4d70beeb3d645ceee1b84d09c65 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             freerdp-2.0.0-rc0 | 1 
                 mesa3d-17.2.5 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

         arm |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/4f041afc994cf8c4070d99fa849b682d7ce17be6 |     
     aarch64 |                  mesa3d-17.2.5 | NOK | http://autobuild.buildroot.net/results/b42c0ab5fae0476b9753c40454f80dc516841c74 |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/aacba4151e9f22ea91f5279f867e5943c36e891b | ORPH


-- 
http://autobuild.buildroot.net
