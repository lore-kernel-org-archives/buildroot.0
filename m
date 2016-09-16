From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 08:30:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-15
Message-ID: <20160916063041.B84F7103833@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-15
================================

      successes : 187
       failures : 94 
       timeouts : 4  
          TOTAL : 285

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 26
                    mpv-0.20.0 | 6 
              libarchive-3.2.1 | 5 
                 lvm2-2.02.165 | 4 
                    lftp-4.7.3 | 3 
                  openjpeg-2.1 | 3 
                coreutils-8.25 | 2 
                   glog-v0.3.4 | 2 
                 opencv3-3.1.0 | 2 
                oprofile-1.1.0 | 2 
                privoxy-3.0.26 | 2 
               qt5base-5.6.1-1 | 2 
                           all | 1 
                blktrace-1.1.0 | 1 
             expect-2014-05-02 | 1 
filemq-e59951489045825d6fc5... | 1 
                   fwup-v0.8.2 | 1 
              host-cmake-3.5.2 | 1 
       host-erlang-rebar-2.6.4 | 1 
           host-openssl-1.0.2h | 1 
                ipmiutil-2.9.9 | 1 
                libmad-0.15.1b | 1 
                  libuv-v1.9.1 | 1 
           libvncserver-0.9.10 | 1 
                libxslt-1.1.29 | 1 
                  ltris-1.0.19 | 1 
make[2]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                   ntp-4.2.8p8 | 1 
                     php-7.0.9 | 1 
              ptpd2-ptpd-2.3.1 | 1 
           python-psutil-4.3.0 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
                rsyslog-8.19.0 | 1 
                    ruby-2.3.1 | 1 
                socat-2.0.0-b9 | 1 
                  squid-3.5.21 | 1 
                   systemd-231 | 1 
             transmission-2.92 | 1 
                     vlc-2.2.4 | 1 
               wireshark-2.2.0 | 1 
               wvstreams-4.6.1 | 1 
                     xen-4.7.0 | 1 
                 xenomai-2.6.4 | 1 
        xlib_libXxf86dga-1.1.4 | 1 
