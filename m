From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-05
Message-ID: <20151206073021.67F221028C8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-05
===============================

        success : 213
       failures : 235
       timeouts : 1  
          TOTAL : 449

Classification of failures by reason
====================================

                     crda-3.18 | 65
                 pixman-0.33.4 | 26
                 libeet-1.7.10 | 19
                     flite-1.4 | 16
             lttng-tools-2.7.0 | 13
                    gcr-3.18.0 | 13
                xfsprogs-4.3.0 | 10
                 libass-0.13.0 | 9 
              alsa-utils-1.1.0 | 7 
                  ffmpeg-2.8.3 | 4 
                  trinity-v1.6 | 3 
                   erlang-17.5 | 3 
                   mplayer-1.2 | 3 
                  connman-1.30 | 3 
                 dropwatch-1.4 | 2 
               arptables-0.0.4 | 2 
              gst1-libav-1.6.1 | 2 
                libvips-7.42.2 | 2 
               libcap-ng-0.7.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
        ltp-testsuite-20150903 | 2 
               libsodium-1.0.3 | 1 
                  gauche-0.9.4 | 1 
                 gnupg2-2.0.29 | 1 
                libmbim-1.12.2 | 1 
                 opencv-2.4.10 | 1 
                   systemd-228 | 1 
               wireshark-2.0.0 | 1 
             bluez5_utils-5.27 | 1 
                    faifa-v0.1 | 1 
            netsniff-ng-v0.5.9 | 1 
                    kbd-1.15.5 | 1 
                 mesa3d-11.0.6 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
               dvbsnoop-1.4.50 | 1 
             host-nodejs-4.1.2 | 1 
                   perl-5.22.0 | 1 
           bcache-tools-v1.0.7 | 1 
                      qt-4.8.7 | 1 
janus-gateway-c632c1e9da5ff... | 1 
ltrace-c22d359433b333937ee3... | 1 
                  libnspr-4.11 | 1 
                      pv-1.5.7 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   libnss-3.21 | 1 
             transmission-2.84 | 1 
                 fio-fio-2.1.4 | 1 
                 liburcu-0.8.7 | 1 
            libopenh264-v1.4.0 | 1 

