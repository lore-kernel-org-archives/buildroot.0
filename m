From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-22
Message-ID: <20151023063017.7A01110148D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-22
===============================

        success : 156
       failures : 53 
       timeouts : 0  
          TOTAL : 209

Classification of failures by reason
====================================

                   mplayer-1.2 | 7 
                  ffmpeg-2.8.1 | 5 
                    ruby-2.2.3 | 4 
             python-spidev-3.0 | 3 
host-gdb-6be65fb56ea6694a92... | 2 
                   bdwgc-7.4.2 | 2 
                      qt-4.8.7 | 2 
                  libv4l-1.8.0 | 2 
         conntrack-tools-1.4.3 | 2 
                  qemu-2.4.0.1 | 2 
             host-nodejs-4.1.2 | 1 
              gst1-libav-1.6.0 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                    php-5.6.14 | 1 
                busybox-1.24.0 | 1 
     openvmtools-stable-9.10.2 | 1 
                mongrel2-1.9.2 | 1 
                harfbuzz-1.0.6 | 1 
           qt5multimedia-5.5.0 | 1 
               util-linux-2.27 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                pulseaudio-7.0 | 1 
                  qlibc-v2.1.6 | 1 
                   ushare-1.1a | 1 
              strongswan-5.3.3 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 jsoncpp-1.6.5 | 1 
canfestival-7740ac6fdedc23e... | 1 
                ipmiutil-2.9.5 | 1 
                 sudo-1.8.14p3 | 1 
           gst1-validate-1.6.0 | 1 
               ipmitool-1.8.14 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7e16a99471049d60bc5e90412d9677e47ea45510/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/15858fe1ccfa39aec32755c714c7a2dc03f49e9b/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/5a82f152e983641f6ca4336611aa5a3609291b53/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d632b1c8d8723d70b008a4ed2390fe0bfdac0321/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/2f2912c6636f668fcf063da67b6df068d6fb06c7/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/638ac1e86bea9485424e044377c1059d0139b8c7/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/6461e83be1929aaf106d9f07ccd853ffcd71ad41/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/55eb4b80e70e55f19084d34dcfbcbadf98483081/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5e748464f1b70a470832d128fa41d7306b580b58/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/76b7a38b17cd67df50a62030a2d963fa2bacce8e/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/36356842e9d143213f0f13f5197a7f010e85c5f4/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/bbfd23a83b6befbeeecd69a14f4b2f93ffa373d3/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/eb9ea0146bfc8ef9cbf2e852ea81783739174e02/
      mipsel |            gst1-validate-1.6.0 | NOK | http://autobuild.buildroot.net/results/52c059b815ab61cd265f935050674705d3db56c8/
      x86_64 |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/a70d5ae4d55cf6d242f6091096674d8938799604/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/39b37d8f7848cd95cd0f307b44671a72f0bfbb3c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/588ba08bdc3b764b3538f1dfc162b7810acd5217/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/02b32919f86318f19464a5dbafd8d1e5247db30f/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/f15558938472e0c201f16921ea9c65ad923fcada/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/1e75d1c9becd27e4f2a9ece09d0e6fb4688586cd/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/de892d6638c54d2afcc3e4967fa6d961b1f1b6ec/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8119f20da3fa97c9916ead7a309addd93e18d2d6/
    mips64el |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/680f9932d647704f1a5b2c6917444bc978a061c0/
         arm |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/af42f1f7090630328b1a82d529f0d4ddaa3f448f/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/e11eaa59a4c10d4e86189b8c0c90b2f61cd715d6/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/0482263531d72645722b9ccd7e9a1e153a19e838/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3d731ffcfc8ee92537143b05fe2b9b828f6de465/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1f163cc921ab6d3700a0f8c7bc37c0c1fc5a9898/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e4bcbcaf21956a8a21cfd8cc5508ce4f8efa5ef9/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/351460364c118b7fa9ad3dc0f0a098eb563e1187/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/95b2113a97e85672fbf12e5b02347277f6a1d9b9/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/29855ad563cfd7cf7905fb95a91f54b8d99460d1/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/bfaa6943e8f630608ce201db0cba3d31b48f912a/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/5a713970b81a2b01044bc2404443ce92d982a58d/
        bfin |                     php-5.6.14 | NOK | http://autobuild.buildroot.net/results/6572d671a9dbca364cd81d33c0cc0b985e1cdf88/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/9c5e5662864f50205ffc2e4c058acec036be5f5a/
     aarch64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/b06d472c6b16c6a087d03de1d6589b9e3773ae5e/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/ff55b0548a562ae185fd710e063a5f30f2d404df/
         sh4 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/1f6b35dd246afc84e71263034c152d856a460c28/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/aff5a8704a297fcf37f65bb31b969407f38b1a72/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/2f15043e5873c7c3bacdc66e4b4532a1d09df2fb/
      x86_64 |                   qlibc-v2.1.6 | NOK | http://autobuild.buildroot.net/results/9d8f6259c62e15cc528ec99d6375cc02c2bc7489/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3d286de4a742c9eb6f1d3e9a804b246c8631341a/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/93ae0d47afc937acfaad80f18e360b0c97296b1c/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/20acd953851b71ba3bf6d49a9ce46661e7b477ad/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/9cd87240ee7f53f643fc191ae4efbd6e5c18aaa2/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/7d45265d3e6ca61b6b1278536ce05c459a5cedac/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/adee65218fa79b0144baf88f3daf94ceff352d78/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/4de8eeb60db2a2cbc1a0246f03566371a363b54d/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/0088aca48bcf1dd4baecfbc77b15faf5ec06f2fa/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/2636978b2517a2c0fb508a6cc6582f553a966230/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/e80eb1d2234bf352b0ad6900fb8553f9ef6bd2ac/
         sh4 |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/948f90f40698a9f5f5d83d874759aca278619145/


-- 
http://autobuild.buildroot.net
