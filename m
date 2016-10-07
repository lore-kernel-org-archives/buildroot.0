From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Oct 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-06
Message-ID: <20161007063028.9720E102C94@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-06
================================

      successes : 244
       failures : 133
       timeouts : 2  
          TOTAL : 379

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 20
 python-pysnmp-apps-legal-info | 11
               libglib2-2.50.0 | 10
                 uclibc-1.0.18 | 9 
                alsa-lib-1.1.2 | 6 
               linux-pam-1.2.1 | 5 
               wvstreams-4.6.1 | 5 
               audiofile-0.3.6 | 4 
               wireshark-2.2.1 | 4 
                 lvm2-2.02.166 | 3 
                privoxy-3.0.26 | 3 
                     vlc-2.2.4 | 3 
             ctorrent-dnh3.3.2 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                    lftp-4.7.3 | 2 
               libbluray-0.9.3 | 2 
            libmodplug-0.8.8.5 | 2 
                 mesa3d-12.0.3 | 2 
                 mplayer-1.3.0 | 2 
              ptpd2-ptpd-2.3.1 | 2 
               qt5base-5.6.1-1 | 2 
qt5webkit-b889f460280ad98c8... | 2 
                    quota-4.01 | 2 
                   assimp-v3.2 | 1 
                  avahi-0.6.32 | 1 
             berkeleydb-5.3.28 | 1 
                  cc-tool-0.26 | 1 
filemq-e59951489045825d6fc5... | 1 
             fxload-2008_10_13 | 1 
glmark2-fa71af2dfab711fac87... | 1 
                   glog-v0.3.4 | 1 
                   gperf-3.0.4 | 1 
             gutenprint-5.2.11 | 1 
                   jamvm-2.0.0 | 1 
