From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-21
Message-ID: <20141222073018.02178102833@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-21
===============================

        success : 302
       failures : 199
       timeouts : 1  
          TOTAL : 502

Classification of failures by reason
====================================

                  mysql-5.1.73 | 84
                 libtool-2.4.4 | 30
                  guile-2.0.11 | 11
                   opkg-v0.2.2 | 9 
             libxmlrpc-1.25.26 | 8 
                     gdb-7.7.1 | 8 
                pinentry-0.9.0 | 6 
                  libdnet-1.11 | 6 
               libmcrypt-2.5.8 | 4 
                  perl-gd-2.53 | 4 
                   erlang-17.4 | 3 
                  thrift-0.9.2 | 2 
  toolchain-external-undefined | 2 
                gptfdisk-0.8.6 | 2 
           libmemcached-1.0.18 | 2 
             smartmontools-6.3 | 2 
                     vlc-2.1.5 | 1 
                    ruby-2.1.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                      qt-4.8.6 | 1 
                  nftables-0.4 | 1 
               libcap-ng-0.7.4 | 1 
                oprofile-1.0.0 | 1 
                  zeromq-4.0.5 | 1 
                     eudev-1.9 | 1 
            gst-ffmpeg-0.10.13 | 1 
freerdp-440916eae2e07463912... | 1 
                    vtun-3.0.3 | 1 
                     rpm-5.2.0 | 1 
               libsigsegv-2.10 | 1 
                libupnpp-0.8.6 | 1 
                 opencv-2.4.10 | 1 
                  cppcms-1.0.4 | 1 

