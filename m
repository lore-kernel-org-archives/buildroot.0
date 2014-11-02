From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-01
Message-ID: <20141102073016.72F6810106B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-01
===============================

        success : 201
       failures : 83 
       timeouts : 1  
          TOTAL : 285

Classification of failures by reason
====================================

     adwaita-icon-theme-3.14.0 | 16
                 samba4-4.1.13 | 13
                 schifra-0.0.1 | 6 
             lttng-tools-2.5.1 | 5 
           libmemcached-1.0.18 | 4 
                 webkit-1.11.5 | 4 
                  tstools-1_11 | 2 
             alsa-utils-1.0.28 | 2 
                      qt-4.8.6 | 2 
                    fltk-1.3.2 | 2 
                     rpm-5.2.0 | 2 
                  avahi-0.6.31 | 2 
                  prboom-2.5.0 | 2 
tvheadend-596b4e0b29937a612... | 2 
               libglib2-2.40.0 | 2 
           heirloom-mailx-12.5 | 1 
                   systemd-216 | 1 
            mesa3d-demos-8.2.0 | 1 
                  nuttcp-6.1.2 | 1 
                      bmon-3.5 | 1 
                  libv4l-1.6.0 | 1 
             e2fsprogs-1.42.12 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
       opentyrian-2.1.20130907 | 1 
                    qemu-2.1.2 | 1 
                     tcl-8.6.2 | 1 
                 omniorb-4.1.6 | 1 
                 libraw-0.13.4 | 1 
                   libcap-2.24 | 1 
libwebsockets-v1.3-chrome37... | 1 
                libcurl-7.38.0 | 1 
                yaml-cpp-0.5.1 | 1 
                   mono-3.10.0 | 1 

