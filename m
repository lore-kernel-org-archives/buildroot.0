From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-06
Message-ID: <20131207073008.BD3611004D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-06
===============================

        success : 69 
       failures : 83 
       timeouts : 0  
          TOTAL : 152

Classification of failures by reason
====================================

gpsd-327a3ef7c83c1b3b2cf7cd... | 21
                      opus-1.1 | 13
                 libevas-1.7.7 | 12
             xlib_libXft-2.3.1 | 9 
            host-libevas-1.7.7 | 4 
                     gpsd-3.10 | 3 
                    fbgrab-1.2 | 2 
                openssl-1.0.1e | 2 
                 lvm2-2.02.103 | 1 
             dmraid-1.0.0.rc15 | 1 
                 mplayer-1.1.1 | 1 
                 rt-tests-0.83 | 1 
                directfb-1.6.3 | 1 
                  sawman-1.6.3 | 1 
             util-linux-2.23.2 | 1 
                 distcc-2.18.3 | 1 
                  iozone-3_414 | 1 
         dvb-apps-be76da69f250 | 1 
               libglib2-2.36.3 | 1 
                  libeet-1.7.7 | 1 
                sqlite-3080100 | 1 
                    php-5.3.27 | 1 
                 binutils-2.21 | 1 
                lmbench-3.0-a9 | 1 
    trace-cmd-trace-cmd-v2.2.1 | 1 