Detail of failures
===================

     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/135b03208e80ec4ac7c4b18af5f19b867719b8b6/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/1b25ff70ab5cd2731b85a42cb0d192bdbd60bf37/
     powerpc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/237801c4b4d8bffcb0c8922b37c9b929666477d5/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc0aefbabf7798c9c382d7dc7a27b64343de7f17/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/86444fd8f53cd1bbfe2abccf37930653f6d948d5/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/d99459d22882f05ae52ba9cc85f7500a4257c283/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/d0bd056dc88f8e339c348049305e1913be2cc949/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0442d72abba6d2289b3c7c92ae73052809a3318d/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/e42a3f082abf540f506e6b4548130ac79e5d5ef2/
         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/09392acf4434b3dde57ac85239d38cf66cc48da4/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/a7ac8782d89fc97e280b3e90a92987f87ae3f5c9/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b850bc3c39fdca1e69fbe553249300e12d90a30d/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/af955ed77a530c8af86216ae4e6f0c8647e88265/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/ed4c61996ca0db62538307bca3a22918868fa5e6/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/67f56e31cea352dc623a40a4db7cbfe560359de3/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b0ca93cec831a899a15d0c63c18d9ecf3c29eac5/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/11d08308f3216727be7aea88c968ae00f4939bbc/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e413159445f707652188a681c754b31bd0deac1d/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a81f3e06df8ffa56f7d1e339812d6f307260b06e/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ff61ce2204806d3ee88910ae3b76d3b23193a52b/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/079b8edc87f4aaae3c59d5195ac835a4f26ece91/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/61e4df3963f08e99d4c34da91fdf2293027f91ba/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5e4164b2b9c0380bf7d3317ef5694e3f150bb47b/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b50f0dd6ad780e016b1e931824e50710d2cfe505/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/4645d9179076af3cbe3f00a27f7c549b980e460e/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3cb935442e12a0d372818811e84624e32261685b/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6efe3e867322032ef326562e158a8ff824871335/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5276240930e116aa40c76dc6c3cf0aad058b6224/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3b4be4274f95ed0bd55bc29f92805fad3b7e407d/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5b2623808464480594ec3d94c709fdd4cba74e71/
         arc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d54c5c051b35b7e8bee53afca31bf3ccbc5f786d/
     sparc64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/10238548558dbf0492806ceae5a422ceeab86b4b/
     aarch64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9d7156d092ff69ad28b34cb7d562b0c1f0d4e6f5/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2a82f56a3c276895b4f155f3a2e0776cd42da655/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f795bd9e7e60b030fd30f7d9015431ef04bc77f8/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/701efd378582c19d5b76be66fe3ca0fc8a1d9281/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d2fa7acbed1182ed2c24a14a93ee8e3fcfe19fe7/
        sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/eb9ef718368794bbf0237480f7ee69cf970e6ea9/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/d8b7bd300b9745482813e5a151e9f15677646ccc/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3f215d1eae04df278848393b361fb6922d6f760c/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/55f4db604fe84294108e6360a14d21ea91d694cb/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/12666ff2cff489180ebc2042860b48dd7ae684a1/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c8eab424c274fe39c57c33808c2d6969a8ea5d52/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/89b248259549bf0276393c1282fa91616545dd00/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f98adf1546485b0447e6abad63695c6822c91840/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/56864c42ce20241f183bb1d870de46d0e185298c/
        bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/354fe2f841a109f8361d06b301021892b26da625/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/3835069d3e18097ab7a92fb720c3cd0e5dce6e9f/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a2813c138398765ad66f7608910b23ccec7ae568/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ea75393f4414307d52669c1e897c13a8e72e9e34/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/cf3081b87e38fd429c7a28edf888f294c82a300d/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/945092a10a880a77e65af4f510a869c637a5e036/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7b954b22ea8c9d86a98ede83e8ae6eee5bbc5042/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1cc35727d2ba064dd6d95bd1d62299fcf22a545b/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/96680c0f36095076f4efc6c897b4d1179672c1be/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ee745a28f0c20af67374cf08e0b2946a012f3ee1/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/19df48b0ee5e9c95f3baff5267a822213cdb53d8/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/dbefc532b411382d9e9d08c85e4c672c2da70880/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/17b2a63729e27d929e0b60493a54364451e49675/
