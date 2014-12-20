From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-19
Message-ID: <20141220073014.B1EB7101136@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-19
===============================

        success : 266
       failures : 110
       timeouts : 4  
          TOTAL : 380

Classification of failures by reason
====================================

               xfsprogs-3.1.11 | 23
                  guile-2.0.11 | 19
             libxmlrpc-1.25.26 | 8 
                     gdb-7.7.1 | 8 
                   erlang-17.4 | 6 
                pinentry-0.9.0 | 5 
                  libdnet-1.11 | 5 
                 libjson-7.6.1 | 4 
                    vtun-3.0.3 | 4 
                    libcgi-1.0 | 3 
               ipmitool-1.8.14 | 3 
                      qt-4.8.6 | 3 
             bluez5_utils-5.25 | 2 
                  sispmctl-3.1 | 2 
                  thrift-0.9.2 | 2 
                gptfdisk-0.8.6 | 2 
                    fltk-1.3.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
           libmemcached-1.0.18 | 1 
                    qemu-2.1.2 | 1 
          openpgm-5.1.118~dfsg | 1 
                 libssh2-1.4.3 | 1 
                 webkit-1.11.5 | 1 
                   ezxml-0.8.6 | 1 
                  zeromq-4.0.5 | 1 
                 python3-3.4.1 | 1 
             smartmontools-6.3 | 1 
                    ruby-2.1.5 | 1 
                 opencv-2.4.10 | 1 
make: *** wait: No child pr... | 1 
                     rpm-5.2.0 | 1 

Detail of failures
===================

        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/6dc1d4feb1b976b2334f223ea684f24e8e5d5a55/
        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/c1bda464377632786c9c85513adb963010bfd2f9/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/25dfbf241965b9eae0946902a61c9a8c3213a7b7/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8e06f6698a63db0f0aab67f0aa80b9e72053e3a1/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/729142d94fbaaeebe52059f8ea3d4465f417a0ce/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/847dc2318fc612b1020f8151a8efdf3766dea932/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/18c91cfb25177c58bb8088c11333e8bec507a592/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ecfbf645180a6abee0d6716eaa6828d00a80103c/
         sh4 |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/e31dda9584130c869f6793fe78648acedb1d0586/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9cf8a9cb270b28e57cb90756c482bf4dce66dcd1/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/947cc920c02538adc380b8425a27defb2c108084/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/6f06f1f3b61188154a9fb47f4f46b407100d3907/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4420c00b9aade9af77107ec372956cd144617cdb/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/5c70efe6e682e8bdb6a04f39b7bed020a4ed55b0/
        i686 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/f09efd6bf148a47f757298f46036a825201ca64f/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/afd3cc5d4e66090a1e09b0866b846cf3ce7f9944/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4a6de76220e6b8dbf6189d3472a4acac09c76cec/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/0319fd65a6a555c9a895fe9586bb196cdaa0a956/
        sh4a |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/e76d907b8ecf0246ffed11c2fd6a4dc14677ff75/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/ce23015c6d0a126fe195d252352c8d57ab9732e9/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/221ea4fcfb04aca9fc4d9e2ca6023efc6b3a0f31/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1bc5382b63c8ef799ed8096e5ebf45dff2122d93/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9e7f9c162654bd1b19cd3edb3d79ed6430a2ce96/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/17c3d40cd8c69011443d9cccb8f46a9da102acbc/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ecf85d433c88f822b14e4c24ef8eaea8a1fe8604/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f1e36eadd892142dc4aec93c00619cb59a0ac539/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b18e539dd72b1eda0868a8ae6567ef6e0a7941c6/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/39fff73a296193a82ef77a1804262171ae81a62c/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/47797262fbb0cdcc6eab7453b9ecc1eb73d7c66a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/31302825cb385c6e9da4f4bafeb7bc39e44f463e/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d7e815808360b18ad2b019cd02901dce20ba5aac/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/42efbf05b225dea0161239a7a2cf7379b154316d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/92a1285277e226e4072353d0e49d3a8c16485d05/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/131e9d7f234f35d251e49a97e45bcc89a866609d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a143902ca2c9c5fc5ab8272f620b9bc8ef8b10bc/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d00657bdc2d60df64ccf454da2d920e66d4110ae/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7387978260766ec6d4087175d0f674a1096f1bee/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e8b733e094dd384a1d3811a65cb7d94a5f4d748c/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c297bfb1a2c508ef546dd8ffee04696d0389d41b/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7790d726636cdb579659bc35cf6b16c3360a7df0/
        i686 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/473cfce9e3eb5f2a5c67a9ad30cf3b6328454e0a/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/a47f182e61d28bd3f03833f7322649283e609209/
     powerpc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/b90dd63e4a9b44d7d6ccbab896cfed6a7e2cce97/
     powerpc |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/e0d0cc3713f85fca867a2413c22365ea376cfc8c/
microblazeel |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/2cf472b47da250d241d379bece59b0d830139aa8/
        i686 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/9c515a889647f907013eb2c386b36a62ef41e176/
