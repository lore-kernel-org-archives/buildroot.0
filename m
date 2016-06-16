From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jun 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-15
Message-ID: <20160616063030.E179F101D31@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-15
===============================

        success : 184
       failures : 152
       timeouts : 1  
          TOTAL : 337

Classification of failures by reason
====================================

                   efivar-0.23 | 15
     python-pathvalidate-0.4.1 | 9 
                  boost-1.61.0 | 8 
              e2fsprogs-1.43.1 | 7 
dawgdic-16ac537ba9883ff01b6... | 6 
                flannel-v0.5.5 | 6 
             bluez_utils-4.101 | 4 
                   libxcb-1.12 | 4 
                tinyxml2-2.2.0 | 4 
jsmin-1bf6ce5f74a9f8752ac7f... | 3 
                 mplayer-1.3.0 | 3 
                  autofs-5.1.2 | 3 
                blktrace-1.1.0 | 2 
                 linenoise-1.0 | 2 
explorercanvas-aa989ea9d9ba... | 2 
              host-libxcb-1.12 | 2 
      python-itsdangerous-0.24 | 2 
                  connman-1.32 | 2 
                  fbterm-1.7.0 | 2 
libatomic_ops-libatomic_ops... | 2 
host-gdb-6be65fb56ea6694a92... | 2 
      kismet-Kismet-2014-02-R1 | 2 
               libsigsegv-2.10 | 2 
am33x-cm3-11107db2f1e9e58ee... | 2 
          libmicrohttpd-0.9.50 | 2 
      jquery-keyboard-v1.18.12 | 2 
   json-c-json-c-0.12-20140410 | 2 
                 libtpl-v1.6.1 | 2 
        host-lpc3250loader-1.0 | 2 
                 lvm2-2.02.155 | 2 
                     php-7.0.7 | 2 
             qt5location-5.6.0 | 2 
e2tools-3158ef18a903ca4a98b... | 2 
cppzmq-68a7b09cfce01c4c279f... | 2 
     fb-test-app-rosetta-1.1.0 | 1 
                  apitrace-7.0 | 1 
sunxi-mali-d343311efc8db166... | 1 
                   fwup-v0.7.0 | 1 
                    lftp-4.7.2 | 1 
                 log4cpp-1.1.1 | 1 
                    quota-4.01 | 1 
                 omniorb-4.2.1 | 1 
                beecrypt-4.2.1 | 1 
                xfsprogs-4.5.0 | 1 
qextserialport-ada321a9ee46... | 1 
                   mpd-0.19.16 | 1 
                  cpuload-v0.3 | 1 
       gadgetfs-test-undefined | 1 
               opencv-2.4.12.3 | 1 
                  openjpeg-2.1 | 1 
               libgcrypt-1.6.5 | 1 
                  qemu-2.5.1.1 | 1 
               linux-pam-1.2.1 | 1 
                     gmp-6.1.0 | 1 
snowball-init-b064be21de257... | 1 
                     vlc-2.2.4 | 1 
                   lite-0.8.10 | 1 
        python-pyinotify-0.9.6 | 1 
                cifs-utils-6.5 | 1 
                 jack2-v1.9.10 | 1 
               libcap-ng-0.7.7 | 1 
        targetcli-fb-v2.1.fb41 | 1 
