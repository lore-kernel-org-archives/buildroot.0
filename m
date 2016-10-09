From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-08
Message-ID: <20161009063020.808AF102CFE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-08
================================

      successes : 228
       failures : 135
       timeouts : 3  
          TOTAL : 366

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 22
               libglib2-2.50.0 | 12
               wvstreams-4.6.1 | 11
                 uclibc-1.0.18 | 8 
                libsigc-2.10.0 | 5 
                alsa-lib-1.1.2 | 4 
               linux-pam-1.2.1 | 4 
                    mpv-0.20.0 | 4 
                     vlc-2.2.4 | 4 
                 lvm2-2.02.166 | 3 
                    mpfr-3.1.5 | 3 
                    quota-4.01 | 3 
                collectd-5.5.2 | 2 
         docker-engine-v1.12.0 | 2 
filemq-e59951489045825d6fc5... | 2 
                    lftp-4.7.3 | 2 
                 openssh-7.3p1 | 2 
                    pppd-2.4.7 | 2 
          sane-backends-1.0.25 | 2 
                   tclap-1.2.1 | 2 
                 weston-1.12.0 | 2 
                     xen-4.7.0 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
                  cc-tool-0.26 | 1 
             ctorrent-dnh3.3.2 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
flann-3645f0c30a47267e56e5a... | 1 
                   glog-v0.3.4 | 1 
                gptfdisk-1.0.0 | 1 
                    hans-0.4.4 | 1 
             host-boost-1.61.0 | 1 
       host-erlang-rebar-2.6.4 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
              kodi-16.1-Jarvis | 1 
                libmad-0.15.1b | 1 
          libmicrohttpd-0.9.50 | 1 
                libmpeg2-0.5.1 | 1 
           libvncserver-0.9.10 | 1 
                     lzip-1.15 | 1 
 make[2]: *** [all] Terminated | 1 
