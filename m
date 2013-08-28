From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-27
Message-ID: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-27
===============================

        success : 79 
       failures : 32 
       timeouts : 0  
          TOTAL : 111

Classification of failures by reason
====================================

               libglib2-2.36.3 | 4 
               alsa-lib-1.0.26 | 3 
                 qt5base-5.0.2 | 2 
                  stunnel-4.55 | 2 
               qt5webkit-5.0.2 | 2 
                      gpsd-3.9 | 1 
                directfb-1.6.3 | 1 
                pulseaudio-4.0 | 1 
                   ncftp-3.2.5 | 1 
media-ctl-ac40b79f002a2315f... | 1 
              strongswan-5.0.4 | 1 
                libtirpc-0.2.2 | 1 
                      qt-4.8.5 | 1 
                busybox-1.21.1 | 1 
                     lua-5.1.5 | 1 
                pciutils-3.2.0 | 1 
                   cups-1.3.11 | 1 
                  nettle-2.7.1 | 1 
              e2fsprogs-1.42.8 | 1 
             tvheadend-5956233 | 1 
               w_scan-20130331 | 1 
                 rt-tests-0.83 | 1 
                      bash-4.2 | 1 
                  sysklogd-1.5 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dafc9f0c237e98b9280e813ed8100ab913e629be/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1d587ef565425b574aeb85e6e2bebd2322634868/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a771c47b8d818245f8b66f128ea49db208fdfe52/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/b85caa22ddc13bdaaac25b9016fe902ade5027de/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/7673109f00d51a6072c23104ac82106962903e54/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/6c179dca4455e4cb651f9b6bce1b2604366431f4/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fab819eee4002a9c392c48c1ebaca5c5b6555567/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/94661d9cb3e27579a09e4518f55dd8406d1cc502/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/d58be37b9b18b37eab4acec9a6bbe28863ef4d22/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8159d3a5e7ea17ef4c3ee732fb21941a017429db/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/519219ec8e4c4aa06baf3353cd2e37bf4fef9362/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0a19073440d22b36df05a54c9104c139cc6d376b/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c3084342085371618f961c00cc866ae37b5e9453/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1f51c9fce5d3e2758ccea8176406289a1bc069b5/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/760bfa75559ec1fe2a7060e9e6792c9789410f2c/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7bcab9b94a81b89789dc1cabe9f6940ed4f5ea51/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/e2090822a32da8b70f0928644a03873a712f3c97/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b95477576f1d3a84951c70ddd158b75e9f19efbd/
   powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/d859068bc4a7f2b406ca83b8e19fe8b60391c0ba/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b970d41df5fa8f63b7ee90e99e7a91846f6715e1/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3577a7221d429658b459507cd2430fc275be8564/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d268003b0a3402dde930a72ab467ee393b2ebe64/
      i686 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/4532e7835c0bc047266d74fa5144d1e67a367ae0/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/439ce2c3c33a92966808071d4fc7231d50453c79/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/41534b06b9bdf1a373f3fe4f4717c3bc8c9d7e1d/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/28527d8ec87d7c0e9d380682216a33ea192eee42/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/876ea074ef53e020d7e72bc508aca834d2dda341/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/f037bf84f58ae293d5b26d5260e3a47a0ed36749/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/a24bcf23cfc4e5d69ee29ef11397679eb8198468/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/f3a1c2245eab30a512fddda620c42b1cab1725bf/


-- 
http://autobuild.buildroot.net
