From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-17
Message-ID: <20160318073022.D3E00102D67@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-17
===============================

        success : 221
       failures : 131
       timeouts : 2  
          TOTAL : 354

Classification of failures by reason
====================================

     host-shared-mime-info-1.6 | 13
           libimxvpuapi-0.10.1 | 8 
          shared-mime-info-1.6 | 8 
               linknx-0.0.1.32 | 6 
                     dt-v18.32 | 6 
               ipmitool-1.8.15 | 5 
                blktrace-1.1.0 | 4 
  getent-buildroot-2016.05-git | 3 
                sg3_utils-1.42 | 3 
                  multicat-2.1 | 3 
               libgtk2-2.24.29 | 3 
                  connman-1.31 | 3 
           quagga-1.0.20160309 | 2 
       host-erlang-rebar-2.6.1 | 2 
                    cups-2.1.2 | 2 
        host-gutenprint-5.2.11 | 2 
                 igmpproxy-0.1 | 2 
       gadgetfs-test-undefined | 2 
                  ffmpeg-2.8.6 | 2 
                   mplayer-1.2 | 2 
              gnuradio-3.7.9.1 | 2 
                    mosh-1.2.5 | 2 
                 setools-3.3.8 | 2 
                pinentry-0.9.4 | 2 
                      qt-4.8.7 | 2 
iputils-3a86a2542c6fe29413c... | 2 
                  boost-1.60.0 | 2 
              gst1-libav-1.6.3 | 1 
                xfsprogs-4.3.0 | 1 
             stress-ng-0.04.16 | 1 
                oprofile-1.1.0 | 1 
                    ruby-2.3.0 | 1 
tvheadend-3927788bb71ad0041... | 1 
                  psmisc-22.21 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   redis-3.0.7 | 1 
             webkitgtk24-2.4.9 | 1 
                libpjsip-2.4.5 | 1 
              spidev_test-v3.0 | 1 
                  stunnel-5.31 | 1 
                 rtptools-1.20 | 1 
                collectd-5.5.1 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                    owfs-3.1p1 | 1 
                  trinity-v1.6 | 1 
                  squid-3.5.15 | 1 
                 lvm2-2.02.144 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 libdrm-2.4.67 | 1 
                 erlang-18.2.1 | 1 
                     fbset-2.1 | 1 
                   taskd-1.1.0 | 1 
                    yajl-2.1.0 | 1 
             ipsec-tools-0.8.2 | 1 
       openpgm-release-5-2-122 | 1 
               binutils-2.25.1 | 1 
                 qt5base-5.5.1 | 1 
                  cairo-1.14.4 | 1 
               valgrind-3.11.0 | 1 
                minidlna-1.1.5 | 1 
              macchanger-1.6.0 | 1 
              host-libcap-2.24 | 1 
          sane-backends-1.0.25 | 1 
                    pppd-2.4.7 | 1 
                 mono-4.2.2.30 | 1 

