From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-27
Message-ID: <20130628063005.BEE3052C0E2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-27
===============================

        success : 84 
       failures : 53 
       timeouts : 1  
          TOTAL : 138

Classification of failures by reason
====================================

                polarssl-1.2.8 | 11
        host-dosfstools-3.0.20 | 9 
                    acl-2.2.52 | 3 
                 qt5base-5.0.2 | 3 
                      qt-4.8.4 | 2 
             bluez_utils-4.101 | 2 
                openssl-1.0.1e | 2 
                   dbus-1.4.24 | 1 
               libgtk2-2.24.18 | 1 
               libglib2-2.36.1 | 1 
                  libbsd-0.4.2 | 1 
                    liblo-0.26 | 1 
                       kmod-13 | 1 
                sdl_ttf-2.0.11 | 1 
                 netsnmp-5.7.2 | 1 
                directfb-1.6.3 | 1 
                  bcusdk-0.0.5 | 1 
media-ctl-ac40b79f002a2315f... | 1 
  CXX    Source/WebCore/css... | 1 
           heirloom-mailx-12.5 | 1 
                  libnl-3.2.21 | 1 
               openswan-2.6.39 | 1 
                     m4-1.4.16 | 1 
                  iozone-3_414 | 1 
                  dhcpcd-5.6.7 | 1 
                 libnspr-4.9.6 | 1 
                      gsl-1.15 | 1 
           imagemagick-6.7.8-8 | 1 
                     pcre-8.33 | 1 

Detail of failures
===================

      i686 |   CXX    Source/WebCore/css... | TIM | http://autobuild.buildroot.net/results/467c1fc129fa9af2cc3d988c781be9f770942a26/
   powerpc |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ffb51bd04b754d15e73601e00ff45d00aeff429b/
    xtensa |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a3d67b86e7655cdf7e07dd061a131612693cc412/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ea7cd58634281575e3b9d9bb4e54081e52abd53d/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/6a7ea790264d1fe1d5e57345b1623bd88cdb23d0/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b889a8e9e9084c174cfc76787b2dfb407410fbd7/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/78901c36517b1d897a1200ccddd79afec8a605de/
       sh4 |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/f15481436f073f023db8af7a7f6c0b7ef4e4ef32/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/c20839cfe652466c6d62d93a6745f7726d898b2d/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/f9d15913c675576954d00525018b7e38f75fb437/
microblaze |                       gsl-1.15 | NOK | http://autobuild.buildroot.net/results/04a4b7344100c8c0175c4c5d519cb4b201c356c3/
   powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/8f696ae427c242766724dc7f8f125d86bd6bf516/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/a660c5c318c749d2723418c45e60fc71d2111a47/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/7f0cfdc2b9c459ea90f42955e7ba4c9b44bd6c00/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/2807448311777a623883632166e5df237620330c/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/9d577f613c5cc3c16885cfade106ecc556e4304e/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/cb7044bf38528f4ec1cdd0bfe741776415768f6e/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/58e232f621caf838347277948fd5297c760c8cb0/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/39467e6e896cded482face2409ff4e203cc2a9fe/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/d86296b9bb3e0dfc69c5cc0a685138e18d78a36e/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/90975f2bc136247e41dd725821b1e3c02cfc6283/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/0a8c15744577bb18bc84c1ba01a55d653c179575/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/a550628b91a5688821346fe16db71f5cb3f64ecd/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/699c25d1239f11d3e6e6092ab39f1a49406e59a7/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/39728c5eeb6c4e213cd96cb6639bc28f337bf214/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ab943a144376867bc7f462e5520312c0cc335e09/
    x86_64 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/1e4e98c35d45828d55dddd5125fd614d0db6bdf7/
       arc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/60f4b896ca56ddd7301dd4b5394dfc8f7564c634/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/3df0c70961a925605c619cc6258f03fb73a5f3e4/
      bfin |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4923fdb361d4506d8932d3030bb468dbfcdfa049/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/703587773718de4f5cc1dd971b726610fe3446cd/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/287e24e56421c9cdfb3f5669ecab333674dc47ea/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/9f9ef4033a45586368e47b61fd41306ace751ab2/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/58f951ddcbd7910a1a2663b3ce5e2da894ac6e2d/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/27baee1366a8ab0fb14c3ed9e7bdd1ee7f7524d0/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/f335690c094b52cf81c898154644597dd974a503/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/1a82173c7225a27c61777bb520c4b6f953539fc0/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/bc29e700bb1992e4d58e5353ea21f04b33e287c1/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/1a13edcb5ced1fbd4f1657b1d77461c037456655/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/db2ae7b196e7def0d83584e71ae1262625b546b4/
    xtensa |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ec340fffa6eebb18a0746097419359b44c557a90/
       sh4 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ac61b144c306f0af99abf881eb30855aa09126ff/
      i686 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/41b2b2af4cf4df21e5e97d4ef4c062ff1b7e4fcd/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ae30c7edabee9af1950972ca48d7c92719214972/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/6b1d1371036137eff635c3c00c13e299a321346f/
    x86_64 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/99f401c856de69d53d810fbf07cbd1a963a0edcb/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/6285c4305d560add327aebde9d1949994f238469/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/976c9349fbb64beb1b42fc0284ed34ac6fbbb6bb/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/38c696c5427b8aa98678d8fc6e142029261931cb/
     avr32 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/56d1d8f12a847f1ba49547a51d7a3605755a0bb8/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/af8a46b47fc5e7d22ad4c56c0a771b9dc40f8f89/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c88d7f00769e8db210b6597038690b6857d7c932/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/856034c9b558f6976bb94662adffeb0e2a39c795/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/5d0c037bd0fd508efdc5a434199e1cb502814dc4/


-- 
http://autobuild.buildroot.net