zbar-854a5d97059e395807091a... | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/95714ca1cbb60d19a16146790a5acf73e65fae9a
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c87cd4a7b0bed938506bcf7e88d4cda60e28e6e5
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/4ae5d329a1e1c4650f2b36a5c1424b9f286231ce
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/f2f6cca12cd963bf8b6634c8576715593aaccdaf
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/e6f8e5a61ac4fd49ce836bc7b3ef6c56aa602ca3
     aarch64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/b17debfac5659769a0dbdebe649a641e5d880edc
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/803e4c61c1d9bb6ef41170bb19b5cfba073d501e
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/374507f39461ea2ab9058946bc89ccbdf7fcbd4f
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/2f1bc3742b25ea698521d148ba9309dacc3046e0
    mips64el |               host-cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/8eac8fac8e97560cc9fbadff2ad94729a7771124
      mipsel |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/97df26b5204be09f7c143ee9723598e1ef3336a3
        bfin |            host-openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/59ac2b463ccd31f3701611b5b28f521f61d25008
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/1846e0607e2d2c5cd85a9fbbfbe8e4f7e84ed4ea
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/50578741cf1f62f7aa8d6bafa78b17b311f1095b
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/e524a3d882f6197e290dd1ee3e888088a514eaaf
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/1035debe892398b02fa949c909b0c95ebc5ddc71
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/170b3d2a5e481c192481c894e94d653a85082e69
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/175fd5dd3b21f9ba7da21b64f69e026c1c4655bd
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/05afdbba440e2d5ce8bc4976cb904fa3e742c127
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/6f60501862532e58063655a5e8d6e81d2c8b76e7
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f975e64efdf56f854e3a6fa8f87cdb035bef47e7
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/bcb3e44495b1617220d67a3270be3b73dac2f282
     powerpc |                   libuv-v1.9.1 | NOK | http://autobuild.buildroot.net/results/17f8dc93507dd329ec439e9512c86a7b9fbfca44
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/0f4c1a02bd05ecadea0339c2564f502c0e300f3f
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/77447f7b886e94a1cfbb783eccf7edb97dfdab90
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/7b61c483e468f1b0118f8ddb3240964c06b89795
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/16d22af95d68ff6206aa00c332c22a3e4e48e4e6
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/571de3f462034bdae618c07d9657c3095feca3fa
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/60ed1ce3bec4126b70576755787ffaafdab269ba
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/1e0f72370d8878844e90757044a7e6d90a877f15
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d49ed9171e6eac982f2f5df6dc865ed47490a96f
      mipsel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/65e26502954d6d3339c396062ad97b8f6b55dd1b
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/76de424943480e656f2b9504420cd6f31b7cae9d
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7765a9ac030897cf7ca008ad768f830542bd3c33
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2da81269b694ac3dc1965c0ff85f0272c0617be9
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/97c2e5e5df307fa5bc2f373ef43194199170d50e
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/35141ff5ac4145fa11f1bc6afd513d36188291f3
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/dde4ef3b9710c0a07f25ba350e2bd4eba38fc726
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8f05274dee1ef0c714148980a3dc0c0ea50dff50
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5f86100a36dd3c482d2feb724e1b8e43bea0b781
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/15fe548c4df61484fd927554cceff3e975a58a45
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/ec64f6e35154a2b90d19b9bd5a091c9812c981c8
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/6fa58f0406a8186804a38ab694db28c74770c823
        m68k |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/2ca3e1b0eaadaf0cf5bf2fde756163ac5786a21c
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/5d1184052e1cc7e9da1244d23c5932de4ad0c435
         sh4 |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/6e36f1ab549bd130ebbc6178576a7cfb2e5fe5ad
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d27eebcf225f4557cc39147a80d1e9b1ba0079b9
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b4ef79f1c722d7d5b314520da0a9fea864f7c276
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/d49824de960b2ae9af68532ef0b5a27798514566
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/3c854df557df61ec973158e33f828c448c0136fd
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/0d5d67be9677b0b4f6d8bb5e6e229d6b5c4181e4
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4e32842c8615064914445cf9a304f3c6d897ce45
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/d86ff4ebc52b82ed89d9d22eecfae0576dbef4a3
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/28d04115d627dcb5b7ebb62943fcc1910544cdc3
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/0a5fced0d20a1015e9b015125319a0ca48d259a0
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/b3d6b710ce53b730c58c79efeba31bc5fdfd7cbd
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2c5b58b55ac8283e33b6cdaa428d3530568eece2
        i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/cdf9fc348a23b0f5765f807809679695e3b07bd5
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/fe3cd33be1a257fd2ae697f6231840fa8592cc88
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/f7829f5ae4b175363a7eb58c8453bb811791060e
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/d8c38d412ed02ec832785206ade168191f25c766
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/9e50376320a0541428b7e99363a463144c4058a3
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/ab139c29d1297d65ef2638852cf2feed8b1d5c25
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/78af581f24758f7c2b19305a801e4c6c943730fb
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/46f18e87e886c7a032593beea043cf89ae61a385
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1433af74c9c6f20def183425bf7746d4cc08911f
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ca79c9e90110026800261546a71884b49c68116d
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c6ac8aab24ab4949b933244a2b149996e9dd49c6
         arc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0363cad0b27a47e45375e377a10ac402127802d0
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b53e3aa430f56dba822dbf6c643829691e0f40d6
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bb258adc457637bad4ee561231343b0b436a29fc
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f6c7c52ea6b9bbd0e12ce673fd3fc2924bde5257
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0afac6c4aa33048c7f4c6ca2cdbfc35b7964d607
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ae8baa75cef8bf0cf467060ce10585b51f6126aa
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/55e3846c4f4bd2bb6ece0e2b42a8bfafe0aa4c03
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a32736d51f443d5eb64850601bbfd373a0cf3971
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ff6b515456ee5bc5c00ced7bf7d8f1bd6b5f6f59
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2f89af97c997edabb3e8e6c2aa5c9e662fcc2419
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/35fc5fcc792361a8492b56fb7d07b45fb2a41f6a
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d3b1140a7ac035a3c6be0826459f459b600e5324
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/926ef9c7f836e548092d064923a2266e235c9ce2
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/610b239c5bbe901f1a2bf7302fc9a0c9df938f6d
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b4667217296e6989bbafe05c17c3b56253ec8417
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b8dc7005cc28e12f3d9eab6cfa941e4605645b10
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ebd5fc1a3afb7d4979367945a2863dd7325bd764
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/596ae5ded4b1171062b808bb26c470578d7aeb95
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/448bcbda38a935fa1e669ee6209b059febba3604
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/810b12c75701081290e0cfd4b0c7ebde0d901943
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f9aa7a7e8af7d3d4e5760ff43e4bad8840d28e68
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/57776de1a17e60209ac1f75ebf0eb233bc286c7f
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/745ba4ef2c9f6f6e502c08ba6395e6f5df3bf143
      x86_64 |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/d82711259e55ef695032259af037d7287666b07c
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/8122da01ce03eca6e9e0b8f55510792e415a1ac2
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2c2f731f1291060eab5703ea09ba96b0a873aae8
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/cb758cd164ce0fa5c20355d9e470d84ce91860b4
        bfin |         xlib_libXxf86dga-1.1.4 | NOK | http://autobuild.buildroot.net/results/c0d0ed58b3222e3a76af683c02666d814c70481f
     powerpc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/eefdc5f1d5176eef13613f4e115fd9ee57960248
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/da86864656b60cfb1026603373c0fe7352b9feec

-- 
http://autobuild.buildroot.net
