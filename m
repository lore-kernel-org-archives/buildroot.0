From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-17
Message-ID: <20160618063029.C84AE101C77@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-17
===============================

        success : 163
       failures : 152
       timeouts : 2  
          TOTAL : 317

Classification of failures by reason
====================================

                   efivar-0.23 | 14
                  boost-1.61.0 | 11
              e2fsprogs-1.43.1 | 10
                 linenoise-1.0 | 7 
                   fwup-v0.7.0 | 6 
     python-pathvalidate-0.4.1 | 6 
             bluez_utils-4.101 | 4 
                beecrypt-4.2.1 | 4 
       liblog4c-localtime-v1.0 | 4 
mtdev2tuio-e1e7378d86abe751... | 4 
         erlang-p1-utils-1.0.3 | 4 
libcli-c63c9d35144939c8b4fa... | 4 
                  connman-1.32 | 3 
             irqbalance-v1.0.9 | 3 
                flannel-v0.5.5 | 3 
               linux-pam-1.2.1 | 3 
                  autofs-5.1.2 | 3 
snappy-1ff9be9b8fafc8528ca9... | 3 
            libopenh264-v1.4.0 | 3 
      kismet-Kismet-2014-02-R1 | 2 
                cifs-utils-6.5 | 2 
ti-utils-06dbdb2727354b5f3a... | 2 
    bandwidthd-v2.0.1-auto-r11 | 2 
            c-periphery-v1.0.3 | 2 
                    lftp-4.7.2 | 2 
libwebsock-3c1615eeadb0b582... | 2 
                     vlc-2.2.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                           all | 1 
               libepoxy-v1.3.1 | 1 
                  apitrace-7.0 | 1 
                openssl-1.0.2h | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
           erlang-p1-xml-1.1.1 | 1 
        targetcli-fb-v2.1.fb41 | 1 
                     eudev-3.2 | 1 
                 civetweb-v1.5 | 1 
                directfb-1.7.7 | 1 
                   libxcb-1.12 | 1 
                  xl2tp-v1.3.6 | 1 
                    gdb-7.10.1 | 1 
        ltp-testsuite-20160126 | 1 
filemq-e59951489045825d6fc5... | 1 
                   lua-ev-v1.4 | 1 
                   taskd-1.1.0 | 1 
                 opencv3-3.1.0 | 1 
     input-event-daemon-v0.1.3 | 1 
               libcap-ng-0.7.7 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
host-omap-u-boot-utils-3f07... | 1 
sunxi-mali-prop-1c5063f43cd... | 1 
host-imx-usb-loader-f96aee2... | 1 
                     git-2.8.3 | 1 
                 setools-3.3.8 | 1 
                    mpv-0.17.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
               wireshark-2.0.4 | 1 
                 jack2-v1.9.10 | 1 
   jquery-datetimepicker-2.4.5 | 1 
                    pppd-2.4.7 | 1 
                     tftpd-5.2 | 1 
               ljsyscall-v0.10 | 1 
                     gmp-6.1.0 | 1 
               netplug-1.2.9.2 | 1 
                  stunnel-5.31 | 1 
                       unknown | 1 
