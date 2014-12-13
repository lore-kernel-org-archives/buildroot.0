From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-12
Message-ID: <20141213073016.E86261014AA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-12
===============================

        success : 265
       failures : 651
       timeouts : 0  
          TOTAL : 916

Classification of failures by reason
====================================

             berkeleydb-5.3.28 | 308
                  nettle-2.7.1 | 167
                   opkg-v0.2.2 | 27
                     nmap-6.47 | 14
                   mono-3.10.0 | 12
               xfsprogs-3.1.11 | 9 
           libusb-compat-0.1.5 | 9 
                blktrace-1.1.0 | 8 
                     gpsd-3.11 | 7 
                  guile-2.0.11 | 7 
           libmemcached-1.0.18 | 7 
                    liblo-0.26 | 7 
               boa-0.94.14rc21 | 6 
                     gdb-7.7.1 | 5 
             libxmlrpc-1.25.26 | 5 
                pinentry-0.9.0 | 4 
                collectd-5.4.1 | 4 
                gptfdisk-0.8.6 | 4 
                   ncurses-5.9 | 3 
                libtirpc-0.2.4 | 3 
               w_scan-20141122 | 2 
                  thrift-0.9.2 | 2 
             armadillo-4.000.4 | 2 
             bluez5_utils-5.25 | 2 
  toolchain-external-undefined | 2 
                      qt-4.8.6 | 2 
                  sispmctl-3.1 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                     faad2-2.7 | 1 
                    ptpd-1.1.0 | 1 
                libupnpp-0.8.6 | 1 
                  perl-gd-2.53 | 1 
                    strace-4.9 | 1 
              jpeg-turbo-1.3.1 | 1 
             fxload-2008_10_13 | 1 
      host-libusb-compat-0.1.5 | 1 
             ebtables-2.0.10-4 | 1 
                 python3-3.4.1 | 1 
                 libssh2-1.4.3 | 1 
              libarchive-3.1.2 | 1 
                    php-5.5.19 | 1 
              host-mono-3.10.0 | 1 
                     rpm-5.2.0 | 1 
               libcap-ng-0.7.4 | 1 
              host-swig-2.0.12 | 1 
                 haserl-0.9.33 | 1 
                    vde2-2.3.2 | 1 

