From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-07
Message-ID: <20131208073009.673C5101507@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-07
===============================

        success : 74 
       failures : 63 
       timeouts : 3  
          TOTAL : 140

Classification of failures by reason
====================================

gpsd-327a3ef7c83c1b3b2cf7cd... | 26
                      opus-1.1 | 20
                       unknown | 3 
                     m4-1.4.17 | 3 
                  nettle-2.7.1 | 2 
                 ffmpeg-0.8.15 | 2 
                 libpfm4-4.3.0 | 1 
                 distcc-2.18.3 | 1 
                      icu-51.2 | 1 
                openssl-1.0.1e | 1 
                elfutils-0.155 | 1 
                     lua-5.1.5 | 1 
  toolchain-external-undefined | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
                aiccu-20070115 | 1 
               alsa-lib-1.0.26 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c999157f08360c34fbf66f46313beec47c67a9fa/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9861991807142422bc818fdaf128710c112d5bfe/
       arm |                  distcc-2.18.3 | NOK | http://autobuild.buildroot.net/results/5daafe5e216e132d9e51e9e583395d0de3be4a6f/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/24471c96780d7b44cc331ee82c83c0dad7040190/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/20f5e5788b735d14c0bce9b6a2b8e80c55d794f1/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/3dcd47804135b50c91ddca13f21fe23468b355f4/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/769cf2b7807734477f67781212c32386fafdc651/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/dfdcf02a13c4e9b9c9ab544ac86337e4eab4e7e5/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/9caea3dc0f8e282174fb1c149b1e6abebf1e2032/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/573d2c54d4d67c942cc213d91379ec91a842ec7c/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/1fcab6ca1e8a08a5c93a5e5e0ae4e084a40de48a/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/5a66b93b45f871b6d32ba6fc85edd78b23fac14e/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/0c5c402f598dd86e6662d37c07dc0666ab72a096/
    mipsel | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/61d3709818f4b6ac53fc0adfa219a068db5c48a8/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/673ce6dbfb30f1bfa98b11557e451e50a96efad4/
     nios2 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/a15ae41506be5583e6c5a71116b116adb0399dee/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/83800c5e2aaf6f64aeba01638500c9589db71290/
    x86_64 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/9f2e5c5600d877a979598fd7330a91d597cc11fe/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/584c59ea0f536e277c2a515a7c47cd1a371da76c/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/5919ed2ff224ab5fee712d01a43347fd74d8e037/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/d0015a849829bf293ab471c14bfbd72fa2bd3926/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/e3f82ebeaeb66155c72b52ff72d550b506db38e8/
  mips64el | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/dd4e4c0137952d338b96a15c9e2fdc8b6f1b1e10/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/d3c2a0eb0fcc6bbbaf1cfe01ef79ebc62b21dca3/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/7cbaa55653e7544f46174b7459083c8be5d3a86c/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/a02dc675b9ce543a31d2af1f8f1c5eaac5df6224/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/e465634d56f5aeb22b11f5be8b6d3c12b1da89ac/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/f6ce06f56ce3bc815c4ac23e0851fe8a9f40726a/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/2e31e5a938a101c9cd6d8d166698ff99131233d3/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/66fd7fe1f717f4351ae2d3d64af60205b5c93d12/
      i686 | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/fa76dc97bfc8d64e6a4cc5f3d698475725a05f7d/
       arm | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/900052726b8fa3b5f5f787140f8c927cd8f098ca/
   powerpc | gpsd-327a3ef7c83c1b3b2cf7cd... | NOK | http://autobuild.buildroot.net/results/3840cc2298cb500148d5c54ea78b0ce5249111bc/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7af4d4ea53754d436c595a6c7d1f82341b509d45/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/2de83bb2984ff25d6e17fa5ce1a26f66b1a32035/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/d8c1374db9f88f582d10e7b16cd93adbbd4e24db/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/e27a78ca020852a82a381ae935c7f46f72f095ec/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/8b20962e5176ba44f9b2ceb98bcdc073d63187db/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/85a643fd340261c332f903a889479cb09f7c756f/
      i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e07326ce18e9b316ece642592fb0ae36b29486a1/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/57d2c7ad84bcd52deb5b6fbec29b5ab78b22c7a4/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/bdb894a3feed1a385cf827f8ed70861d0f002fc4/
    x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/20de860c40c23d0524db7a2d2197a9f29a733e76/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/7a1273b83395aaca73acdd2e935bf168c8725ae4/
    x86_64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/1052fc109b8bf02f0f8a6b05756b1c1c8ae2870a/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/baa179b29f92ab032c0677941b4264260cebb150/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/8613ee474e584085b6d562380fa0aa284715b852/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/7adade2ee92d680359a43fa53614acd399d5e206/
      i686 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/ce6a6d7bb53499e1d79af2a84587f165a84dd087/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/52197cfd5e02c20cb8428eb3d39fc4d031f48c1b/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/575df1f609b8c49b50bef94a8f9d2e039c7bf9b2/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/0b32bc0d76a4ab67961db37949421ce324142b99/
   powerpc |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/c6b352f0e10ee810ebb8dd65ac924b4d29cbf6d9/
      mips |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/d4b82c1bcc16c82324270afae6cd40bc0bf4ade2/
  mips64el |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/0799764280d5742c9b47b5f71ad4d971e17a2cf8/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/c86ef168cb07c9b837119ac3fac16e37281fd68e/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/a6b137f0658a9e653cc1cab67694da94975a6e56/
    xtensa |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/d7b917500465a30535dffcf06cc579dae7256189/
    mipsel |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/8cb84813bdae757da728e1229ed2d337d1f5fa50/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/a2eaa2e5e5a74fd1f0e2b10deb51ee4c2e6f5058/
       arm |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/cddf1cdda4b50ddf6f784f61274db1ab0110c973/
   aarch64 |                       opus-1.1 | NOK | http://autobuild.buildroot.net/results/15a156f4200e6b98c6b4ca8f1e9ba0f5de163c93/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/806134a63dbcbba55744a1d073c8b684eb9b33c0/
   aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/df965f703137df54b4ad6dc3ff0bd97095ea34a8/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/7a41f4211922f86176ff38a76ad13021d06a8212/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/9b9041fd272bc54ebaf6252cceefa900b6109267/


-- 
http://autobuild.buildroot.net