snowball-hdmiservice-f75c99... | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/cb205d8975f6c1b2f4b7c6075846d2e5fb8dc611/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7aede426420b895f7d06be2da4af7ef14090dcbf/
      mipsel |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/321e587e32de054a88101997519f60de0e188010/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/406b347ef490055097ca870bdfd8cc6357d85aea/
        i686 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/a26599f46052329663aa192968f4a854b28c277c/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/a0426c90a1bfc42325b4431ee8da883a82eed323/
        sh4a |     bandwidthd-v2.0.1-auto-r11 | NOK | http://autobuild.buildroot.net/results/5c81c61577eb3632659607c12499c8dcf5a7905c/
     aarch64 |     bandwidthd-v2.0.1-auto-r11 | NOK | http://autobuild.buildroot.net/results/10b3c08d5c67c46899e2223e12de85da7367e1d6/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7dcc9f5b3fec3d86e743ad6971ecca4a1acab8b2/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/50b51f744e988165848ff8a3b78992da54c2d107/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bbe57a096de207b78e069591e21ac5a79eab069e/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c5e9cba3fb2e19193ef8a2ca6f7173591a145879/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d4c15bcb1b2201cb1edf3897c3b1e791c6da5da5/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8a9c2e89bd8656665b2496c5ab3fcf91973dc44f/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2cbfc075f85b2feb3dd5c60fd671a437b89c3f8d/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ab702e6db382b1975d0cd61feaba9812830e81e8/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4a377a5a39ee527ffb97307d575c8a8860eee91f/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9de70a1d4d7da13838f9e7fd2d351fe1be21a01e/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c0709236bde9450e6e858b9173a5740188532f4a/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/022332d11ddea49027d44bfc3e4c20c0ec3ffefd/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/66471cdc5bcbfc847d6f195887c4c46c86b8f71d/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/62defc24978bd5de1f62255a5b00e409a4a2a550/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/1802723f24b88d0e9f923707273e781be202e158/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/84e3fa39eedaec419f61063be1bb2b1b2aec546d/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/900812cce771cdaf45d55866c1c4925f184a24a5/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/fa4411a038f0ca9558e29faeee0ba3c40d6d8f64/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/e74b840a2f2d0a7b433bde09e1e8a94df2a1e695/
     aarch64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/afa5de2a2c17b2800e0e84e9c690e04f481df742/
        bfin |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/470a52a8646a64acae3c1d5b56f51587bec8b70e/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/f30547b8f91f94e1713b72ba2f91a8ee0fedd662/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/0c1ede45043c5543dc3a6c9d2e96c0cbffaeeaf3/
       nios2 |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/14e5bc86c26d568d294ddb19e05502e00a3eca86/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/323041c0f4a58157eeeee10fdf9fb6406b437a74/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/715f95487a0286b9343b2283faaba19585b66906/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/af3e6205ada04a2ced7ca842b98ef91e82c8b6a0/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/344090c3b170c6cfd1882d72f6a167576dad06bf/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/4301cc1b6e8dbed7189710558c7a940a27d76129/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/546da25c9c8c68b38eebb2c0586bc75480b68033/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/10c02b43aafbb921ede670e110feecb408015b3e/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/95b8199de3b0bd1bd221bf0362beb80b454ccb44/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/26688c0005a3498de51f8e762f3c17d27d8f6b06/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b05d416fcdd64f5c13353b662d8f935d890ff63a/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e290aa66b97f3d3302cec734d18fa7a9997faf1f/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/20659ce9cc61f4129f03e5bcaea43b235fda38ad/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ea9d9e9adf84e674d4c40eb05e082233d30f2b32/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e2b90ba92e0b30f4b3059559c1c3525871a987ba/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7e99290a2da3b677cd05d74cd9f8577fb7d7a23a/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/187d9343ae8409144e9e0bcef12dea27f626586e/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7a39c4928bff5b17ad771eafdde475438637cd38/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/75c375eeb16b59d024dd96036975f8fb95bc4cfb/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/46380a84068518c9100811b67f9830398ecdae53/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d7ca758a145881e54463387f84075e853f365370/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e8b3a140cee1699150b439fce700d1b5ccfa9cf0/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7005311213dc69f39a748bbf4077c66f4c3b1e9b/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/dcc7632febc980e09e4522048d43fcc045c820c3/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f9333be412e1e5d2c0afbcee5091cf1bf7ee11ea/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e44b9133a8f37548573a3581e188fc5c2cb7bd00/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/84a174d3341e90877f06848eb6539c15d6e81d2d/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0b30a92a609510ad969595914ad51134af7e4534/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e7b69107a2f92c2d4e8d9f63c5d14771ec9b1ac0/
      x86_64 |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/04bdb99734988405f493ae20f716af1c045fb170/
         arm |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/2126a5634d058459a638c21d63737f5a752d243c/
      x86_64 |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/01d6193af3b0b54fe980fb7742d2f4d80194fd0a/
         arm |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/fca789b51966d831664739b55ca3d6be4a695f65/
     powerpc |            erlang-p1-xml-1.1.1 | NOK | http://autobuild.buildroot.net/results/86f7947e28cce4dea2aa50c4cdaab039a29eeb40/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/70bf9c38d8a1a1f789c9f84b218aade249251ac7/
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/fbff4e5833129528940d2223f982ad7b9329532f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/98f1807d796fe2d4a60edebc651120f64224498c/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1df17e017b359fb7107670bfc9e3d83a796fad31/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d03e3bfe7f3e30c3c6ebca171c65c5daffb46d9f/
      x86_64 |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/3c30b8439135ef22494d9554a7aeffe8f7301807/
      xtensa |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/66b5ed418a4f7178a79e6df4a51d5fa28624adb4/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/20a44541a5cb0e8680fd6fa3584a763ea98937f6/
         arc |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/4176967b47f92ce507e481da0c59627228548e30/
      mipsel |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/3c2215b5afc6588248ce8650259ef8401b20b877/
         sh4 |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/10eedfabee1aac280670209dd97e20608e9df96d/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b2104a68f6fa6c867e358a45cea02a17f5951ea0/
