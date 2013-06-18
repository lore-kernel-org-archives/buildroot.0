From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-17
Message-ID: <20130618063004.6F7D452C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-17
===============================

        success : 110
       failures : 80 
       timeouts : 0  
          TOTAL : 190

Classification of failures by reason
====================================

            host-erlang-R15B01 | 16
        host-dosfstools-3.0.20 | 11
                 libffi-3.0.13 | 7 
               libglib2-2.36.1 | 6 
                  connman-1.12 | 2 
               openswan-2.6.39 | 2 
                 libiconv-1.14 | 2 
          host-protobuf-c-0.15 | 2 
                 qt5base-5.0.2 | 2 
                 libnspr-4.9.6 | 2 
                  poco-1.4.6p1 | 1 
                    fbgrab-1.0 | 1 
             util-linux-2.22.2 | 1 
                   cups-1.3.11 | 1 
                 cairo-1.12.10 | 1 
               libgtk2-2.24.18 | 1 
                libiscsi-1.6.0 | 1 
               qt5webkit-5.0.2 | 1 
                 ffmpeg-0.8.12 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                poppler-0.22.3 | 1 
                   exfat-1.0.1 | 1 
                   ortp-0.20.0 | 1 
                     pcre-8.33 | 1 
               aircrack-ng-1.1 | 1 
                libcurl-7.28.1 | 1 
                   icu-4.8.1.1 | 1 
              e2fsprogs-1.42.7 | 1 
                      udev-182 | 1 
                libtirpc-0.2.2 | 1 
                     m4-1.4.16 | 1 
                  avahi-0.6.31 | 1 
               audiofile-0.3.6 | 1 
                      gpsd-3.9 | 1 
                  sysklogd-1.5 | 1 
                directfb-1.6.3 | 1 
               linknx-0.0.1.30 | 1 
                  bcusdk-0.0.5 | 1 

