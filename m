From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-17
Message-ID: <20170118073014.84FA820BC8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-17
================================

      successes : 147
       failures : 152
       timeouts : 1  
          TOTAL : 300

Classification of failures by reason
====================================

              host-libcap-2.25 | 103
                    ruby-2.4.0 | 10
               sdl2_ttf-2.0.14 | 6 
               openswan-2.6.46 | 3 
             berkeleydb-5.3.28 | 2 
                   eudev-3.2.1 | 2 
               qt5webkit-5.6.2 | 2 
                     tslib-1.3 | 2 
                  boost-1.61.0 | 1 
                collectd-5.7.0 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
            host-heimdal-7.1.0 | 1 
                 ibrdtnd-1.0.1 | 1 
                  lcdapi-v0.10 | 1 
                 libnss-3.27.2 | 1 
                  libsvg-0.1.4 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
  make[4]: *** [all-recursive] | 1 
                    mpd-0.20.2 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
                 openssh-7.4p1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
               polarssl-1.2.19 | 1 
             rabbitmq-c-v0.8.0 | 1 
        riemann-c-client-1.9.1 | 1 
                   slang-2.3.0 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/98067eece63a7ea65f1665b70c68976b036d2862
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/98d57a4cd458e0de45ac2542e48fd8f785847e10
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/a9c4fdd4794a156dd84be6f4e021044f28c6d590
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0fa82ff28a5cff2842d84a69bc5747beca2ebc4e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7041b34327b0752d3f4294a5541c785dd9989d51
      x86_64 |                    eudev-3.2.1 | NOK | http://autobuild.buildroot.net/results/ea3beb31ebc52f50b1fa598431d121158988783a
      x86_64 |                    eudev-3.2.1 | NOK | http://autobuild.buildroot.net/results/9d5dad172fe5c5a6247cd5ce6928307236184a64
         arc |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/f800e3093b6cd9c7b45892f30b996bbe7400261f
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0bfc3ca759962242d4a1fd7db8c562e6e28b6d82
        mips |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d5a9a85ae5177eaaff40aa195df15aeb258f1c48
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0e57d7ad959e1b72e39bb2291cced5d0561dc489
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d595b1af6aebf3c604cec5b9b87cf0febe7db414
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ac096dc95d8cf14540e673c6662d1469d58c0667
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5632f9bba7ef85b76b906f4ce69e4ba7cb3af2ea
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dd65f3511ca7bad394ea27eb7bc17b250f1e0a5d
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b0617eae083d6826d9d2af1b074787e7839a0615
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0070d98bffc124f2a42c3d447a38f722d694dbbc
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/89575323423fbeb67f63d9429ad1d01d268780aa
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/91c24ec0c9fd99220ec3c1dc25951d870a2e80fc
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/22f4898198c328e17d44f6c9bf4fbd8daf767049
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9bedc0e6b0a172141cf3e60eec0b0cfe380e3d11
 powerpc64le |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b0813e8a615facf4c35cfa75574fba2b3b34161d
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/953726510ff568483de7e5989aecc9d80e615807
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/04f8e04ba0689cacbb1e27972407bda9ed025103
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7088d2d9f0a5713b67d51ba5a063e760d7e32b71
     aarch64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/44ae0f7694bc13de5794d682106fe0cfa49b5ba9
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9a10c01ed987fdb9a76536b2b956f1a56a3aac49
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9a7c7f7faee5a29639c4495b429c6fb9598b7672
        m68k |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/3f2c84c1d832b75ca9b999b5974309160f696684
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/cd23e987400341770b6ee5706144afa72f3feeeb
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/07c7e564c3ad6102b252ec83f24b90872e315d77
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5cd08f84fc3223ca337e40fca79873247c3c3f16
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f8ef4e092a37f18abd0d6a20a809f47853543c96
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a932d7f87ead00ae710bc6736cfa61bb8c863abe
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/466a898bf2e4a78652b17568d0af75f5283dabbc
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0eb73f518c09257eeade3943f6cf04e326ab9b6c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ea0076c52ccd9ae75bfff68ca9909e042c52b52e
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a75184218257a6b92fec9d7ac8a35b17dfb237fd
         sh4 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/804094a43709cc7ddbdc7156d569c6b25a5d196c
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d5c33ec4c4ce7d41f3a4de4d4736555a4a2f4918
        m68k |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f0e4a9c6a1f0ea114ef40d2930d6152b06483fc6
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/5b622c0095e04c45e0855f1f9c7d116cdc79b5d7
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d79e9b60577785c7ea0468921a0195d3ac4a0d99
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0a4b224f37d1b43c15ec3f1df8f471c9cf07a59c
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a2da03b1a586fcfb0c7f9146aaf24bfab2e885b0
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/9ba27bf9f0251e02f6c78acef704eebe80dc537b
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e9e7707749673e70c40b1f27ec099ae711df5c01
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/79ebf083a1d4eae5ccd230148cb3f2daa775b07c
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/4892b394ab980cf86749b65bf80a194c8f173ab6
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/09239bfde512fad528f6d22da2a8694091ad460c
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/efd7424e85ea0b09d39ce13ccd24cf00dca9b3ff
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1f79b41f7c12181fcdac9461164a27e78115dfbb
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/593c9cf9143728fa20ee36f89b81c15bb30d86d4
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f078c769a383ad936780b68704a485bfb8cfeb38
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/af75a290c79d420b2ea7ed548fb734d03a64095b
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/53c384692981fee0187eed6a148561dc34ba1c10
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ccf912d41c0416cd3fd747f30725137136ab3da9
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a55dbe27d4608a2d0791b8d94273f74b9a6af556
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2fe9ceccc37a6450dea04ddf5e72ab9212d950dd
        m68k |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8ef28a29a056ecaa1ec71701d186bb861bd11510
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ed788c9d59d902027f818f199618a33c53f31ca6
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7df467b712689e7f929358df750a61d5800a9a97
         sh4 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0b262767d93d490d0908ab4d18c83700f68b20b6
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a874667d1c6279bed70b0debd54f097e7afc1300
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/28f9dee8af3b105c1a7e0eb1d17ec37a2de45161
       nios2 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d8d7c7afb96c38e7e9740349ea9aec593910070e
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8a953d45ba3bd82e206ab39b63664064813892d6
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a143378d0a74b9f25944c51cec7e253aeac888da
     sparc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f0a42978465e52c19affbd1f69b258f05259a1ae
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dabbcb1d6545153697f47e113d51638e44122911
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d387823cc9d5566ff6689beae36b43a9d11c2b72
        i586 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ae45a6805226bf4b1cbb398c29fac4b349429ee7
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/aa4608b1dce08e5fe3a73baef33280c37bff96da
      xtensa |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/65ad404dde95ea31476b81d103986a0591154133
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/7eeb84cd97fb363778e9fcdfbc370cb0f450ea94
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d307661add20005812e45ce58db396ff7cbd2df7
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/86c0b47d09811a513d946be653f740c50bb32330
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8dda3b9652983d33bef0bfe8ff797f646d6d76fe
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/719efd005b0a8ead7c64f395e59156e09fe8fa1b
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/68f154693eb2dc886a05e0cd8d27047f39853bd0
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/8728860024c7d114fb5b8df3f55588ac09ecf323
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/0a64c1670fb20557128ca03fa4b1d1f05a6d4cbe
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/6c2f50a2f62420a7d50a27898a05a101133e54b5
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/aec371f7008494c56e7ab5c90d76c2a3919eaf02
        bfin |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/93693351e9a9855228dcb0d08c679c22736442fe
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/f5eedd5594d4d41f56077fdf4aaf2eb247c022ba
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/68493cac1c7833d8e27fddfd08d64f802d0676c9
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dd4323ea72663f6d0ae03c97021c28a958fbf3d0
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/47e6413bd99a990d0febad84a01a8e305e211a34
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/990a6d0cbab171a5fb1452fc8e6b6e9ec90cd8da
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/40c6d4137f70897e9aa9aa66b7dd2c06f7b3326f
     sparc64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/bb8fb9f96909f4f721df40dc7d6020488fe7ba01
      mipsel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/badd6dc88d2476a26853f60dab4e7c7dc7aac332