Detail of failures
===================

     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/8bdb02db27d0b47219adf517c33b614cd28acd79/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2d1eed7960d1736f20c7affbb0d5b2229c48b5de/
       arm |                  distcc-2.18.3 | NOK | http://autobuild.buildroot.net/results/e7107050bf5fad66012523467f8ec1f6f0fbfc22/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/02c007eb094ffb00009fe1eb98a535e334ea8b1d/
      bfin |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/e84a7daa51ce0a4f807d29905711d802e1088bbf/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/c5b016d16ab5941fd31d79cf6def3e49f1150eb4/
       arm |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/7227d7a3f0d308ecb56dd1cd937bf97f97cc0c2b/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/468efa55f3315ad0389a78c570a73c57a15b874e/
      mips |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/41ebcaf4fca90e4a1524a9a873f5b297b6f046aa/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/e0fb4736ac08b18565df98c44f1a403889c39b72/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/c583c4ce26ecf08b9c387f33a1ac721d913db05c/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/6c9fd71fd0df84fdbf7585efb3c3586271e7754d/
   aarch64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/14046e3942a8dd7aa481fbc53da9d16815ad7df2/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/640a8c4db5e5843191962a0cf579755c6a069be3/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/053cdc4ba6f0eeab7a8283ab26d8c3cca4bb7911/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/4db28ba1fe00aea56029357963cfcabd9c3ef8e8/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/d9092e218006b524f018e9ae5e6d504d6bad1f8b/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/d577d2a994a24c758a28094c81c3c8fe0a050231/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/317e8052256147e7a22e7cf6a30975427de39abd/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/abc799ab8a8cb121766938aa65bf5d109e77f37e/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/1cfb11e712aab02e177268405c13da7f2b11945c/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/83c7e435b806169ee5ef2a85c105fd1dd1fe06fd/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/1f770643abe29ea011032b75d4f32c784bcca414/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/44c6da5365dc8135a0cf3952841fd992c87cbc7b/
  mips64el | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/5bd7eae7af1c9835480a81e2835ea9eeb746ad60/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/251f07a8ca7196693dc168185eb81b61170c98c0/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/14c4b7092e7a69f1a92dc4d3b42537082fae719f/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/f08e3f625be2496f070fe5cd53ab12ce45b16d3f/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/a10b4a7eccdb922799b95cfa7149d8d0baa83627/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/f5d2cba5368696c84bb4ef1127fdcf733a1f8dd7/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/5924dbed2c0b7aa45320fac8f98a78b08bc682fe/
   powerpc |             host-libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/305cb08e2f46626209cd32f6c5974c8dde7031df/
      i686 |             host-libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ab96e384a4da836d99244bb4c8ffef9b8d323501/
    x86_64 |             host-libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/261d6a59f144e44e51b38de98a7355a9eb8ac791/
      i686 |             host-libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6b536806656fe77eadf80d8a776bc64fc09f9baf/
       arc |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ceb6b37a24a0d59eb8d84251196a267896f3ca3a/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/53e1a512805855b0b0abf4255aeddb738f250ef4/
      i686 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ccb4500dbd401dc8546de490b4e4171e667028a7/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6b5089823df498b1e6f7deff16b276dd87a639f7/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/687bdd11b0faecef71561f5c5b8818dde8c43fa0/
      i686 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/84938dc0f08dbab6d8224c26ff40048aa69e24d3/
      i686 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/64cc8467eeb44f741aeb42bf1a0c77edbfbd285f/
   powerpc |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/833c9025cc83ae030908cb0048f9d0b25f320c3c/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/f00a5865c33422428445a569311ffdfce8659d3b/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6301c71d1d8f632cfd7f9389585311723046a00d/
   powerpc |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6b61427359030e1f2779b3341313f9e6d9353bce/
   powerpc |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/b6791feaf9c56a76a48c575bd394bc20cd8e6733/
      i686 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/745899b3a9575d446c1c58036fc92fb6539b1b42/
      i686 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/c5e81737f89b893d42edf30563cc6b22f7fe3edf/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b8e365a592a8bd846fbedc0b17ff4ff9611ba102/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/41ce02b22c3366492d4de9d4841e1b96c88b4c09/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b9e7ec52c7d0538b3616ee3e4e797feb9870891a/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/c3ff358695f17aaf2c9365c6151a42ff2a6e3453/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/c41aedd88ccfe58130cdbaa7c79dfb9bc9076e4d/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8d26fabd4ff0dc0d713ebce02e2d7658eefb0f03/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/0c85c712714618738a55b92bfa4ab85cbd3013c1/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/ba8e26fb7a09f53f10adc2b52e18706c6c76615c/
    x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/5f84e5dd7b4fbe00da42315429d3bd2fdf6a52a0/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/8d58e8a02b6f736fc7c65c066c7d0dfead3613fd/
  mips64el |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/d5760cd60db3aa81c82ccba86039144aff71dd3b/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/836eb795ebd2e4605cdfe65ea3136e0250d7f641/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/08dc34dcbdd35f5c00cb9d04a0d41d11eda2ed06/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/8844f01560489d36af09644c1e4e406495fe157b/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/08a74ff55ba732929d954d70d428a110119536f3/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/40754d16743c934078e5c0d0bc8f173239cc073b/
      mips |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/d940dd0e1aafda1745e83a196be762fcb8c88689/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/0710a5c3d6fa94262ddcddbacdfbeb756b1b0072/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/6c17d21a4f8293bd501ee66eb49d3a27b65fd6b9/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/56348c417a97016dcab0d4dced6372699fccaa13/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/932257aee91541670b150888984678fd460fc09e/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/3b0ed08acf6ea072ec40bd42ebb7da8c8cef47a2/
       arc |                 sqlite-3080100 | NOK | http://autobuild.buildroot.net/results/d0ca0dba3a17e53b5e6716b353a4e8aa19c5e26f/
      bfin |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0b73c684b3d7edcd818cb113fda534e552028d58/
     nios2 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/58bb5495a699f1555ca41954892c2272b396533e/
   powerpc |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/e893e2deba36a991803f6b720beec96bf513981c/
   powerpc |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/e1591673c6bb7cda228708f2bc3caf4d0750a3b0/
       arm |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/ee73b2faef22f138a802259bae1515546b912780/
   powerpc |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/708fa7423c83e22a51854f1abca0f3358506a318/
       arm |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/eee714353f80c25e20ad8d7d923fb01d5cf53b96/
      i686 |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/77beb0b26ebe3510fd9df2d8cc48ee625782bc86/
      i686 |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/fdf7a97856f89e1bccc2c8619bf1306517204b91/
       arm |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/9e63912471ae3a7431af9332d95cf8030266279e/
      i686 |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/c83801af637f243520cbaa691a7f75c1d2c7173d/


-- 
http://autobuild.buildroot.net