microblazeel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/74327b38ff405811a9a2634673d8c2f2935d3a72/
        sh4a |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a4c8b740f62e88d568d7e719af5dc67116000fd8/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/6fff8eaf026aa70867a9a0a214f900def91f53a9/
      xtensa |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ff474ca8af371b68448fa23895ba4ca7a221b199/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a25cc94b2f425a858930264d5dd2eb19d17e7fd3/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/661640f3d608a428f45cf0252f15f5c8673be0c6/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/05f2883e9addfb4f1480a3b03f22fa7fb77583c1/
        bfin |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9ea653e77e03db1d19036103f681af76dfec3f09/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f614454da9fe222a419b72478b9421d7de5d8143/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/91a105a71c982b0acb286d953e77c448e73ef536/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/ea87b39019eb73d04b985f82f9c2871f26c870b3/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/71cc127a86dcd0d4e29d0cafd3852a6c75ab4523/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/9cc72cb245a71385dbe5d6707160a7cdeed91741/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/f46f3358a779aeca394dabd641148452bdcdbf25/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/dd1bb809adfe007adc44f5e16e425cae6681be33/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/53b5ff28e1cd741c5a3db8a9e693f371e9d1d053/
         sh4 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1ff152661504a97afea64e60146c2327b9c0e903/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/5cc3a8a43533b5dbc3e3ff1b81ac76dd819ff38d/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/eca3e60fc8d70604409f9529800e9edda5c73650/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/0b5c422891430d74229f0eb6696458fa46a10121/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/7b05999ef17e4bee5a816bf6c5a3c0b4fbabb838/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/8255c59481710e997ebe8dea82702567343a8438/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/37719be0de7ca7c54ec28c5207667c50c6554c7c/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/544fa68267af9337e6763dacb0cfb21c1c970dac/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f8d16dd68288d9ddcbfa4204b9d2426e8fdb96b0/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/fdada8d2b3f47940e3ad62f4d2300430f6387fa1/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/dd6c9a8f1517e27cb6f97919eaadaa4ce48b5e4c/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/2ed5a922acf8cb19c994090a0ff0727ff4b7c1ad/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/b108ce96b97b14974a93369e9e1b54240d47a91d/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/74caa6537579c41f4cb8e5a90d3e93ff76577e08/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/65e98c4ed8bb2e08d3589c28c37a59fb51422934/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/95b3dec0994c07130ff6b70b4680de2f3b344137/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/0d6f185bc0ac7ec2fb9240a9856d8615665eff79/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/db01d7a8daaaa6864c52ff9e5a240469a66babb3/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/33c4ccf1391ba5c40d55382842605c5497487a09/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/d43b29348a85bb5707c7c2ab86f9b2f458264b1e/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/f6598bb5e75a1f7394a403574f58afbef5fae2ed/
        i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/5dddceaf009938c89f94c39c8c9c19ec472adf71/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/1c5ea22f5fb3c102d06abd4a36838d7a0229ff74/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/138ef0a9a871963894fcc15fceed234d44fe762e/
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/d4c2a5c511998a5b676375f68f5506ce9be2f5ba/
    mips64el |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/3419723216cafcbe9cb0a08965ad80e121e847d7/
       nios2 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/de87233be88a1068122d77ccec431757eb8b8b02/
     powerpc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/0b2cdab8b71d55f1e39f326d37d8eeffdae64ef6/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/dd2bc02abd5cc54ad62c105a0344a5456a19a3d1/
        i686 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/c7d7a5bbf778fd888f443a8b8703716403385cf4/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/8a68a1ed73df22b77decef898f0dd38b9dd69163/
      xtensa |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/02fa1a8670642fa4b396723343abba965033f864/
         arc |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/09caca990497ec61f94c666dc7312f687f570b0d/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/9ebf7ad0d721433dcc8523a55d08ca074d037e58/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/160dadcfc251767b4d3c2eaf1aff0d9b4f081fee/
        sh4a |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/30d4d2f5bfa4149c017aeaf0a06d0ee3dd6468c2/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/34a9208379efe6d3796683e552bf8dee9f2c2913/