Detail of failures
===================

         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/3a0920ffdb81edc4a43ec1797719aa0f5bac1a5f/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/eba5bf85e9ff98916cd3638b5f13ab5bd54564d8/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/c743cfca629fb332bbb1327cf4ea360f0a4e4bfe/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/095348d4d309c2a408a3b297b4325348ed1dd7e8/
       nios2 |                      eudev-1.9 | NOK | http://autobuild.buildroot.net/results/3bee0446733beb6aa7c1ba2446dcbcc2c965feb7/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/1e9fba18bcc1f4affe7fd56cbbf023a2fc7ed75c/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/6d6cb1aefbb8bd582f8371d6e850b498f913ab24/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4f71b433e5854bee21cbc044be865fdb62a665da/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/3e4e36077090e148ae72d98157388242e4ddcd70/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/13643434ca251473cf1cbe075f852fb76d230904/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/bf25342c3f8cdab87ea3268266e5c86b1b084e0e/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ec2236c8a679c77176208b8e84e2b3602c2abbe3/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/7132e43c9a726174bf6a3661d8084524de817eb4/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/422d0f882cfb0c41ea914641a8247d7baa096a44/
    mips64el |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/942402086cd377ec0970bb6d100f59224d38c500/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/1117cbda498d3c18a4a34b5d77753a78df32616b/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/ff7ee8550c65282559f859c79a661006876a0505/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/49aa94b3f8edba4322026099e94bf6f811c0f758/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/85b115bb811e670b279561f1cd2a0f6672376fc4/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/904b9e24fb44b24879605aa4f9be4cd32cc19248/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d3401320d646acb9ef761de23845fc982691aa38/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6b65db62d6e96cee30a42045e167e3e814e94a36/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a4d0d4876ad8cc4e83bce8007984dd3e2785af71/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c5620537728019e422c6989c7f41ac081a3aceff/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/00714152bbb085069456746be197c77615c29698/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5958a21d273da5abc170f855015523c4b645812d/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b066c761ee561777786aa1395d7eb4ac324b2593/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/279d4347a89ff0bafdbccdf44f62b103a9c193b9/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6cb903a7163e80fabcf3500712c94bae97af4f5e/
     powerpc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/25f246742f8dd439049c43d37e57dd5d5337ff89/
        sh4a |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/11b69422aee3deecbf102aec2194759ef92c8055/
        i686 |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/9382eb652e8ffb300d9fb3858e7112bc094c5a7f/
     powerpc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/4953481afa883134eadd21bcbae218a03b9b2ea3/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/a32b2aa76359c0683722c017a99657bec07356cd/
     powerpc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/099d6f192895f0c4ee813528dd8690f1eb85415c/
      x86_64 |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/4429973224067e66069d50e0bc91a15d4e267d91/
         arm |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/6a1892b498c4366407366fbc0333419ee8cc85bb/
     powerpc |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/9f5037fe22b960e6a649137476b41f14478cb857/
         arm |                libmcrypt-2.5.8 | NOK | http://autobuild.buildroot.net/results/8c98ccfdffc0863df74fcf167474e7b3c6b7e6b2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/56c2fa9c05b01a25b1e7a1ea3e934d86448148c1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9aee741e0ccc81b21a15ecae1e00d0969f5f2629/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9ba431d7039c7100b779593bc7bb2a6f29216328/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/a271f7819996be339321f4f8bcbdc3d9e8b13bbc/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/f9d29517de680693fbb286359edca3371cb8b56f/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/4bd912893e6be8a5d2eb021e702f3cc4a56aa86f/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/65943d0987f5735407958d5e28e525c7e0535cb4/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/e28ca079f3d6cc00ea26bae373066929a5fdf5de/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/79e7c5fa4569386b159e88149d94ab2e3641fc9a/
      x86_64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/c11f6149e6337f23cee6ba9464d82b7d3b1d454a/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/b03cab120402988f750f487d8654b30fe199b23c/
         sh4 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/03d50ec20ac8e7261c12635e8b067f793d265a23/
        sh4a |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/59e5ba71eed0d3826556f3b6ea369203dfcad153/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/19ab3d3064c7003668f77033720606170d30bf22/
    mips64el |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/22a9d9a42b2e6c3eff15c5391af9a54f1a939793/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/8c0b91fcaa5b9d0a2fd4b5c888adc56ee173d049/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/efec1d0633ed42ad19eed676da73afd63653154f/
     aarch64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/79751ab06539721977842aedd708312f1eecf00c/
    mips64el |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/d49962a95d770363d25f88737ab1b0b11c210b1e/
      x86_64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/8274399a7b99b67bc5bf6608237e90bdf4d43f69/
     aarch64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/55cd221ad62b3cf13b335d49d15597cba62c9fee/
         arm |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/97acd67eb80e92f0d907cc7ab3198febd25682ba/
      x86_64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/47b4b0327b7a6952ad808049137e9796ba826933/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/bfb9e298196d877b623580f882b6fe74b30bec9b/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/24393bb5bdb2a84078604a85473c2298d5a308e3/
        i686 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/af8e632b368475b4caf8e653e4eceeb60841fd33/
        sh4a |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/18007e4ad7d92ac0490579fd1bd00e7085bf63d7/
     aarch64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/b9d132a0ff25f699aa804aab9532d7ae465e581b/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/4a3cc31542b59030a1b71b10df60f9a2b29689b7/
     powerpc |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/c4b8c542e125c1deedfdcb571676791dd1c109de/
