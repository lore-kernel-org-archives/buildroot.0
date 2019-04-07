From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Apr 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-06
Message-ID: <20190407060043.AF7738791E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  58 |   3 |   1 |  62 |
      master | 158 | 437 |   2 | 597 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.4 | 378
host-gcc-final-arc-2018.09-... | 39
                   netsurf-3.8 | 4 
             dbus-python-1.2.8 | 3 
                  ffmpeg-4.1.3 | 2 
                     gdb-8.1.1 | 2 
                       netsurf | 2 
                  brotli-1.0.7 | 1 
                   dvblast-3.4 | 1 
                gerbera-v1.3.1 | 1 
                host-go-1.12.1 | 1 
          libcdaudio-0.99.12p2 | 1 
                  linuxptp-2.0 | 1 
                  monkey-1.6.9 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/bc3367fdc92aa62cc121dbbe512dee7eb9270f46 |     
       nios2 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/2ad1857188e45b33b7bd678e600b65768131d660 | ORPH
  aarch64_be |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/3495b69382704fd343ab95c19cfeb285033d38a0 | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/fde51e933f21a72783eb3e972de1dd3ae0c796eb | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/a069c2b33bc6f5f4a95f76e9d3e334345bfb5943 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/9185fd84284f957ef8b04ba3b4ca2a4194327e41 |     
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/5d6fc49e277b76f1a086b2b9c6ab98c30aeda8d0 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/9d2a7b2b867698108c81ae3152910318d8739fa4 | ORPH
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/d81dd5e2fa3ceac95e286e0d993182e125d2b811 | ORPH
      mipsel |                 gerbera-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e74fd22a1c4dcdb85250c83839cee00070345241 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/bc343c622e3bd59a2b3ff7361659a6dc7a50e3cd |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/19fc61a7ae8b9047ce05fc9f8b9ddac07fe912d4 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5c4c7bbe7296849c3ef7133e6f5f83903ec9ca8c |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/86852dd08d67f15775f6161fbede1101896650cd |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/aeca678f46d240849574eaf9ab6528b61f5f60c1 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/1444886407ab9ef726f7edef1ab6c1f7d9fe6809 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/b7955a8d36e468e23898272ccb43b510848bd655 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/268453576d4fa716e1e0b3645e45142db55aa5ca |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/2d6dc71b2d1fd8fba01f84293adca7981fd8e455 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/fe8513e7f403c86102f4f016ae3dc08eeae6755e |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/3c944644b45ab08d97ca839bd1f1671d326c326a |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/e9f0e9fb6903d530e0e7ed1c30566d146d3a138b |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/634306ca9189d5f6e573c5b23e4d3350b04b55ca |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/0f4ffb5b0f1f8061196d2c42ad10eea178972ee4 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5668c474216bd7089bfd294c1a63d8f7024ef97c |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/6e6c5561088762aeae7c64b241b81628587a02ca |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/9d5d6546612a7fb6a7049653bc18bdb0aa56d1c3 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/c1c3e593a1b91ce97d154a06f41913d5e3aa3343 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/73886f5a1e88ef8cb34731c11598ab652b1a1619 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/1a74c3832f9ddf267c510b2d8a99dbe81dffbe47 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/4862f00bf66cc3bbd2bce594c059e10271f1ec15 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/1691465c227e709f5347341b358afff4933740e6 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/a9d618160cd115408894e6a7ed6d4078cb7a8a02 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/c3103cf80af624bea888d39f6bc557ab0a9af073 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/29523a9ef56de46167a128b5c8ed367b6f7efbef |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/9c24f61d6aabadb2b1feb9dacc08bea2e14d95ee |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/836fd8de32c8584c981bf792487ed196fbf94c8c |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/5af8bf8fd6d7de4a9a0c497e41382de3d9984012 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/97ec3fb762c6dca95039b525dbb71527a8743a42 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/878e812adc7b61862dadbeee6d8670d0ce529b2c |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/043b0055ce9d2c4134dd0bd46738610abb33d6af |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/8239a95fb3e79df0c4d9f02b2de2c7584530af97 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/a2fec5fad369cb191a51a2bbf5cfd2987cc77c62 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/1164512811e787693406a946947a386fd07718c3 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/7d7632942a4263b8342877d998a953917fb597e1 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/a77aa21189f348482b7bf7e57804aa472cc350a5 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/4be5d80535aa1ad0d5ad3803a119d8288b3ebeae |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/9847b8d170f038570a041f24d64b356584c8f8f3 |     
         arc | host-gcc-final-arc-2018.09-... | NOK | http://autobuild.buildroot.net/results/d2552b11fc59b17a0e2ba8e9193b70c8b6ad6860 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/8e39112d2f273877319377bfc5c4f7612610ef6a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/89fcc4e80ea8c031c1abb350362c19c57eb80e7c |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/84f3eb70fc1c58986dfa7c79d45aaabdf4c011cf |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1a7b885d321a39fdedd69acc0e27962d9d732445 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b4011c6ad8ba6e4d8e53b67c98b4cd859dc2ce4d |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/26a23f51442f5d61c5f979b543ef69c207642fd7 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7cbfa545cb829b7105ca68105d263e974117771c |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d82bb12fe365491e0891ebd5dbb03c29220ca96b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e5b44df38fe06edb0e1558392c23b6881115d7e |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e5cdcc875765801fae4ecb03e876165820a4e8c6 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c55f0f2cf2e3f22d5c27708318144516b8363902 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/36051145227dc8ca59b6bc73bec0c267139e6b47 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a7a644ecce94e8d66f9ea5539cf0378c2e8820c7 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/403b367ab460186085b20e32bca0b7c9828d79d9 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4d6fd51a2b2796ea1606305df74d7a55fa9d0fa4 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1b139cf3b3f04a8150f48350e72001f691bb0a3 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c34aed7a61fff6d13e89dd81e22797a55be44773 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0ecc6f1fa0d3d0ad1ef094b82cebb3602c3b6391 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4f9fe1818112174f15e1ab0f0c3a7c1eefb65d80 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/650eaa43451e9b59b0a8345455f6d03c1452f716 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d7a0947bbd8463ef9753dacf7df4ed8f0a4356d7 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e2ee808ad318b2871078efc3ac3c01a6f26769b |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2076e7d8825604c47e804915490c03be82f5f5b7 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f27cfdc07e4d858f9a393e1ee8313e42cd09237 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/682dfd76dd9348f29a488a0c8fd2a075735abbda |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a79949d9b389034905420f0ac33fc9a38945561f |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/648a3785037662719fd3ca267c41eb6ff59e841a |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/210d0eafdf934ad4a3e013b5dee57a5360c8b796 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2e27197ad14c036fe952f1f341a5a3cac877aee8 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ce7dbde46668b2471fee857ff457a9dcd2c07068 |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bd814eec532e77edea8af5f11846c11c7abbb77a |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b3a707e870c403a85383c42613bae4a58e3064d2 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4a5c12aa56100676b13b6b4829078fa159f48bf1 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a3fa939a17522752a516af6197021b472b2e455d |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/abb6212e3440492525e52fe8f34cd14ea623ee4c |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/74aae67ef86b399207bc08f679d1d70b4c04b446 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/08318fd56ad130f309857c01220a7fe8eb52b53f |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d1db99d396cfd362595b683fec60df46cce7172c |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7778b5b8125a7c0fb86ffad4806206c16a34a6cd |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/36c8d1d51278823aeba3f9e2a9736df9f335411d |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0c4eaeda7b2a0e8534782e23e357de0ba1a2ffe9 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1ddb58eec1d03d99439e495891900087f6659e58 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/88769020e19734bf881c5a22f79e74ca6b885150 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/79b2ce927830cc4dc51d82938453382874f80591 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e23000553e4a84d7be92c4f0b3e4ac9b6f00f0ea |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c026841356c7e5d2cca7cfd084ebc44add5ac2e0 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e6c830e657951caa84d37de19d376d215a36e657 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/33c4d32576f92915e04b29d3c4ea25ffa708464b |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e5f47b00cd1f99d4fd20c3ac6467f35aa0769f0 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/71d83a9f79099f46d86f22e345d48f9e733394f3 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8d6a7e98c2fb457f4c70fdfd63d122de0d072178 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9946083dcc51895c1a9eb6891a836c9375096bb7 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fb143eca00df06ca0282502f3633e22dd6047a16 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3b9bfaf6efced67413e643887a839ab85fa848c6 |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/14350d42e8e1f2ade1b3e7fcd55a4069da7cf7f7 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ca4d2784c41e92a829fbe5a8b08cfef63d53dc85 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/adbde19a82e59426f9fec17f25f80864e360845b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/97c472a2226706915db312e3ed4a9f21824fdfe7 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7784afb4d5b1be197256141f030feb023a9511c1 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b0af9c503c3c3b80ce756996c17e0a3519bef29e |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/07e892eb2a84367e377f42a4300d65960df7f957 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/37cd160fbba588ffcd6ba63970108c4c62cc880e |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0c5fca2406026a7ef29c312afbcf19aca431550f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/90385d2e780894ba9f040ccbc49a6e9696f8f866 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68c5e3a1b715895389581002fdbb07a18065d5f1 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1bb9121536e482be582dbf4a7e6c0404f8a5cb66 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f765ad53a5fa119e82239b4961c8ab5d1cca8604 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/77ba3e91160f902ae34bb6ac506d3ba01202efc8 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8a1139214a294163321310d37c46f20569af625f |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/017220007ef2791412ac729c0b85693b016ff971 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/dcaf77a373baf96d9146e510b55ea60e878f7116 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/516459c6208a8349c5da08b572a9a78bfb42fa4c |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4b71a53b7113b73ce35756bf2deb15420d28a5b6 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cf37a8da9376c132d14a210cd91dbeba0e3139ce |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/aa1c067bf66bb4c069cf90fec55b8cf08f57d955 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/17cd0ab8f5fad33ece0400d26a3b5e99f5e96145 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8abe296ceefc1c2e776941297f6240caaf83d0a4 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/03ca8355a263360d1f5f05d8c65d85dbe2ca049d |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6cd2c9ce4610e53b913e3c47378e9ffd68d569e6 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/69f60fb83174279461b3e0fce4bc06e14e7f8042 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4610509092bbf2a9495f21ba6c79bdf076ba2389 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c672ca23e4d6f4e42c951eafd564e2a73ee4e70 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df9128f9068ff0d126a26aaa37368c0ef8afdf60 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/31a40860bbc9fa4bb3b67b8785a655e1aa551365 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/44e089a06b42b1b1ccdc7821c83f7522c267a9b2 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/35f94ae92c2c54f180e1c61096495789e6fdab47 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f936f6fdfb535f64a2a224dcf5681fbd46d1c34 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c7c7b75b7eab7e56c3eadfb3d58281a4e2a4d7bd |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d617a5bfec351d90b1f6558592f64c1915202b44 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/78aca5625dd37285d85bc9273747ea2750da9df7 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/beb53f3d5e3dc8cda624ec10ba002dbd60f27c8e |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e33f1df45d1b5f9193cfbc675d90e76652c144e |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b8e5fb9511e8b763693f6b624810717e00a0b4b6 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/70f0778d0302009d0446dc1f636bd7a89a99ecd0 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e747c40079dcd6a4068184a07cf2a64f09ba7949 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5d2ce41c94961605c7388c64663f6bc290d0d2f0 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/854c46a0cc024fb67913ba1e37091edce8432513 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f9ad2805d404c56604492c7c2e76a53e6652f153 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4884dae320afff7989a569ff36f3c3abe4b89f1f |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c3f5db5203b65cb8937b72d869c78575e12b577d |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ce53b2c7e024438eee37db597658296a63a04fd1 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bba5ec3f1cb861c8aecd639c4c789d59a23f877d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f27b0d882c56947235763a3e3987c1be612c892 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/27ddb1b036c35488b97dffeb9e34296322107cd9 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ffadee7c4da5a4437b486c16ae32e72d7e0ba412 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/06343457b1cbf142444c73b4b314349133f1aa83 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ddc12db26cc98d7e8bd81045a2e7ad2d9237dbe8 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c6a3b8de25022afa695d6f916bedfe71dbfc31b9 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f8779d0104994413672b79cd55e9b421b4efc9e |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ff3d0aed918b585f44b9b3ad902b0f8cca4cbbce |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/206ceaabfe52eef909099f0a7c5c0e8cbd95cf32 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cac914072883568cf7f0dc7ac609cfff0891dd61 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/531854ae3f0f0348f2466a1427ca937a09cfbe7a |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8eb13db6a1655d13953673d47db4649dd5d3bae8 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0bcee9a392c989e1d7f85a1d4add4611139ba8ac |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/886de023e118739eb70e05b1839fb3fdc750bef1 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4b9c0a88ce8e8903058360c2e6f9e64d2edb4a9b |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/50498d4418176dc610416ad06ece83eaeaea29fd |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df6fdbfa7314f9d67fb9a40c183dec2a7202bb5a |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/71360d2e1f97be9f2b47bec17c141959abbb686b |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a88c37b5c6654d3b653e6bdf209379d77ddf4d24 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d97a5644eaed327ff5522d397e1d242aeb726fad |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cffc1b0b3391885beaa40a28f47296a7b53ba435 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/458ec2fe43991f3de225efc171307f46b46ca265 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9c14dabe5940e6efe21c8ec8e0a116401d0d2fa8 |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fabd6dbb0d4efbdbe104ef5979cf9edccc1cf508 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1db597fbba04a8500a2bf4f5d97b375f46b56f9b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/842900a1b5364c4dfae4bb5ef6c62a5a8f8c5a66 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a7ab24727cb7fc6da116b5075d1d2cbb66770d4d |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d8242f68c6e406ccb7a8814eae1854e7f0189d80 |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4d86c7228f7b847eb93736ee7683a6deb02c7110 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8142cf5c0855099000ea83c355552347f98d005a |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2a6c4723ae37ca010a328bba04dac2879c8cf5eb |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1a1a90ee9324497a18684764f2c36063975d5e8 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3a7d16fc3a7c52034e3f98fa3699cee759b5c3ca |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7d5eb353627280418f2ea03cb9ac951cda64bd24 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b1ee121898e7ea1e3ee4d803a87a9caab689f5d3 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e636907fa9eab21a7042f885a4cdec3e546d644d |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/68bbe571dace37ffb739b7f47e49c12b48d3c14a |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8af0b279bade448c7fb10b6262a6022155a00932 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/66e2479f32f6d3c0baf5341e16e6c7eed5816d66 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f1be124d43bb4dc30e59dfb3929433dc773ad7a5 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f7a9ede1f75e0b9f1c3f6e8fc42cd5a0ce868e83 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7bbd2ce36257029b7ec98b4d0bfc58632007a38c |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ff28a70e0921eeb30c10593c82200e00826b40c9 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/02a8aaf4caf3c0111852ae5ebf1706f26c55892f |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/df95c79a03659fc395060cc6be407d9a6071c89c |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b43e909d66e4f35708d15830b60d82dd2fdafa3a |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/73c2dc4542fcffc5b4cf74eab9e256a31639df6d |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/864473fe0fab0c0a9716e5aa263765178ba975ac |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/28c22914ace24143ea065dad2f8779a47a516f71 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/eb4e36abd36673abab53cb68b279737530e9a031 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9d18e5ae38d16ff327d4e652058d8c00f312a09a |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9718360caf644b3292c2e2a70e94d27883c38e35 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/11a99189513e3e899c23534fb6161d2390c97dad |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/18fc911795aeebbf75cc4b5b6e221d9e9beb3350 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/69e4012bed2efa9b5a7217df03e7c328666e9701 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4c1e7a95fe7e1660d1366d01e8786193b0df4ac5 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cb374a9509d3aae47a485e8825614870203b6a46 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e9a99f42d9d2b49a4e24932b8810584c9a992f65 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3eb46f2c3b29aa25881cab21c0972276fbea0f4a |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/799b5e4ee7a616206e750b7624dece9bd9a8320f |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/014d1c509010fd60ea5ae32756ab972243b957cd |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/663fd8ed20663dc4c6d0f1929010210a5b954dd5 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c219eaa5a7b09b0b0ee3f3a303412d692117a215 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2094b09ecba65b0a71c2d5152f156b3e7f5b92f1 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4c099f598431c8ac1a2e7b78f1619478e8a39392 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4ab51af983d0b73b41404a97142f4076f1331ead |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ed04979c4f067c5a5b15c584fed012a27dfac414 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/033f59006fbe70729e04b04c24b738033c19e1c7 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b233be19ddb1560c306592e0d8c9d72516ce8eae |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8a9f220f59b179ed4c8d2701ba1a4764b4a0850a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cec3e30027b87e549f03e59cbc701457a8f39914 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b4e93047a0792eddb5531c9a9d3343f0c710fdfe |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/20b6dc13b8449bced23f087b2ed4a6e68e6e0553 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6a54928ad2360fc396509511ca69f1c4fd3ffc44 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f75b6940508de2b1c277dd6d0ffe0cccc0ca6337 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c19a1b991283ae38b8f3cc2aaea56c0b6b228317 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1f0b926dcf3cfe6f4dc4defa2ff834c99b652d8f |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/af21b7478458c9534c147d68692cd78c864157e9 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/42dc19f70e0af5eb2d69ba2f3436fcb29e503898 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/61690e944cc9c610562bdf2fb5f996574d61d917 |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/efe55f89c58b9624bf4a992ea5bb4b72edf349b0 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6cab7d3b4c62193d20e175e01ef9173f432f09fd |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bcba4150319c88560ba733e09d595fa4f842acf0 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/113a6aba2bffecb8c9e01f2116bc5e947e0db571 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/84a66fb861cbf5d743eb5e142e54e4ffbf321d21 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/18230aeafb4f7a69abe91567a469e7c204650e94 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5ae9722dc32ff8b072601f6089d3a5c37c0cf064 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bd1e422ea28c2350ea14f6920bd8d3f5d8e539b6 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6c85f471de14942610e03f0399faae1847879ab5 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c25ed03bdcbd2b39a603cf8785c12feaa814eaf |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f9d42aa77df383f926de963907c448d0eba9b9a0 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9665f80ee39bea4c83b578316b98d29172ec9ee0 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e4464ad05bbc9decbf7ef07d0ff434fabb071325 |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1a0d80509e1abbc00a0fed12e10111e8b17a656d |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d3563ec073e59e75c5c3291cc3a4c5037695357a |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/97bc8af71afcec302169dd6fac75e8e812bdd7c1 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/318716e349deef9072bc3d826727f14f5120c3aa |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f7cf03616d52c6f10a70f5b1dd195fdde59fa584 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/50cdc882dfe34e7528dcc9bd3d3fbbc68e726f9d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ff30b5a482001025c4753cafaac1173b41b77633 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/14a2aa28ccc21dd694cc4420f50eea6f8083a8b9 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b712bac687f109b2744a5a1c4d366e1d39c3831e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/388b0f49b84a725b24f829d8db842682e93222aa |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d3fc7dda06ea6096f9de1396556b69c5acdd1eb4 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e12fa82d861e0f92e3020a201afa801f690001e6 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/67edb32d3441a837f21498657ad525b29a36ad93 |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1863cdf1f10282bd0c858034dc51bfcea41a0cd7 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ead2e08c39cba9942cdb2241e6c15085d539414d |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/defc3fb89842f84e0b77df76ddc4e157b4341ea2 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c14ddeb06efff8c4a44168281152e00b477a5c2e |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7ebab5cd185ccfa0ec1e392d93f67676bd541d63 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5e10c319578cdcce83a10d4a2d8c39d606a62fbb |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f8b8aab9025c5a86a7f5ee1d5cce75689071c534 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/33d6f2904ca436834a9e2af03ce5e7f87acf4561 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9b894cb075b65d179ad5c324e506dbb3ca766d72 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/de41760c239fbd73944478d34c98c09b986b8286 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/43b0870f866ca87a5f6e144c433497bd9c28af59 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e35a0e97d4b0a63fa904c5b0f3dfb4eb089abd5b |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cd9b2653dcf45c2dc7d3265ef2656c5488c048fd |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/98b7580267addb7921b7616f70a97aa64908b1c7 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5a9e5bef10fb3a0d8321b9fc1aec025561302509 |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b7981c6d44ba3498c56043c65d77ea67b61304fc |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/906bf3429ff3ab6c7eab6b5f1827bdfb71835b5e |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9f906bd126a88efbfde28ecae25740a869a9a8ea |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/530163a94bef27d1159dd2c7f22daffae50407c2 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/90e781a51038fa51dc2c411834f065f26588a901 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2f45e2c497c6c1692300a1839464c6cdb0997e58 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5c518905e6efa5f4c4df88b083b8bd1529529e88 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2cbbb05b865b5b682e38bf9b8f16c5a38dfdb8a2 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/26159d25011d4c695c7d205f7f3574982de2ae96 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8627fa5a6be26e8ad6c6fd0ca3c619df82e46617 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/52a61c95b85f615bb10f3fe290fbb55c3ffb685a |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d81ca9c6b7c1e4f94bc1460fe34d330ecaf3194f |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fd2fd367a57453990be57c123c16e7943b20b4b3 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0627172f8334504c92617563b1f5dcee82e2f21b |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f8fbfcea6263ad1ed726ea185bf95b4dd2a81567 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cc3b8b8b3725ab8a51b1a3fdeb20d1183e090e65 |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f4ec7497b19ff7a2bede2fe015c286b94de7df8b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bb7e8e89ee00738456f45ca9e769593936570957 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cb9d795e5effda98955762a2631b98f058ae14b0 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3e20347f17dcb86b35db6b2311350450d09b8283 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/bf4ccafb373086bf64134d0c57b562dc8cf5ddd0 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/396263fd173ef232a82bb51811d3bc9cdeaff03a |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/10917d8f2f5cd020175aa17675da37a29451616f |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/24187b444f1409bd0a597efdd5d889746ef3ee9f |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a62fbd5d567eb3629479f49c2770d3f5bc05de5f |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/933ef9204b06a797f9c502eec92965a1dc84d0ec |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e99c79c27506b35ad488213ada6a745e8158f911 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b0e27f7878980135ec4ed16331c3965bd76f09f3 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d684dacfd1573499e1f3d9927009513ae9cf411c |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c2a18dcdbd2f8d1452aa7ff1ad2c427e056a081d |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3794b58ceaf807a55ed4b2cc665b03bcc3f1a405 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/07ba3e411f0daf973025b28e86815b38c95401da |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/63f8d36720cdee700f5477f5c904e52faab1a8dc |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0a9fd37414845862cb5920ba85fa42f827a8ceb1 |     
        i586 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/be284267f994f6fe057d52b25779737bfd1683c4 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1df70d4228676177ee277bd259cd621cb0be7993 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/de0569481072ee3d521bdd74acaaad0e576a507b |     
        m68k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f9f1452acc0c6978e650e28dec710e91580364ae |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/43c0d495665221710715dadc1616859e0a7ab78e |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/03bd46fddae51a41cc36b6d7331388c5b1739019 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a502b28319f3dfd84fd0cc98c5e76f6052a3136d |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/65239e17e01f5f45c437d32db05e84916f3d8272 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fb20cc93aac1e61382b1e5f7e8762d147c0cd91d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/31babd69638a8a9d40420c01879a79aa1b48a152 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d3197e1f68a4e3a06e48cf986268707a76ab5a0a |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cb480bdf9a85fe29f8e679cdf45fc8f71f1b9fcf |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/52a3783fb20a2005a0c2a430ed77b69e20d2d664 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/732ee11f55c2d71baaf2abb8f55d07681edec681 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a284e142c71d3e3412d441eae94bffdf30daf28e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/942ed8f668a654276c8e9ec92250ce8c36785859 |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4dfb1dd1971c6c16d0e190cefaab8df53597b56a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6854ffde19a4a96925d0554b7930ab070886548c |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8d64f13884ae5af32606e483ccda720b55bb4deb |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/52bc65cf5bff20a83c4d764d1af48afe81611911 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e053cc3f10d20dd8df6725abf7944c677a3fa77f |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/38135b365d8a9dadc706260076c6b89136a86b96 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e1f5d4264a4531a19b123f5a0a8eed1f4390ea4e |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8ecce01eb37c59673e5012ac4ce4f42344fcc966 |     
     powerpc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2c31583c4941a03f552ca0c1e77930effc20fee0 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6df005f68f5c68083efbc694b548770d9d968898 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4fbaf7a6336734e8b7d0db9eeba46425e02c6628 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c4de7d0bc93a5ddab57f5f03395b2fb76d79f94e |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/13263a75ef67bd02935efcbc7288f504e0570663 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f080a2a8e38a4f5929964f96c5214cfbee873033 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/5743eb9137220e11f44b5d910b30e083578f0c4e |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/77c30a0ca64aeb31f94b5b4afcde541dbd13eb7c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e6ba15a429db27afa446685921d0c7877990b8db |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/55377e47d495b5b09893a9fbfd78294179846116 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/15f71cbd7260d0f9a16ed2387d613de30297b780 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fe1314d52f6d40e7f4157c21895ef345651ef1a8 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c1ccb99cc3228eb47f1103baa44e183bcc578a8f |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/13a40e8510a41b3bf5ff1721067843d7ae2639cd |     
   powerpc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/facb268e7f7b5e8563d0b7dce7457715d32d206c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a3bc890bc497c74478bd919ebe4c6929bf4f01b6 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/98cc57cbeecff60e1e58daa230459598c1fb899e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/480c729e87483d87c3d428198debe45050f2d39d |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fde0389c3eedb35aa5c9caeaa83ca44c10d2f1c3 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1a3de5b945ae51e38115e7aa781eaa61c0b106ad |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9de097a893591202da91fe41569fbd857820b673 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e815c212eacc8a141e20b57e1e4b27bbdac4af04 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0f7eb1e04678704d033d27e354977337cc652ca4 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/146f6e6809c5a468a0dd8df2b03ee649d7cd143b |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1c25f8adac56b77974e63aa45ea2302ca198aa9d |     
     riscv64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0157431dbae930225e5d73663d39ffc59b391b25 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/babe068fca44286c129cbccb89d543e726a61def |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/22dd7f0a2c892f3eee95276ef30bcc06c9c6eaf0 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e0f1bd112b872ffcf9e41f93ed4f60eb67fdc749 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b8cefb3546f574796ba168695f60a7902d4f183f |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/38ec17997a0764e760ae20b6104583e9c59e281b |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7dda6e3cb11a0da16e221b73365253e4630cecef |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8c54b2f6e7ffcac1a9695e3c136c451da744031c |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/56a17445d7a1c3201163ab85315b91ac13397ac6 |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/33aa97807efd8021b2bd80e775651f0502a62416 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6b63cdf7859d3d30cecb3b030884c02fe2c47ad0 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ac86bffb856db370492e06818f0d9967f5a3fca0 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e52de3841e8e4f550fc1f9a36a14860e3767352b |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/be0cd5a67280ac5d94a2a553ff64ca56b6756384 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a5837cdf595c6a5e0f965949cacc64aa894b815a |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/dac36b38b1a7d9db1bd094118f0e033901618538 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4b1e14540f30183e0e776f46bcf1cb04bde434eb |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/d4cfd25bc94438ed6512a740e27b490c4a887ce3 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f80d79caac71d3ab508ee2e01f61e81f271ea4f4 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/61fba692a7cb3d45589459367eee1ea26d93bee6 |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ccd611ac6c93e6bfe845bd819ba359a61cc3c29f |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/79019cb4af6472d1652f446d6019aca3d1cd5540 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8be59743664338173709fbc5c94a87f4ae003fef |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cb23bbcba42c17c0fa6e718dbea24cb262511a73 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4b6fecfc30cc525f7e3907fa2c45d44730685d5e |     
      xtensa |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0405eae4a9edd606f877a285954b4d943fb53bbb |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/0723a4e433440cdb2c02864626293fc32875e422 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/b31410c8a94124aa4cf1d3ca071f2b93d743a8a0 |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/460148c1c3401d2cb8ce47e9c99ebca76fa60033 |     
     riscv32 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/66ee036cf58423b6f5ef60b7056c100c3ef20bb0 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3522db187b7a4d1c2b752e6916095c6af030f9b1 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/53b8bc1a2ac2f9ae89263f11079c4834550e9039 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/8036022a446180ec430762dfbf41f8e66c0cf6c4 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3e7f5ec238eeb09c3b6fdf4c5e56378984b8696c |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f651e77e5cdbfb63b318df41c9f1b6a81449166c |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/acdb01bd1c7d61f940e599958377695a030f1b37 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/3c94105468d460054a78a4d3d22ae00f36dc3902 |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/394a5f3784415d3a295f88ca1dc403a451fe1ed0 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/fa58b7743f62d0e1e599430e721e96eeec7d2c98 |     
        i686 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6480fa48a519cbd04a330c86c90a5735d6643ed5 |     
     aarch64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4c61a513bdd7e72841ead86bb2871d2d8cfe09f8 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6a6a9292349a4ec4655261c623a4068f14d973e6 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e9115ba343befa106be077a74f0d2c0f90f7f2ce |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9d41a2b68525a7377c486b5ddd6555521a20a455 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/71c481e9e0b9c73d02cb85d9f0aec22e245fa6a2 |     
         arc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/173ee8346f4442e71645adc3ea1ee7d3e84bd2f3 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/a62db37b78f7210bd3c8263aebe0fd7aca3f954d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4d15805fefd8aa82e734cec657fee901540bb82c |     