Detail of failures
===================

      xtensa |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/76ca1ac636ac75e5033adf29c91fd30ee97283fd/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f8db73c806761a0349d5ccd1938d117381794e98/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ed13342e00e3cde41fae455aabb9f5bef3cbb972/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6d3c98d7b5a39ebc5b02818798965d6debd48b4d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4121ad254bc258e208918c98d7ec13e9f6c4de30/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e7347ec35ee8bb8fa447b0e20698ce1f2b3fa670/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f00be39640fc73aa2a11c5a7d1f90a300d26d936/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/83c8f4e3645b44f419f04ca417f40b578acb2cb9/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/4e2561c652263e626025f4933adf5da43c757b2b/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/298797d184ed580b3938a9e94391a4da0e7a5ba6/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/3f0752cc46014ab4cb835cf9a3c7f0a1a2a23cdf/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f4f6b91b00f1fa396ade3e4bf00d64a76edb2a30/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/79495af10673ecaecd6e1e0c3c11b83da6102c7a/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/37f07452db9558bd679b3105fc6960c551cac67b/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c40034d4d378b572466bf612a5788752b8c7fce8/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/86acfcef1a1b4a01107d3708591e9888679cdcd7/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/57cb3892ee2fa656318e9de038585262fa2fb7d7/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/493afcdf630d05d509dda72ac803dab3f02a3e61/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/2b9adb56128f2e85bd9bc9b48e10bd3b5cd72d7d/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/a9b5d14a3f47639538bfcc97888ce9e84d1643c6/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/60916ae5c1baa012d5a8aad774a11f7d6206fb23/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/9ec7196f97363bb287fefb158bf94abc5f9ac976/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f1c2072cd4b6af811d592c0df3be997a735e1cf5/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/0aeff5f1dcce07cf79bd9c80df9e9b6f6f23c05a/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/cb203bd4876312697fdb1fb2a9776d0f3da3fbdf/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/5b8e6125f0e6f45c5c1fe036cdecc88bcf175ec3/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/29030ac2774aa638f7b3b0cff268fd67c55b2cfe/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/63dbb5d51366968fd2ca492e332a7215fcf284a9/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/d48beffe8e93d81693471ba23d6c4ca68bedf482/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/7956399eb026209229a2d410f249d7c19c2b4e12/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2309f2268aeb55c927e20064bd9dc435a567a965/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6fa3395a20e6b848c2abf8dd5563db907da09bd9/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/48b007230602ef7c0389a66de14ae5fa1ae6b8e6/
     sparc64 |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/dfdd5137b61f8c5b87fd77f75dac7058a1d41fa7/
        i686 |        host-erlang-rebar-2.6.1 | TIM | http://autobuild.buildroot.net/results/7be85ef28a7d698552da60c9bc0a8e480146b714/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/26cfff37c27411bb330e135a040c686443513aab/
     sparc64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/0b9a3acfecd48164118ac55f0cb96da1c87cf822/
     powerpc |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/f337725a43431e7160a17ad99403b458258dc4ac/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f809e235737bc9d0e207295855fb92f788f77613/
    mips64el |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/af11870d041ddd51fed32ef4f985301c8ba07651/
      xtensa |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/01d272e6ef7a5a0b0c1309ff741c0c8f6d8a0d33/
         arc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/adcdcf154214044a7b7ec9bd99c425444e91f6b9/
      x86_64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/f18b39a3cf76bb54841bf08873efef4f359e923a/
microblazeel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/a4c14dc6ea0a7fd954e73345bbee3308927bc1c5/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6fddb574c6d05a58dcd4134d77e3bc7cee1cfb1f/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/d59ab03b9cb42068d10a9f15d6252c4751c0e325/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/3b9d6ff5a48191864a5d53a6697d752113087586/
       sparc |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/c002399dee6e0de3bf7ec40dd0b2029c1f33f1ff/
      xtensa |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/b77c79022eb08282141563f619fd9f69dbae2e83/
         arm |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/3529f0f14d6640a3ea7781aff1a5f732c0728757/
       nios2 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6a2fd6a1aaf87dac37a73299bf5b2cd9bed08b11/
      x86_64 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/0a5e5997638e863e5e548f938a268c3e7cfbb198/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/5c8c0ccc4e105e58dd17dff9a097c8a9aa1825f1/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/5a788313c34a89c64306eb9bf8d75d77a4ff4e1d/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/6facf98a71c218edc4fa1d7a8ace29d8fc1916f5/