Detail of failures
===================

     powerpc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e9b2572c997a1f0fd9b72c3488f754a83fffc62a/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/fcaa48dd5e32c9268d90aac4b76cd6f9905422e7/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/761a6ee9fff3299a1920ec37a88e0200169b3cc4/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6a6cc8270ba4a583aef8afb73fa029f1870014b2/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/582411f90584cadbb39d899a8d72aeb6d79e688a/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cacd1c95953e834cd2b90269ee0909ab21b8be21/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3b9d4e3fb1fd30af0c19448966498da2c489048c/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e846651cb84df5ef16e19a39bd276a0fee85db34/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/38171b9721152e7466c9dcb4aba34f1c3b7c6495/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a862968c3bd78e3feac7d905dededc4675bac763/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/26af265d5cda61c19711928639c193813f862fb9/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/758e59f14b1959c166914b9f999baab703cb631a/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8a317100007b650c68d8f8674327a6ee0475b3b4/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/67895f2d553f3a7d09722e60fd1c8b06ec778e81/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/bfa2a817545e80a5053972e66f51bcd96c9423ac/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a001f9410c3b912bc8e0a21a1752f6e80a20b4ab/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2de1c6fa2aaa415ff72cc9f548e758d69c56bf71/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fdfc3c4dbaa028db00473543635fd631abb6987b/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e52e5f3cf510387199425400ba734bcb344ab0b0/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/860ac7b236966f47000efde14cacb48f2936ec69/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/50b509db07c566e2e6e9c0aca1f985839a8c6310/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/dd0837c7236464b7305dd54d04c62ef8e4c197a0/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/63f783b49d833bb3c20f0e346b9a22aa5b4974d8/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/81f399a01a876076acfe7103865b5b6d9b303cf4/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/876d1c28b7b77711c100e9c33d37bb67a4ca1c8c/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6a495889239404a3140bdb11a58e1ea54d10f43d/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8a940d0d3938607d7ffd7c9bcff7f8eb12631f5d/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3df358eae37c6bae17e7e7cbba13bfbc7068a56f/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/36c07e3422d4c23eff83fbd2ff45f6b9227dd51d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d9fdc61ed1b41a6e234bdcc5a4c3b45bac9fb766/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6e63f953e7c8d8ee2a954932ee123bfc903c1126/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ac62a96ec90bd6803dd0ff034a029c19d7b59a0a/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f65f6996effcd1afef8dcdb7a3406ca34bad9b00/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c79dbd14ff612203245b49c3c19e644b9b6b233e/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0510e1edba90da85e08cf226b53668c64c1e3f7d/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7a1a48952969e819bce82bb5e8fa6e23ed42bcc4/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eefa255e910864eae961d6ae9248641dee7f848e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f3955f49b2d27d3c93ff77af73a85e51d7bf39c4/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6e443a71985a8cfde706a065d72245edc958b444/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f68bc1d06c938273cfa02d319c85951287bba7ee/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e73e8ad7bc731a7b24800378c1a5bc876d44a71a/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8932f14cdfb3d9c843bbc76826cb70b9fdf58240/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/360ff505d929e4062ab7b132ccf26301357d90c1/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ced317851d34793d46defb97598dd0f680951344/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/30f9b68bdb78ccf874520fa37a942c35a5b0d46f/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4d4bc1a80b5022ead7de4d401b0ed0d0145791ce/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1d86c1a9d5b0506b1149aacc8ae5d8104fef7962/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/000e82aa31c7eb44d2062dc79af55026597724ba/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b4bb6d52ec66e28e3ce3ec310f4628d8864dfca9/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/50c85c746beee55d6d74508da889ed0397958f84/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/244a8330bd3cc43b7ec979a938f7e767930d23d7/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a052359788ec0bea0003d5f840ac6da6a1de94df/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b37742abbc3da19e52a64f7b727155c49a69eeb1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/79b705a8b2b6399dad938b20464254f1929a4669/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/21dc85b159b2ced70ccc21a164438c3305e7ea94/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d2c0abef1ab757c591acc2389e08a1f9d0bfdeef/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/683e276c3ce922c3357dfc76e16729d13944a79f/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8e74e5cd6c5c59c39318dd9764b735bcd1933bd0/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fd74313c19c4fb8491f6f6c314234537743ca5e0/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/da826c2f5da3593e9921f9a2fc31596a76ca92ba/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/697198faba6ccaf7c6058c30a68161bc52999002/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/aa54392bf34bfdc995d36500afd384e15601e6ba/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2709b7bdda4376874fb77ca94b8188b8b38616be/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c81d09b26adc28544fb0dd6cc9df19a448d76918/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c7a02711da3ba5bc1b6e34c097ee3db6f08ba8d6/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/abe7808d7ef6cf4ffb6e9f15c47fb559e1c710d8/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a48650d781c2c22a56194050cb44fd1166a41006/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2049adea9f72e25c0d4786bf8357d1b022a83ea1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3a37a42bc4e2a3b391605c52a9285b2c019a8837/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/880486f9382884bcb6f4e2c396a03a44eeaf2d07/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/21e71a38be3a431064e9fa9bee5620bd93e8f0d4/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/004150400d268c5662a315d65e5dcf3e8f3789d4/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2ebf2b0343b7a89b2bcac654625981dc9d6f3f30/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/97553d37370c87b601817bbbf20e68656d444401/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fbda72fa5e3986604cbeb17c3ecec95499637ee9/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/922771b8dbfd4db0aeb7a817517e4432ef3d908a/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8d19c71d4b99bdfa84a6c2f9ca5445a455e1e628/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4875b707b937b483dbd30ae873382fbfa2421673/
        bfin |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eb63317ecf9b110895716ff743726226ebf1ffe9/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f3686710f571ade10e249e02f30eee202373e647/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1fb91c56122a2a16714471061d7507004602e439/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f8c5cfdbf0e168d0e6ee02e98e7713add047e87f/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/03db9f41d8b39ebdea93852c4809614bed4aa6c1/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/22a5777649e8b7f5926f03fcfa93117014593638/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/670155eafc9a3efadbc442998e313a76660ac7a4/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7821a0e659eb67674b9957935d17a01b9950bf72/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/18c123f69053cfae32785f5b137aac8ba43e957e/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/91c9a04b95dac85bd5cf26c629842ee35a5bed02/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/385e979cf782221f457355df1dbacc2828f75bbc/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0efa4e048f731a9afd519e59723c5ba21f56b02b/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/09d8926a5654be42d4e35d4bc58e91ec8e421efd/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1ac96f9a6b8f33fe9aee7eb4b610f559582ac85a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9f763d1a8f70437d84eede5265a1a102989af3c9/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7aefb597748a3399ea9a237e1efcf3d43ca021b3/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3c7f38adc31edea183594b1b9c930e519c9d114b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/97db0cfd0a71c74413c7cc876617740557d1f48b/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9eee132814b41e9a32bee53e6742b0df1fe658de/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/90bbb9ea66c503d28ac22e90d806d4a46c1ee261/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8e48b1b0b65845689a493029c46f8cf839dbb24b/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/84129ddde80dd08e1de6c59c2d47c3231f811394/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ef921744cfecb3edc75acf8024c19875a9af6bfc/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7abdb169d80aadc3523c98fde782549898727ace/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c289d7e659e7680bac9ffe6886a2fcfe821ae4b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d4fdfb965cf431cab54e71b2205609859488b16d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/20c06753c196160f1683fde579edea4b2b85aa1f/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b97ab029f4ba067ef388f3b6fe40c5e1a927588d/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f99386e2a18a73c7f2a3afbbae54693033e23f66/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d4e7ec47697fea3b508c75c8cdce444a9bd90c0f/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1e5b74fafafd6a9a6665fb24e01aa6cbe6c37007/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/05fa6ff9efe7dbccd8a6d9c94640883df2d4525a/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cd4eba7371a84e48a3e020989a4ef58b2c0b8a66/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/010b3a0391f6e1d66b554bc8db255dc7989c1b4a/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8e3d443143672c21ede121b80df8e95e551295d7/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f5e1f21c46e5bba76c7d50f8b771e5552a90cef0/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/38ff2d9a60f9f9d1258faee4080036199fa6239a/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/789ccf4bd95038f65cc562c6afd76cef5d437301/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5d2efaa6c9210682663eea2ac42c3b5eeb89c170/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2e65ab1b04053b07dd4db1f0d420a941d5d43cc8/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1d601badd883eee5352d2b66d575ab60638f3eaf/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2a7760162ae4da54c61052b5f739536afbc1df91/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/444d0250524a7c090959ee771edbe63f32d975ea/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/84e0070545293c70713eeea5de3687708d7232f9/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f352e04c0b20e18a198b027000b1abf28777ed99/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6fc542fb4fc374041603ec9f6d5d764a98b065bc/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/95222acd70e6a9d19fa13f630fbe798376b6fa8f/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/32874ed2b030d4e9de8ee64f8359abc1c1f538d8/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3ea2da9dba7f4a3e55569c2f119de8359997ff14/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b6c37a969e8ce02a869092c6d67470784cbef79d/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/679c6803264fa4e1690cfde544cb660228335ba4/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cf20b7a4123b882a6648740f934e70787b229061/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e8c0559f90ea8b9e64c5d03eea7349d6b0519799/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c4bf4b3e7e828ce9f7a2eac8c6009bda9561ed95/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c92e2455f757589f08eccb9b4908bbae4be6db6e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/db208336ced24dfd81bad4ae9546a24f717af104/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c73d266af96d436c9d2a646cfcfe6930855c9203/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f57df766099b5d4675c88bfda29a75bfe76e3faa/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1a8f5cfc377d85c3b2d478425a9ce720453dcc54/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/805638e7050513b1cc4dcea0c30322cdbdde99fc/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9afa0dd835af079411a2ea5d94e5e4db7c993111/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/925433ef505b190aa5ac83c23e9359afe4b21829/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b41e13ec6c13830667770b3731f8990062f202bd/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9607d350cbbf165ed92a293093c181bf766b29f2/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4946763f04e6084c79097b7921387b6d6a647fc9/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e9ef453ca5944499b8d995f7b65398e48fd2a9f0/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5df803c586f022a9310da122c2fa36ab90cd9a60/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/667ec4f6c4984060a10283e626797921f3c47492/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c8b4e3ecc7b143429facdefad634a8657f55bdf/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/50256915afcfac229c1da9512820fbb7818ea75f/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/15ce819d22d654557c2181bec73b5a32bfacc5dc/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1e4bfea17df9bdf3918de619a9bff18cea606798/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4a3ee2db58fa8c630ca5ac5cb2dfc9f580aa59b0/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5b16dde57117eae0c2bc3133922476b9df119f55/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9c4514c436c982bd4078ff02fee67ed174e89e0e/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ba635e38630ee22f8e8ff9319e7477a0adf70fc2/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f1f929eeb7952abc8e8bfd33d00d43623e84eb16/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/335c57d89e2bbfb6409c0860ee50cee2cb863dd3/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b37f18177a0e4e82c266fd6146a7d0719af74f65/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6bfa169391bf20f1f5c24856977b19179a0060e8/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/68b82b687f068c758328aafbcc4e63f9592c185b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6116137e1d5b550b7987a910bb3f1f3d673ffc98/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ff8e431104a0177b94ba4dabc1a5f535af4dff4c/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1bfd9ea361ad72800fa943f28c406441d5d4c3b7/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0778027848c9a6a2f6bcc95786cf595ce14b8ef2/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e7986ed53da2d0dad0ddc41f7e4cddd1c1b96c55/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e97b116a295cfb9441a561a7464c61a1e1ba3cf7/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/73f31ffb7166fc53d13bd4ff7cfd1e3e719cef7c/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/054c901442c85747cde67024501cc0a809a8fbf9/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9f0767fb44630816cf80c1d86f32ad5197bf616c/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c7cd82a370a1cd65f72dbfef36576c1f6deb4f56/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cd887e1e815890ca0c05a51c2be43177e681913e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0c11f5e91d0c4ed3190ef0e4096722f983f713ff/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8a2a3286ec6b528666c84cc4690717e190fc02fe/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/10d22931b8a56bb7c20e2370f9fee8126d7d7892/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fa5a349fd24ad7d7f48fcf9ca45986cedb583a10/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ef86e0481d2722280c0d16b0656a1c28570273e7/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7e8efef6fb22daecdf8f3e691fb776da09473972/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8a127d6a7d10e43d0098ffe11e6f6049fa03d8b6/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eb3d16b43ef6bff082452e5cadeeeb5fa2de16fe/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7e2a2895e67a097e61e066db9b5e0822cb8c7209/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/308ff51fdba316d664515751318ca53b732fffcc/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6227ca3bf72f4d3fa0557fb28d2c9a3b301be61d/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6da734e3d5e5a257af2a6d1b67e35b0a03edf227/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/43c7fe5f9ac9b0ffccf255b6827b479ac5248c6c/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7cf6bb81c56252f61a1156fca3e7403fd593f2cf/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/86f6d202047ef7fd6f09fc3aace2e182b787ce1c/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2037f8d303f89a0e01eb4a2199bd4d3fef2d5477/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9d0c90a5937adfb85f24239831ad7bdcaf69fce3/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b349771ee2a6b81942d830a04e5ed31f26ba83af/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2dc1573b9fc3cefa2613775b9e014e998509c99f/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/de64fd0e8b40a858aa7ccf62255711c11c397a7b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7dcbfe707c554ca1185175ff5720cfb8ee0953ff/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0a9947c0515df4e0d9f99ce816dc2d027d065ad3/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4f89dee08fbeb20e6bc6fdbe654dcfaae77c2d7d/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/661f56d6e400a821bc024abeb7bf0cbe74d44b4b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4ffa98745b7a5bd397157d00a06dcd2188a5673e/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/38dcfeba8464aaa3c1275173e2bf44234f1802a2/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/53e0cf5db530b69a1c48412ab32c8d56ff16c2ef/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e63c69f27901a7e37ace54de9b7b036bfe77c25b/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f99a6886d086c884a4fd2899c453a550d483f0f8/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/befa2e4c1fc5bd355696020c8f9677629960cb5e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0c107e5979c82ec173856cede2ac59b13aaa21e2/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5414c72ea431f463762c49cf780aff36adfdb00f/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f8715281a8d5333415758992094073e4baf5374a/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a0f1704e1733ad2a380bd47e3925d8f4a6ef3188/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/729344e505a52aaae2b1ac37aaa0864bebe5bace/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/08eebc1548f4d37cfe24b95f45f214cb5ff5ef46/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/117b36a780d7b64d9e6eb1f8e6569392c013645f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a44eabd2940566ab456e30edace665455d5b76a6/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/158ad017318faacf33781009d3edd7db6ef53c36/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1a8596b16a2582df7e16570d1025c053d02a4b50/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1af8bd811b23f0971ca445e1be54de932e504fa0/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c770fb18ed96ddc000d445ba930c59f62ee63e6/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b35a72789cef32e0ad642ad9240127061490c937/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b4a30b55467d737c50e3415760adea2a9ce3853e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/69a3055b38a6f4bf939cc3d795982b190722189c/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/68c8d6ab45381a77f3e75cac7c01a52120793020/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/94bbe5c8e8b9575e2b1228cb331d38be8f35e200/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/80faa8deed2d415ecd4028f69ea4ffb390309d49/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7d2e39ee0b52c908b7ac164fff8980a15ce59d98/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/37112943831017b2e3f5cfeca79f3aadbd7eb674/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8ab9c0270e6cf24dffeed960da1216af2ae4dd36/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1f3748f3ccc4d8c363be98999a1a38c93d39dcfb/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eca1a094aa0f6a294a65b3a07596f67a3f6fd86b/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/368c631fc22f2d0c7f36484c709ab5faa22f421d/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/873748fd3fcd3fb75dd6c07f306dd333c26f1362/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c68066341644b8261e12dbc7e718e0f45940d3fa/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/96457237bca5ae9a52801cc54fc5046fe0d7dc92/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/eeddb94ca0e909d0b5f896aa0cbb912b6f8ce047/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/54032437d1570b2e2d13aeb9eabeec09e42ab345/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c065c531ae893356d5f40f97e6fd2ceac3d1be3a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2209a271c757565dd97d4ee60b5c80ab9e25ed80/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4fe7dc1ac4fd54a2b321b5ce08f20a7bdc7a9e1a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9a25a0ee8f24d6e34175e9b8c89e42e0a4f36685/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/79f2dc7ad63e8c1c3eaad24bc377c1b0eddd3d29/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/072fd8d1ad953e3c4076aa032c8d72bd73f537a3/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e5044bf6acdc1ef1ee175cd29bddef47708b29a0/
        bfin |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6df013a447eca86096d2e61d52da45860feb94dd/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/663d9c99879bf1ff3fd0781d6bd65fd5013e4592/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4bc3477e8eca0f692d0705e70842c7c2f87f6291/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/93e8ff6b14bc30eedd1cc25f231bedab2c043ccb/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1b0cb733877b311374fe10dee80df1e8555464e8/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8ce2ceb99c99199d1649354201ad5932a1243f8d/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/91a70ac7cab6961251edd56e35a959c6abc2e3a5/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4ab8e7270783ec5804b3fcd2d10fbe3cfd7270e9/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d4eab6abf949c16a249c89b8e4d82c05702c921d/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/bce817bd09cbde1b6189b6163b783fc776ca134b/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/639e223c404843f76afc10e0043d5966a39a0b50/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ff525b6702011116a68b2796db8e7cc8b44e7b3e/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9f5ced70f199a7b001fbde141f4a9e719603fedf/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3a209aa42e5ece122b2b61e07e8c70077056026a/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c3cd9ec0c741822ccf73b3d4e5adf587d4c75ae/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/21c5c689d1c507c9f14081d2c9daa01fdf475228/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ec11e978d0dc7e10137fdfbef75ee267c5af7bcb/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/75777a82fd620a5425d8ef12696c7dd2ca061d28/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/443380c85d730aa8e6e24e4756888b00697a467e/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/93ff4e1538b3b86fae272705e4ca616e9c59cea5/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cbd8f180fe055821cc87b1265baa164f950fe96c/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/072a24fea552bda48c41b7aee3c288fd911fdd10/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c1fd9955fe4f3f626630b36e9641ce435856be02/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fa735205abab388db503c678a838344d805e153b/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2bd6fd2f95a8832b5bbb43b52b03a99b773b1bce/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fab68e4b17ef5931209536829517adab0e1186f5/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/33f680771cb163e5334f00b6884afead93a231aa/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f67ddcbc5fae731cecbad3b8d8d782739f6a032e/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fefc2cc35e8c7b65a002861d5aa94d41bc9b66a1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/49186313514b5ad488aa353d069848f9dd6983d2/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2f87a295e136c0467a51a24cb83c11506dff61be/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e7de3245fa74768e13ad02f5427a8ee7e0cb1b71/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b3f9dadd9ef6980e7bb106c271cd7de4bd9909e5/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/94db33729ea1d8be29947b3cfe58ed52866bb53e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/033f3d1f769fcda0f5d9a7129b3b4152fcb25f17/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c71930d6fb77751928860a39f90c6ae154f679e5/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d96a4236bef035c3a78cc2fb0c29618b85b9896f/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/99545f8b5c9c22941cf265b1d9863ac59e5dd266/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/48ae46b870e6618fd3f3f011b673225af78e1114/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8569c1fd56e06575200b607c0876b32d4e82cbcf/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/42b8a706fc85654e092b061f8f9b09566643292f/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cd5d380ce2532df6d1826234806108e08ad8d2ab/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9a77356e6d2eb91ccfb60e9f66ffb6e254c92335/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/44236681426eb81f627fa6aa733ca6e2910f8093/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/be2e092936df403b351411881751a8979d3ba485/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/db9aaf1c3d062141635cb86693c3349412632754/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3648c3eb952ae2579bb71280897e61c8f98ed1ad/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2ba9615053d55dcbb685370df5fc3b6a6d4fc5f5/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cc11e58f0a7336a80dc1d9dffa7d751ed474e037/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3d4ef56ad42b210465bc0cc209252c8fd423440c/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9e712fc636a27c405c79b59027e7b5602415975b/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0ff548e9da8476746057eccd24a901e72804d59e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cae0091c9e7fba00aca741512f09b8d658ccebdb/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/00d30b466dad7641951167e66e55e728e0daca1b/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8817a9993fa7a9386c41f4d810a8922827463eab/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e39c0ec75349cbb68582ab599a61a3926b288b6c/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0cb3d54e0d5c698a317f3bd8513ef24858166499/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/41149f3bfb1860a366f8604cef6d889e41711ce9/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/60d4f4fe0eafd32e5ab7e1cf135a03e86534f217/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/78db6921d2c7f14f778377e21ddad139a72f7ea9/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ed6f4aa9db5b39401000a51a8cf34b25fe16c0aa/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/67342d4a5ebd260ce56bfd2b1677e509f0f29ef8/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/148d5423c10e5c9bc0982fd70304eb122c409879/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f71644eba761e57b3bc33723fd1274f8e25b9cac/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b67e5171b77cb60c09190fd3d579a4cbb3be0c4f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/872a322108d6f824834a307224553566ff886022/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/540924c2d9108ce84251fac5e5f79ad9458ccf1a/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ec6212586be010202f256350a69df7e96bc54709/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9f9091974d11a6a36dd6cbfc03ba4811246f1704/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d687ccee77d27c8ea041630e811889b2e139debc/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7397c3fc4207315bacf275fd310e3fe6540e0b17/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/05ea508d4e96d8355421ab5fc38f53982bd9e0fb/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0dda1a9024e6dcb98531eed9d9a50decf1b8d8ca/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2dd9caac59210d8e8e0856da5679368a6a4fa3f5/
      x86_64 |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/2c0c24fd3baf6d475ace9487506bea360cb908a4/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e1f441ea562c29dccdc74db7bb1a9fd12b1bc396/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/6d7e3dede72b1028217dba74c1025059a4215751/
      x86_64 |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f9e61c555993de57b66f480c8c6eca4ff7870751/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a1c5df4686f6b612d2e96e06a2aa65adcaf6dd95/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7185c8f6741f4c57f6ee473ae3a3fefeaa178605/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9166be18199700cee76c73187207fe024b57f358/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d66d6e0651d1070e259c58a214f678a8ff47e0c3/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/b3498a87ce9ea9449e38ed247865c9f387cf1c0e/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/be881e0c48aa68ad7867dbaff3be0236fdea1df6/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2510c72f9c6677d1bff73ffe4eb81707be1c002f/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e2f17a77d4c1a632669a70e57ba141d279655d86/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2eed41e6326217f0b3f182f786283b9818bb6cea/
        sh4a |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/1571e20da2e062df8b735233f299ef40dff89b8a/
      x86_64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/ad6e69eb2e3b77fe8766bba0f543fdace225b1b0/
    mips64el |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/1874a225f100735db91eaa96aeb2e67b94c1f7d3/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/ec5a7fabcb19897516ceee89b97e434fda66dd34/
     powerpc |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/96735bfa91bcf2e3dff89f69c0a12ed406e9efb9/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/49e94e171f0d3e1a7571af89e6645d9c087d3349/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/ad408aef5fb92fe9e031c7dbaf6999776b40ace4/
    mips64el |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/3c6b15a3d7ba84b7b3c257089569e2f615ec81b2/