microblazeel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/88a9fdd5ac4f32ad1ab779c321c687053ae1c011 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c87b758649ae9cb549cd3f93fc71ded8aaef15be |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/43c03d8a2b097954c3882e422ae8411ee69dfa4d |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/1f9474652a20618ae8b45c16fe596d5fb25ed904 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/7209e50c4dc5ef61826a2ba89ac821ef609eaaa8 |     
        or1k |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/57233ce369ba2d943527282b72bfb3b3a4980cc4 |     
 powerpc64le |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e81ae7bb42331f484271d17d3131d9d98dfa2c63 |     
     sparc64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/ff822116516c3ce2c1cb340ce68f941d313d14fd |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/678bc5a2440e45418b618c3bf1b8fbc1cfc484a0 |     
       sparc |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/963884c9c4160d5bc612516f2f3647f52fa8191e |     
      mipsel |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/9e3f0ddc57b8ad76a3580b20c1d643a4e4211b83 |     
    mips64el |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2e00269fa5932f42213f02da05aa794e6077e82a |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/2d28f893b237b3dd00de1876f607c22450c4fa5a |     
        mips |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/620eafaaf5ae4c850286b6784d8879cdeaafd3d4 |     
         sh4 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/c6a5741d72183c9124257e68bf864c98976f4af8 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/cf8fd5b9e10897abf7ee7f115ceeb672d900f46b |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/75cf32d48eaa975a0127fedab922d129350e632b |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/4e23d49758d451497ab183ed37757755936b0d26 |     
      x86_64 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/e466c2c6937b90d90f73202692eead4e216277fd |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/58154f501913af421c5c42deffecf30f19acb27d |     
       nios2 |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f224d672b807d0175b791f164aa896dfe8071dde |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/397fa0bdd7faa7bcf14baf7ceb93106c85c34e10 |     
  aarch64_be |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f46bd31852b2983da184689f617085226a79a54e |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/6e05d4d8710bb3f595e2fa2bb1c9f11841500957 |     
         arm |           host-libglib2-2.56.4 | NOK | http://autobuild.buildroot.net/results/f03e2a7d6fcfb4292250993b56e1c87b9df67018 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/7bff3c854f2013b21df81afd07d6c0e1ebf2ec6e | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/99098b081d08703926d4f8ad90af34103cdb921e |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/4c88fabb272c6f20e5dd411a5642722f5ceb0e66 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/ecd2205aa45c9e2641a3df0a118a303ddca25a0a |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/43f9248eb6d7c05fe69fee7f4c000c3a85f4c5b6 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f842609a0d1e8c358681fd0590aee987da221dbf |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0866b1bb1f654c2d3c4ac93a12b1f938d570ad7f |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/16eb3a20411b871b43a203ae24d746a60bb53ebf |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/876225e76b8d2053356fa26a099ea7d3d26e4a03 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8a40c09b0fcba7ecfd08a85fce131b8eae87391e |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/6d07a0d3422d01fe5bd46421d54ee4e93088266a |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                chocolate-doom | 1 
                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 
                  stunnel-5.44 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/b6bf4530c2b764af2e0fa47871d23f02456f1117 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f62d7795a7444b1ef059fc253921cd7b870205a2 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/1280a7e34be01729a8b930a13e4a21fa0b734616 |     
       sparc |                   stunnel-5.44 | NOK | http://autobuild.buildroot.net/results/28a466b98f813edb6402686cc4706766e73e1ff3 | ORPH


-- 
http://autobuild.buildroot.net