microblazeel |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/521eb01e117c218e479eda8953b9c3d9ed51b452/
     aarch64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/402160fc5a92a51b18ffafd52002e5816b918b4d/
     aarch64 |                  libtool-2.4.4 | NOK | http://autobuild.buildroot.net/results/aa49d8f40bdfefbcc740c32158ddc8f32761fac5/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/fd28a2a1adc573a97476f1cfbdba96a4d87646f2/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/829140b702da2994b008464bab796a6048666de1/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/3236784e80087002bc97d30b70200dea53b5cb54/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/4655eb03503f53027c94029754679cb186bfddc6/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/92b249c1ded0dfbf490c212fbd9af7e133015b0e/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b9f3f1dff26919a11924883cbdc60249a5303bbe/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b26640c57ac900895b6632426eeda56ee24169dd/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/9dc1e3541accde17fc216a0426590ed40c5eb6ba/
         sh4 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c13a28b437d6f0cf0fe1c15ff1ddf0a3aa9928c0/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d8904611a9c8260bec65b2fb00672202bebc4af1/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d4c72142f2dcaab15984bc9d05b1800440e04e42/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e18afc99cd5482dfd21eaa5f7f93b9939c864288/
         sh4 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0e850d66697a0a3a204f28b40038e0f3ae2445b0/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0ecdeddc19482c12a92c979931f8ab3399c94768/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5d71194d61fbb6fddfc25a1c0fdf0fe31a2b4cd2/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5739646a73e1954c71e757fde8209d8d2f8d3c93/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9f78579ab7ca6580b058d47c5ac332972484573e/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9ef0eb2afb5e42ac59d9d3110c0d7b703a73f82c/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d9d8074054b0e8dd789d36995c22d1a8f8e99701/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1d2cfa2ebea0345d998fc541643b3e3b23ac0ec1/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b04f65a19e281e2a85a3c0938a7c6663e86734c3/
      mipsel |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b5ccc402965a75a6657ef4304a9fefd9ea734ebb/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ea3645f24ed7834d2205c03c9d308db8ce5f7556/
        sh4a |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/21e26abd16317cf99487962de724e16c851bae23/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/8a457d2f76faca2a543c723d6fedf6a22853661a/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f0c05e65d35bf2f1d116dac624e897fcf2b13dce/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ecd91c9d366f29749b398b0ff612aec367f5746d/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d985c5824f9012374d64e6085d6c8ec9b3cd932b/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/043c875eb0986ff81af69005724505852420c089/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a9d1ea9720bd88c6401919cc9990817c25ce9240/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2cc481b0ae43713a6fc50a1ca720f91384892af7/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6d26c4ff3cf8d61b62998c319b71af12fc260dd9/
        sh4a |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a82f11f5779e941844409c84970f1f399351c064/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/66e5eed05e087b94486abf949fc2348b398b623f/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f252fc9d69a7ee4dff585c624a83908bab4074b2/
         sh4 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/83775d37b575013585f6bb1db3f1e945f3ffde27/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dc6de99869ddabbcb4d146a287ef1df4b3dcf00e/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bbfa6d7548f4ab3cd4db846cea588f16797b11c2/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1f499a23da2e50bcd3e41f481658630da455d8f8/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e2a4e6b577aa0b9339e9998f32b2072351706222/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/10525c4de3b8d5aeb543db507b1d41c0e4e3e52c/
      mipsel |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/94ece7a410756a5f08948089ae23472666120f39/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/68257cfad6db1cfb81d38f7b4fccdae082c1b3c6/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/70fc3418831e026bc47a6a844326f0e9e2cad04c/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b4da146d43df3adfe77ad19a8c776c0439fbe7eb/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2c02b3dc741ca7c2038a1381929c06f8e7319b17/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cdef845500f72705c7f07ef51837d2b6ae2e586f/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dd08d0a63a4f36b5a29bfa7358ff78a4ac088683/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1c25f1140751ce80dd9c035bb1d766c676df058f/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/501545e91ec83d735e032b5bfad13ad3bbd5affa/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2f8ad89a690e3caa594b3423652e6749e61dd05a/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7f121b85b2dce1a6f698fea2087efe92d6463725/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9ead11874fd6bcd989a6227356b147f01229fd85/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/20b6084b100c728d1ab10b5cd6606b9a60b32d25/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6f26c681eb9381938fc7b5ca7955c600fc46ba02/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/93894aa5afa695b24137874f0cd5d845aaaf5a0b/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0cfa6cf940e09e92f42ca48b3447db11ad55550e/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bde5e5f1ab60f01053bbb2f2f30bf8d41c285206/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2c54e43dc3c541b9168fc49476e79623c41e9ed2/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0c937793e54ab2f9a520b3097ff9e3e28d5e9f7c/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bc6e40d5781590df504beebe361f6d00ad0039ef/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3c5a7ce443486b12aa358baf6752825c04d0b8fc/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/16aaf2c96c95ab66043884cb131398bd94f56617/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3423c61ef97b67dd4e24132bfac3921d87348868/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7736255ffa109be7d979eac86c6a3b2e26549dab/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/89725cf4ee01ef249a38f3cd4811443ecb4173e2/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/8a1b6cabc4f1c2d080e6572757a896b45f28cebb/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a5cf5a17d5cd44bbdddac1f2b6dddcff09d13e94/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/fada66e23b14b6cbba09a0bb70b8e1e0d0866475/
         sh4 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/eafdefd6f1f994a6717b0aaed840286425dadde9/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/24a1d8c23b85826c384902508ec93a3cbdcdb83c/
      xtensa |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/33efdea48c9dd535b7d78ce5b00a3e35eb18a45e/
         sh4 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2a6073ac5f6d259433d6ad4994824a8ce695d51d/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/60b9bc9abb18c6b45f55f60b619e0bf277064c41/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/105e114a3839234010285b0c388bab638100db92/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3c276df902758f37c480366da8caf465740dae19/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/551f95c95916aaf0f786136dbe59e9773e4d2d3c/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7c18df7b893a35338843d557ffd14e49ab351839/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cbbd4b2b037a31ee54907c9af4b677e4b34421c4/
      xtensa |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/914f42e6b864b4513cb832f81cba3240e37c412c/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/2c35f4ff06b0eef6f90a138cfe53b93206641573/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0876b05bfa57d8a7d0501640037290b833e50bc5/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/750e7577ce6901292b394c84f746d4b1ea1f0dbb/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6975cc715f26184fa9345fca378abb0d9872f95c/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/abff1e4c52c871dd5893ac08e446a380b8d41702/
      mipsel |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b5a0eb1f3e754f77ebc278e13d90868ec5c61765/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/834b1ee9c848fd7adb1493b008fb59b839ac3304/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/744627fa39a677c586282e6249ba7b74a63cb997/
      xtensa |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6c27ea92eb28295d47f9f18c1547c7fb0f349d47/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/53aeabf7228b3b09462a8b96c6c83b1c8651424e/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/39bef4d438c40279db9ec4f02063755ad72c1b1c/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cb784b99f4116079179e5f362091d70961cfb1e1/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/47e2724f5bf951917241f8bf08422e8d5d756bfb/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/c04434036b752815c771f891ebaf669c9a81a594/
        mips |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f95918975821b316e87f69339c83615a6fa7105d/
         arc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/16cdcca3c99929f2272504c0b27ea3677de4c03d/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/654afc8a091675ad97a10462cee055b273df2ae3/
        sh4a |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/d4c8e3f6ba349e49b7686bc79438e66ac3fd2ad2/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/0a8617bd3c565c086d2da6ab97552eb554015025/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/e8ed70e222bc10f97e9f0d3f4fd5fceda3ab414a/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/76d83aae4d32239e03c25ecbf0b790b464684c98/
        sh4a |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/0817c5827f1a556184437c7866e4515d6c071599/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/c2514a3e55146664a98e8e8c515de2796263dbcd/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/e408524c013b1c91ef8cc6b871717dd5ba0456fc/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/2bea35ad93ac190a2d2a071e922b26a8481908bf/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b9fbbf26ed4e0df0f6fbc139e51db14605b9785f/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e4230f1813c1a262896f21aba97a53e93783df06/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e517c5f03d64497fc506b808d38eb306ca0b8b9e/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/56232290555b5c0baf2109f594e3fbf8235f9ba3/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/534d5bb60d3c6ce459231c4fa5d245c53bc35323/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/508e8b068639911c0a860b8f7e97bdcb0bf8d333/
        mips |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/3d4d9c817ecfc41ae2e0c582d15f59ef95714e89/
    mips64el |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/d97f91382a729092be86aed30adb1d64c608f849/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/a04ccd6ca0487949bdcad1e8636b3944c2743d65/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/ee2abc12b3343c42e52d67c29b2d489a8403d26a/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/41d523909ebbc5df63dfc6b6b7436bbaf65c5e0d/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b42a1e667f504a939308c394eb8b719d6f239ed9/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/2b6c42bb74da70787ade756535a62c01b950b35e/
    mips64el |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/6775b696f35aab69491fe0f4c177e3e83c7630df/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/509dd29298cbd91d221d80338b293d3ee9da0f95/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/81f2f77280d26a899752151a9d2b4c9b7927100c/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/161dbdba02c1735df0048ff1228e49c43ec45203/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/da1a73e3647e44a6faf5f90dc094541b225b3140/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6ab73ce4c75905717c5a07f1bbb497076024ce56/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/641aa20ca6c5e1cea45660a04a9948b54253de7e/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/3a3dbd395a95d235cb773308e36e83750bd08df6/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/af2f1d1f35daac357982a1ac56b1ebadfa349283/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/05205f989e6dc58bda4878d46f0295c0f4cdd74e/


-- 
http://autobuild.buildroot.net