microblazeel |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/67c1e4c68e15c8861b426641d3e8cd9ce1383ae1/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/0d9873d4e816d19ac4aca4c64f98fd7bc60f8593/
       nios2 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/bd1b00340349cf597e0bd28f35ab48d7fc7d5105/
        mips |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/14c0e63d7bfef5f67e33a25c21d38a50653824cd/
         arc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/117c41bf2df4d6324214ee801487187a7c0b62f4/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/92abe9c61d2ac19a58457da4f74e2ffc0c7097ed/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/e86dd780ea0363a7f456c0e40431780bd9b50b76/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/e6442411f687461203646f53eb11116e04249ed6/
         arm |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/e9293017c4dc309c83934ea2b2545df2097cf13d/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/32e9b82e5ceca5d60fdb60d612515deb455ff674/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/c75419aa80de14793767fdea4be07d0ba6efe374/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/b24f20dc31d8d05463389f2eef50795297b0223a/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/ac8a59c0b520bac7400d5dd6fe1450bfc27d1acc/
      mipsel |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/76f55df0b8218137d782677b4d901053a20ed979/
      x86_64 | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/aa265ab2e9a6d3a7a77c8cf8e2d6b00a985e82f8/
      x86_64 |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/c8cf1a7ac696b65bd6174a21cd1bf9155284c531/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/f5cab987db8841c31b05852e57a8936f8644c3c2/
        mips |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d86ea56c984e348eee55913ab15fc37ea00a0594/
        sh4a |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/242412c12f526b4cf91fe3c4d7bf3bdf5f2aa542/
      xtensa |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ea035500ddb86d8264901b8ed92d05e5bb0b7324/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d4a8539e5687ec96364b49ef0f8401c8419fdc2e/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/61a11ce45483fe4003223ab7999a219e065fdea6/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/5de1b3ac0c4fa435103d6ff08b59d9c988927f6f/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d2c40ffdc3d0cae34a774f09a235c8169f5cc2c7/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d3974dc9dc61593f73b539678386d9d00479b961/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b09f7195fb21a8328e12fd499cbbf1fb97148518/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d3075a81d73ba9dca7dbdfd5549a9388bf0aa896/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/081c8c37fd9c490a5ee682150f8efdfd705d8c66/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/49bc75a75ff28e85f600c4f2440b53465f55358f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2d077af3203fac04e1df0d8210496afa801c61a2/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ff8fd59df70cb752697079039bfe9843db9a196c/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/50cd86458695be2279c1189b8181e6df0ffe4944/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/226fe6c5d718b12364c588f4cd01126a5621c267/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/79f43f71c1286a9a2fd5f20d17dd26a506839d89/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3cb14924c7c6491a42b7ccebe2fa6f1dd693e693/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/97bfd3ece5e6dafad5dc980b7646c5749e36830d/
        sh4a |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d02ee9d885ed418628f06f70645ef3daa22b0f4d/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f87fbdceaf335a0babdb35c4acea7c6ff471fd9f/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7ad24f4d2b6d81ea4a74861b90f3296e941765ba/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2a62f9e1f29ddac2ac4107e8c13a32884d3a87bd/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/83c56601347db00e9f5da0eba756bc00614cd692/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/a899d4fec3ffa208829ac617b6565e11187a762a/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9d65a32da0cf11038ecf91dc663ef378c4d22b72/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c5cb7bc81b7fab5af4f572a3ad08892432cf5cb7/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/a983e9c7e395ed6563e5110ee237b5323bf16103/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7ea90cefc5bb56b9dc2e5871ff09ecee689d05fb/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c47d69da4f09e07ea094336b582fd8f4afaaa3ac/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/323456fa2cb2f246835f2e3257a5f3afb58e3158/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/251630c54c980544da6dfc151f4536ab0dc9b790/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/985b97ce84453c7d14c62dd267ae3c5a57a0ad51/
         arm |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/b140f6f1ed99f390e831a450fd7b501864c18abb/
       sparc |                libsodium-1.0.3 | TIM | http://autobuild.buildroot.net/results/5fd49ee3cf1aa496b1fa2cc1241451d1484eff7a/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/bd14e78da2e7dec15d3b221397efaf3f3680b78a/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/6f52464171df30654c4e2149ca0799170409a489/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/40af7aaee4b3984358462bf5d3ae45c23820f170/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a72af23f8f4f0fbeeaca34150dd1f37f03533b56/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/0760d42167c1d25f98fd6c3a39a8d951bc3d133b/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/46dcd214acbf14e973903806d7860f6d0601d73e/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/3de8a089ac6f7c7e34a9342afafdf20659c3b328/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/b42bd841b6d22738de5f990ad5a2615dd3d6476b/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/171ad10ed568d7466deb955a89f7f775f157b9f9/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ac997095c0f560c258be3f13af50ef0a03aaf5c6/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/de0dac9d6b29180042fa476756947b441c197d60/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/285268ec641362ef47fb0944a1597e00a351e302/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/a0b0d3e2988e667c6a2ae3606084f50d8fb4008f/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/6fc2fd4443d59560e376393ea8f00dcc9d932c30/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/10e2d9bf3d3026fd8c925c6c6d29c6ade230b10f/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/d9b4a7ebfc5a61162309e15e2c8e20f0805db49b/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/161720b1b448326f445698002e8c52e666082a2c/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/b7296cd1b79c2505402472f95abfeeb39e7b53c0/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5d4a1d0adc5f7a051950c8905b268ec38efccd42/
       sparc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/9ba9c9b5fb2826d721660e9f5bb20ac7d77b2437/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/007e87241010d5cdde3b1dce5c19d2c078b780ab/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9aa1070a566d2ec1359e59e7ccfe29aae05068d4/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/22aa0367ff76a3024faec69c762a08a4a441f45f/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/be6ce27de66f77db5e18983485b4c29fe6bf097e/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a3190f3a2e33d38eab7c29dfebbded3e1eb365cc/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/432fbefe9705bf8d98161f500245f955376115b0/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/2ab71d8a4fe6620692c3eeaa29b4bb18313e166e/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/f7a6c015cf0e7c85cf53fab4d6ac01bb982dcfa8/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/96cd7084127022fa460d347e794fbd939182105a/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b7fba314f6af1035d2983e244dfd934c3d5da067/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/42b3c422f90b8431d972f3bac953a3731f48c167/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/0895a4ff0a0e5b99599261538821604c33d37007/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/4e4f1f3df252a47e058076b7c403bac60e3fcd58/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/cfdc62fa8c828522ab77487620b20a906a76b909/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/03213ca8e029cc40e53bbe127a71f155638f525e/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/3f4f1e88988d66b052432885b4f044a0eddcee2c/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/a95c8e98ec193a62bf2cf3de7d1abf09b6811a4a/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/9610d3b22b1a5c2a605d02535acd69c09dbfe8c0/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/27f9ac8bb354fe548662fdbc84a5ef644e06dc18/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/d3ed77229e72a1b3cae2d1fdf8417e072a5ca0f2/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/295abd74d4bb1ee53f47145210782e51b35ef0db/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/686f43a1cad59f39fc0ddd3dc9d091998d004771/
        bfin |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/b54e0ac3da1fd9c20d406649d380f8299db1bb25/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/1e824c71572d48b52bb6faf44d70f613fa20f272/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/cd722620832c28d22eacfc43336f6952b82305ff/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/0b838cfba0d54a4e3863a3798b0b30c81fd4b9c7/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/fad10b87c39b6cdbbb22e68fe7224b4ec07399f9/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/5d5972dc3a00f924f8eaebd45f728985ff4ab44c/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/dbfa3e1828460aa1460b337ecab59f2ad8edba9a/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/9b9d7aac88f7efa254aab7505d87d4b6729239c6/
       nios2 |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/68d35bc806749968fea78de875e79e0bca6faf38/
