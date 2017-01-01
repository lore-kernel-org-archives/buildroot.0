From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jan 2017 08:29:45 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-31
Message-ID: <20170101072945.42C2D2076A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-31
================================

      successes : 182
       failures : 94 
       timeouts : 0  
          TOTAL : 276

Classification of failures by reason
====================================

                collectd-5.7.0 | 32
               libglib2-2.50.2 | 12
                       kmod-23 | 6 
               sdl2_ttf-2.0.14 | 6 
                 gnutls-3.4.17 | 3 
libasplib-f7219142e790a329b... | 3 
            lttng-libust-2.9.0 | 3 
               domoticz-3.5877 | 2 
                    git-2.11.0 | 2 
             host-nodejs-6.9.2 | 2 
             libsidplay2-2.1.1 | 2 
               qt5webkit-5.6.2 | 2 
               skalibs-2.4.0.2 | 2 
                espeak-1.48.04 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  lcdapi-v0.10 | 1 
make[1]: *** wait: No child... | 1 
                   open2300-12 | 1 
                 openssh-7.4p1 | 1 
               openswan-2.6.46 | 1 
                   perl-5.22.2 | 1 
                poppler-0.50.0 | 1 
                    qemu-2.7.0 | 1 
                   redis-3.2.6 | 1 
                rsyslog-8.22.0 | 1 
                    ruby-2.3.3 | 1 
                    sdl2-2.0.5 | 1 
                   slang-2.3.0 | 1 
               tcpreplay-4.1.2 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/523bfd527a939bfa2bc8610dc3b3f20cddbd72a5
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/af2720185cdcf2b9b78dee7657d4c49edd240418
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c0f489dd9649c82b706698eea7113a249395fd4f
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/26410a6fbbd3dbe2438517aa92ab73f3eb550ce0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/15c9e9ee508485e8ec711f2e1d9919078c0cba57
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a93e0d848e03f2cf0c0e0b5203e6fd4b2224c643
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2a60a8761a5d5e904820970de5a6a7d3c73980e2
        i586 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/191f0d85443c27cce5663e357e48e7980e6ce146
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d3a471d4bfc652cb075a8cd3f19c8373f5ebea4b
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/84a770d6b001b3bd790c97d4d185d20bd95210df
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/51b85739b99f57898e10d0283412f51051ab887c
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/eb1cb81d3c5db926db2acbe9daf787e481402d65
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3197aef9d143f77e52e045217d454b5a86177bd2
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/899d8f4cb6463ae2db9fc1c150233887c597aac8
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/98242bd0fd9a2e3302c5c21f2ebeabdd0de18a3a
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/daca81d6997b3efda5ab7560481fbf621e05c0f7
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c699c9193be3d22036742d10d7e5161164ccadaa
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9d33241ea4b5c238169e8864a3bd0e524812e4b4
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/421ee2b6c48d87a3c3e5de02a681099689f657b3
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5e2fb2f5bbf528a458ec6b045a99f10a70499962
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2b39078b6c4dd6d35268b532b50f1aa9e440bb48
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c0a5c2fb4e3ea4ed2c468ff701f4dc43c154ac07
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bb14fdfd38a15d7b8baae251082581a4a3277d1a
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/17bf3de6d67244d341e742aaf2b55ecb3af64c9d
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/76d94ea8275f6d3f867bfb242bc23def8c240cef
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ad48a8907d903bb142d1f386b51084f6835a7d3d
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/173a1781ab38b4eaed0be7e5053633dd4d948ba1
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7ddb024fa4400cb658d90755b4f1411c7824d6be
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d10f8aec0b4963ecb751bc8982aa3e82c122f3c6
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/6817153b68685249a099ad1919552af3cfd5a6dd
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e930116f7d4db56c741549dbd2bea39de032540e
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/da6f0c3e4b4b6b9c07d67650eada677e49499647
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/d7636e7ce244d5fa47b3bc90e076fa7abba8270c
        i586 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/a3c30ebc216895cc472c1e3270c43facafe210aa
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/8ddf7914edbc4dc6704f44e7e1403e71ca34f018
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/99461dc1587053ae75e54d739b13a47ac55ad46b
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/80630b97ce8db04822e88c4d747d627e1e56b07c
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/a33f96f28863f095ba7428a8dabd896d71488d16
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/55877aabafa64deae06ce92c5c08c8987fd3e332
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/7bbf1b28ecbb62c9f8bd03165c87635c4cb242ed
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/35efd85aac6f117e15ad148bd4bbbc1ef311f31d
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/e89dd6693c65f9e028f9b3294b66fb7541fd6acd
      xtensa |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/7c11710ae073b973eb951f21e0837113f3831da7
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/8ce3dcabf790efce80f40947c06e7a9086af6cb4
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/77b9e050d010ae9dae5ff8462e330e4fbeef7d08
         arm |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/613d9984f23f894ea46d8e5dc0dd93ddc5017a64
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/a9371b03738cf84990760e2e4e1b32283573af8b
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/2ab7fa9851ac82d1fdd597303c38ddc14c5277b4
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/702d41b79c36016abe3a9a06a99600ccba1b1071
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/ad8ea85a77f3a9f115addecaa240a65cef21727f
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/141dad2f461bfef0fec99b5332a68dc5cb168c82
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/a4ca5c01e0b6931e5cadfdaadd286b5da9e8bccb
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/b82ef72412a05455f9cef83cdd02ee29fec19f89
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d43f9a8c41d9ad6d2faa0a7082146561fecbb63e
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/13519909762cdcd725c7eff10c49bff9afe7fd28
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f1d0dd7fffdecccf2e12bd0e31b7b384d5912b45
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5efb8fc951388c0b61b4ec98588609d428c0b9f8
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b52072b040183431b5edb38f175baa1ee25ece12
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/4635ce0d24b631bffa5b06bac4ac2bab075acd2a
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6edfb7262d1289ffefdecdecc6349f8e91cc132b
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d3dfb8a42de92e906aabc01491608802260910c7
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f7fe8db891189584053c79f72172107b0d990317
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b80cb8181dd527e6c0c17f935a835620e12c041c
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8b11e28ea8bffb81cc69694344350cee04343976
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/101c5a97be1386504d2e8b14e0c61213f151fde0
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/2d7655896331e2d98ad94ec0a0de4d0ee2727525
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/e0176b2cdce056ab94fb74f63e843a3156929cef
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/7a54483cd944249f9ce896a3d3d120e43a0d24ee
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/26f48091df6b6f713076da3d5d0f76878c316571
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8ca0e9941556b7e960d830a2767902a3daffd12c
        i586 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/5e0209d91a0c5e81e46d39381fa4bf01eec73a9d
        bfin |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7f8cc293554100ecabf8b76ea62e27524f1ea05d
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/b5e77934e760402b019ec6ed6d13f0e1420bc54a
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1eb58a60397b46ab99a9ee662f2e161b26cdaac2
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/4a19c3fc0d9fed974f7d751aa19a0c5096ca32fa
         arm |                 poppler-0.50.0 | NOK | http://autobuild.buildroot.net/results/b7fefab86ae0db9ce9c7bcfaa68d6b2d50382bec
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/05034530b6f555d86816b37303111122885718a9
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/dc2ef9421382d6f68097d66bf625e3a629fc5221
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/3be7b05842009b1c8048f873b183734c47985b84
       sparc |                    redis-3.2.6 | NOK | http://autobuild.buildroot.net/results/c0b1bdcc5fbddf8b996b923015184d753882d4b8
microblazeel |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/fc995ed70025c95522c1d96c1f68d8f5324bd2bc
        i586 |                     ruby-2.3.3 | NOK | http://autobuild.buildroot.net/results/438f51af233d5d28629c5b191f8b2e4cc087d3ca
        bfin |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/2f738830bf98eb7284f99c11856a8694467b3daa
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/722c3bb41de7bbdb6f7b22d97ae6bd5c1c2f74b8
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/fcacbf46f831d57532422959eb87210a7228bb82
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5578ad9713810ffa63a02d1758ccce7b05bf91bb
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/d207bd8a4ba3e1052de55c2501503a91d8b960f4
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/988b669ffef9f048627dac1e491e21247b7f08da
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/0effd1866b334bffeb7a06fa9193d80da9958d88
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/e7349fab3b479c6a3a9247987e82c0e750ab1be3
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/c9049535244da2276aa3439e3e1be993a4e972fa
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/64db5149a9d1400f789201bba3ce2d0fd2ee7430
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/1ab2543ccf491078d3530fb8bafdbc3a77844686
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/e33a872d1f6220250e6283698b64d8810863822e

-- 
http://autobuild.buildroot.net