Detail of failures
===================

     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/a66a3d8c2a41eb0d344e23327d9f166e89394fd8/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/0b6615c98f36343a374badd077d7636556ec6eff/
      mipsel |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/4e74871a0b63a152ac07253f161f3cb7f5ad41ed/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/57e5d8c3d14f3092032febecaf2bf404c541e405/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f8d0e2198fa54f9141512e2db6dc46e3cee1cd44/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/4b8f530a856fd3dcf33533cf5cb17f81b3ba6288/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/68d3fde43f6c14f326231f7eb3d6dee0ec3fbe0c/
        i486 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2d74a4b7ea7c679a4879e209b42df75acbab690c/
     aarch64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/9b52474c155503999f4a69521cb076abbcf82060/
        mips |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/04ddad375fafecc2bd678de954926d1070083bb4/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f330059e54a77fd00474736b7e7e5c38f956dc62/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/b90f499d5f4efec0c651d7902d1540aaeb66d37a/
      xtensa |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/6cb885e52c22831bb775a35088fbbf5c0bf1b506/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c586977cfb474a7367275fd5553ec167cc7192e6/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/14e83c26a557c8bf0b55eb0b5198f526b981f695/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f9464aa521cc34d262714895575d401cb85a7d4b/
      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/d0f118f6ebccb155c6c322794e621f780c643d08/
      xtensa |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/247e3cad0ad6d62f178f85e3cb1c7f5aff041adc/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c6032e146f4b69c1094fea2bc5befbd4338632b5/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/20f2d69340c5f3aea12881921b52e27bd8c8cd05/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/9738a7e7111aed679b26d48761bf0eafc9258dfe/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/551c534b965b49b16f18e0d0b1086a8efff87b39/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/b6d4ca97b2ee47881d2678c12d3efe086f679ea5/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/d46a137b24eb063f442cf5b39fce49bfbae8795f/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/aff71ca2a26638a4619356c8d6faa97e6d076c4e/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/de28866ddbd41dd8cc80f7cf095941cec5f562d3/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/97b6e4b312315448cddc861387deed9f4908d1de/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/5705e7997dfeacfd04a8004038e41c697fc3d7b2/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/dd30e72187139b3e8b373fdf51ee6de00bc3b10f/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d498ee26a1b971bc2c16d2c6cb37da0ff6b27b75/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/df04fee0dd0ee3d3862a7bde3f503863af6465a7/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/62f6fc13309ad32178b0b48e29fbf84b6626e888/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/94270f7f631dac0704500823324398b30318e057/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/42d4770186f5eae113a16487cafa57a7009b8d95/
        sh4a |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/f4d15f61feb8610557856537f2efe80a743019ce/
    mips64el | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/f68b626411976d620e1e64201e89cf80dbf3b04a/
      x86_64 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/5bb3af2a09fea19de2c45f0f44e5dd024866f2a2/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/fad368cb61998bbe2f933fd5368d51356493ed97/
        i686 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/d2ade153cbb1a03d3afab7673966e5d0a510bac4/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/e3c83a3c4adb37dd834b31ad72ab38e391a81663/
        i686 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/fb68d1da88bec8e001d2e40269d1e1731ec5b675/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/90152f1cfa09ad4d37700b340204f8b75850c582/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/ece1051cb9238735130b29f76d90a4994058345a/
         arm |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/ccd88ef146f1313bdf9534e92092feb8cb3c9291/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/061291b16a1ba38d70b0a05881705a6f3b6fdd69/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/d0b56f84469709a27cce23cb76c0e58088321c28/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/fa73707390c907aa804da3781f064db9d6c52aca/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/99cd34810d84445bc99ea0f1a6e2c72673a50f66/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/de9edc244acfca6dff2c2eea8da3af22c5588a2c/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/4092dbfb8b1b7d97531012056c330abb8d4cec38/
        i686 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/b1a92e23d7a1756adaeea5a7b49065c0bb17813b/
      mipsel |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5a3804b0c3dc484283d8f3609a93a1cc8ed9b7b6/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/58de9b84233a24ff5f3fbf1435fde3c5b13f6ac1/
    mips64el |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/4c847a6bc5d416bae4704eafa5f978e536f34c24/
     powerpc |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/5de6860ce15f01afb9a37df48e6e3d08a5f96ff8/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/a455d7fa5cde7ed304ea2ce4ca8b9002c539f98d/
     powerpc |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/f091e27c5f42bbae20274913b0cc15de4b305064/
        sh4a |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/979838068939bbc59a09d6c2102f3c80c8eb9441/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/8f46f7c5ab79e66093b2019211608d581c8dfee5/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/93dab4e6f2993e4f27221a9e4e599b0ee3ee8447/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/6d35da54d6a074d593890f686c5f9cdfe4239323/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/05c1513ee025b4256ea9ed252064eacdb44dfc49/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/2165d06a315931cbcd0c8cf0feb8a56c703ff642/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/392397c37af4ccb13f0eef33ff38b7adbea86dd9/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/2efb25356bc87ba0e1be08214eaa28ac064ad6c3/
        sh4a |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/3da15ced0935cb98df261d6221113ef00535f9df/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/732e08b343fa426f9828f030e83203112d9185bf/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e1ae99ea6b36766db7696e811e73d9b48d5fd80c/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/92af64bcf4eb81f9b2081262386c9ecad30ccf4e/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b6e67943c03f8d09bc16f2383b3dc7dc2ffdd23c/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/298aea407c518cb77ffdeaa57245e05136ec7dcb/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/fee05c5b25c89523ff5923b43ac3c9c009df5960/
        mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/59617a822fb2c8961881dd78a0dc8e41bdb14ede/
        mips |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/07ae8e42acf62fef99de70c8099ec5a0ca89a817/
     powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/3e7c4f25397daefe490697dda7d9709510ffa46f/
        sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/d5652daa05df1d983e14d0295d09712445fb9161/
         arm | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/f1256486bbc9cb38c9d0887138ab25cd51174494/
         arm | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/fe53b6996dde6ac6ff121da229555f8a683d7124/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6cbaf45cea7b98dacdaa7f675c136ce0a0b34f3b/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d1bbadce0a25cc63a7903704811439167d951f71/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/18e82511c5ff4b33a1f505b3d302a945f6e5c4d7/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/829083e6c8443e32389f023134cb690affed9c59/
         arc |                 yaml-cpp-0.5.1 | NOK | http://autobuild.buildroot.net/results/63f36858a4e23242a1367796c5a19f10859eb319/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/7ef651daa88f76ee0b3bf7d26e72858f84f0db91/


-- 
http://autobuild.buildroot.net
