From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jan 2019 08:00:33 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-29
Message-ID: <20190130070033.5B474209F9@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   2 |   0 |  17 |
   2018.11.x |  29 |   0 |   0 |  29 |
      master | 162 |  65 |   1 | 228 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
                libsquish-1.15 | 1 


Detail of failures
------------------

       sparc |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/dc9d4e4b4682ea4ff5f8cf099214269724ed13f1 |     
        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c60ec845428936cd707d4b9f3501bb9053970716 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 49
             host-grpc-v1.16.1 | 4 
                chocolate-doom | 1 
                civetweb-v1.11 | 1 
                    efl-1.21.1 | 1 
                 leveldb-v1.20 | 1 
             libgphoto2-2.5.17 | 1 
               libsigrok-0.5.1 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                     lua-5.3.5 | 1 
                    ofono-1.28 | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 
               wireshark-2.6.6 | 1 
zbar-b3b4e32b55f570372fc3af... | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/1dd1e80aa026fd0c14371ec9aba1cee87fa411ce |     
     riscv32 |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/b593deb3a5b5a98c186292b65acbe1fcb8a375d6 |     
        i586 |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/fb46683f2c5fcebba30af7af179b143badf2f453 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ca70c0cd261c12c1ccea130b09b595c66462c9d0 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0da3398d53fd6d103041a8b7b03542b754a41739 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/8a5a8503e723bfbb39e57c832f4a3e357e38b8b4 |     
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b325d46c25674567ab587d230cd69833b52f1f44 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3d1df007240bf421efaa8b9cea104c414d853483 |     
  aarch64_be |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f8e0399ae74ec15c80036428322d0a64ee182753 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c4f4dedfac07fecc2fcbc2e67bacb61d0e650a35 |     
   powerpc64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/00f1f179cd1d660ec7e0e53789198244046f3211 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/7d4531f450fc7ba201da784cdb0f5c283a5a6df6 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/09ba3dd1cc3ff67dcd8f3c057b633757c7c979d0 |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/35cb0bf9db80566ff267378583e58fd7a7b213c2 |     
        m68k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/32247d3c956fa2e26485876c0a85073168bd5352 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/923f9fde07803aafdf0c3eac4db726f5a777c244 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/db96758c011ee628dadb3a2470fd3b7c02d8d85e |     
        i686 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/820df8a1afc6fcd2827a91423490eb68edd41b03 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/83ab6c086e7441bad0817790dad741b3d6f4d823 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f3eaaff9e55ca7c75fe7094547dc2394b1288849 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a8127a93796c45c20ba399051afeb00808466230 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/a5fe2029abe3465992fd6ab323ed0b76adb92bf2 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d8b662a1a0ad96010e916d3148bb922cc1ca515a |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b4025bfebf36b37f197fab774a5b7d74f2bb2192 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/fb1d541eb4845caafc8e9d0bac5162cbace6a191 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e2a7bf0d9b91938149a85f4b23cf5685cdd41cb2 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/00872752c1c779f776432d09bcdc03d6d33b85f8 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0b0cd39e1bd9e9d20414340c25eca46d2ad47266 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ebdc13287d4d78b516368cdf3c4b44b107a204c6 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/673e9ba77719c979931d4291084963cbed79fab0 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/050e9d1c1a49afc1cea675e6f1ce44ff701c7828 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b8b05e6ba5e7b78dbd9920dd527c2567913a466e |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f94f5f3185948edca86d5c34a88ac8f7af454f38 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/67a82bd0e757960e2d934f470a324f51946f56b9 |     
        mips |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/1ec9279cd0c7a3b6fac7eb9878159c3ad28811a2 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b7b4e5065d2d4aa2f62658ab219a6586f34fcb65 |     
      xtensa |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ab0028268b5bb2ccd05f0b96f94f612c94727655 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d72c4915d2f4ce092b4600f2853b152054733155 |     
     riscv64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3d40bfd183341645ab81f81a264449e1c8a83b2e |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/7c50f810207900b8edb03a6df1f6e4610aae9283 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c397ec8ad07c66dc77539afc44e311e96f926bbf |     
      xtensa |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b3c0af066a897fcf72b3018553135f0f39b1c6e4 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ba9b9baa945b51b231f1cff6630a45bbd71a3352 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/760e17cc518c486f72d8f591cc4ab5178df180d3 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/b3463c435b289e630ce4d4c685b4c91f15a6e448 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/20054524d64d4a7d9d436498dd5eeb68203c75ad |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ac657dfad3ad4cd976dcf3cd42038326d42fa819 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/156d1fa8ca0e9f787a38a38a315a313d930ec4c5 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e26b93d772747276fb77872b4365eb88e2b4efff |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c1a6a003a69ac38f2b6f8172ecc77e2c1615bf61 |     
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/00f319723f0057f68f497f7632d61c100aeead48 |     
 powerpc64le |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/bce441523ea3699cff84d459c9084a2ffd4cf35e |     
     sparc64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/10fd13cef3389b0c88f85572911a01279407516e |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7ec686d7b73886f01fba6a8ad690e6149113aeb7 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/a61dd5e2eda71065d2a892843d4f2ea900a6688c |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/52911efd3380bfa5e20c2e37dedb5ecbf472dde3 |     
    mips64el |                  leveldb-v1.20 | NOK | http://autobuild.buildroot.net/results/9c33692aa130a20b0f8e868156e49990e862d6ee |     
     riscv32 |              libgphoto2-2.5.17 | NOK | http://autobuild.buildroot.net/results/f646154dc6de70831abfcf15977f34372e07dab0 |     
     riscv32 |                libsigrok-0.5.1 | NOK | http://autobuild.buildroot.net/results/0af9aff037a29e50340ffef98d1582a29e34b62e |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/84983859f332805254189e079f04ec7f72f3e3b7 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/8cd62d236f55ecd1ed2efc0273ad0752e5e20069 |     
      xtensa |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/ca763e9c6f50c001e478211c6396d62f77f859b2 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/31fc8a1d6e0e4a8cc117aa57d1f3795f79231c8a | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/fb89880d84ad88dd46741f281e11d26a8d9130c5 |     
       sparc |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/f5f4d363fc0d3d3b005055780fb655641a77ad03 | ORPH
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/62bebc22673e868a72480d5bc4f0d9107d87dd45 |     


-- 
http://autobuild.buildroot.net