microblazeel |                      git-2.8.3 | TIM | http://autobuild.buildroot.net/results/b492ab154899d15d6920b760a7b85c16b5b9c152/
         arm |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/12b3deb1a6b79363251c3e5c0816adb70889cff5/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/42b2c420f61a64ea67d05600ddc28b3b96ace107/
         arm | host-imx-usb-loader-f96aee2... | NOK | http://autobuild.buildroot.net/results/6a313023f2eb8637853b9a8210851b0e8152354a/
         arm | host-omap-u-boot-utils-3f07... | NOK | http://autobuild.buildroot.net/results/953cee555d972a0d9fd4afd1b22d2a733ea61b8e/
         arm |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/07d5d75c57f1f427efb6332f900251c24a17c553/
    mips64el |              irqbalance-v1.0.9 | NOK | http://autobuild.buildroot.net/results/1972c6d82cc6033540fa57f8eef3cac02b8dcced/
    mips64el |              irqbalance-v1.0.9 | NOK | http://autobuild.buildroot.net/results/072691ba55fa22bb4336a5d9f450ba04847c4688/
       sparc |              irqbalance-v1.0.9 | NOK | http://autobuild.buildroot.net/results/95b992d7c3a0b577a89300cc62190e0d6e1999d8/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/525fe19e56e3f2cfbac72378a9d4a8dc760c75d9/
      xtensa |    jquery-datetimepicker-2.4.5 | NOK | http://autobuild.buildroot.net/results/577fda40ec202202a2328358a190b1ae2c9716aa/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/222805c7b5502aadf99a3c8e077d3ae32912d445/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/e212f700fea1619130aead03019a789976cd054d/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3a1b3f40b11129e6824bfe88a98d12945c85743d/
      x86_64 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/b42954fbfac6172b3c10477c4f288f7f819e806d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/55694fe9fdccbe881a1a559ce3add7d1ce67826f/
        sh4a | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/4755fe4260adc6fec1880185183cd594e74f3c31/
        bfin | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/c0aeef0196212bd4173567e6e4fd99c47a500e74/
      x86_64 | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/e3274f2d82cf3df7f0ceba3dc47e8782d4e7569f/
     aarch64 | libcli-c63c9d35144939c8b4fa... | NOK | http://autobuild.buildroot.net/results/010cb6a07b09604ce3d541fe771cbf3bda34957f/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/4c096be10febb4db332e3eca3438e7b4aab40000/
    mips64el |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/104621e0cb6c058cd56104e8377002e152aa79ed/
        i686 |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/2f18f887bf3125060b5e0b157000b497312974e7/
         arc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/8f2dbdd7cab32d7453870c312705125b7fea9a24/
       nios2 |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/e54afe2f5d27540d69e2b9c3b963e23fac5bb4f7/
     aarch64 |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/ef3e3b07c8453c8775f412da70c4c0f1e1ad3cf6/
    mips64el |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/9437b29ae5c03049ef0c23d01c51107b2cb2575c/
      mipsel |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/cc7a748f4be8b23921805bb32c7054a3e4ebacb9/
        mips | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/21badbaf975296f6328b3522ea03e2053fe41c35/
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3afc4c482a2c882e4a98e2d6d304d019a778d0fb/
      mipsel |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/a75eed8a5a1965d8a712d555bb51eb4826b112ec/
        bfin |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/7bae05e74af886867285d40d61eee73a2fd8dbdf/
       nios2 |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/da1d3c7a9c080f8dc8fe165ab6b0566ed5b0c1e0/
     powerpc |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/4d7f83ee9bc73524c73d6681e545bd20041cc4bf/
    mips64el |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/19bf6ad33081f50a8735048b582cbb33a983418d/
    mips64el |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/ae97981ca8d65a9ba3d2d38327fa751ad75c2f65/
         sh4 |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/0d8ba6f0dff473d7f57c279c5386da68798a295e/
        sh4a |                  linenoise-1.0 | NOK | http://autobuild.buildroot.net/results/54088ba187bebb428f03102faad9d619179a7ab1/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/deb18df04d28f23468c8bdb828ce9e35edd3354f/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b86d7ddbc2d420c9572c829d90d577bf294d9995/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9bb29e39214d97e448dcd6a137e1b71f1c2d3ce2/
         arm |                ljsyscall-v0.10 | NOK | http://autobuild.buildroot.net/results/630e8aae62f4a88ab08758b1394bf557ed1523be/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/b467364c95f6178ef184f292a177fc504b43e3d7/
      x86_64 |                    lua-ev-v1.4 | NOK | http://autobuild.buildroot.net/results/fbae1f007a547e4dc3e5aebe064d84dc03fba70e/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/70cf75d2acf5843eb7d62c15e2809732b6fbc949/
    mips64el | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/3af829eb66eb566f638c920ad57f67a693eb5105/
    mips64el | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/d74b4ed55df2de9465ed5d401c0873dd6875f14b/
       nios2 | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/2fd1ee4bac02e024a3f5d98ddce9a01d11a19821/
     sparc64 | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/4a470422d0d7242cc9637898785f5eda491a60bc/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/32c2767c3a98aa6c2a10ab76756722ff259012c2/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/cc818b4264f5454e3e2c66b34b36cd7e104d691c/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/8580a5fd0af690b9ea336d945fa5a1e3c7c79290/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ad87da6625a57ebe664896575b9e788aca6794e1/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/58d33a7ee8fb8a794a58ebaed1714afb2ef2f8fa/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/958af6232d8b83b163d86f7aa2d58ebeedb68934/
     aarch64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/bbd71451a8de0e6f562566c11db66ff3248fd972/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/495189ddbbf8064acb8581214f59ddaa882c8d1f/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/7d9e4a0cd015d29a997f7b6b8377402349756fe1/
    mips64el |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/fee1b4828699686b14d8a2e163947839a42410c2/
     powerpc |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/f5096a04f16383773903acfbad601e42fbd83ae2/
      x86_64 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/223a5a8c71406f6ec1274462013034c9500b179e/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/91cdd5171645dc8002d89703d289ba41f869aeab/
    mips64el | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/41ad69222d80c2debafc6060c40b6cc7d1bd79cf/
         arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/b5a365d4977c2431deeec742100b5582fd6afed0/
         arm | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/4609daa32f6c08ced754518111fe707dc19665fa/
     powerpc | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/d4ed0cc9529e333c6cc64f95f30bf2f9f602a78b/
         arc |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/0fe3f29446fa2bc4d53e8eef401e8bb00e861e7a/
         arm | sunxi-mali-prop-1c5063f43cd... | NOK | http://autobuild.buildroot.net/results/3eff7d3183feb12c55dfb123455ff28bad1eca77/
        sh4a |         targetcli-fb-v2.1.fb41 | NOK | http://autobuild.buildroot.net/results/57a4fa18a1d09e964bebd0e2def58864f4474603/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/9f167702565d45485188634185ae5a4d3aa3b84c/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/d8990e4e577d3845bd681eb1e04737aa4fa63231/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/542749a6632d45d7af02ed8ddbc423c57d0eac89/
    mips64el | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/e5ce19748966d994cef27647d8075dde2a41b836/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/1b7ebc50ae19a5c08149e07a047c4b7c1b5c614e/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/661cac1f94fd6ddcfb1717ab6a33204da21c3af6/
         arc |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/5daca9800e707bca0873866441ab460fe18d64d5/
     powerpc |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/a19f3c49f86a8573a31552dd381f3b8439d3af1e/


-- 
http://autobuild.buildroot.net