microblazeel |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/5c9fae4eee1a6d0c4f857317f38c6d27dba82fd6/
microblazeel |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/14ad2e26e2132dc51d73c9a7dabb69e5f62d6b5a/
     powerpc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/fcfded2876dda8152e4d32c09a6e0971ea2494c3/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/e60e7c27af16f4085dce9d213e9a9d76edc020af/
     aarch64 |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/6f77d7244dc98f7d1959adb448edb597ae9779e5/
         arm |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/c6a1fd058b0e7e3e0ddae3ebe6fe222e405a866f/
        mips |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/8699f97be736add162de9ef99aa8f8c5f61d7440/
      x86_64 |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/876d8b3df7fe5c3e39cd498de89e73757bd337f1/
      x86_64 |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/d966d8472cd91c27d8dee6feb4122a511bd76c08/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ac95dfce50daf3674e5983edb9d579f0aa9b7dff/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/64a64823046975efe3bd883c773ad5944bdb5d25/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a6f7be907354a65830cabf8eb8d8d3532535b132/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/48bded77733d4dfeb4913a11f3565ad15c99bd96/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cba4cd01147babfb36cd836a539de6cb87c0b944/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d26ad28337550f90fbdeb64cbeba0d9772de4616/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/322806d44c52222d9337bc332b80e8f70119c48f/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a3e4f381db3301a411caef795342d5364a26c9b3/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/7714aada171db82653b487dfc130b64d74d6ae27/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5795e096d528430b375776566c64a6063c396f76/
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/2c48301c372c4145631df0ac52e2d6069dcac522/
         sh4 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/b3045d73b04b98074c54a0853dcbd4e124744105/
    mips64el |           openpgm-5.1.118~dfsg | TIM | http://autobuild.buildroot.net/results/34b053df0c17f736ee7e2c3391fb8beadc505d60/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/882867d83f4ae45e6cd51906fbc87dd12f097b3c/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/727952d66a0b0a3e8b86ad7bc26c649151e7d953/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/b3ae684ecae14833113cb3cf3127846d5b2c15c0/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/4295e31ee804f57f3f47bf21847c9e800c223d0a/
        i686 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/f255b99b9feeea9e229d9cf6efffe3c9ce30a8cf/
         arm |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/657d081ab901e55cf68064abf503d170efd00484/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4326b4390c4877081a5e09ad3702577d0def89c1/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/b1ecc1eb2efbaea9514183d3809010f1ba0053d1/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/17d4cb02161e9535694f334942a61dad6c2968df/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/25a6952c67b5cb298ce3fca23f1d293d42fe5a63/
         arc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7bc45afed76cc20036cc8825b1e6a60dd48e402e/
      x86_64 |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/7ecbd009b49271d070661c22a15cf6aa573f6cfd/
     aarch64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/8fcfb4ed2674f0cd50243b4c16298e1e4588f85c/
      x86_64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/0b41dd484c07318e998d02977694e88b70b20aab/
    mips64el |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/f2168fb541f65e6914a36faff23289c79cfc0fca/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/6705de107284834ffa05852f0466904509eef2c0/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/3e2ac65ed6ae40a40b50e5483ed415ae0ff6fb77/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/4201f775f412fec440f9508bced9347892c71c1e/
        i486 |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/4a4ba1bb94bfac45006b238491b73e0066e0367d/
        i486 |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/22584b89e37044e22f50372f5b382406bb2c07b1/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/23e14fe9715f9848275d3835cd8b162c2674b423/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6a1d6b7c9255901d65046981be2bd645a6727fa7/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/70a9f0b2f140b918c46400bfe1070a625b0d8b86/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/55ab7f7c4c19cce3c1bd8ee463841d54562f175a/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fbcbe60e195124034bc09456d5f34113456a6b6c/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/94c76e4d05b03e91140c7a4ae6ed3a30550eaf56/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9cf239d45b1bdd0a1b1407955a00e988562a36c2/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/8fa3911777d23db541c1c870f7b9676ad4f5d70f/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/ee8e6dc6194933d213c22b5d908bfb7212f6f843/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/69572e97099301db6adb5446834f66098f1786cf/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/118e04f8ebd229d065be0c397739b337f5d56774/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/494cc0bc5cba302cc49e50b4b57e8d1861d66677/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/51922ddc440c96ff916ccc81c010bbfcb89f1e41/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c665fe610ec9df7f3e73bb7ed9f40242effe5463/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/f65cf30c689ad18782dd2e45a81c07d3f6000b60/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/6a3e196c21d3de8bcf99a86b82eb9df92902f7cc/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/25332c6e32fd90dce4bbff3cc539ec964f5cff59/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b7b65ec5d7c5130ed9ec8a415be1f92c68ee793d/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c2767f53c5a74c086b9538798d048b9a31453af0/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/cf207d1c360117285e97f2b9a7af3deec2291850/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9b1a009ca03634fc06b22a9f0a44ef918ced2eb8/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/8c69a2685e7781c526767f4868e835e084b6e6c3/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d1c8194dbe3328dbd1db1328634f26e738570804/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/db4bf22e64e114d3de1915f4716b49abef047135/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/102c295772ed7e2d6d93f5095e2594dd78e2f187/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/c2e877a1049d84619bf36bc5a4799f2bd29c150c/


-- 
http://autobuild.buildroot.net
