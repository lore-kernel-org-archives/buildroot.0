From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 08 Apr 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-07
Message-ID: <20190408060133.178E623018@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  52 |   1 |   3 |  56 |
      master | 199 | 310 |   5 | 514 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.4 | 242
                host-mpc-1.0.3 | 28
host-gcc-final-arc-2018.09-... | 11
                gerbera-v1.3.1 | 6 
                   netsurf-3.8 | 6 
                host-go-1.12.1 | 4 
                       netsurf | 4 
                  ffmpeg-4.1.3 | 2 
                   netsnmp-5.8 | 2 
                 python3-3.7.2 | 2 
                  brotli-1.0.7 | 1 
                civetweb-v1.11 | 1 
             dbus-python-1.2.8 | 1 
                     gdb-8.1.1 | 1 
                    postgresql | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
  vdr-plugin-vnsiserver-v1.5.2 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/036f605246e42d2fab0bd76bd798ebc7769c1f3f |     
       sparc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c |     
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/aa05508fe87ce869058bfa4dd50d24548c42589a | ORPH
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/021568f0120eb0241ea1413e56beeea28989d750 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/fa54cbedb5be5b6e526a8f4cc5fa43d09687aabc |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/c31c09ff5df10f98809c0c76fc62a959aac9a468 | ORPH
         arm |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/bc46d49c128204b5a109f99140824d928588a091 |     
         arm |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/2ac6f09937c30e9bc9cb010c986d3288cd5f55fd |     
      xtensa |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/d4af0a277dc293ab0f9d7b4e1dd801fd6d00f2d7 |     
 powerpc64le |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/4b2a271f191739a0a81413f5f10b73cbbe3bc763 |     
        i686 |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/ec20da2d68d88002ece4b1b8038a22d0e9ced7bd |     
     riscv32 |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/92b30748e0fcd12f7e5ffcfeeb25a9a18cafc588 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/f861708a6fe875c880a09e3da59d058f43ba6479 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5a2ed8a0cee205ddaa138dfddfab35c63c4dac68 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/734f3a97276e301b5c4bcd4e905abb189b680dff |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/b9e336851f969cceb44f5293450e792edea7f0a1 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/c3b17d41574ef6679ab394e8513c17bedfd0c3de |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/450aef30e3e9e9d12b7672022b9992bf8c898425 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/532e1341ca133f7472ab20cf073d2e93c66c8e91 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/400e8105976e41acf08639a4da7866983e53141f |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/51867f997540f9e4a51314032fc350b775d1ed93 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/0248f1514087c01d0b816b02a63db8ef9effbda4 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/182c741c629d8b6c096689ca8539dccf1a2e882c |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/350b5c33f1216b3fec307c7dab9ad22129f05082 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/8e30170d192aaba982d540eef7caede7afb02eb3 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/0116f36fda13bb8302d97be0219c2630232b25b4 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/aaa50a780160717c4e18ac80c52693f66fb6d778 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fb736530fb0b9ea0d06925cd8cb38371eded65fd |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6f5a7012692885f8e1596849065020f387d07e0c |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b859afed30347bb65bf86d43316b2a5905f1baea |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4950dbf4858f6d34e18ed74ae971e4be9d262b4e |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/35cdaa4c92dc29ee2a96e1d8ac21e76d16ecda66 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2aff7bc93200a18bb298773b0a2a391523b7fe6c |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/43be22e4f9a29263eddd9e841b8d52c664b08aa9 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/eca9aa5286169474297fefeb2db5d7d7dc8aec86 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68ebf797e64bc621875da98c2276da47303cc69d |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e77943461e3f315fb2f8e5c9ca16e0cda1e8c36 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2dfed84a838b40c3a5703ba68031af6b179505a1 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/efb63c15a6324ac560c182fd89f717f4766de8ea |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/559dcf64a2b4f4e5bfd5e6cb88f1fd04fccc017a |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ef48a0ee7434b4c053fb92b9c49bf695a0b237f8 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f962a9e68c4d61bffff3eda80b22d44406c1a615 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/decbbcad11fbf312f6e5fbe0bf32143bedb6610b |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6bd2dd5338db8af07f076542e4ad2d28bd676e22 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b50551802f75f258ce49dbd39aa105a19324af0a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/92f9184c46c52aa1336165f10536891f94ffe07e |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/19c5e81931832f04bf0cd96d7a828f036d13295b |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4c4ede3f01bad88bc36c4838341beef07fad195b |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7dc784d04c7887e83382820b5a7e2245bc15a7b5 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1574a02632056cdd98d19ae8820c56ba5ed51db9 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/19a93723ea5139d6348b9fdb84e84a2f61a0320d |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2ff57896a2d3b52eaf782e523ad78dd03c6eacd2 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a6621b6650f2ed3ad026546caf93d858a46e7ac4 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/653eb6466593f1e17240a1d1ca26b34543df0769 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7380da450ec565b12b3f4b548f6bfdc650fa0b22 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d553a1e2f695bf8e48a2b20a85c1cc973592d684 |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f3c2b2c12b81f252e6ac58be320192a1a25bc52f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2fbb667c1ec5088170387aca102c756c18dbdc41 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/23220758ee2d407dc36990e4ef7ea12448e335d7 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/04157053b2db7fe6b54ed9ae83ea4f1c553af69e |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d73ef971746d0a32762fa3e4b61394b3e0d736b7 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0d3f0370686e9cdabc2cc93aa60907b8c3679081 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6802aeb99900c8938e8401a35281de75b1b7169f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1e729aa8b56828fa8934669cdb0aa1ee5679c62e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3f8ee10fa5fe2f6427e577e76a7ad7c8961323b5 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4ddd01553dcec08d4851e08c47c3312865ec896c |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f9d1f30baba49319d89f97a6000dcc0af746b560 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f4472a608a3916239a9d214e237869aef07cbb7 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/def6149c7e7460bedcdf6062dcbf0f71736ae5ff |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/710ddcf2ed9997e1fc6374708290924bd90532aa |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3fb8860d960b300f9a8ed7ee1e4888c493c02e9a |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5741d1bc8923c01c4b56760bbc116b154fd1e950 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0d524eabdd8051f2fb34fcaa2af6b9230a2abf7c |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b192183d366e974b5e3ad1ea6c6a4fec020cba73 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/561f88f2e2ddb0f18cbc81b623ba38512b070a9c |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/23ba3607c851d53246c22d574498c82c1af5f2d9 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5c4674031ea122f750a26a2b9714cb9b0bcfef29 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7b67d2aa1df104427dc239bc5283797c3139e6b0 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f67223dd7c26be7e0f1fd5858398129a1c691a1a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/321ad859b6c754a053ff4e7283574fd8d718ea29 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f9ed739c60b09c9db7d2a37a0133f461b6ac0af |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2fcddb9570fb2b906d5cf08d9682bc742f17b3f4 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/76c8914efb8f26212c4d5bb0d2b405cdd65c951e |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a1a05d6d3f8db64e7e75db8fb793d54d6386f380 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2b4054a910623cc0d397dc2178e1e4d7ebc82677 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1d732dcd448e2338a5da8c78ca13eedb7d58a4e5 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2fb0dbdd13fee15484d1330866bf35638c677ffe |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/06db7b4dcbf88a706002d896bb75df512910b45b |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cd3c3608888f1651d9276e7dffb7707c6b4e8c54 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f2889f1e475099565c4e71c99b07e1bc6359a8bf |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9c9bdb07e1056e594d604c35bd796630d032c778 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4d7903cde3007f280487c36a61469c7f739d0d36 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c3e5831e01e76691e80b5427dac5f2d44c7394a |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2533a1a6c2df1a991a0e1d495d80f39f847cbdec |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/85305a1edb06e016c8884e11bf2ba485bec40b1f |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b2afa7b644a905e3e3238d3838b539e48d683ea4 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5cea596ef003600bb3f95c40237f022add104246 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8161e0155f2866256fd07f18bc21aa67f138c279 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6bbb8ef12ad218a1182cf335853541ff0aa83cd0 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9a8dcac86cd9b34e655c7de410a52cd06663daf0 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/696d99e93dcf41b3c4178bad7f8e53b04634e1ff |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a6fb6ec6c98d0510c517d57bee5a26992bfdd574 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/94f929f1dee2d9a2a4d0b51c27a100736be0b785 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ba59755f14751a3465b46cd45b1b73a5a4f8e792 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/41ba049305c813d7ee5f20c1763512991e26e171 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0bc6aad97395f401d24b0815a9985b7c142a272a |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ceee70689d36f6e713b3114eb8fb4761a86996ea |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b15350c29679e8699311749511854e27d1489913 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cfbcb3e63a44a97aa5aadbe2058bea16a72e23e6 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df20361e0f540150a29454e838ca5ff02e0cde2f |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f8d41aef6da80f5fdaf63bad4f7b50ad9fc9b10a |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ec2c6dcf7f5c4446e631d9f501f8a72082f88f5d |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d1b003585c69f6aa047b4561cce9daa4a9f63d94 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9a8c2fe3ce3e19a672248c58d9cc53e28fadeb6b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/660180edf63551ef248c84a3a278252bdf4ff160 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7d279d7f91b6ddf6fbb20a39e04305fb49e394d8 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a5c706d9f5861b5b22c1faafa5e5cb713f400543 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6506b983a10cb3aef29ca80744848f891f42f1d3 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/358ece14ed678974c428fa8afc447620caa9a08b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/13d6f0c720bbfc262e70063f42c81f939075e039 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/32e528e2ba4e15a3c49dce4d471dd804aa45f001 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d554f2a5d6f04247fa124360b1c05615f63cab7a |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cc530553cf0ac8bcb8e8ba16af25e00645202864 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d18c58834c66e2af4dad0885471ba0ca07a00c57 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0bf8462548ebcaf983cedd464058cea9e8731f88 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/66c4496d476d4735264fb2aa8eedc1241c031979 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f389dce60c03ded63cfa40b041ddb53a90b6dff7 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a0facf5d15d7f982402c821f83c34f68baea2dff |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/142b435286fce54463b01b70c8a632a6b4afa5a2 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/19c572fa9ba7a47e3bf5b261802351716481e25d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6df2c62c6382409423d330cbed0eaf47c37ee389 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b25ca995b403876a7ba7d81373af1a494062324c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/69c92896efb8e54b4aa6f2cfd9384dcb93b98087 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3f4035060ae1f3e86c8e4a8c522f3e7dbe4ce292 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5d0e5274385f075f648b72b948786f02afcd82c6 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/64f704c3a0a6313d230a0cb0a376b5f606f9b47f |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5ac74a537351755669797f5c1338f0c07f2a633f |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a812761f2b6a808bfaef1e98853623a459614d70 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/882dbc60e817d420cc37e008dfe7b979db3767f5 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9513db5db7bb05b09988ecfc93775bce6723a942 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1839fcc807aacc2851a14d866a63e40041b03361 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/282aa75ac7777df9726eb6a49d4b300154f35776 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ba8ad889e3ce7c8d90674fa0d57e4a08faee6b9c |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/79ce928630b68600cf2924eb91568216731e8354 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68a852bd25d38e95cab0bb1e6fa56017bb357703 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/33d8ccc5687a6ca81fd42319ac6456b6d284c10b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a60e5e934a2a6ec52229fbb3f4ef20f485762855 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/db16f713b59e71334f3942f5205119c76c157d49 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7bf34021965b0d502d61917a521802163503df6e |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bb6f5daad69524e6be83bdf331ed994a1db40181 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1fb0777dcb3678085fe8f23a8b139e19c37facf3 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7ea3d10d47fc0f2810862722e8ae03bc040d5bd5 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a24d3b12c3fe219abc8bd18cc47843533a76921b |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/628e3fc3b4c5480f5d3ebcafaafe3a7bc76070f7 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6357c3d85368c8e90c3356f11b2e2367c67286a3 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b29b9e6e034533502d309b636b6689c6bf1655aa |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/395fd9e4d5fe08b4ab927c4166a2b6b361b4a89a |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7918c6f99332b5083792a8636047dadb32819ed9 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/87d940d9dc6c3dc13e5bc5fad5e9343a37a05f9e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/be88afb2d905837f7cd84e5d2e2fcf2abfb8ff83 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68ce81b9d60a3a0da26b34e66e9e218344265012 |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3569fafec54196a533b9e2bbb1559b4ac04c65f5 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0833b3691584cf580bdcbb44dfc91e4aaf366244 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d0743bc619f2ec60ad1fff889db630ffeb9e356b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fd15792862675cc43b02c80d35c9ba26786bb15e |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4dcd34966f0e9422ba82731c6bdecf870cc43ae1 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e10844149f2b07390d6634424e9f77fc001f3ca4 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/39a4c25ac7258a1e2a5f9cebed4d582df5a810b9 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c9187a642bbe9e53032323121f3b2bd2c54822c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3090b8bfcfecec786a1f5265f9b88043de00526d |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/89a6eb9f3bfdc3d99dc2bd666d096c2608dd01ed |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/48caf981316ed8db3a3b43ddbd2d69911c51d965 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/db300300366a98a238fc8981ede6c50431bd3ffa |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bba3db9ac76610389db320cf7954bbf966e10048 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0ac10435b92f077a074c946e99ab0881c838eeaa |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1abc7d9c317c00abca8d6d5b38a6e578a50da5c7 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6f17cc67f30889f790d662feb7d938944b88498e |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9867af4eab1d0ebae6ee0805b269128045cc4583 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b932aa7699c752218a07c836fec85376a3835834 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7e8b9deff7fc43344cba1c5cc8c1fa97bb8a5cff |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d5c290db5f837a399190c2e79d5dfd58ad463650 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ea91e296bf12887374f0491a3fbfc10289762037 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a358a820be6dfbcd174def3d4d96687b3badce84 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/90702b6f6afe781f98a6bb19bd9f3a58ae1d7506 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6338239a33a5133ab56d22f13d945c7bbabde15b |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c14d5c610ae3882178dbcbc681a637a82041cac8 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/54a4d26b35f08928a9080a8c5f338324395e3dc5 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ec33c43a3bc9cd78953f116993346864fc9f3294 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/478b2327632a0354801c58f5784f442fb54b75e0 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7800180ca5f0692a780420604aa614c01e5a0a90 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e6167898f03372becd3e62cf5bc6949feab97cb |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d2f825e7b69a00bdb36c900e451e4e5a8505aea8 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bb447e633c0c02e14b64c241f3114827536774b1 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/09e5ed882120405773aee65d8521a5925c0358ae |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/55d767056dc97c13360b1905973bf9afcb52c6a4 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/183d5620477cb01aae68c4b63d0a590f1e17234b |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df67ea26f9d95a04148b189e0483e06c15cbeec5 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0462094a43c78a2bae57e33ff94c36e8c0b182b1 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0a4254c0ccd515307ef6b2a7ca73cd5106d36a21 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b595d18f0d60d5405aee19766a09a8345779d2b9 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5847e5334ee7a7cf6a198ade721c86fcb018702b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/783fb260ae6ca47b3efa78333a6a0046345f00d3 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/13db2aea5cb4a1f6bbfcc60758311aa2aa21f4bb |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/091619f955dbe4bae1ec495c2f60c47d180f4dcf |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3536b79c9abf8592141580e6ce7ac6aa3fd2b761 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/32a3642ccb2b009cb79e6591aa8d6da9575df0c6 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0dc72bf3a9b8e2c97d8641e0568e22cfbe93e371 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3dbf56810a4bd0bb944f9cae87820c1e0ad4714c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/92a18bd9bc57d8b1044d8c6e6b36dc885f9decee |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/db1eb38467cf451d4dd055ff5e48d6e4754899d8 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bc54b126ef77bffe929627aa8f028c256167b6a5 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b8c788888ce359d03bbafa0436862d2d659593af |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/45803795dad876f09aa26a58e402c91be3255db9 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f514d40bd1609200f731aaa58f6fa0ff786679b6 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7d51666163d6aae287360905e094677aeef21f4c |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c9cbb683b494b091db736abb2e225bc445904584 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/97f0ffd60630febf220a9d8d859dbcf4dea33d6c |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9cb2369db671824e15ffb58e77b4bc4a5dac870e |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/725e67677b702c0300be3e093a4af46d44972b14 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/97416a01b820c974654c4a102e5d0e95df134594 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/92d29442623ace1540f63030eba64ac816adc96b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/64492b0c1f167137f1a01941265c0fda2e0f541f |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/baa3c4880164b35c5a5bb1e5b187b856e960e0c0 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7e4503c4fe8b80d1a2a0647128c3d3f3f17b4de6 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/94a5aab1236e535e982b62aae4a5c53494870d49 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cbaf47068031096bf96fbab1b66226606b45f6b2 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/07663a392e7aa4021613787382a562ed6f65b04d |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/59e9b8989e25f6cdea8378801522492b329db449 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c49f2a345dde4e52d4d2bb904278d8ea60eee7e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/42d1a1e7feeb40c82e805933caa8989790da0395 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2529efe113c3a7d541b5787862255b14aa89564e |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a23373e93629026bd5affbfff1bfad8cc0a27aa9 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9fd053023aafaad23770d1921b09158050ce09a5 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7c605f49deb0c40b2a006a651c75f8dec872eb01 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a53e2ed480c2be9ad296e62f4656169a342861ed |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/036330c518bc0a33e8afda13d02050004b6b714b |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2885b30edbb36ddc175604c32001f0afef16eee2 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/951363a32c60c033d33590000447bdc8799746bc |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f8337a073c9888a193664127b333d4542e0ab2b |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f1c0fd3ad811e64d9ededa8a5bb360f2bdca5991 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2224cb91357c3955b305067ff286cf32a8884bab |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fa09b89af93490abd5396071d8709e92fca2e760 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/556152468a9c0d2ac0b7b794cdc84d143a7e5526 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f93491330dfcfc09e64749b978864c6f7459bdb |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6354bcc3eaeaf09f67534917ce48f037830a97bb |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c8d2214b8a2f5fb2473c09921d40cafea1704a90 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a0008c61ba8dc458dffb3434c6e39e1e4e2d4b8b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5d65b1ae37ed47f40f008bbaa1e6ccd08150a6c4 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5cccb5ed7371cc5078153f2430a53c72131fd8df |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ee66bbd4b5091aba588e07e7689917508cd8f3a9 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d22140cbaee86eb7d2034d011dff3c008fa3a57f |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3243190912c8596aa96fddd895fd66e773e11a30 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5b39f15aa5d61d139d5e7e996b658a7112ee982f |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/567d4f24e156861152b7a9acf1e0eaf04e84887a |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f14bb30a2c972d9b34036946275a2c805970bb07 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f3f80f10b9fbb1de68f80bbd48964ba584f5b1cd |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e164b8f76c14359edffa0e6bcd2208ef6aa67c18 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/89213fc5432536778ee6d017833a683f5a5f6163 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5d2e3ae58e9c1c8d5806edcd17e5ea7f4eb5ef1f |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/db8b22ec223235abd7ae80b70e5930e42fb7bdde |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a13091834888d08ca51d1d6cbdd1a7a65b1f9751 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/11380e1e14ac37d6cbbd9997d56527e84f5dc45f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f3c59a4e59501a226fcfa9e6fe673cc6e9c4594 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d24553a115b3d05caf08dfb24285e61bd0ce7579 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5d7c3e028ee8813852b658cc032607541115c913 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e15607da96cae8532e882c91383ea6fbb90dca9b |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68c5b4a36c5ac3e0181c688d939e717bb4c3fb10 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1763c970dca054619388a7cd1da019e0478773c8 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/684b3b66c0faf068301275bd3e6de9900627bfc0 |     
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/726e9a1f5cf329a1f16aefa0b65bfa3251eea78c | ORPH
     powerpc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/b6ef41f2ba5987abc94bed6c17330a9b9bbf5376 | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/48ae7c7d52c9fae0078125a0369a72b658558273 | ORPH
     powerpc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/79afc2922ae4092f8a70ae0bcb526c2072613fff | ORPH
      xtensa |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7db6d94d988d7763aa5ec480dd2a59284338626d | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/56c0e9e7e42320cdb7f8825889ff560b80ac10d4 | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/95a9f18aa1147825fc7561fc65af7e3df5d5c2f1 | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3c7408008d5153e803334f2e8cfd4617a2788e3e | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/fff5f90fc9e38144eb42c679d0137b25919a9d1d | ORPH
     powerpc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/6bb04f7423f3e56ca09bf50c8e6cabad5f53264b | ORPH
     powerpc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/57d9291351a06f23a6e1cbdd6e691f7e8de92cae | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8e6e53fc1db57f4c24037d887d8130ab0f32eea4 | ORPH