microblazeel |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/d40176eac0b2cb9ab8be81d054be10276f263f65/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/11f30f662b0692872300af431d7ebff25100f5b5/
         arc |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/591cdfdee716c0892474466d76be67af8f3a0cf7/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/7205696d550615353ef3baa7a005e222e111d682/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/00a300ac15bb623fd325a27514bd74c3ece0f620/
         sh4 | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/e4fedad0b74f8e8557ffd02b045c6248387faafe/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/8b0a01cebd62d0acd835f795cd75e41d5155d9f6/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/b303f069fcc230ae3116952d5eed435e9ea3694b/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/50a835b708d206e741708c56a8381a09e295d32c/
      xtensa |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/6460cc9c0d893473404b3ba29f894c2894008e69/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/188d1c4d3ea2a08164137302662f5fdd9166f739/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b7d6a352060e404aefb51f3ebf192888e7001bfb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/968923f3f06360e0b522f97ff366eacb8ef4c1fc/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/feefefe4a4713d62e487720d046b1d39281cc47c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0c787524714cf1fdb93b6a0980ea495332c9b62c/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/3cc400b56096adca43996bec3832191bfbec60e4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/cb637fe0c6e910beeb63f14e2d6d7f6e64a0581e/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/531a31af3321734d381e41590646df6cced9be99/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/0968c7595e5a0b6ab848ce465550be1c8ff369c4/
     aarch64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/210d54c1302bd1805889ce736c5b2b09516ba537/
      mipsel |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/db169e802b467c6734206913731ce13304493a8f/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e75b7fbd39e44d4314ed3270824234e2687b9eb5/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d1caba9be07a4350c7838a2b27695762779411cd/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/a86cf0c1ad26117aba86ce75d3f76c286babbf11/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f2b5e934e78483f641b7d77ed8adff342723e16a/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6f84da758f537e8ad60107153b5cf4f3b368c859/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/e61217311f19dedfeb64f319b95a0fc34f1ebba0/
         arm |                  lvm2-2.02.144 | NOK | http://autobuild.buildroot.net/results/d290c67ca15f58df5b103cfbf8fa73f91fbba5aa/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/4c3004a91755b41bfb0453b4cb6b1dc8a2876ecc/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/d7370d0f8d1c7c028996feab0ea4f36edbf8a698/
         arm |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/809aa88d162752e1d845ee7c25cfc332867a2f7b/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ce6d9ef179d705e2def8d29eb86ca40add5908bb/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f12acf057c4c20137dbe028440dbe53bd50f8acf/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1c9c09690149f6a00975528f1313ba00e0727926/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0eec9b0ba6c01caf34c4aec9c085bc424f30b60e/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9e07a98e87755c992254295c46edb0dace967a21/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/54969eda6dd7fc414ed72f87a38b5e05f4222d18/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4b07d276d7c09f2fc2d63c8c37c92519cfe36dbc/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/49723ffc7707d1c4e71c1a6c0ef51e13e753140e/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/76f1807b2e6f37939e1cd8bc2b6f0caa73079c88/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/87189f728200ef6480ea473c8e0480a1d7c48486/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/03d04ba9b40f251755b3c1b3c83f6881b4d1529d/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/39fcd0d474fd721083f8a19b3fb00c49bc9511ea/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/24c8316e579965deb408caef8b4fc81ca8119a70/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/de7f8aba46f90154c03caf5098bf0dcd6efa0993/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a89a861752a9f69de346e254f209db3d43ac5ca2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c893dc86bd5f02a4c9125aed33ab8d0671fa4c0a/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/06cb0c5ca36796f75123346765697401ad422997/
      x86_64 |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/bb5b4c0b6c13b6b2c60948ddfb6aff0ce2830695/
      mipsel |            quagga-1.0.20160309 | NOK | http://autobuild.buildroot.net/results/3613d86632ec47ba5a5fefdb29066297fe4646d8/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/8c125b1c12128237638e6c487b090d21139168a6/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/1a69c48f8835b1df4e779a5523176c4a2a0dbbbf/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8b4b2617dd68f03ea4d6de154f2864f5319520b9/
      mipsel |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/5ad9b8932da0f9a3ba504aa2d3fa5f6654b3e908/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/955adc16a08d6492f5258fc8c9cd4d12f7650a66/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7396ced289da41d4ab4b4c006c5407361fbc84f6/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/e0e0417441a4651daeb653a4f9ae6a1d4dd7b6d3/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/a60da0713fb063d93cb364b70591e05eeccb211c/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/4823b8d064ad463b5e9ac0fe312659ca27e87690/
         arm |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6124dcc8c255d6d13fb80abeb4f4836aac8a0126/
        i686 |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/3dbfe698729d99bc2f48da230059b125103eef55/
      xtensa |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/8a2ac00291efbd4ee0fb80af05201eca65e9c154/
      mipsel |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/452fb22e8c972f87ecc77a8ecce3f6aef4378f20/
         arm |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/b55a7bf4cae8468255dbefe5566f267788c5f0e9/
     powerpc |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/d3029992e1a5726e64ad24737c651c0d0929daaf/
      xtensa |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6531be13c402dfccf4b94c03321bf434dcafb4f1/
         arm |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/4364de2f586972a4c127582c4e7a7d2d60abd92a/
         arm |               spidev_test-v3.0 | NOK | http://autobuild.buildroot.net/results/dc3654c498e6b038d5f62e7ea1b8fc1b578ba805/
         arm |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/7b9387713177e40759f9b50b32badfc1a64ee5a6/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/2b7074ad5938f2cb7def2713473d270c07125d72/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/0b653ef18f0e8847ed8acf63bfb7ef88d5258c6f/
     powerpc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/20c5135b2ba904301c46966830d4c293bfdea55b/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/4f3c7b4395e474beb3a90f50902a887dd51d7692/
      xtensa | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/416667ba5537ad4e432e30ab0d40538992c3f741/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1c9a47f304e12ef0a8b785548d4f3fc5cdcddc36/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/0516dc32a25a86d5127b9f86f65cb27217951129/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/d0d5879f3f69264fd6bd6e835324d004ce1ce233/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f0abd48a9051b8d3aed05253d3cfbeb874c1b896/


-- 
http://autobuild.buildroot.net
