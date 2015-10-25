From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Oct 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-24
Message-ID: <20151025073018.6F3311016AD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-24
===============================

        success : 137
       failures : 45 
       timeouts : 1  
          TOTAL : 183

Classification of failures by reason
====================================

                   mplayer-1.2 | 9 
                  ffmpeg-2.8.1 | 5 
               syslog-ng-3.7.1 | 4 
                  libv4l-1.8.0 | 3 
                 sudo-1.8.14p3 | 2 
             python-spidev-3.0 | 2 
                  qemu-2.4.0.1 | 2 
             host-nodejs-4.1.2 | 2 
            shairport-sync-2.6 | 1 
               openldap-2.4.41 | 1 
                    ustr-1.0.4 | 1 
                ipmiutil-2.9.5 | 1 
                   perl-5.22.0 | 1 
                  dnsmasq-2.75 | 1 
              strongswan-5.3.3 | 1 
                 mpg123-1.22.4 | 1 
              libraw1394-2.0.7 | 1 
            gst-ffmpeg-0.10.13 | 1 
           gst1-validate-1.6.0 | 1 
             webkitgtk24-2.4.9 | 1 
                harfbuzz-1.0.6 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                           all | 1 
                   dvblast-3.0 | 1 
                   bdwgc-7.4.2 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/9d281424a9658efea7cd66d53720c9b680d9b3bd/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/4a87a50e1d9874f786c28464bf2ccb4fd36dfa90/
         arm |                   dnsmasq-2.75 | NOK | http://autobuild.buildroot.net/results/9b029cc7246cdd332fed91f64a5c94d37dca4fce/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/8c32be896701388d7595c037cb0ac9284e3a4001/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/fd8443c4ff4b09c8b3f2b650b781f8ecb12e309b/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bda183c650c70c16c826539c3759796b235959e3/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b028a0141a45d46f6cc4e04eee09c467a0cdd3a0/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/57666b5c0d2fedfacccb60f11c88c2f917625d94/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/156101a0961df9d1c199c1c24c8008c0f12dd896/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b738d3e1cc8c72ae4f834d9a89ce7f87072233d1/
     powerpc |            gst1-validate-1.6.0 | NOK | http://autobuild.buildroot.net/results/9871e31bf47bbbcb025815520cfba0c4d2f476c4/
       sparc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/d914ae06084b2d7fd5da200fe2eb26d762c2fbf4/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1846f635331e4076925201dcacd526b2d80f0ecd/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/fb9a07499ae06b0839b925d97891a3815c1b8567/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/e517989ca55589ec466cc2b8b35150797b8904f6/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/3f67817b35091d1a303697690d44591398100ed0/
      x86_64 |               libraw1394-2.0.7 | NOK | http://autobuild.buildroot.net/results/508ce81cfa4597b4222949923fb0894e4f623796/
    mips64el |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/dcc81e36e38ee6d764da444f5203132b5ad5077c/
     powerpc |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/63035ab69957f66966aa1af8b080028c46805718/
      xtensa |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/f806c84acfd3de3e9714dd283117f91c8a024f64/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/3affce67286763c8eecfadc077009c1ca2241ed5/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9c123fe510901cf6d32ecd38f2320b500c1d4dd7/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2a43bd0cb086a4a65ec7052848b7bca4dd66b3bb/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/87cf848ecb674673988eb773070feec8d9cbf835/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e6008c2c29ef9c2f94a95706a2deec66a5f4bd77/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ee16d6c0569d6954660b1341bc59655a9be4f663/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/257dbb3f9e1df5979408de117f8324ed38955394/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/123489162fa1d945fbe0f4df29a361ea45bbcbbe/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ca777f7eda22f0c97522dce83f21d4cd9d235ebc/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ee137ca7b80bbb39b862b87426ed24324b140a25/
       nios2 |                openldap-2.4.41 | NOK | http://autobuild.buildroot.net/results/09032cf1d56622f73dbe6bac49fdd776756458c2/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/cada750d4f545a3d8ffc62cce5f09d23bc00d9b7/
microblazeel |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/4f14fc00134b1bdb6d6fa5b1e09b1d2aff0e1e65/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/0e17ad62358167add053315a99fcd026c1551ccc/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/592b8096d549ac17336f60d79a44cf120a55d282/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/ad787fc34e1c64c6568e88dbd075f1e4d504e0aa/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/660a635acb3b6643ebe28f20a088433119da1105/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/c456bcf466bee937c0271ff01f2614e84fe0b878/
      x86_64 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/aa637a0506be0e007ee8564460991b96aefc28c1/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/2754416d8e69acd08b9ece632cd4ccb7399f9d59/
      xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/7d26e8efe67bf958162a309acb20800e669543e4/
      xtensa |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/58214c416e5ba818a0ed653a28080d3e397e5035/
         arc |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/af5b8880d29d5b34add39c89c9ba29e27b1616ba/
         arm |                syslog-ng-3.7.1 | NOK | http://autobuild.buildroot.net/results/a3dfdebd76d47df11a8e26a215bb88fbce8dc6f7/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5956a7ec4156ba12649e75c975905bcb485e8459/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/6893f99928c341246ea45245e3584e077637ec45/


-- 
http://autobuild.buildroot.net
