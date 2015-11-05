From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Nov 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-04
Message-ID: <20151105073020.0C879101836@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-04
===============================

        success : 132
       failures : 56 
       timeouts : 0  
          TOTAL : 188

Classification of failures by reason
====================================

                   mplayer-1.2 | 7 
  toolchain-external-undefined | 5 
             host-gauche-0.9.4 | 5 
                  ffmpeg-2.8.1 | 3 
                    ustr-1.0.4 | 2 
                minidlna-1.1.5 | 2 
                 python3-3.4.3 | 2 
                  libv4l-1.8.1 | 2 
      host-protobuf-legal-info | 2 
                  boost-1.58.0 | 2 
                   slang-2.3.0 | 1 
                    ruby-2.2.3 | 1 
canfestival-7740ac6fdedc23e... | 1 
            shairport-sync-2.6 | 1 
                  mono-4.0.2.5 | 1 
                directfb-1.7.7 | 1 
                  ltris-1.0.19 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                  apitrace-7.0 | 1 
             host-nodejs-4.1.2 | 1 
                 libraw-0.13.4 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                openssl-1.0.2d | 1 
tstools-08f6be304040e7b8476... | 1 
           protobuf-legal-info | 1 
                mongrel2-1.9.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                 mesa3d-11.0.4 | 1 
                   ushare-1.1a | 1 
                oprofile-1.0.0 | 1 
                 mpg123-1.22.4 | 1 
                    sdl-1.2.15 | 1 
               libnspr-4.10.10 | 1 
           libfreeimage-3.17.0 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/e9c5cfe6d6da0be501873b6835803913bacc540b/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/50cbbed6341ff51941973d58763393c84c12f2f2/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/37ba482771ded07ffe11d9e3bb4c2b2bb6bb64ca/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/91a6393efe8271082ea2a5d38045a3d23796eed9/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/21a0aaa5aa1b2f2e7c850dfdd7b9bb6596fdc770/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/f9c989cd0fc67b37e4507217e600e8f358d7930a/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9a96419d6d196a861f249f90981ff4c42ff6e87b/
microblazeel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8633634651c9769e9fea0f098f09e4efc2a068b1/
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/e164329b9d4e9bf0659600ab3fd80a4fc89af5ec/
    mips64el |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/672a67088873442aa10a1c0978a77479172ccaa4/
      xtensa |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/304ed9997ef51388803c9f66b6c1d01f4ce77cf1/
         arm |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/d717a620ef161e880e2b6dd359de883414efba68/
        sh4a |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/7a2740a2107fa017a10ceb0fc5f019b554e1e92f/
         arc |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a56d6936e15d4bc84a12b86d9572d6822541bee1/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/801677365d2b08c7761c65567d8be33ae6e74955/
        sh4a |       host-protobuf-legal-info | NOK | http://autobuild.buildroot.net/results/62de5594d7588d2122c0386d66616bd4619d1596/
        bfin |       host-protobuf-legal-info | NOK | http://autobuild.buildroot.net/results/bf0412a970793f79cdfb73da4217a450e2c40a39/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/902c49d5cb327ded68077882bfafb1f196ea457b/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/33cca4106746beaa3d6e5c51d35573c02269fc23/
         arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/8311ecccf74f906ca2c37103e580a3a9fb5adeb9/
         arm |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/c32c92a034c897a056f125d3227589f908aa9767/
    mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/413c8196d4337577ea5f9f35def8c670f5eb9a49/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ee3e99984ff4ffe00602fd317237d1cbc66a9a67/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b658107652b4ab5902f4057ebe019a42a5d82e4e/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/2ffeedd8933daf4d6873971c8e0e2f57a7ee47c8/
         sh4 |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/88186e4c5491e6c87ad4903f6f70cc78b3281528/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/54a71ab915957f7157cef84b8a39aa852e99d943/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/ead81aea376b069198f647b0927db40239aa45bc/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/83a83ce179b703deb52f16570a1eda4b58a804b5/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/b0a99ff1516602ed42c0cc14d9d2922a01cdf88f/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7d06b78bcc9d1162805ef6334d3e0690b4f20127/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ee7e1055019d30a7aab6db858d6e88b11582cd0a/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c88599c536af923cc095025d5cdf44e18ada2ca4/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5e3320dfc6793a9ff0494161cdc9a3be795462c4/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/03b1b42688b07789971a99337708b4dbe4278665/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/257539ee545c430e6b8149c3ec7683e3e4a6dc7e/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b6ae86559b0df1227839ee5d20f3216f955d9874/
        i686 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/f1ba76de3600db300f027a03ab36d3a1a42551ee/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/4ad2cfff765ef7166159e801cacbad2f00d8240d/
         arm |            protobuf-legal-info | NOK | http://autobuild.buildroot.net/results/c40e9b6030584a4fd8b3e46f78f6d0702d1dc11e/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/06e7c654a10a7618c0c64c57bfd9f27e770138fc/
         arm |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/b1244c97ec451523f5cc4d87a41428b8eb696920/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/2afc25e5ded31d7ab9f8df5f40519f6382dd5889/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/076d8d3c2ec8b85da5ddf8aa5543af3c20cf07b1/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/d9c053acc310191856d2606d1bfdbc3476c9a955/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/89fa9c2ce60e28ecd0982719568764bbff2ce4a8/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ee9397bf10520455136f16fd2ff672030f0e9edc/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/771d7e470365661c5ce97435f03d17e70b97836f/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/deb3f152c9f6e0081dffbd025d3cf5b55f48ac9a/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/832dea1904991ea20f5b30ba80f8702aa6a66636/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b6072af1aba48fb441bbda45058a28aa7346695a/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/740e7caa268b68f4c1712dbfc862c7395a318ca5/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/19f3adaa1a558d8ff2c5ee8d439d06bac7513e09/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/58b4240a776dbdf70b638dab56126dd34c16f8ac/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1ea8445241a2defccf093d57c75bbf75e484289c/
         arm | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/295ee8043603bc80bceb81debba6c1a43c05ea56/


-- 
http://autobuild.buildroot.net