microblazeel |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/30974c0ade82fbdae319e3a004e521ab5db64de8/
        i686 |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/0fb29c31ec975a2c1129487480bd622485e2fa1a/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a3135d3aed73ece0885708290efb9c670668dfd1/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/018b442be669543b1c3e3ccbc61c9c30ca73c968/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/404e61e5c30040ee5756f4b5839149dca38660d4/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/93c3e9bf0803a0419e7edd94d767a9b9133cd471/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/67e3117eefc26de099f7345178a3314e5fd0e268/
         arc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/28e9e9ce7900418cc473ea6644f179ae1e432950/
      mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/584927bc7ec61a0e0ffd2d29450f85ac0772a464/
      mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/5c7d1d558032199de22fbe9af58a4a42ce67bf68/
     powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/8d3227f999b47e0d8468b00f5ad29214611334ed/
         arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/78d263ed0bbc456b6b93782b6adf587245260251/
      x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/cef7d1bb3abb1e49defe17e8af58271f30d81c45/
    mips64el |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/7b9f2a6a9000ef05752d909fe7b467ef9bf19b8f/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/9637502cbb68741e58e98e9fa25d1c8252aaca07/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/d4fdf44b80d676d4fdc565491e16dfac1b322bf8/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/bf4a0794e760c424aca01d5ec5583c73e148d172/
     powerpc |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/80f26b4a2f933dbf769e511ee4a78065537b3914/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1c42af145ca955e9859572881616899c439aacf8/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f5b957fb1a899725bb022e54122b21951e2998e1/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ae8d5b5c9f854c3aacca4c54670140b8b2585e98/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ffa262180e2bea9ecb2e2be0d1386c95f3510745/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c6867f15e0350beaf58b79afe10aae27ff65cf30/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d23e2e3b4f3a93519307dc9ad5110a3f927882bf/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d07f7785ba96ed83f5f9402b240066b826dc13a3/
        i686 |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/a75ee9c9d09ca0da550de84b8220821d92f9e132/
         arm |       host-libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/7e94db92a06ca9a46765c0420660d934ecce17b0/
         arm |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/b481cdd067882996e8cb93843adbd641c294047a/
         arm |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/b3017b8a0a9e464076cc49f08aa0894f68b29809/
        i686 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/c41f5571b58f77573d1d462dfe91890a4bf0f6c8/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/413570981ab37afbbd08ff1462eb77821d50b970/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3326d6a28b96d6ce4c9cd16adb9c170e5713bfae/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/d6c61d1a636dab5254f0d99dffbb2107ec358bba/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/b6794514280601ef01cd3c3605b1048144329077/
      mipsel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/1cbc0ab07f9e2783a7e4ed4ae27d650bdf2130b4/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/5632c377742c67fad6aea466bc4c922c2bcf1566/
        i486 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/8fe3d6ebcbe6fde3f899d9a73bd68f483ee1f380/
      mipsel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/933b78e5f611ba54c73aade8d950582badf4b611/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/5dd94dfb9d9572c3e2cd0a0465b4aee356423aaa/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0a3f54e7823be340b2f1d32dca2b1d4c4291b6d4/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/40d5f51876a1726ca902720a1eac2cae99fa4645/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b6f994eb485a05f551b62b86bc5d42431920592f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/e188f4bb604b3c7a0ad3cdca3ec044096fe8201d/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6d9ef120fd27b08440d076dac5abd35e3fc6d676/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/47e2e7e2365d11a5ea2a7d1405992247be7ad040/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/95bea39e356f9a30835ee28265311dbc88883d6c/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/ed08263bc65c1c5755fb47ab80af0036e58673f7/
     aarch64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5851ea7040fe06dc1e3834921cab32db31b2ba48/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/acc086e04da324621c715962585dbdd80e04b74e/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ca084460c06f5b69ad35080cd347554a2c53f2a8/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/ec28b1e2724cd4e6a567dd67b4672f67c2a766ec/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/e2bfa161f43abeedd5370f7570d104c62812e893/
        i686 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/03a476c123fa9bf823d4d29f9038b3549541f5b6/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/9e25022d94c01571e093a5e25f10fa7776b84b54/
     aarch64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/32ed6e45a0f15659d6b4ea02b7beeb0a76bf6c89/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/37b5ef3b25dbc276e9f78319fd27fb7252f3c412/
      mipsel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/874c7c3ee38eb34264d32d129ffbd14bae5e15d2/
      mipsel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/57c8a82fddd06aed71fae6d06b7aaf08ee631ac7/
        i686 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/6aab9498024b923aa7e6ad699da83bc3ac2d2e12/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/5d93b52d69a013d7be9db2dffa53d2455c7afe01/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/ff4b521807717df2417c78eab338817e4d77c129/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/037330399e4bb90adcfe3a99548fa260e8ad34d1/