kvm-unit-tests-0b04ed061003... | 1 
libcec-2c675dac48387c48c7f4... | 1 
make[1]: *** [libavfilter/a... | 1 
make[2]: *** [libavfilter/a... | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                    ola-0.10.2 | 1 
                openzwave-V1.5 | 1 
                oprofile-1.1.0 | 1 
                    php-7.0.11 | 1 
                 php-zmq-1.1.3 | 1 
                  powertop-2.7 | 1 
                    qemu-2.7.0 | 1 
                      qt-4.8.7 | 1 
                  squid-3.5.21 | 1 
                   sudo-1.8.15 | 1 
             tinymembench-v0.3 | 1 
                 weston-1.12.0 | 1 
                 xenomai-2.6.4 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/af47a11866702af79a5a825f60f447996b39b1c7
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/4c48c02a289e1a47a2f620205ef665f170d97179
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/75ead8c7a43c71a4596ae665138a255c8ea3bf3e
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/1e4fc94fc969b7e17ed51228e409a45eee0911de
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c5df7e5f9824f3c7e5e7fc01fd8bfc89d91594e2
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/b6ce4d9ed93d5999c318d07a7c1f5d1c77bfd790
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9d76d5e962cc45411bec6734eeafeb881dfcd39e
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/54596f60a5c3e07a326f101f8ec062c24c115386
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/34e0309993e932ff141b6eb07c15131692552efe
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/94aee2d91a96c21ba185b10bb9d373a567771c0b
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/5c072051060a0174509dc1881a5967ca4400ae0b
         arm |                   avahi-0.6.32 | NOK | http://autobuild.buildroot.net/results/026905284a81c783b5783d95c2ea7de0c132d0c7
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5c99fd04b6f00254e11345703de53255c3312bec
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/127514a381cff496d2d47697803210cebc215038
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/ff946e4b23fcade11d0ab1cb44cbcbea210492b9
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/5c432553f6ae0f5e4d006ac8b786e6c7d092755c
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5d6d3a789b48bae1082036a29044f791791903ed
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/72aeba005021d09c842ac732369d1477a527e9fe
         arc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/16e37149cc6daada172c998ccd369db84b4ceee6
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/18a435525655ef54d9e809154cfebcb4629fa5fe
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/b40c2c185fd16c8a669cd0a10832969e7a100320
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/4acfc9fc17678c82c60a2de5f69f1a76d5a94e04
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/02a8f9420aa0ad2af85237dcbc10b8f8c452e91a
         arm |              gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/7542d09de2ab21c5e5f15af02b40b5cb8e2ab2fe
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/6d2349ee51a357183c1478cf6f67fadcc74c7632
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/fd5ed770478d0e336815ef51ba16930e6a8b95bd
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/84c25d0bbcdb86317cf05c2054a54b8c14ee0aef
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/8b18dd3deebb297d1ca330038bbdca3f2a5c8b4b
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/8a7cfce78fc427d2dfd7820ea9a321eca5be3976
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/359060dbc3170e483478e49e71cd21418407ad8d
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/8932df7fc33cea9b5cf18782906f756d3de7d444
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0e571b48834cede658f510183447913b881df862
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0dc0972173ff3640e1302347c45f64c654a2aee3
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/76bb15769abcb600b552e3db246e368b66dfb183
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2352194c0c0af9f19fefe7154da2e5e2ff3ea23a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/defbba243310254de7d93a13bb5de9afa5d636df
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2a75b7e6e28b4ad6e26df32af899994e837c01b8
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ca6b182ce01db5342db3ae9f89cfc36e270065d5
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1c9dcda417466da6067dd0c43f66c0cfebfc36f3
      mipsel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5d2cb14928b3f5821d9c2eac68ecb7ad4009ad6b
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/db8d27ec9827f7caeb3c5189af3a3995b734e3b4
       nios2 |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/f12a5d5b4f5338438fbb053ec013e69559eaaa0c
       nios2 |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/5dfa73b06b474dad42ab69cd901005c247e33c06
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2af17433d66ae317ac5b5e7f138e266ebef38ed9
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/be76ccb136302731da0da6ee19559d2808c740d5
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/901a027d6363868c33ed49868fdee4934d4af9bd
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/73330e5a294784d32112d7156cf99234b817e129
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/21ea787861a64645791dfdca252903d60c3692f1
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/1bf34daa5d7d46ddea17937a44d7ed552ccb7693
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/e06ef67a11b440cbd0574548a52a789eef1b2ccd
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/a2a69b7eade78fb0d202bd40058d9f374e11cf5c
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/7b59bcf0b6b02b1b72aa91849c88fb24fde6afeb
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/feb5de6af7033ce5674c0eb6b73c452f7ffc3b0e
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/f02d2bc8cfeb0c67272e86f93392e020d15c4beb
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/5c178b1a4c3538e5420e9e30fa680788cc27ae23
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/7b3c0b9b28b2692ffccbd347157a6655a4ca654f
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/87294f39a670c9812b0fa3f4ffb0fd1a7d5ab38f
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/30138819fd29e7abb3ffa8df4deb62a28bf43fb6
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ef548a46ec1bd0ef8a980027899bbc3af49c4281
      x86_64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/53d514dc9d478497061b09bbb2c4183a01d9fe08
      x86_64 |                 openzwave-V1.5 | NOK | http://autobuild.buildroot.net/results/0afacedf44925110a45a8d6fb5cd4815202b59d1
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d69452707b83e1528289b5a17b86514cc5f2d7ef
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/2958e9bf94df17115e9b0da66ee1053e9b912d70
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/59a4385962a08703b1504837d633940d6cee1fae
        m68k |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/f01dbb1874fab32640acca4e3ee4e36b82b5559b
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/f69833b6fe25ade1e0608192a86f8b5fffb0dd53
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/05d759d15a6817a68dec1d2db551679c213f6b57
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/4382a02c3d4a5eb4e85735c7e7fa9b552b4c4e82
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7d58f9e1d62dda06b8f9476e8af5545b1e6ce8ea
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/2c67454143641e8fb7f5301dd751aa2018a377fa
        m68k |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/b7b5691daa825674a43c196865aa13cdc3e749b3
     sparc64 |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/75ed3f0fb010b10c307b294db41d8be3bc25cc6b
    mips64el |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/4b93b2a9328092f22e86221c546e5b066f72e064
      x86_64 |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/00824a3dce18dfc43f841568033a50652f741b96
         arm |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/60ce39261d21fa411b73385ba9012e838067db29
    mips64el |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/07212a5fc77791eb5ce79db74df4807fc440f130
    mips64el |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/ff33606b411c4469167be594b7fe15bf0a6180cd
      mipsel |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/2d8153f9ad22c162f67b7b3aa7550f0754d600bd
    mips64el |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/44c53838cdcfbf4ab0e7fec7d2991babc1178016
         arm |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/48d9deb0e892744d6b4886a2d1e528615f5bcaf1
         sh4 |  python-pysnmp-apps-legal-info | NOK | http://autobuild.buildroot.net/results/4dd3a5c0654179a43b2efba54b5ac3094592d0d3
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/c6ef9404b24e30c9de22602a266b4c7fc5e1ba88
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d1bdec83ff1e886c7c99963c01e3ff03020b6cd2
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/fe6082a22a9810162a3fdef7cf430eb10ebb409f
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/cc8fdeee0a9dca839f94553325321e9e2911f7c8
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/4675192caed0f21c4a45b4e15cc9aa2099cd82c7
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/fe3361bbb16e162e1e0bd192284a8469a46119ab
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/7bfba036efbd043ec24bd94b2ade53702e7127c3
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/791122941cc955ac726f3cdde6b1dd09fd71759f
      x86_64 |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/61d4c459bc44a64ff98eada21a871790cc5b7d29
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/26db672fd686157d1c2725ff2b23c4c58641bf7d
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/ee38585634cafe7056abefecd41ba0fca688d795
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/ac06a2ec628686feb7064daf8b5177ba88765381
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/f6ad0ccd2783ad7fd87ff6a7a903187af1b9b4b9
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/eb587b1a49e424241a2e73de28e547650010e844
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7233c2597b99041477604944a9ee311c981e745a
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/0cd6734d4848b47795d08893274e38c6d1bd424d
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/4069b0b74f18c25c522e220bfd6ac6063b284dc0
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/6b7ac6787b15ffadd7f94c83d53e29d1e37b7908
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/9488210463ae7a5375819deed110c5ad53a44bc2
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/33f126728368cfcd970b2c328f61b72b6a7736b2
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e8be0de5781f0013d49e1f4389cb4174b73f1806
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/81142c10deaa8d69d3f064856e1a1ebb2d87615d
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/51e7900dad2d747495f95373bebf52f9f575d581
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d0585b4d9325388ca47cb6e7804407c8cd8ac009
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/506395535eaf2ae2efff2ed30995ba0122bd139a
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/86b17c384cc51693ff6e1adc7d79c0bf94ade1c9
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4829d0dcce5af571d397804b444b607f5a13e6ea
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2780964afe402227375568245d48126f35b9f5e8
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bc599d6ff43a02b3a8afdc8a76da22e5c972e908
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fdf3867ccecf1248b1f25b46fedd9b24b0804017
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4e0addb16a4bcdf55ad688e28c05c4e38a9ff5d1
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/14e53b2b5f88a58086943aec4e566da1fe6bd1b0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2e73f9c9607a01dd989aa22b9cbf4558cab1d97c
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bb35d3defaf47117f359b26eadadb0320c611fce
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/74ab163f041e956e21707bbb31ed0771aede5867
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/34d4cc9f1a6eccaaafa3d00950e5385eaae5c3cb
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5ec733c97357cd6227058e7994ecdf167384cdd7
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/97b7b56360a8008ca46ea6d30b78869e230d76a7
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/833485d6b089daf19c85065259390f9f530451f5
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/742c660011088cdd9c7b47664360381e5d76c602
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/30d5f5d26d6a6a7cb2a299279cb3116bfc5992a1
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a2d61ec23ccbd8265536a27d2c0034cf4cac04fa
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c516eeadd31ac091f366ec4b38f82583dcff4e50
      x86_64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/73e44f97023fa34445c51da32089e8325b436237
        i686 |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/30a8d63078cbfa5d9359735ede78e7efb4b604c2
     aarch64 |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/dd0c2e99b13d8bd9030d20d65eacc387083514ff
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/6682c4fd87d7867c752a723d28a36cd57c705b55
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/8a85435d6644e948e1627c05ba028d88d70310d6
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2032feeb2ed286417daa61a2264607bcb43b06f3
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9faccc00f5cd91f1eb6286f5f8b0ec7435dbae91
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/83f5076863ce9f9d9c48e1124f3ac38c50807d6a
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ca3a20f202ab875f859f8fc79151a122856bca2a
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5880faabc73c6054a1b897384f9e06b6a6b8c2e5
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/2be570f7cd5368d541a9e359a252be98b8f4d9c4

-- 
http://autobuild.buildroot.net