microblazeel |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/316f45ac726d421e90b51a10e88e5a12df8eacdb | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/e668c986a10b1df0be804d1ebdc9141df1974e0a | ORPH
      xtensa |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5428faef6391aaae1d166d140de4f50126f6bb23 | ORPH
microblazeel |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/50a41d477e6ffac1852c812ff3c7352a981fb03b | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/632474a924c275afdf7f2679ed0faf858a1b69d8 | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/9104ace884ab97493370442abd41850c603968f8 | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/0a32c56096813eb63f74ded4972508b22e769437 | ORPH
      xtensa |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/4b96a43d720fb3e10d2a8e6920cc7b9520dd6f09 | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2a24abc29aea736d1a18280bed01e5943aa25419 | ORPH
     powerpc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/94f24eb3b0fa73c9a4fd6c05801bf2ab8e1fda9f | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/4ec5dd82c0b1901ba1af8ddf06755bfc06d46752 | ORPH
         arc |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d4d2411ed875dccbba27aec6e606aec8c8c6d3b0 | ORPH
microblazeel |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/010aba6ce6f29cd712938569404eabb865b988cb | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/63b07b04b8322edc62e31a59862f720c3deb92b4 | ORPH
      xtensa |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/7c70a16b98889396bcf690ed84978f0a830db3a2 | ORPH
         arm |                 host-mpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/263d167efebe010a643d5b60832ccf8194895116 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b5b45d4c494112a7fe0e7ee227f9a1dbfe3528ec | ORPH
      x86_64 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c03985d8381d278665037986155da70c57511b18 | ORPH
     aarch64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/f2e7ebea2ed6c4d798578ab09e5a138526a5e4a7 |     
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/793607fb4daf0849d71d42ad637977866914b5ac |     
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/767a61c4467ea22a10b243ed7aa97a5e9b33a834 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/0702296ab6be11f08e7466c180615e9e821ac96d |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/36ba6d4acfa9faede9e70e260b3dda14eee40597 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6d02207364828c80ff31de66b7b7777223f30928 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/91048f0c1fa992b124d17c2b46423a24e641e8fc |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ec3887e557c0fe0482c525f3975246300114f0cd |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8dffb31f03d2611434742169655c3e28e23a2c77 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b07562e00d8eb739a8fd2db5350f2a1f3f4d64af |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/986a3578db1ed166323218db6cba8e9cc1995eef |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/832a19ee36322a364c35a87aaedef5ca4259cac3 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/e10faee61d8e41de42be0dd8941e42f01b68258e |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/1130443b227636f8e1cd2669a4896a1e35f32d61 |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f1f5ec2dc980879a584b623fc8f4ccb4ce1404c0 |     
        mips |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/48de475985af1546cf60e875c808e9589cc28e92 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       netsurf | 2 
                host-libsodium | 1 
                  rpm-4.14.2.1 | 1 


Detail of failures
------------------

     powerpc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/fcfdce4c6602c3ff9aba25d2efcde20d61598a2d |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/e2b1ddfaea9fd56afd1dce308bee317ca5fa4732 |     
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/75d6c53bc697629a6cdd824557cb456e3bc0f753 |     
    mips64el |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/949f4ffd55db0926ac5450b809cbc830b1e11765 |     


-- 
http://autobuild.buildroot.net
