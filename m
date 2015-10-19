From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Oct 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-18
Message-ID: <20151019063015.D010D1012DF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-18
===============================

        success : 185
       failures : 71 
       timeouts : 0  
          TOTAL : 256

Classification of failures by reason
====================================

                busybox-1.24.0 | 14
                   mplayer-1.2 | 11
                  ffmpeg-2.8.1 | 4 
              swupdate-2015.07 | 4 
freerdp-17834af7bb378f85a3b... | 3 
              gst1-libav-1.6.0 | 3 
libbroadvoice-f65b0f50c8c76... | 2 
                pulseaudio-7.0 | 2 
             python-spidev-3.0 | 2 
                  qemu-2.4.0.1 | 2 
              strongswan-5.3.3 | 2 
         qt5connectivity-5.5.0 | 1 
          openpgm-5.1.118~dfsg | 1 
                   ushare-1.1a | 1 
                   nginx-1.8.0 | 1 
            mesa3d-demos-8.2.0 | 1 
                    sdl-1.2.15 | 1 
                   flex-2.5.37 | 1 
                 opencv3-3.0.0 | 1 
                  mono-4.0.2.5 | 1 
           argp-standalone-1.3 | 1 
make[1]: *** wait: No child... | 1 
                   systemd-227 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                      qt-4.8.7 | 1 
         conntrack-tools-1.4.3 | 1 
                libnspr-4.10.9 | 1 
                   bdwgc-7.4.2 | 1 
libubox-e88d816d6e462180f03... | 1 
                    ustr-1.0.4 | 1 
                 opencv-2.4.10 | 1 
               ipmitool-1.8.14 | 1 
                 dropwatch-1.4 | 1 

Detail of failures
===================

      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/d0edc1d832acce79bbb6ed5c0724af3d652c69f9/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/561e94f1fa5d363faf9f7f2d2354fad19c9a239f/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d8301bac52014e9514472cd648882b5939835409/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/5835e2748c2120997b6bec5ab94dedb6379454a0/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/645c813ca1a91302722e635854d11f6929de0e5b/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d6088764e349a9b77d72588463b604c81ebd06da/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/3f2d32f9e18e7e6267c65edc746149cd99cd94d7/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/3ac28bb01ab3b0d1f2c10331650db45943848811/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/25f7253378c486fc73a70a788f197ac3c1eef186/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/502fa94baf1d70571e552da3a86b267bea1e1b59/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/9b3492aeada8f0278f66d265b0160e4ac984f64d/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/37a8800bc8566af5bb2f4bb4cd4f1aab6591e289/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/56be31ac0252099cf04f1c53f387136769cb6743/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/dd7c71d83c8af8b8f30759ffcdd87bc41ec0dbfa/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/1b5875b07bfac0d2d90ab73a3ff80f526f9e466e/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/a68834023569c83d4cf5a8c0d120ea0b1ef2133a/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/329324b32dcd60ed41b85540e1e5d84e9584174b/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/35eac62a908cb05c14a53e4633d8e58ad7781d6a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/1e425cb08d8becf3ffd54b2592be403e7dad3213/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a19023e094cbed491444665d6839a9e65a8eee6c/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/99836db091af610a99dbc815b7fdf09cc1d531d1/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/98dde028d1d6199f05c904b498bc39bbaa112aa6/
      xtensa |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/f951a8e87618ae811949d505d9c41e23614e9492/
      xtensa | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/29e791b39966b1b0ebd7b908e6587106afc533ef/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/264368bbd19280694c9d14856eaae60ec6883e94/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/6a2d1810820ba17413daafe5a2225f597e5152db/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/8a39b5adad9fafd2806d038996a3271a24a9d2fd/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/fdaf2d40a947ef8254d067860b6c282e2b1aa74c/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/94d61d75903ce982de12254bfecfb641b195c81e/
      x86_64 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/9ef8d46e71936b4701d2b35c72bddd73b26108e1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/8d95b5a3eeac7296c9cb61b851a32ad6e0338e40/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/7cf634c2b6f478992973779fe47625881bb85db2/
      x86_64 |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/20204d82c503edee443c4999a0842bb0f8c1aaa2/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/22a6b9af02fbcc4160ca8683c3992d36072b20aa/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/3922452a45f9a83a4dec4fa936e03b7ef9a8cfc2/
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7fe72d498090b20176419d09fd4a84b293a1204d/
      xtensa |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/1dfe9cd006e1ccaad1eff173c07f216950fafe1d/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7699d04fcf51d1e69bb7fa26f0b3c0f6a7e3dbe3/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a18941f6a63cb9a05332365fda5dd99e83851a2a/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0d6841a8452d49b466ad56cbcd282a27d52e8faa/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d32f2a4c9ada37f3714c7d7df1b79d0e9c37bd94/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/790d7c64c3caaa80a30e295cf9a391a1fccf4ac8/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/710cee63e9a33940d7b0112b67c69d335ca82cb3/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f4eb80b4b081d6e67134b37b0a466bcf671a0104/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a4a8a1b5594f639f1812032c2a67ebc4908fc8fb/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/77c49bdefcf22cc75f0cac84577e6de9dcf9807c/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d41dfc331cbfb2705460f6e183289f2521fe9b3c/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/659341805dfcbf88c5314730d5a973183f136bcd/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/157c2b62fa8383b47ad966296f3bd24d7da7112a/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/67e9634200d57ae06fc63d9708ad1003b6b58179/
    mips64el |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/6998761a7039044af4d07b71e0ad2fd65cfaecce/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/b55dd29f970ded24060ca61de1bd2c730cac0b75/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/babda81955936dba4528be370723a65df4e259cc/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/668a3828994f297bf15dcfbc4762c75f73639a24/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/076566327815f460b6bc2f9b3e520246ce1228c7/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/8f8d8f5756e2751a595fa760d38018865555ecc7/
      x86_64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/aba0ab374327f0a8676513a380087e53f64a4785/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/3a50509e533500d383844d74c4d1159ddabb6428/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/4d5e66130ec29f9976fc8b26d70d6d6a2704aafc/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2cc57a439cc3d9bb2df44665236a02f1f85d3b1b/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/3e86035ad34a14c9d2da54212385ddd6a02ff2b0/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/a1495c944e1a1ad1f17b07a4612ffe81b2ea0d91/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/6cdbb63397675b1d0e259cdd7f92bd12d33b26c4/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/c16fa81987b9ee9fc08758a4e0511a62af8cea05/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/de920298075d32f3de83a0cfb7417846eb833425/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/975915aa33005806e78260bae385cd4b3e359ca8/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/c54e7a2ea353d95d41a1e966de0dffa7b6ac432e/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/0198596ebfed05ab86552b628da2274d55bf42ae/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/0811d61273481ba6a3669f7c421d94cf783a6472/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/2743a8c336f6750e16ea780a22cb42d8c5dd30b5/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5603ef590c29ea68793f8e7f7f278003c8c7d07b/


-- 
http://autobuild.buildroot.net
