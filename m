From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-18
Message-ID: <20130919063005.AD47552C1CC@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-18
===============================

        success : 53 
       failures : 88 
       timeouts : 0  
          TOTAL : 141

Classification of failures by reason
====================================

                    orc-0.4.18 | 9 
      host-gcc-initial-4.8-arc | 6 
    trace-cmd-trace-cmd-v2.2.1 | 6 
make: *** [/home/test/test/... | 5 
                 dropwatch-1.4 | 4 
make: *** [/home/test/test/... | 3 
              libatasmart-0.19 | 3 
media-ctl-ac40b79f002a2315f... | 3 
make: *** [/home/test/test/... | 3 
                      pv-1.4.6 | 2 
                 cairo-1.12.10 | 2 
                  nettle-2.7.1 | 2 
                 binutils-2.21 | 2 
                aiccu-20070115 | 2 
           imagemagick-6.8.6-2 | 2 
                     m4-1.4.16 | 2 
                  iozone-3_414 | 2 
            host-python3-3.3.0 | 1 
                 qt5base-5.0.2 | 1 
                 nss-mdns-0.10 | 1 
               audiofile-0.3.6 | 1 
                 fdk-aac-0.1.1 | 1 
         matchbox-keyboard-0.1 | 1 
           python-pyzmq-13.1.0 | 1 
                      qt-4.8.5 | 1 
            netstat-nat-1.4.10 | 1 
                  ne10-88c18f0 | 1 
               qt5script-5.0.2 | 1 
                      gpsd-3.9 | 1 
                  prboom-2.5.0 | 1 
               libsigsegv-2.10 | 1 
                   libcap-2.22 | 1 
                  weston-1.1.0 | 1 
                    ola-0.8.31 | 1 
                 libnspr-4.9.6 | 1 
             alsa-utils-1.0.26 | 1 
               w_scan-20130331 | 1 
                      icu-51.2 | 1 
          enlightenment-0.17.3 | 1 
                 libssh2-1.4.3 | 1 
                   mplayer-1.1 | 1 
          host-protobuf-c-0.15 | 1 
               alsa-lib-1.0.26 | 1 
              cryptsetup-1.6.2 | 1 
   webrtc-audio-processing-0.1 | 1 
             tvheadend-5956233 | 1 
               qt5webkit-5.0.2 | 1 

Detail of failures
===================

      bfin |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/549bc89aeaa0ebf9162fc5853cb637f4f70d0b51/
      bfin |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c5772f25dfe826c57356504fba7209d8ce9904ae/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9227b815c42cf669df432e914265321c2d32880a/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/70978d9be7dffe2036c55b085dfe42f73b447b66/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e6b64bc103e872ea38233534fe4c8443acd56a7a/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/84e7aca407a044b91426ecd7b30e8214e1b9a15f/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/72d0ca4f39ba75b5bf24a94f66c75928deb05a08/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6da1ae037df34021c409f1e25c027ffe697d3405/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b98df957d0af379fdf63f97713299e2ff488c245/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/fd1daf3e2ed920c5e07e7709e1c011bbde4619fe/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/101618972eb81c4fb52fc6f6d92cea3dff828018/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/6937e801dcd200bdad455bd4601c3d44e9dc5afd/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/820ba353399ba325788714f23647a863524a4c90/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f1216b625363861b7a2c5e3d783ede30d355e4f7/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a1751ecb8c23a85433d63d3d32c855b15b3e9619/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/4114a950ce0d919c6e43eceb1385617df7e9ec3e/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/fb3bb5af05ffce680a4ec58352817be30dc8bbea/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/fa9c8e0dde011a4f36316d832eb025e980af9a52/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/8e696cedb37d7bcf6c62965311d15d2614c221d3/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/a540c070faefe8371754cc80e8eddde79e9daadb/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/612a83c4678157cacd2ada95527c7943ff81f267/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/dc83302b57bae9b3b62b5d0592665c3e290b3a34/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/8554385fdee2c49f1d91c80858fee1a80ad1c9f3/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/447a5772736006f3410d8a25b653837c2ffc2674/
      mips |             host-python3-3.3.0 | NOK | http://autobuild.buildroot.net/results/d6cbb9848a427d706eaa2185429e6b1ebb62a5f0/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4239bd7af9e24f71eec43d8002b61dab436a6e6c/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/f4ad1d65c2f7e6409f04378dde08b02ccfdea86a/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/8469a27c003a490260441f8a61ba66f65b157867/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/5b94bd1e1ac6b2e0f9ea5ed23f1366a9b39c5d54/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/d264d7d3edc7de6f6cd54630c9220dd1faae76f7/
       arm |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/31d1ded6f75ccd2d5ab787c226890e1b988abfad/
   powerpc |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/5ba6549c82182088f01e0bda3d182f0e01298a00/
   powerpc |               libatasmart-0.19 | NOK | http://autobuild.buildroot.net/results/a708864cb5cf5cfacf7436f354333b96038723cd/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/8829fd287ae405f7401c1340ad97f0bd21107af2/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/9d0f7498e92d5355e539a43664989c598d1db5e0/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f3a1401e9a8e0e0053e6bde6ab5d9f195d781eb7/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/90809f93e54f78358ad5c71791bbf6eda1b9ca2a/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/8cdbd129188570ecc1cd88a419b1f83cc1d1ef9c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/88c6a36e54e930e07ce481c8197014a18f827e07/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2a6ad026ff9d720681d8757b68c5f5ccbfa0c752/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/bf0574d5ee0ee90aef7430514f57ca693159e80c/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/94448cdac84cf05c718b526287b76733146aa281/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/6099f94a35a0dcb7fd4d2812cce1003ee8899d3a/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b7dc3c1d9014f76e2e6ce36e8f9e080de8b23e72/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7c52db61bb61493e4553fcb7efda02d94b52ac61/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5c0fbfbbd12656797ce1bdcbb8adcc5de6c19bd6/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/117a71edc18d64040a8b51e6ba5ced44f1733bf6/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/07813ff6582e17d5f93c49f20c1de043cb8a91d6/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/bd2be42f08bbfeec94f6038c369ba928bd49933c/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c810db1352163e3ff6c85f2294d908d7a8cb6968/
      sh4a |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/5f70d2d3d33bba504ba48044994db73035de2262/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4f0e91a01c94882b255457c66e9485065741f9c7/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8c1a76acf33a781b83e008b0e829077f192b1e79/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f1a603242874c72bf0fbb48be82e9d03afa60730/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/389d7176684d1a1c119727cb3a4476e8eb4713f5/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/e97e9f4e9d7c0d485c735cfd1d4bc6eb482bc4c6/
       arm |             netstat-nat-1.4.10 | NOK | http://autobuild.buildroot.net/results/8a3f10150bea059349b7424e139a5acc0c3b8506/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/764a58a1a58428501be639c61ba4d1038bc64039/
    xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3f4aeb79aca0cee5defc3d4ee4cc3cdd989aef8/
    x86_64 |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/56dfe43c13a6b852c8954a76fea1aef718ccb2a3/
       arm |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/385f05b5e1b023b6c4ca220aab897e400b5aeccb/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/4d6e7d0216d683ae58aab5852333e0616c8017d8/
       sh4 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/6ce2f977aed6264b669c9ba9982a846c162a53b3/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/b78441bd8ce9404451928684033d213e536b3058/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/3bc8c1573ea05ce84005ecb4e341211411f69f80/
      i686 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/d11ec4e1efc2aa48771643c438f2d447d77cd3a9/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/cb5664b7dd319e8f22849424f9cc5c34da66bd4f/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/f2a71d09436930eedb916b8cca9d9233e5e6b194/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/4eb1f6f8ba3f52e896e284a27a0f6303eaaad925/
    mipsel |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/92c3e2c63ed65a280c835fa30a72156c2704f84e/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/60a8326a62b56e9a6135daaea12eb308a8a5c5ed/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/b56c50e92cb2d1751b138645efceaf60cf1d1ffd/
       arm |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/65d281f54dcea3d1e88b123fb2c5a2e17ca48607/
   powerpc |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/217db8d6e40270f5893898409c46f0bea3fc5abf/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c662afde0f6a8a456d86461595b6383092530e67/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b34a1a8e4f375c4af3426e3caa3951328b12356f/
   aarch64 |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/4ecd214c2f52ffaf0806351ab5c01717982ece3f/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/5dddabc9de07d189bf9b6e228fb6b7a1ca8b8191/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7d14f154588e6682375c0ec94e44644d5a14b0ae/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/510fdb897eac548b3be45a6cbec1eb00786e52a7/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c2df7f9509631433662ed1000ebe342769056091/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/08a1fd38cf186c9ccbac9a7ab9f0ab3f4cd063c7/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7e5208b5b520b5cb5b409d86872734c97ffb2412/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8484e610a4e84f2d734dddbc0d82b898b210be4c/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/133c536fc129010eee0ca70027a52b7b92012650/
       arm |    webrtc-audio-processing-0.1 | NOK | http://autobuild.buildroot.net/results/5435304b12fa1344411821b749cb028485431a82/
   powerpc |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/967d7b8561dceb70c5dd100fd3aba57d54199c66/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/fe19ce010f9a96cccb7fd473e3437a289e23a375/


-- 
http://autobuild.buildroot.net
