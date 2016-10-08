From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Oct 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-07
Message-ID: <20161008063022.E8587102A57@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-07
================================

      successes : 241
       failures : 109
       timeouts : 3  
          TOTAL : 353

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 23
               libglib2-2.50.0 | 8 
               wvstreams-4.6.1 | 6 
                 uclibc-1.0.18 | 5 
               linux-pam-1.2.1 | 4 
                alsa-lib-1.1.2 | 3 
                   assimp-v3.2 | 3 
                libsigc-2.10.0 | 3 
                    mpfr-3.1.5 | 3 
python-libconfig-b271c3d9da... | 3 
               audiofile-0.3.6 | 2 
filemq-e59951489045825d6fc5... | 2 
                   gperf-3.0.4 | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                 opencv3-3.1.0 | 2 
                  squid-3.5.21 | 2 
                     vlc-2.2.4 | 2 
                     xen-4.7.0 | 2 
             berkeleydb-5.3.28 | 1 
                   cmake-3.5.2 | 1 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
         docker-engine-v1.12.0 | 1 
                   erlang-18.3 | 1 
                    flac-1.3.1 | 1 
             gutenprint-5.2.11 | 1 
              host-fwup-v0.8.2 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-0b04ed061003... | 1 
               libepoxy-v1.3.1 | 1 