make[1]: *** [libleveldb.so... | 1 
                       sl-5.02 | 1 
         erlang-p1-utils-1.0.3 | 1 
                openmpi-1.10.2 | 1 
                mono-4.4.0.182 | 1 
            lttng-libust-2.7.1 | 1 
                    cups-2.1.2 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                openssl-1.0.2h | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/05baecff7d8ef882f21bf4da1b348ad0b1b908fb/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/aaf9cb1855a23bbfd80330c8b0e6438e903922a8/
microblazeel |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/d010149cd536796c7f9637c42e1243a2021ba170/
      x86_64 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/b579660f79921f413d7d51662e8ad12968e19a84/
      x86_64 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/0afd1a00962899eaba775d44dba547b92c00d190/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/63213a946dcdde804f6e746a40bfcfdda6437046/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/817be4755f08bb34dbd9b760314503fb41584830/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/8217454f3c9713c9cfa00e04b85e5b9bc1f3a536/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/00ca476565330144049801368abf787e3f32f47f/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6a17b3bf67dbad042c32c40a15ce8c996d07bef3/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3391009b8fb2986c61cb320e5890fbb8b51bfed5/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5e8c3344ab9ee5c68ca6fc1cfdb80fbe57d109eb/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b8dbe77ea96bf9ce6e079d365e3481daf6181881/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/adcbb021700e3350d0ef4fd1eb0fd7c487195cfa/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/99c83b47b053a3715af1ed2d6783996b7a043d7a/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c00415be58569bf09409fb6c960bc50689648162/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/807c6a43a30c463daebba109eefe2e33de50d9ad/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fd95612b1f5b7eee9128b0b6a27bb389694a32a5/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d3a7e8bb4aeb6c45e2d03f7f2771d5934dab1be5/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/567669b7b201f1f932595834260d4009f2f34f59/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/5898de396dd1af701637d1926512311d4f7bc686/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/06e862ffcb0dbc1fd0a06635f034178fef537e2a/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/88f1f907b926bc99d536d051a8a424f10a375699/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/aa17b05961c63c0a1f6a3fbd7e270dc027caa87c/
       nios2 | cppzmq-68a7b09cfce01c4c279f... | NOK | http://autobuild.buildroot.net/results/5c9d5fa1f9b54924cab365532c17f5ffab1846b1/
microblazeel | cppzmq-68a7b09cfce01c4c279f... | NOK | http://autobuild.buildroot.net/results/425ce97de58c53c4f56d43654c0ec8a7cd7c6430/
        sh4a |                   cpuload-v0.3 | NOK | http://autobuild.buildroot.net/results/e595a49833bf3046af6fd6ef4ddb7443d40771b9/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/f3d9ed09d156b6b6b6c05bc5989e8fa38320e84d/
        i686 | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/1ba790cc69eb92796402a0de053d38f45f83a563/
      mipsel | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/66b2989c9441f7fab446d2cc60f047fbed954f25/
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/aed6c66f83242238dd28f57a64786cbeb8c7ff55/
         sh4 | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/fd69070ad15792d5a2eea62da6bf22cef78d6f30/
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/15dd9fa48e7ba531a88994ee917f6282f4f0b7c2/
    mips64el | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/bb916bc627287d330e620ffef043e9054c03be9f/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/dcc5f38723aeda208c3ab898324a71f2dedbd7f4/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/eefa320d92c32d8904f4a7452cc6fb8e49283c8c/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a875f4499295e00e349ea4b9075256596ff25a79/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b1e80a8cf9ab86a78322112de0d27963c20fca20/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/cb12775c995a4401d7ff86f9902cfe53c37d48c1/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ab2a891dc53f052109d087ef822470e91e8368d6/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f81cd1d4d5572ee985760f29ee75e8a3bb50b522/
      x86_64 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/28f0e730768bfaf9577069e4ab18b5a3f3e595a8/
        mips | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/008df073bfa99f93e27d977ef1b64b79ef8b34c4/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2bf74c2bb9f20ad95029d1d9087169e1a8851832/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/76d9089e9c0b75945609c0f253a3b7b615ad9884/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ea36fa011ce3027cbb55d6c0cd7cfe70881fc82c/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/5b7e4d9a5f36e67f697bfe74f5d4eaa489822afb/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c58a80e8bb1359abd7cacf47e03fcf674957b260/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c36e3eb94b9809591b03179921bc20e4cb50019e/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/cdc1c752d53075481d3ae220668243a2cf231dbd/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b5497975920a78e42ab3a7ed0869d0c2dd079865/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/278ab413e8b205be86c9d9c830d9a71a92ac69ef/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/04b0a76dbb38ec12cc4ab4d73c2b775365b269b9/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6ee295e131d45c978212e538de6c263b7e83dca4/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/b78d842b9e3fb43abd453db12ac9dee919d3a64c/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/136378481d7975fed99bbd11e7d7c788db2e31c3/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1f4f77f1a0eb75cf94400d145e583dbe40295a76/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/79f97e035398969e0d955605ab553f7897747343/
         arm |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/9e7b185ac9084ae6a6bb5135bcfe30eeb3744947/
       nios2 | explorercanvas-aa989ea9d9ba... | NOK | http://autobuild.buildroot.net/results/51ca42d031814e7d6650701ea285cb7e1f31bcea/
    mips64el | explorercanvas-aa989ea9d9ba... | NOK | http://autobuild.buildroot.net/results/dc55e5f210c90dbaa4bb051bf489c53c18462828/
         arm |      fb-test-app-rosetta-1.1.0 | NOK | http://autobuild.buildroot.net/results/9aa6818d67d9cfd0bfdf14945476c7783cc05aad/
        m68k |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/54cc2f443eddc1459b2006683f001d473ba65924/
        m68k |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/7d7081e7ce6e2be71b8df3b6213142c5ceeeccce/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/32ec429ec60647d50f4176d7936d0952e9c739d0/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9d02fc3b714b383a82575098086d43043adc5db8/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/4e8bcac871a806b58434b5c8f9d6e301ebf6b7e2/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8edb47c63e27a33cf70ea29fd269420a0908576b/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/cf746f7f4c8208e79b980a53ed4874c208fd9853/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ab8f2efaa24c2bbba8232f5f3d69a36f0f1aeb9f/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/df77eac852e74444d490f4aa1fe83b59ffc7bf4b/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/7720f451269f577f5f2e732f7708e3de7d3fa46e/
         arm |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/61c976806b043b25b5c9b520002f387b72dda8f3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/20d974526eb432b6405dfa325ca19c0561bb0aaa/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c4dc39c37ed7a783731dc5faf5e785d9ff7f0fd8/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/032b94a8cc61cceffba3076d5663a45029c0e833/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b5e02fd77789f61f13bc90030ce6434e795eeea8/
     powerpc |         host-lpc3250loader-1.0 | NOK | http://autobuild.buildroot.net/results/56f4e5f864da7e2176c78426d1d180c37966b181/
        bfin |         host-lpc3250loader-1.0 | NOK | http://autobuild.buildroot.net/results/a601f30d7100821ad0e303c6338348751d7aa99b/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2a691d01d8c91aa1058960f5176ad611b3549f36/
        m68k |       jquery-keyboard-v1.18.12 | NOK | http://autobuild.buildroot.net/results/d7500f7e063b94e9991bacfd1df9fa5aa1967db0/
     powerpc |       jquery-keyboard-v1.18.12 | NOK | http://autobuild.buildroot.net/results/f485ee75ec4c9b87f17b8b8dc1898590045474b4/
        mips | jsmin-1bf6ce5f74a9f8752ac7f... | NOK | http://autobuild.buildroot.net/results/c05a9da77c4d8ad1e64e029c9e2fd65ebf35772d/
      xtensa | jsmin-1bf6ce5f74a9f8752ac7f... | NOK | http://autobuild.buildroot.net/results/03bcb7d8bd81109715bb284207df5c8026710582/
        bfin | jsmin-1bf6ce5f74a9f8752ac7f... | NOK | http://autobuild.buildroot.net/results/6acb5d5c56ece6cefdd135bdb90be035a3200e0a/
microblazeel |    json-c-json-c-0.12-20140410 | NOK | http://autobuild.buildroot.net/results/ecc4ca7fdda173faf042dfe991073d8c5e9af4d6/
      mipsel |    json-c-json-c-0.12-20140410 | NOK | http://autobuild.buildroot.net/results/38fd47a81cc2a6fc515158692af4e2b62f4a965f/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/709a73f69aa213e4a8c4848ea519ce573a0d4796/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/38769f969f3edec668db5f6c99dd2fd066ce54f3/
      xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/c63585a644ee1493a1040e00e1fd1227f59a22da/
     aarch64 | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/866b35878b03e0046b18285dcff89e164a658237/
     powerpc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/a459be0bf948c3d5db6d5ab7cd9a1a89edd692a2/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c9289b144615013885d8f2aabe1ceb3cee7b7e60/
        m68k |                libgcrypt-1.6.5 | NOK | http://autobuild.buildroot.net/results/83c8d93ec9d3ddd4ab04cdf511e4b3008fa21263/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/51fc6733729162b8b0f242bee3380b792be89404/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/83e7c871d1eae230a3f519e64d92d4ff7f492efe/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/67abf8ef86f28c34efdadda72cf2f2e58db7ae3d/
        m68k |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/604397e16bddc71633a625b6dadc5fa1575d3bcf/
         arm |                  libtpl-v1.6.1 | NOK | http://autobuild.buildroot.net/results/18d492dc166c3d175e00f2d621d66d209854cb93/
         arm |                  libtpl-v1.6.1 | NOK | http://autobuild.buildroot.net/results/1af513c5832ad44d348fa99ea2b65f3a8e462249/
       nios2 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/ac3c5e1a42111b8d3a0b884383537848aab6860b/
     powerpc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/8596046f86bafc01b1749e0f58a440a98cfa4a5d/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5af6ef4df57fab248223ccfefd3104410f71b085/
        mips |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/6b747e7cef51fca29ce042b577dbdbcbab932d17/
        bfin |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/4babd83aad0638a93c0a502e4dd5f3f938b32bfa/
        bfin |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/b02f03e8d0f8e5bb3dcbb3b28819268389ad1dfe/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/21ba4465de6ef3250af9f8cee785b17d3be83a27/
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/72b5f86dca4ea8f404c0085d92d11672014eb8aa/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/cf942e4b8a5259414a4dcea6fa4b75183435394a/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/aab8a75044dd865052ee7caf1a2b063a6b159010/
      x86_64 |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/bcbdf793f5211f36d8066adb4dd1e981bec843e1/
      x86_64 |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/f1b74e12b36c90c9a19a74929ce7c95908bb1217/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/cfcc14a8ecd74f8b15b382c671e58e9e45042aa2/
      x86_64 |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/11e9a7c1332a5068b53939b0a02ed78fd225f4a6/
         arm |                    mpd-0.19.16 | NOK | http://autobuild.buildroot.net/results/38e00ccc948f800e390b7ca9a0f45d82c0b41096/
        m68k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/cfc6ad13c7b4fb080ee89ba4acb420ebb38373ea/
        m68k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e48db9dc487547f4d6f6102b4bd2512e0281018a/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/109bae69cc5f596ac6a50ceb60038967e911744b/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/c87bf17c03189c344a9051a047f31a85cf12afea/
        i686 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/e06f0e6edd5d8013ff5e12e2b7253e99a1d1fa2e/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/0d30535b485b52de106bef918cf8abf65d96d86e/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/7a58ea19c81cf28826a3a99da49a1b403a5d0d55/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/513acc9d6ac51605bafe61e79d67ac7e6c4281f4/
     powerpc |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/0a822a4a0945789f926d37e80919b277c82f314f/
         arm |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/d8594f39104a5108d9b33ba6b2025812c89c5b24/
         arm |       python-itsdangerous-0.24 | NOK | http://autobuild.buildroot.net/results/a4d836ab3a0b571b6eab232dc66b5b6ff238d440/
      x86_64 |       python-itsdangerous-0.24 | NOK | http://autobuild.buildroot.net/results/596f5d6eee03ce94adaca34a6f5b61aed7f929ce/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/c9f92a9fb6c40139165fd3a776fe8457e03d3f88/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/4412f5140149c586a90062c36d50269d330e3c14/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/2f048dbf7d7f7815e4cd7b075068ebabb405a3cb/
      xtensa |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/e83c8047223cdc2ae98c79943b9518df2c565f86/
     sparc64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/63bf15441876a97e107f543f72d7b059fb7aaeea/
         arc |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/f85c6b3eb6eccdd2d92bb326b8281282b3be6680/
        mips |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/d33206f9872f2882457ee7dad5e95570350c1d5b/
        i686 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/fc01671a79fd98b3466b68319250ec3753ae34a4/
     powerpc |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/a95bf6d8a61e48a2e4c5272a490b3a8c4ab58505/
        i686 |         python-pyinotify-0.9.6 | NOK | http://autobuild.buildroot.net/results/35f4c094a3d58b95ed990b57d91dd75f63245cc6/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/560554449675f1b00ac51af63f38e49b55f22ae3/
      xtensa | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/7f79dc0e3910f4c7441bcd346accc5df9eb91425/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/b81f68cbf6a1be7e65a43ff45ca243f166e349f4/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/b8297793041d33924b22e7143c92eb5d2898d810/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/629a2616a120cd0993b2079b26bf9edd6e14b40e/
      xtensa |                        sl-5.02 | NOK | http://autobuild.buildroot.net/results/22e78cfb88f2fc6f6f8b7a0afafbb5eb101bb982/
        i686 | snowball-init-b064be21de257... | NOK | http://autobuild.buildroot.net/results/fba69e25de9463282094bcd9b18b63ba6de0a892/
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/3e26462743269001510ac8a072cd61c86f2a63b3/
        i686 |         targetcli-fb-v2.1.fb41 | NOK | http://autobuild.buildroot.net/results/780119a768bf5ef2a5621da2d0efd1b4d8f16fe7/
         arm |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/79923f099bf0f2e88ccbb7fc2d3d92a85c167057/
     powerpc |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/ae648f40e0f51628000b2d2297759c5fdf1b4d16/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/dad1b898453b20c79bb908fd0f5d6207bbc2ce54/
      mipsel |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/7f62d759c6bf23a1664e861001dfc8b5ba283e49/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/d07790d5403975af95e559e503ad830ff80c588f/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/05ebc94267d38f7d92be940b75bba60887eb5867/
         arm |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/79a56120f65044f7556622a447958b664e2a742d/


-- 
http://autobuild.buildroot.net
