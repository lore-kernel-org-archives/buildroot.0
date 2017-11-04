From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Nov 2017 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-03
Message-ID: <20171104070010.A343A2068C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-03
================================

      successes : 154
       failures : 67 
       timeouts : 3  
          TOTAL : 224

Classification of failures by reason
====================================

                ussp-push-0.11 | 14
      host-uboot-tools-2017.09 | 9 
          usb_modeswitch-2.5.0 | 6 
                  boost-1.65.1 | 5 
                  ffmpeg-3.3.5 | 5 
host-vboot-utils-bbdd62f9b0... | 4 
                   jimtcl-0.75 | 4 
             dbus-python-1.2.4 | 3 
             core-dependencies | 2 
                 libdrm-2.4.87 | 2 
           oracle-mysql-5.1.73 | 2 
                  cppcms-1.0.5 | 1 
                     gpsd-3.16 | 1 
              host-erlang-19.3 | 1 
       host-erlang-rebar-2.6.4 | 1 
           host-mono-5.2.0.224 | 1 
                      icu-59.1 | 1 
             lttng-tools-2.9.5 | 1 
                poppler-0.59.0 | 1 
                prosody-0.9.12 | 1 
           python-numpy-1.13.3 | 1 
           qt5multimedia-5.9.2 | 1 
               qt5webkit-5.9.1 | 1 
                  stella-5.0.2 | 1 
                  tremor-19427 | 1 


Detail of failures
===================

        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/276916afa722ab4210523ca57904cc4dea88c7fc |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/fecc16df052ac5b14d3b15e174c7026dfcc8fd33 |     
microblazeel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/df6f9d51ee766a6f8fca986cdc7476d148dad53e |     
microblazeel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c8b58bf37b565e7a4dd7959e0d9c1cec993758ba |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/e23b646b16fe32616154a7c5b81e2911b8d51889 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/e45c3903e17d81c2e187e8aaa8407037e71df7d8 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/866585724b0652e1d7eb67736144db6393f0087a |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cf5a2e23e6d90123829a87f61a00e33dab9bde5a | ORPH
     powerpc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/64e3aa543e3abc3f37e3de7e1519571bc8e13fdf | ORPH
         arc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/9427d26d9bc16554b549d21aa93684b95f8200c3 | ORPH
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/78764b7a0f6b8973ba1534734de49950fbb7441b | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/e789f7898cb09afc19005ba4437f2c8949e083b6 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/5cd980ed34ca51d9d2d46d254cf5ceaf86af9bbf |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/c662227a98b5af59fc054ddfc85f763f4436855f |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/96afa6f1a62f2455196fe431466bea5b28b6003a |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/871c85031faf166437788ab47e4f833741031652 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3bd5883855076384ad903c14ea13ee1b832ba63d | ORPH
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/f05836cd2000bd373a5d2a852899af8a5438fc77 |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/d554d3ad76e3be11cac26d5f51c03fb7273d2487 |     
         arm |            host-mono-5.2.0.224 | TIM | http://autobuild.buildroot.net/results/b5eae39a4c7988fc58b1a48d792cbc3070c23651 |     
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73 | ORPH
         arc |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/2b429f82bed1f03d69021e0f959da4e2db2b5a0b | ORPH
    mips64el |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/b18012963926682ba192b9176bd3e35fb07cdf56 | ORPH
microblazeel |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/c9dadbee31cda185358c8978b59229c86f46e77b | ORPH
         arc |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/fe7ae6c519dcb4e71f6b2f938a43f76bb54334b2 | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/f5039d1f02a752917ae71a518da200fff6f1f8a9 | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/dad53b436f49596b2d94000acef478c1b22f0035 | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/d58d4e5f90b722cdd6f8dafc093c93a163f37828 | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/20008ca0adf86dea90f148a23332204ecb1378f7 | ORPH
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc63f5b0f9fa409224ca17fc432282b93dda6b46 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1f5d6ee1581592e02e88d62ff3c7eecc27406435 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cfa349e0a39fc1ac3e372ef16c3f7e607ab68a1f |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3dbcff0d5907397923940f2884a7e0efeefdea9c |     
        bfin |                       icu-59.1 | NOK | http://autobuild.buildroot.net/results/4e87cb455df98a9a5dcc55f39df881c63bd00158 | ORPH
         arc |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/0a34c1793cd9c5501f2d71750ef088f02f8b9306 |     
         arm |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/0a24243ac646ad681403ec57b65f1d7c9e1d4a69 |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/49cd9cdaa85349b0eb9db63a29e6e7450972526e |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/d137680bf1c0ebfacef635cb2f0fc14524759143 |     
       sparc |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/6b751d0225dbd31827af14cb774fc75cb29d73cb |     
       sparc |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/d79577145cf879dc3341535da1b0c25b731818dd |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/8dcdbc21d87229c8f8d13493ea6dcaf3a3964044 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7f58eee8e6cdd9f55c7e3298533c8551bb4d4adf | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ec144219704ef7bc52062133685c0a2d2228f43f | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/bc4a7d1c096ad40e407f367f56358ee296c26225 |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/44c565cda172438606417f4f55a5da76b60df0e3 |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/84e7a7e5acbd18ecd7b882aead50174a1082bd4a |     
    mips64el |            qt5multimedia-5.9.2 | NOK | http://autobuild.buildroot.net/results/b10ada20bc88469e1ca46af6bd1fcd7bc1066718 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/1fa00bda8fbacb069626aac8d240ab0e30330951 |     
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/7483123d5cdc4637f298d7edc5910751b27791ec |     
         arm |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/2af7412846c576089f8596857ab8c81ac31c1bed |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/f2203a75838dfe319cbec40eb4e6b667dab07635 | ORPH
         arc |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/3ca24fba3291b4c67662a158b7b70b0f9c9b030a | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/2266a8243439358178396df6bb3b79a2cd27cf62 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/d4161a75f968e25311d278a0e5979e0003624625 | ORPH
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/eafe197343366d65dfc357ab41236bb5e987dfe1 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/106af20196089e74c35daabdae46f030981600bd | ORPH
         arm |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/543e70a5781c092559e72045d71cdf4289dce7fe |     
        i586 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/41211fd9f2dacc4ae70e0c88ed0f3fa0b874639c |     
         arc |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/95eaca43a4a087d3f96f522afa5ea5d49fa30c3a |     
 powerpc64le |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/d900ae8a50700b4b1442651ceb84c5ad4bc84e46 |     
        mips |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/b262718ef9519b44b924db604733d4dc20f0f488 |     
       nios2 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/dcd6bc0c2064d8fcbd27a6093094d8d57b7aceea |     
    mips64el |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/a3da9eafe1458878f3902e66d21d811c60aaead3 |     
     powerpc |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/515f2fecbd6cc4ca1f146fe1ccf2b0f18f850268 |     
      x86_64 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/c14ddfcaf63687d1d87088217d0e55680b7352d6 |     
        i586 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/5426a64d0a7c17d57f661229bfa484121d0bee31 |     
    mips64el |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/487742e1b4adcbcf3581d30b353d5a6a718fb146 |     
    mips64el |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/5fb060da192087986fda4078c7609cdf3d11eea9 |     
      x86_64 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/872fb01df3aff0a63084679a0e7ac4a20a4aa590 |     
         arm |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/ec3174836f99253d7d1c9e1d3846a57417031db8 |     

-- 
http://autobuild.buildroot.net