microblazeel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/7288af1e1b792ae7a875f46cdb789151c3651d7d/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/dc58eddb0df7c721a0121b90d81d23ccfbbc220e/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f978b0e03a94fd259726eeaadb7cff9cb22c2d7a/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/e739d64011fb6a24ccbef136d75944f3bd2eba03/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/7ebe6909da859507639f57da2d4fee46efc062d4/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/03c2243080b026b0c6f4bb64e7dc8dc359f0c8c2/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/406bf830ae84cf9ce4afd5a4ddc265197df42b44/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/894a3e0627244b5e1980c3840629b4627999d252/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/2dad2609834564060dc090919c128b45e289102e/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/46de32cbe68b614763a72303490515f80cfe5bfd/
        i686 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/b167d2660ca37b896ceb8f1372d88eda6d6397d7/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/17b6aee3d0aaf425412f9f5d89de665de9efedb8/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/af9e5203299819085441fb6ee27e027d58f220b3/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/138e5bd9bd0e2ad6de13278b446d1a48a9b64b17/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/b77d52aaa5face5d5b8afe39f9a32a51b1df500f/
    mips64el |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/8c0b6c6180f3ecf19e432f32b59fef7e8ffac671/
     powerpc |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/dfa9a41381e0f322e62ec99e40704d1264be1635/
     powerpc |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/9f8ecf6341e5c365ddcf853d6fa938d92b31230b/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9520b9f37c11b8579f3588a7c490af2cdcb46210/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/fcda99ae393068efe6bd25051d19592bc9692476/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f9aa025b94826969e4dfc593bc724e3065c20872/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b8ad15b84164641b8c1089820e5c16c5fd628397/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4b3c3e9c31fd477d405e0986487498bb0f5b51f8/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/083843743efb2d3957594888f6b56cab12b13b49/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ad7b61ab69689389b343f48d797a04d22e48519c/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/25182813eba5095943db30859cb612d9158390c3/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3ecd6d56fd5e6d9772e0b8ccb04d2901edc12528/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6e0c9e91ae07c063b595a7fcb3cfa11c7191bc62/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b619e58e9bd209f7f3fbf48b2d4098074aa54415/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a60ac710e527e193242555e5c0739334198844bc/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/66889e182703a4d10d85a0822bbde1f2648d1998/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ca25c23ed13f1a39459b33d0f4900f40eefa7c91/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/17f3aa9330c14744c734d16024a68c6ac9923085/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ec9ed0d027124470e27f78b200c796526842a890/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3b5d6300f07e3170de6e917b4159d1b59eebb91/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2d591092a9b90c9aefd346634b7116011333c0cb/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a7d4c35fdd0fc79cf774f12599fa7a1e3a0a7d79/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/14868a667e051447a866386106ea0b94bc88dc11/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4b922159eaced8559da5311ce9c0d72e54abaa1d/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/57eed9103bcb9075175ab93cfed5896a7ddc76c2/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a107412153e425c5216d2a3beaea88e2016642e0/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6d271e18fd386a950127eb725e4da30a943be8b9/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b9fe8819c418a3886afbe0764625788dee04a585/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/aaa6cd0e528fe6fbb81c2556772fb4a82f14dc20/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2ebe7e18e591ab81a8f0f41a65fc28ba9a344c54/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b253d4f0bc4a4440e4ac4f6b8e0944b52c6e8bd7/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9c535db45754ef0275f59f568007d887c643a86f/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/60541e8f452e4d9d033ae4874d741801d21be9f8/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e531f281d6fbe348dfce6c403fa8ff990b83c555/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ff22e4551966c4e88098d482b7bbb808eb675375/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d909560c376639f01531ddbcaa9bee157b466052/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a96815b9f612ec6169ad38080b86a30321d5a253/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/23d30a6d30caf04f07009134e68d07999bf00376/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/dba161c80ca4a378bdf153cc41cf11081fe8c3f8/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b50aa96519771843d83a1aebff75e40ed267b8e0/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4bdb8d69998e44d6dbc49e38595bb4f5ee02f3f0/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/240e434187bd009e5b9c698be72ece283c8ebfe4/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d0c3d35806217469fb4ac975bc54c9707a5af0f6/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7cf4d7223c3f6a75ba1d9a289a17836415b1516a/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2aeae7d5cb6a2a2784692681fde4988238faf635/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a28e094c3120887d067f041d27a697f8fdff9568/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/03ed26533a8e730ceed887a1b0899368b8a50475/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3960dd96b67356b60e1bf1e45e8b30874463cd16/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3d447476bc6888ed4cd16fa4df83b9d4308ea4ce/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c56204799f859b1a62be325c29f30e26fb2e836b/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/521d979658e402103f1a18fcfeab3f9705f0c000/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1d4cdab56762436d1852657775720a088bedd0b3/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/eb25c55c927be85be6d8fa3f755a756e16f627ac/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a621bae4ef1892dcfc2386ae43593b19a12889b6/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/faa1031493ed5f40f5529c7c6610d0aa737f2bae/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1d11e700fbfd2b8160b4d1188764204a6a9b57ba/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/41d556c44fc8fdf72a578f7cc6bba612a0e4908d/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/fb6dc4d20504cacc2af15cc303b2a2256a66381f/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8322159f75b7ff1676ebb4fcba23922ea141f020/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7af4b2e36850653a2b10b38140178b2ac1cac4c1/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b59b4d9252b00eba1a9d4795356a9562faab1fa3/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e8abe1ee1fd144f8f381a55a4f747f78aef6a618/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2e0119ff0ffc7cf6d762467bc64461747216f7b3/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e6960eb933981788fb938f15c0558a955659e729/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/18d1a54f7b6287486b9f3c7c234ac2eeea0dce17/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1af208a7cae6a72058db990e233dcf742f3f63a8/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9065f95805052be4b38666a68f9fff6de783daeb/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9d0f1571e804da55d17d0ea1c6788056e2c57929/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/52f1c419d65b8d0240d4ed4bcac06356f77af6f8/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7cfaa54b58f40c14c1b6307418b352dd0fddb2ee/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5837d9228c40f10d8a89ccb8c04ff586b186d581/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/32ddb1e0c9c40a6db9ae95ea60977d597565d8ad/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ccdf0b34840895191cf8ad492bbeaa64cb528bd1/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9ab69d7c32e6b7814f43d1b1fded90f408d2cbca/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/39eb7c0e134d1fc46f05c0c2ec89fc1cba1a9e16/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5ccfb435b43c7a824e39631c2db0de9b3c1ed503/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/01dcc410008456325d647dccb943cc7f5cc0227c/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c33a45d78da43ffd54bbcc4dc6f078ade89efe57/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/eab719bfa59e3c9e3db874a702ee82615d8ef464/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/509875dd0f1514a5b680d9641099cf5da29b8174/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/159b6366f2d3265563bdb4dcfcc1fb22c3dff68d/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f179b13e698cbdfe7239dd7f7206fe82c1635486/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7c189088ea812ae4e8bce38a6183f9399e15aef6/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/326426fff572d5cfabcd7eae5c2612537694e471/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f54bafaf0e0e7a4f5341aea1fd401af1e708523e/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d497d7d0a85675f9809c89d60e3f84267e579024/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9cf24d361b7481ef4a57269f609b09408d3b57c7/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f495f9ddd24a2cb49dc815780e16278cd51b03ec/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/98e02f266d75853a1163f4c106b5c49d81867bd2/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8543346bd70f8d4cd438ae7eaf8c46455d03d553/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/fa686edbc6f71f4c782769ea1aef119b25b50e93/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/fd9e8af88b1047b7b2b97fec6c7ad706692431f8/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3fc7c3aee05d25d779da07165c44d588e52e311a/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7adc96811382efd8569ef1c2afbbf6502af9bf84/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/48a40251f3e63605653ee859c16b386ac87a1134/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/cf18e7a4d2d705b2f1b2af8d836d9efa0a3ab620/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c06c09a2472933e1e711074c1ed0646a561d16ea/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/93c56c1072250107863c3901bc99ca3811cab0b1/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2e547dd0b497000af970b28996cd72b2edfce5d8/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f22a5335a4d46a9d7eaad0754130c6c1f5b2a09b/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/30079c040f7894223e4b7da473c058737ccd1a49/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/61f4414c7f0906cbd86ad3ef1fd8af32ad8e6e3f/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e3881e718e204e5ac1b2aebb6699a5bae79e6821/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/45a9f3318af71ae104c6c20b1a1fa2451342d6e1/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7c38db340f5ac3dc97eebdfe56a496012e0c34bb/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ac0abf28e6a6d340a15f27bc7b79764a919868c9/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/715e6088c54319d07acb0bb20bc0432cafb2ef78/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5129ec0dd3c8d6618a0d8e8a8a5ad96f50969e78/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7574f64576876f32b1b889411b3418d166232de9/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/dc531a40f62479aa10e96d59ea5941d06b3ac311/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0616d4e3f8837a1967f3fb5e98a8ca88866e4bb8/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4589541fb8674c31ff4b5093063771b844b7bf12/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a036d060a4f6bc772d40327b94ac9a2b37d4abe3/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/826cc3adf2086936ef329db0f2034e9b547ee9e1/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9a35f1856705d81188aa8a7112adf26d0ba3cf5c/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/cf99f0c5aa50926af45d7cf9cf17a810bc75b71f/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/41541ab984071c6e1e0baba7f81ecc54bde242db/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d3d0808b8983e7ceaf227d9d9e78789293e0d846/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b4039979b81e99bb37d4f54d36196011f544f134/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b952ae93484ed1c357ab6f816867352a2deb9e0f/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e549ad88bd83e1992771ee9053fff9647f8bb6e6/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a3ae879ac80df830ed0a965da91f4770c4254ffa/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1f0c103708e06d402981ae61f116791b03ecb25d/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9fec4980c7e4431eec28bddf48afc0244314a474/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b901d1062264077763a0467bad062bb4ae16f69c/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/bf210e08d1eb6b032c4dd8d6f9c9e373a4adc09c/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/51d0138ff39c45603315dcedf1f654c18604e1a8/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4e34baf218f15cdb9bc0ae6f5ea8f87aaa784d93/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/438fe87e39dbdb9ffb9b51ef8caf112d1a78e345/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4f4b885133db036c408945f82df2341fff9b4075/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/99b2587b92db402bd965adfb2d538c9f504f94bc/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/15b544ac532266da8bafad5397107866fe5cda51/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ab851fdfe9c1ba20b30781f986e1a262bab4106a/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/556433203311b6a760ba951d29217af403a94fa6/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/108c327487f38e39e79d42dc7993ed6df75af25f/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/958e873e4e9a23a4e89bbde06a1c2f258e4fb090/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0980ec498f8213fcc983fe4485a7e39fc2cbe519/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d606c7ad6d476bbba80b354c980642491834ec9c/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/079d952a0eb28b49fb24cee585d9bbe4c42bb94f/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/00b0ee736803836d5192bf06d31c288951e1c85d/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/50c771d84bbffa94afba4f835e5bb9476980a581/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e3ecb0be64b0a122712ff19684a06dadf2abfdf5/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/23b1622e302dd0e3b184c410c6000ae58f6bbf01/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d12a675ef4b02fded3fbf0d91783c57e3fdd8b1a/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/cef8787dc075767d018059b29a9114d8716d5b48/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/21afe19b53aa801d4eb3933bcc2bd771bac3fe4d/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6acf505f7a39cc336430fad5ab3de77884189bdf/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/24ab126ea1cb5e8d7ccc92eca49360cecc5b5a38/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/56938ff7f6e04e91b9f614629fc60fbf26c23539/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e93da743c5b84b1bb6274aeee3fe3b52962c560c/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4da4f0dab5e63dd9418a4d76d0208e95b5da55ea/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/814d28b66e07ee907dd16781997cedd840ba980b/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1fcc32771575964f0cdf5743f3cf790f5771f120/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f0d68cf3ff13d59b7902f078f21b11527ecd6110/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/762e7c02bbdc2737309d42b728d8ae2bfa8caed0/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0fd1e1311671f2be8cf538847fe927317d3d504d/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a2b7e4e3f5ded2588c5a5e9c76ad8153bf48416e/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/85fa644b3693ea1179de111407fe214a1e9885db/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/57954c782b7db63cc34247f7a0b73b997235b693/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/97840bcff34a152dd3e3c2c0193089f0e9820fd3/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b99579f7989990bd6cec1125675ed38a20c78bb4/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/31555dbdd5ed7a66ba4d6de1b419831361071746/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/308a240e257a790df1d0355ba45bef0e7fd1747a/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/af1148c54f866530a28912bff21512274a8b2b33/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/05fffc3c6415922035c1b73cc723cabb844388fc/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b9d101a11e8cbf238b61ea0fb98049ce498e2589/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e4827deb340142ece758d6c0d6fd081e7b6a07da/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/eea67fc2439b5c3dc9e3c972a2ea656146db3259/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/51355412b41e1b9d20119a889eaad6d8ae2a0513/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2f7c241ee21a61c42ed81cc4135d4be94ecb922c/
      xtensa |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/eb3d95abfb90eaab299821fb4b3e471eadf5d6d6/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/974350435e31e5913c8ccfaa158227ada7ce6e7d/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/b2365d600bf4ee8abcc81a02309186941e077770/
        sh4a |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/0444fb8829f16d34e8550d78c1b1f57a43ae1bf4/
        sh4a |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/1ffd8141a8610f3bdb2e3804e79e3c52d706a2a1/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/a0ef312eae84ebfdb8320fa7b95d3edfa402a790/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/b6761bd06c69b7ec3d5b7a62d6e18083f74f3c32/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/248ad44992ea33bdf0bfe5071d19bd96a9775fbb/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/4a62a1426f481fd24f5f4268472194eb793a7c19/
      xtensa |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/c855a173411b0c4d513bce8ee77fbe65b1c41898/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/8ebd3d22b4f3b39f0b7452d72195cda9b346e8ca/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/fa242848689887c4743b37c0eb05fc1ff7c31c42/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/cd9062638c8c3894147f91ba21e96e869416788c/
      mipsel |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/e42e58d39d404b20a37319baad02434282b8a843/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/f09d5e6b8f0f05bece6a899c5b6aaeb58b1d0cec/
      xtensa |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/22235cb23d57c588c626046e690175deb8cdf847/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/0776cff93039a97b0a2dadd68fcfcac4c72bce5b/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/110f454fdc5cfe4488195ca6140667212d77520e/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/7803ebf1cf0727609d8242d9815244e99e6d6da9/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2c8a6feea92e913879d2e567134ebd9cab702c5a/
