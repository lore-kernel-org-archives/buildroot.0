From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2016 08:30:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-14
Message-ID: <20160915063045.B95B3102615@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-14
================================

      successes : 228
       failures : 97 
       timeouts : 6  
          TOTAL : 331

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 26
                    urg-0.8.18 | 15
                   glog-v0.3.4 | 3 
                 lvm2-2.02.165 | 3 
                blktrace-1.1.0 | 2 
                    cups-2.1.4 | 2 
                     gpsd-3.16 | 2 
                ipmiutil-2.9.9 | 2 
                libxslt-1.1.29 | 2 
make[1]: *** wait: No child... | 2 
make[1]: *** [libavfilter/a... | 2 
                privoxy-3.0.26 | 2 
qt5webkit-b889f460280ad98c8... | 2 
                    quota-4.01 | 2 
             rabbitmq-c-v0.8.0 | 2 
                  boost-1.61.0 | 1 
              e2fsprogs-1.43.3 | 1 
filemq-e59951489045825d6fc5... | 1 
              host-fwup-v0.8.2 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
                  libcdio-0.93 | 1 
               libepoxy-v1.3.1 | 1 
                libmpeg2-0.5.1 | 1 
               libupnpp-0.15.0 | 1 
          libwebsockets-v2.0.2 | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
            mesa3d-demos-8.3.0 | 1 
                 mono-4.4.2.11 | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
                   ntp-4.2.8p8 | 1 
                     nut-2.7.2 | 1 
                 openal-1.17.2 | 1 
                 opencv3-3.1.0 | 1 
                 openssh-7.3p1 | 1 
                   perl-5.22.2 | 1 
                  prboom-2.5.0 | 1 
         systemd-bootchart-230 | 1 
                  tremor-19427 | 1 
               trousers-0.3.13 | 1 
                    ustr-1.0.4 | 1 
                     vlc-2.2.4 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/422f1cd60de314f47064b49867d31969ffb3829d
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d9273bcdc2089386f6786f0dc487ae987f9e3116
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f8ca934a0a39c9afa97483962b7e2648367339b2
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/e5d300949ec8af5d168547a81e2a3bd0a7ed0174
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0e2c39c3968bd316ce071d0d312cd6bfc5bdc740
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/c881aa68705cd3c746b9b49d6f2fa35e0e4a4716
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/4902d018ad0af0986b2a21753d91cbee9eebe12d
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/dc05925d7b013bb1b42b4b0da7cfd4204c03c79b
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/78ab68da3403f9690c5d724751753ded9f7c91de
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/3280abd71bd3d74d05545e97165775707c82126a
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f2c824e2ae8e31b2802566e50c6f786649dd2aff
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e50ac87d0810cba83d86d3551b842800e99c8f85
        bfin |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/be120c6c4bb380458eb7912a2a291fae01713fd5
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/ad631a8de4309e3ab94e8a21c3a6217c47136a1e
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/8e6df064cd4b8e7c69e3f1b8240c2535eb5f2fb3
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/c535dc6c212e80d8f04e4d812c7258af9a0c6fa4
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/b7ac45ac079799795248c1d91b6d34dde0074e47
      mipsel |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/29022c2ca47fab0a93e14a5774c125b0f1460320
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/76041a992732783cbaa87c50e2704dc4c42d3902
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/2fa5004ff390b01133151da707d96a35f3d21b03
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/964779819ba7806ec9c3634227908cec601d34f3
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/d62751515c58ca1f11a39585a56b04a2e2caeca7
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/868094ec0dfd8634724c13bed79bfcc58acd9730
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/424ded2d68b409e664b2c16e6c47e7b70d380d6b
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/40fb35812a1d06d326a8b27a741e5cc23dff0edc
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/bd0c02289f18fd585ddaacb285c499350cf8c46a
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/98e6f03de8500396b7da7e55a7171ad0e360c89b
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/6c8056b4a31a92d9431a4ac0afaafeeb50cb99f1
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/ea5e8854f2dde2ba74ec539d0b3275e83696d531
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/ef860ff02c2572ecf7f18c71218033273a3f7ef9
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/372a8254ac74352cb190195e9bb8fe4ec8236cb5
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/1c3575822c1f47f46fd0c20a552c94064691f788
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/08c5d7afb4181d75ed0c51174ee7f6f166b04f86
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/d93f9e6d7451989f40b6218982fedcf7d1012de3
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/c36992e95c4d8bd594aaece31e5da67d2d0e9322
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/5a2a1503b7d19c0ca5b0e9093aa24ed9c020e812
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/e19cddbf55dc9c0c9a619979092985204b145193
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/2b53a96546f78deede30e4ab5f0446ee9e5c9cdf
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5a3c016352bc5bac43013ce0d62e2a249e69f35f
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b6d3ccd3b3ac58bca31e0c5da4e468affb8c0070
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/36a25b8d905af0b5478a436b0afa2525ea918191
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/4419b24fff68dbddf488003100b6abd7b3cd5576
      xtensa |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/a11eab534b8642077705d891329c1fd40d394419
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/9eab0607c56a0540dfbf24b056a43fd407c2ba19
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/7a97194b3ef52e54df71e2686fc857fc7838a7ae
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/3d47be8564f07a7891d4267359ab44638481b05d
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/97f1d4aa2f3198a1ca5139f1ebda29203f573702
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/fdfca97561036cc3a5c0389b337f31a6f7af7e20
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/5f9f4d95acc033e33f7aaf7e0817fc442c9627e1
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/c0198f174b9c651d3847b0cd3e769cdbc0836838
      x86_64 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/d345e9bf1416817458c206fc847a72ad4737abd4
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d36650398cd7a922080f813afff87c7ce340daff
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/28cf8de57a55e73a0beab174c9e8f683e8640d31
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/846f326133931c15be71477b9d94ee38f73b0ad1
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/77b0c07eafd95c553125876bba6053da31706b56
      mipsel |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/db39ec1fc50c559a4f70d7f46cac0605f38c9990
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/42058b55898ae91303963afa854e08441a017c6d
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d7994ea0c7e2c4bf545b04b40514c94d4907da61
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/823c44cf47b6d1e5a4cf7caaaf66841c36ea0ac2
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f72d2b5debb257757b605603aab42ed8fa4db1d5
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3e736b2d15e0688b34f94ef138ccdcb243b909ad
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ab026e39c347c77d532ac42021bb12d697ee398b
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/49e1d0a8aeb59a4f6010d9970d1c61bdbe47e2e9
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/41a10f92a9ee430528e1760336b818dfc9207910
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/faf760b0514779f5c227024e682ae1b920939b47
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/de814a25953bb7010e752ccdb1e47b49f6ec588b
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2afe6061c6b3135d1e847722639478db7b1adc02
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b63bbd53f123520d6e748251185c6ef6eba14c03
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7134b0fe075e049bdf98045c175e4511beeece36
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/47ca617a4d823758a7dc0903f368370028acea38
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/35bb1ef3920ced3ddb536bca99c1d2a9eca72161
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/af5f49bd66505a7672130692515eceff2ee4c29d
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/812d276b0379c68177f6752ac74d8d1672752fa8
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/83eb5e6a33f68bded3fca7cb2889d179f3df4e34
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3347f0ef01423883d204154ed39f2ada05bcda01
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/de639b95699ed118ad5a29bcec44fc938c807078
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d17a6cb273f9c802c7f4c1f1d334ac20f4974668
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4ff90cb27cc12b82239977373f465a6e93f47f83
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/980ede3b51fc167cbd8e591acbf6fd931e1e484d
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/92b11b2948e867f0ed6bc8a5a244852a528dcb1f
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/55e185ecf541053bf0774516468f5c507cd199b9
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/40fb03dabc7bf6d8bfe86d1ae9b214781e740775
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8618c2e58d6a9fd89280ae185e84131ea2d0d2a8
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e103dd102ecb8a81c41ffd13a249dac110f69a76
     powerpc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/f398e862cdaa292e54751382c00c79ba1ffc6cfd
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/de79f37687b61fac1eaa155b833b77fd94a49833
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/f35fcbc1ab2de05eaa898741068cfb5a18245363
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/52d4e608ac4840ec6bc45b260ea0091271b45eae
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/0bced6e11182cced6cfca2c2851cf32c1932a118
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a84b63347716b62782e3b562049326f9285c785b
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/427944c11a0ef816b0628d82336fee324e16c75d
     aarch64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/c67aebe7baa072b87cc5229922cb2970fba7f8b5
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/e889cdf64a73d53a663ad44cbc83e1576cb4fc66
        mips |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/2ae440aee2874e18007fdce7c9464192719acd7c
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/eea8322ba4fcce81c43ba8d4a826efc4706570ed
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7aa04973a9f7eef253824799b612a26309dd5444
        m68k |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/ae73ace83a5d17304af50412afa458e6d406396a
      xtensa |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/bcb11058c5262fce84effc0c28ecbd3ba535c55e
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/5b96177aa7b7af7fb51e9d643c0dcddb80c128c7
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/24209ba13f56889357024b0e460d508b7a03d1d2
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/155824e65e6a7ca9647e590661e6bdeffd6ceb4e
    mips64el | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/7351aa92720f2b778ceb19bf279cd52730d99cbb
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/fdfee60f52f5f32a60c5abc1a2220981c095d9ce

-- 
http://autobuild.buildroot.net
