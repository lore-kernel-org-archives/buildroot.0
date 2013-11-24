From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-23
Message-ID: <20131124073002.A9D1610147E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-23
===============================

        success : 67 
       failures : 26 
       timeouts : 0  
          TOTAL : 93 

Classification of failures by reason
====================================

                      qt-4.8.5 | 3 
                libiscsi-1.6.0 | 3 
               libglib2-2.36.3 | 1 
               w_scan-20130331 | 1 
                     nut-2.6.5 | 1 
                  dhcpcd-6.1.0 | 1 
                  aespipe-2.4c | 1 
                  poco-1.4.6p1 | 1 
                      icu-51.2 | 1 
tvheadend-2b649954346aa2e9c... | 1 
  toolchain-external-undefined | 1 
                beecrypt-4.2.1 | 1 
               qt5webkit-5.1.1 | 1 
              e2fsprogs-1.42.8 | 1 
                elfutils-0.155 | 1 
                  iozone-3_414 | 1 
               alsa-lib-1.0.26 | 1 
               uclibc-0.9.33.2 | 1 
                 webkit-1.11.5 | 1 
                oprofile-0.9.8 | 1 
          qt5declarative-5.1.1 | 1 
           imagemagick-6.8.7-5 | 1 

Detail of failures
===================

    mipsel |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/c0ef1e8ca118eb6dc7e782c3a1dae14a72bff416/
    mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/82ba9cdb4d9649be485cda48593fa534e3838c74/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/729e1a66d6b57385da4b1311b1d17b571bbf9ee9/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/cab15e113b68d64d93ff1af21817761ec8c98cb9/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/965372390a3c5fdee604ebd839bd2793b8398e80/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/d08e392c7e44b60f28965bc67219ce2859c96cd7/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/887d62c01a425dfc32f782e5c0c7a227ef368ce9/
   powerpc |            imagemagick-6.8.7-5 | NOK | http://autobuild.buildroot.net/results/cdaf84e4ffc44653f2a07222b62e9cba8007ee35/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/3e545ee695c00cc535dd754d8ba8ef8222f40f69/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6ec06dea010577907effd02d47d15263cfe5c151/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/e6f3049eb10f55e908605e4e70db3284282be317/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/c59d3c230fc0148a25bd23c536dfab2db9e9f783/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/c29a4e4d5b34325facfbad7a1c9ac2333a8bbcc1/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/7e4e369dc5640619e95983ad0b4571f3a3f0d84b/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/f1b56652821a0db566aa947945e7f3b30faef395/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/94a5c15c2def2e96e16cd35cf29a0b725207359d/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/1545d3255ae7652643e38a2e5a750d1d13637c92/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/17a18a4d5712e246239d4184b3bb40e401c9afe2/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/f728d36ae8913cb687831255554392556ceb4dd7/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/fe0149296342271afd1077badb3b06b175dc70c2/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/bb08b962a22cc1725eda177160b25069ad9d383c/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ba0e9077de9709c93982792f77239e178d492acd/
  mips64el | tvheadend-2b649954346aa2e9c... | NOK | http://autobuild.buildroot.net/results/ace25c72cffb6698ae7343d9fb514744fbf7a1b1/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/287a15715cd60c83ae47ea7c43450d9539f6a808/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7407b4216c6f9c949ec85632fea66167f6787bce/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/50ee32640ec8f01793767a51d89e255dabd5f6c2/


-- 
http://autobuild.buildroot.net
