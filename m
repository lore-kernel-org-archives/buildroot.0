From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-20
Message-ID: <20140121073008.E717B100DCD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-20
===============================

        success : 85 
       failures : 35 
       timeouts : 0  
          TOTAL : 120

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 6 
                  thrift-0.9.1 | 3 
                 mplayer-1.1.1 | 3 
            live555-2014.01.11 | 2 
                     vlc-2.1.2 | 2 
                elfutils-0.155 | 2 
                 libnspr-4.9.6 | 1 
         host-elf2flt-20130904 | 1 
                minidlna-1.1.1 | 1 
                 qt5base-5.2.0 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
              e2fsprogs-1.42.9 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                    sdl-1.2.15 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
               audiofile-0.3.6 | 1 
               libbluray-0.5.0 | 1 
                 webkit-1.11.5 | 1 
              pcsc-lite-1.8.10 | 1 
             util-linux-2.23.2 | 1 
                       kmod-16 | 1 
            gst-ffmpeg-0.10.13 | 1 
           imagemagick-6.8.8-2 | 1 

Detail of failures
===================

       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc04fb33a5fc9e468c8d119d4c401fa5b4bbd8de/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/67eeea013e4673b999f1641952099e240765539d/
      bfin |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/11a308e62ab6c50e2eb5c2218ae086faec14d619/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/a30a87a379f206c2b822d13a1726dcf97ba41b07/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0d00b53a89b7a7afca395448db6b738d53a512ce/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/6b09374baa00ce1d80cc126629694af8c63af23e/
    xtensa |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/08a27891fd5336250f00e611a15ea45505985f67/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/2ed0db578a5b9ab72a9bd967bb1c796614f8a27d/
      bfin |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/528c905650f1f49c77e099841016b0673efd24a2/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/277d051093b62fac805b4340eca10d218da0649d/
       arm |                libbluray-0.5.0 | NOK | http://autobuild.buildroot.net/results/2bc0ce057e54bd6ff7f9ade115c389648a2df2eb/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b8fa864d3db9d9cbfe46e90d7ca11e8e84d89629/
    x86_64 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/d2bb82d0cca04ff66f7d1c8c2f0493f41b43ad3f/
    x86_64 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/3b2e5f3a3914a3a651086cd8d8520380a7612d7e/
      i686 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/26ad398bac0b1794681e2bb558bbfbd020da6be8/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/3dde2ec3c165a629afbc96f7374328d33d06b38f/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/d31d863f22eca745da03834f2aadfbfe67bb11f3/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ad5a66bf11b6cac816a85dd4d2cc8dc25b821997/
       arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/275e22e4054bae0d05a9771f04e07ff7e8ce3dc9/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/723a30465b1090aae1c5ec774ad0557e2bc938ac/
       arm |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/06616b44adeae52512efa9760cb9550303f60145/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b9d309ead7c583fe8fa96157e07fd79d50bb7d11/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/69e5adcb5c92259566556aea2b0ac4290f6d0cd2/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/11a83be74c222c6434053d5dfb9a23d36d03c5ec/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/7b2c43f7f6ff6b46ded7a9dbd8c1040bce97fdf2/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/94b584164c42994948b975af77da05b6fc3a02af/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/9d93582362773bad2dbb495a7796682f432e8915/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/cc106d1247f4255fdc12f3c6d768d4f2c4a4c3f4/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/49ea98785653c904f38ef0d158fa9cfda6a80455/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/06e0b7e985800d47a7625f8938985dd7d126c8e4/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/34575fbfaaf0f3851f5d934201853fbd2b40bd44/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/a92b26db67d79839c3c2c246b437207f741614f9/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/eccfb07617b3e7781731c7d63a08d4c7afddab0d/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/407cc8b5c11cc39aaaef877545504d51d9850b9c/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/ba8bb30cbe35631d4ff838f2add5a777c40ea6c4/


-- 
http://autobuild.buildroot.net
