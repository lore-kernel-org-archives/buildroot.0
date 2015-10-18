From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-17
Message-ID: <20151018063016.793481012C4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-17
===============================

        success : 206
       failures : 88 
       timeouts : 0  
          TOTAL : 294

Classification of failures by reason
====================================

                   mplayer-1.2 | 12
                busybox-1.24.0 | 12
                  ffmpeg-2.8.1 | 6 
       kompexsqlite-v1.10.12-1 | 5 
             python-spidev-3.0 | 3 
              strongswan-5.3.3 | 3 
                  libv4l-1.8.0 | 3 
                   bdwgc-7.4.2 | 3 
                mongrel2-1.9.2 | 2 
                pulseaudio-7.0 | 2 
                   gvfs-1.16.2 | 2 
freerdp-17834af7bb378f85a3b... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                  libnl-3.2.26 | 1 
                minidlna-1.1.5 | 1 
               alsa-lib-1.0.29 | 1 
                        jq-1.5 | 1 
              swupdate-2015.07 | 1 
                  libtasn1-4.6 | 1 
                   attr-2.4.47 | 1 
                    ustr-1.0.4 | 1 
                  apitrace-7.0 | 1 
              gst1-libav-1.6.0 | 1 
                libtirpc-0.3.2 | 1 
           qt5multimedia-5.5.0 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                   open2300-12 | 1 
                harfbuzz-1.0.6 | 1 
                coreutils-8.24 | 1 
                   systemd-227 | 1 
                     tslib-1.1 | 1 
               libgtk3-3.14.15 | 1 
           libfreeimage-3.17.0 | 1 
                   nginx-1.8.0 | 1 
                  connman-1.30 | 1 
                 opencv-2.4.10 | 1 
                  snmppp-3.3.5 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
             lttng-tools-2.6.0 | 1 
                 opencv3-3.0.0 | 1 
                openntpd-5.7p4 | 1 
                     apr-1.5.1 | 1 
                   expat-2.1.0 | 1 
               qt5webkit-5.5.0 | 1 