make[2]: *** [libavfilter/s... | 1 
                   nload-0.7.4 | 1 
                    ola-0.10.2 | 1 
                 opencv3-3.1.0 | 1 
                oprofile-1.1.0 | 1 
                    qpdf-6.0.0 | 1 
                      qt-4.8.7 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                   redis-3.0.7 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
             transmission-2.92 | 1 
               wireshark-2.2.1 | 1 
                xfsprogs-4.7.0 | 1 
zbar-854a5d97059e395807091a... | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/30c88edce4bc96a91e8c992d23f7ce3282728e5a
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/453e5004de83dcbf732cee6a624ee943559bb9e2
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/da577cae57d818efa590dca7226519b8982cb3f4
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/1febefa6fa03e107bf3c834c5f759b2ed7ef7dbe
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/916adaaaf5def0715edbaecf7afa14d31ab8fae6
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5c708d462739976e2465d486474b687cd4170bc8
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5295fc98789e8e55cd8945ddbd9d898fd24c7b56
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/580cf91f44cdd13a6bc9c04b2618b2c3ee0ab2b8
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/aa87b997ef2c8f40127fd8263ce016e9fe25c6ed
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/0b1997721990f7bb3258569dec0ea50110ef3b2d
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/8d67251c1260fc8a0270698721fef53dc19ddfec
     aarch64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/fba97ecb11b73f6b2da39749580a16e3ae55ec00
        i686 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/122e395671b836546a28108c4535c9793af61cf7
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/2503d22657f3a7ffa1b74a062cc16aee93f5af88
      x86_64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a7eda0009fa2dc566d1632cd3950d61450dd6f1d
        i686 | flann-3645f0c30a47267e56e5a... | NOK | http://autobuild.buildroot.net/results/6a2d4cb453128c0aa1fc9ed0ac04ec7c8306e7e1
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/37f1ceb8f3321421fcba76b7733725899d456a9e
        m68k |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/41e65be62daac1bddf16089bf0e8f5688c4a6135
         arm |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/64eed2a86ff1fe97b543bffa4dea0e658476761f
        sh4a |              host-boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d28fc43f72a15646d46d52d230464c7c4380412f
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/b42f4789f857b48e23699dfd076d6daaf5fbb062
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3aaa102723290aaee2498e5950cfaeb366829178
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/c0159e1d79df673e0a25dadf803ec558f856b27c
         arm |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/b5ca1f2263cd78a6de5a8a2dd3568843bb8256a3
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/a1f7d8a0a6970f04e38c86d80f409d72130f7ce1
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/96c47522528d7595a8f7c2f8ab58c313e503ec94
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d0b53518686c8b19d3ad7a145ca3c09e06ee979d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/22d774daa71f22d89ce26046c9368f0760b4ef66
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4056eac8176e4438d8632c111a81d7ee93ab9fb7
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/55f0f2be30457db8b425bf183ece7b5e793b55c6
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a3f82c5d6563764331e167e80e87eee2d7da2fd6
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c197f0fe7778fdc20d399e144d0b40c386f9379c
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6e8a575ada256da350358d3d633d61bcbd763445
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f1239dfe8a7033d38d8abfc28286e13e734bcc21
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f968304357cd47183ac236341602bf3cf3a725de
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/03da9658f200773f99859365c0014180dfa2c99c
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/30955bce8670243a9e026aa7663c3e4b0ed003b4
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ce1f52ae2eb018eb33c1ac5bb1998b3c1bd13487
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/02af96bdc2a0340bfaa8890726e31df24611eb61
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/aa667f62e96dd23fc306671f20dae7cb42f10a14
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0848570942cb49a9a5416f344846c314415eef82
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/26597bd793ae3d4dce3e369adb9cb39acfcb4626
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/2eca2ce53141e8febe4e30202ff0e4b8459a11d1
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/558e214ef28d287b3ce12068078507a2906ed51c
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/13e77d9e6e7fe8c013ad5e3fcab63b774c3254cb
        m68k |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/70743a717f749dce3945763f3307934993be4076
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/2beca22d9f5fb8f116105a928a4483370ac146b0
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/53d082394b64a8278cacf718ef0feb31fd84348e
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8cb8a98ff7a1f3157cef9d67d8945ee27bb0cd89
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b6d8e45dcd1002022eb36b14f3b242ff5807148a
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b1a4983815fb4ed8e034a932f45e8aeceb9264d6
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/ece3b408fcaefe02492ea9306aa016709b5059a8
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/475326955e540be64092d93e1d75d624abddc8ec
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/c1845591bb87860b42db7aec28d5c529abb5e629
         arm |                      lzip-1.15 | NOK | http://autobuild.buildroot.net/results/f73667ed98e82b314bcccab19d5b99421c2a22d6
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/9515444764a7708632f0718be2e3bce8d9427c4f
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/0457b824e610ebe262c116c1db36c6ef1d7c17b9
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/f497b3646eae4d05ba865c18c4c2bb215d1eb1a2
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/0b1ee2a9ec31caedd2729190ab67ccc89420f9ee
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/9dc475ea2204ea6a279ef00ec1a9984c6793404d
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7c42553ca978106d48912327d3648e62b2a850ea
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/baa4e8fc32a9473f2296cec509629e351b1656f8
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/06721c42114c7ff76ee822d1ad511cc079acf3ca
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e4b0699f33b5b6b4e4e9d9f62d56ff83e71318fd
         arm |                    nload-0.7.4 | NOK | http://autobuild.buildroot.net/results/88bf5b489a733e55f7fc59edcdb2f7dc73d51ba8
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/bca63902de9711503abee14af2578be4b69edd43
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/debfc8d8493cdd94908ae158ec964a7738e353bf
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/a0be68c0835134ea3048e4f736f0c2f0a89a4dc5
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/29a4096251f8f63f9767c12f9702cf5d87495b9a
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d9f2f771f8515a1ac17009e233a135b5af58ea00
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b98e321dbade0deaf78a608276d2f9a68779eccb
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/07394ba1aa70b8c47f23dd0408c4b4bd1e01fd93
         arm |                     qpdf-6.0.0 | NOK | http://autobuild.buildroot.net/results/ef91efbf26e6c56ff2061388d780a66d0cdfb283
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/70dbd546951e36d19f6c3683d5b64585f2fdca98
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/82f466efad7fb7672c7a5372e3358399b5bf3203
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8070e24521f353561c5da3550319114ae688de2f
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2160f3b5c47869cdd0b455feda0f840a34ca8071
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/84158dd35f73ae1063fd793273088ea0c9a881e2
microblazeel |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/fe5656883c0cfab8cedc60b7c3faad9e8a3c4627
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/100a4552e51f9e80e5d6a5fb6f2c604ab312b4d7
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/cf555920a2d285a54da798189c190e8d28281031
        m68k |                    tclap-1.2.1 | NOK | http://autobuild.buildroot.net/results/4581ed78e70b6332d6f25f89f0676c33e26599ed
        m68k |                    tclap-1.2.1 | NOK | http://autobuild.buildroot.net/results/e8dd9aa3650426af46458bfb11e040ded634b6e4
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/19f4608a2c177269dfff67ac6a58def4eb5b873a
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/a6d329578f694fcd261f7c7912e5b9f308d8a14e
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/b53e63a290ad519f958bfc6e9c9a555fbe210c63
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7d5182c68d85da5803d6f152b7e541df75f17aff
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d0395d9b672a9a1ed2211524f58f4eb33471a6b4
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d4f94cde02020779b91aa8248b6939b92bc84dbd
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/c1e25d1c321fe56ecdde334d50d914798d4a70dc
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/bb5db9fa61a362d8f81d865b65a9b64a195e3533
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/3aad8415fdaa5341c853ab19fdca01a50eb26f12
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/79a8d3a4bab673cb3a1f8efe2dce4f983f6836de
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/78d9a5b186994f1eee457e229b71807c26af5775
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6f73f14f350950e46e78a44ca4057d22360cee46
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ad190a3746c1edb57b2685571e8c2cd193d470d8
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5683efb3421c1c72046a0978b5ea1bc787da77b7
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/89f0d195c2f1ce0f2e215622c77d0a3c9a3f8b0c
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bfbf382095030eaef4c006896ad0ff694f5e3a11
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5da773c108bee3ae960ce8c46a384c331edf17c2
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/82f85074bc9d7c82d5862bb52ec23eff07e9adbe
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/51794784093711be58c3253dd008db48582234e0
        i586 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/72c6201a319816cff8405c4ed29364a42943865c
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fcce55d15b30256edf2416fd4a6532a2278cade1
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2e7052cb03b290aec7bd5560c85ea7ade4dedad7
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/eaf87956cd829b343b27b1c5b05dfd0f172cbc7a
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/786c352844d4c99235018729cd3256fc7c95682f
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c745506d75f44ac8075c4a2f4c9dc9f6a8e64c78
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/949066e2897d2cffd51ca209db1854f63284a4cf
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/516716d4ac7cf0fedef71a433b0614a598b7cd74
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6537b2a9a286c54f2280de306d7484b16504dcce
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4dd4a47295f9c6b07961a688334f0001b669b546
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3cea389a8f9a17ac8c9612476207ae4a6cce5d5a
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/608c898cca108ee6305e0f73b7439ee02293b76f
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a92fe68e0fdc94ddbec4915a84f6348809f04dd5
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3a6524772003dc710094fb33bef0afc4dc95009f
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f39e6e543e1d6a45dfaff6d21f68894d64000860
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/095887f1464a02dd6dd89bd9bdb65e1fcf9c29c3
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e58848c1b365964a236831fc10a4003d0d4d9fa6
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/1f1512eb694d7f0e26b89471d9c73c76d6cae6a0
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/9b940279f67195ebc58f7e120edadb31d6336943
      mipsel |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/b3686a692dec07886233c70c725d63bb74fcc01d
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c4ade763e7ec327854fa3d042d49bf08fb47f208
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/131e2c3449931f5cca014a5690a4ed8f2d4240af
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/dc4284289dce4025c2ea67d403333b83f9643a82
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6cc088918d8dbef4e52e57df22207d9d39f37553
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/93f6ebc7333434aa2d79856d14f029578a488f30
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/46c08eb7ff9160981b60730242e4faca6b7f8421
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/298e1af7a100470e807e9f2e73722253b64d17cd
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6286740885a888e50e9620055feb00271814842c
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f6ab54f061838c59c9a716a9e82247dfe1f7bcb3
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/701b65e5f739707d449f5c1fcb6345a248f59735
microblazeel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/267b71df68af6ca847ec2f5ffafa0c78b5014ff7
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/9440bc5924878bb3c408daba2cb173f5ef5b78c5
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/c9703dae26ffb824f548644c73e4b7e13f4289a0
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/abd97b524f8a19dd2adde3c1d417d253a67dd276
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/508f35fb425c6597cb9b6c0ecec40da76c7135d4
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/e2e847bb30b82e0614d1ff24e3cdbb69a5d6dee9

-- 
http://autobuild.buildroot.net
