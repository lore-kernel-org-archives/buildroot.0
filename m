From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Oct 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-06
Message-ID: <20151007063018.D494C102352@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-06
===============================

        success : 245
       failures : 50 
       timeouts : 0  
          TOTAL : 295

Classification of failures by reason
====================================

              swupdate-2015.07 | 3 
                busybox-1.23.2 | 3 
               util-linux-2.27 | 2 
               alsa-lib-1.0.29 | 2 
           qt5multimedia-5.5.0 | 2 
                   bdwgc-7.4.2 | 2 
                 dropwatch-1.4 | 2 
                    ffmpeg-2.8 | 2 
                 qt5base-5.5.0 | 1 
                     pcre-8.37 | 1 
                 lvm2-2.02.132 | 1 
                    ustr-1.0.4 | 1 
                   attr-2.4.47 | 1 
           libfreeimage-3.17.0 | 1 
                  samba4-4.3.0 | 1 
                  apitrace-7.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 mpg123-1.22.4 | 1 
                 opencv3-3.0.0 | 1 
                directfb-1.7.7 | 1 
               ipmitool-1.8.14 | 1 
                  aespipe-2.4c | 1 
                   perl-5.22.0 | 1 
                   tinc-1.0.24 | 1 
                 jsoncpp-1.6.5 | 1 
                     flite-1.4 | 1 
                minidlna-1.1.5 | 1 
canfestival-7740ac6fdedc23e... | 1 
         conntrack-tools-1.4.3 | 1 
                  guile-2.0.11 | 1 
                pinentry-0.9.4 | 1 
net-tools-3eb367aedf1280f35... | 1 
                  libv4l-1.6.3 | 1 
                libevdev-1.4.3 | 1 
                     mc-4.8.14 | 1 
       kompexsqlite-v1.10.12-1 | 1 
             lttng-tools-2.6.0 | 1 
                  boost-1.58.0 | 1 
                pulseaudio-7.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/a06668710ee0c5508a442bfe148ccd2ff5ed8969/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/3efed82f6d52071739acdc55aabb55602e5dfb62/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/b0a05a8e4e0c4e61c73b7956310c933a87df35ed/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/860907135a6e8ac55bda3161bfc5ce1ddb1afc75/
      xtensa |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/1b3dd35de05d9455ea9e8f9a2de6d6eedfc52230/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/9f438f04dd8801b5a41e1b832dea00173856d564/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/303559aed38d5fc42c8543feea4be6a65f1ca181/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/86aaa54a2b5072c8123cdba27b1b0068bcfe18fe/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3214508e73b5bcb35505c6c70f410a51f9a6c8a7/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b770c292e5210d9ebad23c26062245c321b3161c/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7a7ada376b47f5e715097e9673aaf3583123ba69/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8d907328a8bcf384582bcac47097c5bbc7f7651a/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/8f852a16c3370226d2f8731fd19d0c5b33e53561/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/0f1674f99eb94dd201f4df34d0739378302b5f88/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8e570e422f30b40623c9aff4c163df95d2801f56/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/2455b42bf77d99efe3077e049db482638446e8e6/
       nios2 |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/e45162cdba52e357809a11ff7d5822486f411f7a/
         arm |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/b50d4b7a182faa273d85d336ba1f4a8924249dc6/
microblazeel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/0cf88abcfdf81ce4c3aa1fee0a4000b0e4ed1d51/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/61cb2e36e61b6a1bbe3ced5336d5598af3163241/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/eb0917dcd28864ef850fea8c51579a0501b02e7e/
      x86_64 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/5757b4e0f1384ef8de672f8190b5d52c75fb6549/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/2a385c7a9cf0e8a388459ce08236614fc7d1edbe/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/a9a8190d107b06bce8148312e0771e413da36877/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f2a5f3c7e4b36eb33f52b686f8f21f8871a925e9/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/2e9d3db1690381dd4150c5e4925d793b38f377de/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bb187acf19a562268c48086e663ffa0c6b29b50f/
        i686 |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/fd9cc3d83f5b3f26cfe3467397e932b41c88b4f2/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/ea3b3f399727ffecd5ea3b00e9128d2e7089ca5f/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/1fd5d7cbffed43fb09feb9dfa68037942c933f3a/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/df1837e877f89a598a4991472617b83306f6e7a6/
         sh4 |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/3905eb993abcc2208ad0182bf269785ad4ea2cf5/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/f34db3a342ee977d928f390d028fbe9eb3dfc2ad/
      xtensa | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/8c3771d59345f90780d2b89d5820bbc6a54d3cc9/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/c1dc4ddb9877d6eba5b1ed170bfbc75b82c316c3/
    mips64el |                      pcre-8.37 | NOK | http://autobuild.buildroot.net/results/77f1c33d4315cce3f2d2387aa1368a63caac7468/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/1e467e29884b92327652d1517f8b2864a8d63420/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/72e78d54a8f48f35cd0da1aff2daf960290d2eb4/
         arm |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/b81aaf803d84fefade9a254445c6cdd771cd94c6/
       sparc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/46a2226ba4c8e15e7fd265441bcfed47be3351fc/
        sh4a |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/407c772d94412286809fcc1f1af3307f51ff0b94/
    mips64el |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/e20decde35829f51352673b2008d037af30e640d/
       sparc |                   samba4-4.3.0 | NOK | http://autobuild.buildroot.net/results/44c611198774fc8394b0568549064763a35c9701/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/7526791079f102c036fcba9317bdc1af572cbcec/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/fe13fef76aecc031ad9733b61aaecdce406e217c/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/4eb6e3570c686cf7b7d8be0739dabd22319234e1/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/3fcb430360ee88765e086f4e3ee511b8269e5e3a/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1774f55b6709f5f013608fe86c61fa2b56d6578c/
      xtensa |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/271d14617a5a8322bf1ca05d736684488c1f6548/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/8e9aee23319c7c426a801449696643053e6066a9/


-- 
http://autobuild.buildroot.net