microblazeel |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/32f2eaad4366c3e7fdda90110d7431a3fdfba334/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/eb9fad856f6552c6fbe1498ae7718a00ae941873/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/da17edb6c39054c46ef7d2777f0f44a80cd1b9d6/
     aarch64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/61b43218e6fbd3cd79b0b450c72929703f4f9ca5/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/99b14f4dfabf02fbaf8e069d90e36dadcb2b9f20/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/15cc0d0adb4dba1fcadf18f7f2f0fd82c5e05f76/
       nios2 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/b1e5f66dfc3dce1ecd74d180a810a01430665ca4/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/bb958cca36a16b2623f58fb4d15e787df7f6b197/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/23054b905865ac25abe87814b6e49befa9406e63/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/3724eaa7290ede135767e449ce0a1352e5299d04/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/7c6d38cc89af908ee40f6f6818b4237791c0ab83/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/8645bfaa3a83aeaa70c8da06557c64500ff5af20/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/e9f5f1d2161b50499753fefe29e14763f35297c3/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2d9084a45df28cc3f6fce524b85de1352d4af95a/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/4e97ca938ab6dec60b05d28d21daed084a42fed3/
        sh4a |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/592e555d42e5d24d228631bebf49a4c821dd0515/
        i686 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/803d2b5c11e332edcb732dfc9543cb447cf869b6/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2dd5aea2b158014c972dd2254358df77f3ccefdb/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/92285735f059fdf3840cd87f6f842279fbeb122c/
        i686 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2f566fc13d34f9611b7eea946c80e030ccf758e1/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/0106a071a882fc32fb29c60c5a82f40785c5f744/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/d5d47f7c71848566a7eb9c8306c5003979c08159/
        bfin |                     php-5.5.19 | NOK | http://autobuild.buildroot.net/results/d31b296786fbeb92259302ddc7d7dc5f8c7b2a32/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/38c2b9ac9148d296a157b84bf8eaece39cada894/
        sh4a |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/611b076735fb849a3f021f35b81eadc46cbe8385/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/479857b181d42afc7ac06af2ea3106d30fac4905/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/59976d05a1c935f9514c25e70d6c129988aee380/
         arm |                     ptpd-1.1.0 | NOK | http://autobuild.buildroot.net/results/ed07607213564865bca3b3e01657d97dcc041fd2/
        i686 |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/1d31a4bc4879aa8c8a707fce9e1dbdefda926354/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f46f7215a5f5d1af8ba95780fc4a28e20bd85333/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f64e8e260aa26d6fe488c4e7a78d8aa2ea82b873/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d67fbdaebf66f6ad2b90e789c274d1f438cffe3c/
        i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/0b2e26b555b7ec2ee1198bbcdf4e96ecb0f3dc0b/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/16b9381d98303f1cf7bfdc4ac577fac25ca807ad/
     aarch64 |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/87f0eb8155a8755d74aeac383d2e46ad33dd0e58/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/7ec489f6973040ea46782c28e1d1d28a3c04fbb2/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/c95b697ee731f883dcfda8a567b3cb6d895731b7/
       nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b882b5825bebd2afc0824c86810820bbb0428a48/
        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1376aa694469c21bdd59e5305d7c7fc7d796d3e1/
         arm |                     vde2-2.3.2 | NOK | http://autobuild.buildroot.net/results/9603c5955d89c130389bd53f91d078313dcd135b/
        i686 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/66a9d3ba6a4bed9275a307b369e54171a3583720/
      x86_64 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/919ed278369df496e81d0d8316d2dea805504e96/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/45cbb5ad989d6ce0167298a5e148060778726f53/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4818c0cda1831968d346a8fc5a58d3eed45658bc/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/bf7e0904c43140253396a09fa3ad1f69aea51051/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/2b5b52d06b712931f084e3f79826b4d5e203d112/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/af03d6b9fecaade03cf710e6922c301fdffc6a32/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7a76efae2a3386cda4ff597277de41c21c771005/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/86e509a6f8c909f6bfa7b8d4d38ae4f5f52fcf2b/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/302f3790a7ac1ed845aef93171eeb67be739c125/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d894f3005c53e7e01f893083f0352f222788d388/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/b5c50bba4e8f0d413283b487df9cf292f77e8d36/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/67f819b27c474eae20eb322a6df9b38c4f0d5b15/


-- 
http://autobuild.buildroot.net