microblazeel |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/3c08bfb4e74c570ca105f50f72944a22e8aabcb3/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/1edf5a38bcbfb345f0671c67b5140980be5e9074/
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ffc5e7ffd3558d26f7ea26cad1862b2d1279d7c9/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/b6da64c45153e4c0c3753b42e80cf0275a8ba7cc/
         arm |              transmission-2.84 | NOK | http://autobuild.buildroot.net/results/eafcc8aae4aecc3d80c2cbba730c20a3d9526657/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5f1f10d34c912c5aba89b5c3dc9a9d6c371bb2e6/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/9adc7012f0a508f61e2a4c34659149ce707ad586/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a5c0d7c39fa02c645db7f4f9474fda968f5e96ff/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/7138fe61cba52f4b5033e1e7b8157027d29361c5/
      mipsel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/01afe32c1d815073137c3c42d69fef7875375f36/
        sh4a |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/4bf1aec2c2ff2b72ccc7df18655d6f281d83aa0e/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/1f7bee7aa3cd715cb3fd41cb9a55f5260f6c2e9a/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/58c302d9d858f3e13b63e0707f71f1a2414d8894/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/55dc7a20c6aa422f85c656f997c3d3010519ff46/
       nios2 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/6572f37027ca9d2c7f5cd871583ad9b51221826e/
        mips |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/7f1c4f5053ece0d38c04f5aec000c5cb068cef41/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/99d4a5fcf94a0ecb772aec09060275f233654041/
        i686 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c5c91ad7f66d0838907a9a6d97f308cb733d61f7/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/37b467f8d681b36a8fadb5246074527806daff44/


-- 
http://autobuild.buildroot.net