Detail of failures
===================

      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/a738563d9be3965fd248eaa950f3a850f5b627bf/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/44dfb278d1ffb65ee6cbd58d79c5eade2c7a2188/
      xtensa |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/0a9e8de6e26d32b725edd2bef1c991be17ff5708/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/c06238af758dac2b9c1fdf751b12fecd3a820f59/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/6a7910617ae7a0af101d718bc04b6d819c7a0b69/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/2540fd789051222c5d587d1808a2e1332de075c7/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b0351baca1ee3954fceaa478373728fbf5147f15/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/a10e15b77babc8ea4e280443a62f81fa24487414/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/a223d4cb249a252aa68ac3b8bcfe3cdf9eeb7fb1/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/fda109eec2d8b4535b6a6f0b90b09a6af9b653af/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/64ef3bd52e97942edcf3705f3c154b43af1149e8/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/b96ffad13bca5e6fbf7ce79538aacbfe27b1eff3/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/0bcdbb2b3c69140392a8d9cc7fd1c6f037559aa6/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/1d7d0b0cc7150ded8f4fb03d4bfd1ed58bc4089f/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/e1b2abc2b867f00451b3ae1f822dd7d80c1a32f6/
      x86_64 |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/92e76ccfe1e1001f49877c5a1f17ea40e7dcead7/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/3da538f2445df1c8e1525d50a4757aae1fb25f59/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/d5aec0fa23478a61615dc2316fd9612115e3bfe3/
         arm |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/fc2a28b0dc85dfc3b6aad32ef773b11e5c81a315/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/63794694b9f0e64a4a5aad43d8e6770bb849ad8a/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/00003a3f3d8aeb9fde3135a4ce834e4d1ebd8841/
      xtensa |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/f9155572885d4fa6fd16c9d6f440bc92aa859e75/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8ced16874255ace4923f6b8888c3fca07f28b804/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/16ccf50b99d9b8eb46a7c5adf3846e6bde87985c/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/4ffcae6cae419df35e8ca29d429ee178bcf31882/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/910edc47451befa31c680220dce674d7d1940e0a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/64e61e219789d98582dfa02ac833b04597a0b8aa/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/cb61a15a05d38ee39987ef77bbe632fcb85dcc6f/
        sh4a | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/e0c55a9a242fcc2d5d4e46a3bd774665a44f1cdb/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/b161b0508063535d01564345a7cff3ebacda2ddb/
      mipsel |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/d100a5a3405d022e6f282cd3c344489eedefc9cb/
     powerpc |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/dda1182ded67e51565031c43834cd6fde29c37d4/
         arm |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/aad4cc4842a462ab392a1da8f2027870bfa5a8e2/
       sparc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/f3bcbd7fd8dbb5d1c7d9d5d31721ad1eae07fef4/
         arm |                         jq-1.5 | NOK | http://autobuild.buildroot.net/results/efea14d71305847409afe5aea6f1604ac3381009/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/1695298119dbee5c6efd56e7a0e92e4cb082dca2/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/9870ae94e0b4e8221f750c9e683f3efed19c0ac8/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/bf891f0ef1e18a6b2c5fa8df32cfa11d55ae0db3/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/214ad162e2abb43b6d789750c85b402f57aa32ea/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/93b1455c278ff692c43e6a42de77d9a8688fb433/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d82f2002a52c931eb6129127f08cee874f7c0dfd/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/27884cfbdacdc4ea011ecb38326e9b9dd89aaa0a/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9088229c39298bf25cd4b28e5fa0e0d1a2923d9c/
     powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/bb0dc0057a7e60ee1590e1b1da08bd7d90764119/
      xtensa |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/c54272b959bb64301fd4f1f3495139d6a630baf2/
      xtensa |                   libtasn1-4.6 | NOK | http://autobuild.buildroot.net/results/44b862a96d28ccdcff6e4aeae174a4b6d8265d14/
      xtensa |                 libtirpc-0.3.2 | NOK | http://autobuild.buildroot.net/results/7ebffe0a45286ec511e2d0d1aa1015c9f085eed9/
      xtensa |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/d5129ebe07291f1fb8443be3ed3ff16fc96d5b7f/
         arm |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/c210ef295527a83e27e9b3c33bfb85ae7ac47b8d/
         arm |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/fd9be8a77086124f983d5c146489e79498bb176e/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/5d52574cc599ef435100de8fc0ad20538597fb34/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/75289473396ce2cba4ffd0a0af9af5d90f2db35b/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/bf4d8bbb4a140156b3791f2a9e5dfd30a0945db5/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/50ccb100056014e8f3437144d77c5d64e5f07be6/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a5dee50f935f448aedaccfc0919df5723a16787c/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2597e364a875913087652ace5d668f1b53b6ea0b/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2d2ff54a04dbeedd2ec56e8b67a1d429a731bfac/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c9affc766d24f91d3eb7e5edb883b897910ddbe9/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5424e3ac573b41796265a4f4caa2c01707627ccf/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f9458905e812adae186a7beaad40eecea5f803b/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9f939e7e2622d7da7b50a85b26af987021a52a19/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cde623167a8e339cec78741a9d6344f42503394a/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/39d32b86fd89c78c14b376788dac3ec179860508/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d70968728b55da4f02a5a235d153254754c23bf5/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/20c36558ae006db8564a4976165896eb302e5c1f/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/978a998fda2e09eeea15c858c6f4a4357409985f/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b5c4a94ab64073b99a28b1fabd1eb1f0a37094e2/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/f1b9ed014825d71513bd556299aab40a4417c92f/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/f1d7d467cc6ed0c38697cfbc6fde15326b261b58/
         arm |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/6dfa80ea9747578f8ae552cfa6fa34e34d486bdc/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/b324584cb3ef5b4861d37e4284739cad75acac41/
     powerpc |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/8f3159a3525aec5bfc6a20bc47220969e08478b0/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/569812b7f05595c93c1de2a5a9fe9ddcbf619826/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/bf88c272ec4643485405c306443921ddc36461e4/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/020ee357b000f28abcb85a183eda49de7df01d4a/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/29171ce9bfb650a0845120db5ac137c668c6c67b/
      xtensa |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/96bcd7c469c1d761226003aa9aad48a0f02f5e0a/
      xtensa |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/456d380f8b4478245e89f711c33fe0c2d23aaa3a/
         arm |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/663f4a20342bf9250fa820857225dbe7c2eb14f3/
      xtensa |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a75b2a22a9a49c975580e4de7a17d927895d45e4/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/3000e3568b09cc3ada9fec0eae035d3a30a3c7c8/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/9015922011b122311f97faac87c2436efd1a540a/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/aea24fc2e1435d34280f377acdd64ef282cabe73/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/d7fbabf8e8aee140c51d0f3831203c2d95f681f3/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/3a7c37a6676de3c6db22087315b524a300776d62/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/7cb5ab086976ca5c5b7cef0bad152439378dcc1f/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/6dd7e1c5d6eecc5a12c6ef2167b9e445a1efad7c/
         arm |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/81dbad489412cd28345de364624180cb082b3bb6/


-- 
http://autobuild.buildroot.net