libsoundtouch-010a91a59071c... | 1 
              lirc-tools-0.9.4 | 1 
                 lvm2-2.02.166 | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** [libavfilter/s... | 1 
make[2]: *** [modules/calib... | 1 
                 mesa3d-12.0.3 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
                oprofile-1.1.0 | 1 
                    pppd-2.4.7 | 1 
                privoxy-3.0.26 | 1 
               qt5base-5.6.1-1 | 1 
                    quota-4.01 | 1 
                     rpm-5.2.0 | 1 
                rsyslog-8.19.0 | 1 
          sane-backends-1.0.25 | 1 
                  thrift-0.9.2 | 1 
               trousers-0.3.13 | 1 
               wireshark-2.2.1 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/d9b7e8f57fc5163e00e70f07ba2bbcaf0f488e10
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/2498cde6eb536849dea790c4d50fafd1e4f88e14
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c4aabdd76e3c6f595435ed1b2ff4c78c976de3d2
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/da5c5b884407d3ee2146df8893298d6b98309909
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/bc0a1397888a9d62c521cb38d037f5393e4d2381
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1547f4be408f6c68c13edb8cd6790328f085663c
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/46e19818e165f49aaaa47e8c9cbff749e3171a49
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/586180943137b22e3cf78502c3e16ae9786dcfb1
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/13f70fee4eb8fa9252e25471db9710704610b21c
      x86_64 |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/88158f66c85862380600191253ff8a0f407e6f46
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/33da5fea352f2228b5ad174c96e395eaa863b4f3
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/f2cc5f113170198c4c27079bd86a9b5eb6f08896
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/ede75788c829f59ea29ff43e365b7c015c3a769c
      x86_64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/66c7f98d191e807dca73f8db2af62fd46fa6759d
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/325a1d126235d884f91bc7dac6bd03dee165209f
      xtensa | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/16998624945942837f61a41d7780ac8dd9fbede7
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/d721109fb350f23ca744c8534703ccc56d7cb5b5
       nios2 |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/fb36a9939cac82dc187b64fae93720ea1930f343
        m68k |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/e99d8c6982bd4072a71f1e65c54aa5abc7eb55e0
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/dd220828acc63d7fd9e05f9e0e2775ed2fd378db
     sparc64 |              gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/22c314925bd2497ede1d3786c7910c558b54b3c6
microblazeel |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/77a4e2c21d3d346e59870426119f694d9b082ed6
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/4455aa89d4bac522a9ec0e6e0c827320b23629a2
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/726092e5fc0b7cef76fe300d75f437276da442ca
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/a5b06815382a69aba9948266c9f07fecfe6827af
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/b2bc90d8f2be049e06025a0d6201d5617f4fbcd8
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/7f3542c42f6937f5fb93ee593df30daa18527259
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/0e215676cf4d6b2f48c46f5b7950a868dd5264aa
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/0033bfae2dd09fdf5bab9b588cc140a55ac82913
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8f2c80e909240800a4a100f798be4e730985ac86
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/934891a7f822bdae2517c60c2fe600b2edf34492
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e193033860f6bf5d794aa97317a57f3a3f61d7b8
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2182e6ba8cc6ab3e8a9baf08f168950c3705046c
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f7c917c7737a55a8d03d400462d8559c34674fd6
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2505338edde14ec5c4972caf02d18e465b741e02
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/85dfcdbbba4fdd2f7d2dd357f6bb1a53e05be3de
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0d15a75967e472356001f9d7939597dd0096c702
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/aa205aed24f917f72d65481e6e843bac151c874d
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/ec781ec81b520d497e233aec5adec8bf5e6ea541
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/0aa70748e9f3969b7abe440320fca11fe67bb799
        m68k | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/82bb0e89d43ff67751ff9dce8a1ef52e9cf20945
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/c8a23e6f6caf33c3a2b8989edf45c3960c53971e
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9f478122bdafe6366dff827e94a6cab12b7c9df2
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/38e8a2e761407fef64f384cdc94a7881b106faeb
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/bb60923091d0c5805d34626e645266cdf2839feb
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/9c738d8423a61771aab3598f8be5edeab0d66262
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/a304755cab40215590dc7d4194b620172516f6ea
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/0cc22502923360bf982daf6ae781b8de594ddf37
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/9a62d61699081130eea57ce0717832c4b8e04515
         sh4 | make[2]: *** [modules/calib... | TIM | http://autobuild.buildroot.net/results/195304bac43b2a8e341ea30e171dadb70d7d4259
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/acde7970078afbf0d30655d37f7f46bd4464aeef
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/db25a2c2d55ee51b0380322c8b53fa95800a943f
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/9848e08c2c2f189476ec611315df0352adefbb6c
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/0080626eb9ea57fca8fa6b9411387f66a97df07e
        mips |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/78934d79a26f0ef7b3d07ffcbf57c33f79ce3a37
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/c304a71a67f171a9f788dd539f53566266afab9b
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/745038a2e59b15ab10ea6875d7a784d253a73d9e
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/e449d8ccab4ab248346b786a18016ea61e70b378
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/59ace83395f548b02c48c2f04140fff2d29904dd
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/5fab7186c88d08c3a2adb0f62b950a5b73701b85
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/0285274836033b326ef41bc9a4cd8c68872e4652
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/63e321ab312ada58aaa7261e7d68da48820045a0
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/07b00f02103076311f32a86ea12102be743cb0ca
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/33172051cc8c914c671ccce18cc49cec4f7a2371
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/c112ab3de867e3ad9c52f846133a30026a3f6e20
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/658f24c0929f4d88b24c3c5a35a4f741397c7752
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8b4491511b0dfa7b24c12fb9ebc07a9f4e5cd76a
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/02c55ad27090fd84543918e64198083bbf7139bb
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/5df1e0f893a9db4b5d8bc607504242975916d0bb
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/2a93dcc0340874f50259a2c415258682c7f49dec
      x86_64 |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/d6cf725e88bc0a4afd0b7e1ae58a8e5a649ae6c3
         arm |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/086f1c48d3e8470c7bfcb33a63ebe251f4daa397
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/73f338c373fef20732a7f4f1093cbc828e35605f
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/6f5cfea7700ad0d46e27bb8d52da6bc3d389da73
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/1c1080795c5f65c3e8a6b1bd79ca9dd997409260
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/e4c65ecf3ec011c39a80fd5d39ea0742c6171b06
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/9ec30be7f0daed3edb95160fa3fa5376be0a4c20
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/f7d4605ae5c0f602c72cde07a6db3f722a29a94a
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e407601c6845ee3552e666b20a0f894f195b9bc9
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2def8808069364b546fcf2c4b82a5c1359e15c49
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/076feb00dc71cf35fd8e183c510487d0afa00d42
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/836e23bfad1dcb9adec421e3940c02ccb584fe77
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/45668c0eac5bdc36e2b7d66f0dadb12bb178d42e
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d0e596a5dbe82b76c83535bcbc0f6831ccdfb866
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3ce7a13c5322a1809582d562679ed69fc08b49b3
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/dcc807bac5d0302bc601b4775c61ab4983097506
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/93fb95f54311adeeb6c9858033e8ad6d5b3573a1
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/128e8bc9eb878008d550e2e1be5ad85897114582
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2776d312362058bfa5b609061f4d8856920da965
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1af9b5702542461a47b5f7eafaef55c00f7bebcb
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/689f6753e997adc4eaedfe6432995034deb173c4
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b781d0468ff83712453447333243005b13a5dcb0
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/19eb0398e90bb4356d81017c8c6574f692317c36
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/05aa60c66915843fe9a608f660534a236b0ababc
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3d7a82c6baecf530e4faff876b071dbac2048b04
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/48ae6396b02a78c1a0c01e31a1d390db092ecb23
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1b09a3681c01d91f1470a23932bd96d036afeb3f
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4d0513756ec058bb09425540fd9af030667c58f4
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/790add7c3a6a07f97f51967d72a100c17e32cfcd
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5d47c1b2f79ca7fc9917674c8f86f455cc407508
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/dc916177faaf111423afb1395d6febc3794becaa
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/023e790b6828a1eff3c10e80d3bca447fe746f55
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/680a05a321db6588c3d24e934f7dfe03954029e6
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/595be3bae842a3e55219c9274b90c9ab7374f004
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c8c98d65981c6868f64225ac2fd2843cf071326d
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/01b57dfea5342462aebe0f9582b49626a5a6886e
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ffc3aa197479f474d6c91b1f3d2d0e5e97b56284
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/1f443a2c9ee545e9c1af3b0dba4a7a0426550361
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/cb98ab6e65fee6b2d71d9f3488b9e7aac8527cb0
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4a8659235568bdc87d893b2834059df4558103d0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/e90aecea1f7befab5f009d9236473059923272d7
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/d9e0a49c89ae101dca32329713c7ddda2798d853

-- 
http://autobuild.buildroot.net