Detail of failures
===================

    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/323f2a20dae313cb20c12e7df4e69826344b91f4/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/865764bc83654bca0dbf66543ecb1aecc98ba741/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/7d24c78b58f96aabb33541c604ac569803d0b5d8/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/f835655a59b8817290098647d48529ef35882c65/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6d119ab64fb76f53773c4c9810a2c7f1ea77ab6b/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/ea0a3a39534ddb6adbc6538d39fc03284a70403e/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/c55e912749ac7a2628bd6dafbe00f44736e68ece/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ad60aaaa9e09798bf3025e481c202aa79706466e/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/17a8890ae00f3e6699fc19e1bb676890811affc6/
       arc |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/7675815307a48137943d268055f139f8a96c3975/
       arc |                    exfat-1.0.1 | NOK | http://autobuild.buildroot.net/results/eb28bc718b52537517e5cdc9e46982f6a749f9a8/
       arc |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/417d2cd0ab676809be87acd36d5a1ed464bb7526/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/52aea60ce3148ab29f3d933a5a14f0aca06500f8/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/edcb8dc835ee1f80f8b04f7f53469e0a1326d704/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6034f8b74db7b37d353f4c8a9f05c5b45470798a/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/c7716f9d8e3b8fd26039344ece81687c17adcf4d/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ed9ae41a55511236fd72af1270845882209dfa15/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/b973fcc9acb801662dddbfeba970a9ad5e2cedb7/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/492fccdae1139314dc9f7dcd9f181dc00a3a29b6/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/f79b18584d59aecc7ebddcc6c8d65255ecdff946/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/88fda9a06af0c807a64905b5c6b7411dc1eeca46/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/99e71f4b4ac78899329d6e840b1ca746cd4694e4/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/1de5ed79a1e5b762c2a5fb3f064fa47ab1117189/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/3a374171befe9ddc3655fa0009ef0a07c66d0253/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/c7a1983e46a0200fe0c792d6be61257c3ab0d105/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e52a0b59074d3aeb9abe35da16f3160cce5a0247/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3c72da89e885cbc83dcde9f6f34e5f0b3d850006/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b22dbece47c0eccfcfaab7863111688ef5583ab5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b80b3bef7bd602ae4ffd1a192a152b2ffaaf22a1/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/2c7b2d58dcd5539f173664c224f0d89a69dae27e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/4c48fb635e33b9096bb140549a23b6f7825e686f/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/d59d150bf7a1904c7f0f258f7a804a6333f9542c/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/4045360846142141fccb36530f5420c567a4d0d3/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/6052762657fe5e67c4ab18627c9bede491e9c3a7/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/008570fa9c0f1e1c847f303e007683a7423d312c/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/379a5cea5949ea024ac0286985aff20bb11fd10e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/37c7caad6b709e40eb5a517bf018c7a74cc32c34/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8cd3d86e36787c35fa07da790bdab3c056fe984e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/2c4a807cdf7f3465519681caac7e823a6a224dbf/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/6956d5e15399c0c72dd2356420d2457b44bfdb2a/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/a249e2a64449714910a42b1ecd0de734531b229c/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/63fd8fc705cb7d75c554e28be9b1d9cb570faff9/
    xtensa |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a3b8ec40247455b37a05c4a65f376353ac025416/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/70a1864e1b68207edd2eccba77bf29371c40f7b5/
  mips64el |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/6e9e5a2ed83899c29278889d885f2c7a8af26e09/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6245e1333cadd3a75663b80fc372abf037b14bfe/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1e918e0e78aebc60a142ecbca8bd90875b41a0eb/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c9b691d3968f5cf7db62d453a9158fdd0d9954bf/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d530728aed2cdf865e7e636b6be86e4c89efd65c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ba1907670fdfae540de445e2dc4aa447afb3ee8a/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/93a7a8ca0b7b83524579530db9a674eb893a54d7/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/35969937485087075e394e12b90a839c8f7bed34/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/02a165058792165b1253d827eb2f64550bcef5e4/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/889dbe931e72ac127e4c4112bb11dc919f0c7e5d/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/5e8f3513696c957c7bb85f4ce51a97d795e622d1/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/1677d97e901ce5b1466f24f9ac88f117b65e135c/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/42ef79f5798771443bf3353d25b1c2f47949c1f7/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/2be8232a1053372135a296079e5fb1aef3f012cd/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/0ba2f82ead71510a9daa19c1751c17787a307d2c/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/85fecf425c115370c18fd9c2eb675fbb303a0077/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/e59db191e8bd5f276bc48afe271b9de80b5b5297/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/853215c5b52222e7bd8954b2bf468f576976e61b/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4777846f0fe37f54dce69a2361605dc1498fdd25/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/63435868b667adb7a3c881c28929ed4514e81a61/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/6da0d7b8163b890cb0bfd180cab138bbb5673cc8/
  mips64el |                linknx-0.0.1.30 | NOK | http://autobuild.buildroot.net/results/5931ffd7b810795029f9a98f3055732f6133b4b4/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/e19619bb04467f0c2a87858385b0fde1a5312ea0/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/48528a6a51a5fb2fe58b29ef3568b8a793f1ca48/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/46a8bc0365e037a78fa2f86cffec677f0d4f34c5/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/483007bd5cacec532ce5b5e1ed7d3876cb28d873/
      i586 |                    ortp-0.20.0 | NOK | http://autobuild.buildroot.net/results/d170648d07e6441c5b4be3ce9f318ce67366f8c1/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/0a0da2b6b16423d3d720287269411f07fabdab19/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/e55c74e783efb485ac707e7236400a96b7514d83/
       arc |                 poppler-0.22.3 | NOK | http://autobuild.buildroot.net/results/71db88347c353aa55d4101a7110d104972690a36/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6356b50703dfa1df343b56d9c7b1dd90d1099fcd/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/671c2e9d51960cec8a7dc94208df34af300825b9/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/6c9c4dee266ab306b6a5b28a59a5d39c389772c2/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/306c00167e3833043fffa2da2b62e1ac9f6bf67e/
       arm |                       udev-182 | NOK | http://autobuild.buildroot.net/results/304f1c4fbf49b700e34117070c9386c4470ccb69/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/800a2b4cace7b38aa2a9c7d424bd7344582154ea/


-- 
http://autobuild.buildroot.net