microblazeel |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/24bdae81e37107bd2dd5c7afb659013c849e38f3
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/e9b5e0d639b3e50a1797f46670e56cc0f9679753
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b0796c0e8f2ea02a426f1f6329097a03b15118ad
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2733ef9015ebf815e98be7bbbe366420b9ad0ae1
       sparc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/6006bae4f3d971d47d0dcbd1970e575cad8b18c8
        i686 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/2380f384d9ab56634a864084fb34e1d36c1bdff9
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/a9efc898ad7b7d04e1fe02886560fd3f237de24a
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1815cab57a517ef0e1d7a1e7f291f0cf619e8df9
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/62b78f6f64d25ae31959721f5172009a2c06f1cf
       sparc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/aeb4740b9ddc26c8d0f475c3cd0d2b8b06a94726
         arm |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/dbc98c12b0ec0e41b727d3becfa394568254bd51
      x86_64 |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/eb7f9f19e73dcc1bc8d5af0413c44ef948c74413
        sh4a |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/d5a0e26f353a1dd7d2640fb9925344e397b3296b
     powerpc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b42a5a21d8e847e1a9bde01d67b009f5cb33e2e3
       sparc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/461a73996bcb695db58f424453d7e91007901da0
         arc |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/ca688d82b794cf6b3127704cffe97a9731910894
        m68k |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b8e0b4f8596541228254effb27fd06c55161e4d2
    mips64el |               host-libcap-2.25 | NOK | http://autobuild.buildroot.net/results/1215989bc1352b34c64304efcdd8509ca4cf362b
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/0d153c39d79291fead344d6b1934cff8cdae0c7a
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/3b23ce9c8aeed110d41d5046b4bc7d247e967529
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/f07c2370d6436cc9a88a2ed12121a88d4378d541
   powerpc64 |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/f6c6e89e0b4f9bcf32f0054399704575f25bcc9e
     aarch64 | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/9192fda2d16e2106defaea2aef73437da7529ab1
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/acbe0932984b1aeeaf075eaf74d2a0e7648236ef
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/12af4ec0da5ac3b57016af02596a092e81e1460e
microblazeel |   make[4]: *** [all-recursive] | TIM | http://autobuild.buildroot.net/results/692b4e66fa2a2507df3a37854a3c20e464ea277a
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/2146859ea806a9e3e99a0b0d2b62d738918e0f05
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9d6a2a328296bfcc097955b84e5b4e0d81712dab
     powerpc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/9a34658b0d61b00a6d7046deacd77ce94ee27bdb
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/74cf7dacb20f14790cab8293eee8b6a8fb86771d
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/61afa71fc2c917b7e66d08011433c164f54f55b5
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/481ee8816736be481b984ce1aaa4314e6669284e
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/c82b44990b195b8cf6484b3f6a75811b64c4fe91
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/b52ed4e0794955165fc2769d45067a02ee1f19b6
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/bf515c79d84211ace446d5319620d090e78c49a8
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/c8da032ec2d615f93874a5de24dfc6eb650bbafb
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/1c140436c35b03f9b76ba50be025b7131670622d
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4604c101f1d57e33bb98535313be758caeedf759
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/d015a85d9a2d40a036adce9411bb4fd2a2d7498d
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/598b9d08912c1d59c1feaa6dafafa341836a3e96
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ae2cf7c02e51c2f2cab5e881b41c330e5045eba5
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f8cbc82b5a5e7e38b58a777e1206d235fde5229d
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d501fd477eaf6868bc508188bc6c498e4a54084b
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/806cf6f5c991dc0086634cf2177d3e8eab228b20
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a1b8c00e0b79b9f73e6efc94d4c47cce4457f95e
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/4fcf73655622b6e3ae90e62978d86424fb623f65
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/967623d9fdf417a9455c0c617dbb576381180f30
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d5a3a44b41b25b4117046ab81efe37e57bae4fea
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/82721cc82797167f94634144b8bd5364d7da4230
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2044edcbb69c7f97a2b0af0caef27c6225c733bc
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5228d91dc014c3c8ac3db4392de747e24e3e340f
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c429f021f13c796aa4e43782dde8c8a65ca2390d
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/adc59cc69f212e2a633590649591c89aac683e65
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bd547fa70ac2e4ab3e150d59ea914ea619c2b052
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/dbdbb1f9358511799bac1775b8928232c6d57c94
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/62f631f3e3920816e09ded7a58f05b9b928a9b6d
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/39c1f837af3e0ff11d4ab9d56978e2d6b4e87b36
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/45ec9d22333af7f08cfac93dcc2fa1dfe36a9f20
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/0f8ba7dd46389a43edada1ea9a575b69244308cf
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/fa34dec609335023d4f6846cac29578054bec761

-- 
http://autobuild.buildroot.net
