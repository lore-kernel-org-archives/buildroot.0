From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 08:31:00 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-09
Message-ID: <20171010063100.8F9DF2092C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-09
================================

      successes : 169
       failures : 70 
       timeouts : 0  
          TOTAL : 239

Classification of failures by reason
====================================

pdbg-77158819158d1d7053a737... | 12
        wireguard-0.0.20171005 | 9 
      host-uboot-tools-2017.07 | 7 
         xkeyboard-config-2.22 | 6 
                 mesa3d-17.2.2 | 5 
                     nmap-7.60 | 5 
                  boost-1.64.0 | 4 
                openjpeg-2.2.0 | 4 
            host-lvm2-2.02.173 | 3 
           argp-standalone-1.3 | 2 
                   evemu-2.7.0 | 2 
                    flex-2.6.4 | 2 
                    parted-3.2 | 2 
             dbus-python-1.2.4 | 1 
                   jamvm-2.0.0 | 1 
                 msgpack-2.1.5 | 1 
           oracle-mysql-5.1.73 | 1 
                   pcre2-10.30 | 1 
                   perl-5.26.1 | 1 
         python-gobject-2.28.6 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/89f4e480d8876e5f69d754a65ea8479cc4e34672 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/38bd5b021bc8270db096c6a3e39fa57b2ec08f83 |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/bba6d847a12b829551a88e5ee257c498dc8d30b1 |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/fa0e80dc70072c84bbe3b9dd7e18ef5dde3d01ef |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/3eb8a06d9445371bb72120cec636d7c0c781ac3e |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/e95350fdd1db069ae9e6e41a279f5e362652ef5c |     
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/70acc575feda3c94fc8004a93e0ca7238cb9ffa2 | ORPH
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/a9531a33268e20b4e5743010cc6571c720abf599 |     
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1eb8343650f831965354a5d741c99771600f14f9 |     
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/fa3068f83e9362390202abe989c05937693d6396 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/e734db8b8b73f49a2829efac05b9cbd1de6c9446 | ORPH
    mips64el |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/f783f7c95295ae1660ae264d1c55568d526e21d8 | ORPH
    mips64el |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/61406d4ba868578705b01e89e1f1c4975760dc42 | ORPH
         arc |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/023be8321f02fd00d478df2b284125bea8f8207f | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/bc712b05a703099769c31063e221b4e9a28623ea | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/82a370f0b99b44a389735c42a2937aa4bfeb812c | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3c650e6c1e04c7107a185f5b55990056755847af | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/860cffb195946d26b9d0cbe251befb62edbaf559 | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7d21d624f10d70ab91a4abfbdae2a1ff5a8c0eba | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/947e921152cb981cd8f607a29afe9dc648a82556 | ORPH
       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b911480c5a7cb123c2a461b6d5e9c3a347a8f1a2 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/b1988d9d66565c2febe229c7c27d526069467b18 | ORPH
         sh4 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/c38f67e7b455634337264a248815c520677b6df5 |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/e2d14e9b313d9aafc23136456574debd6f7a1971 |     
 powerpc64le |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/464ab7b7cd97bc82b81c0749c6357b2b867856ec |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/53e0d0dbd5d1ac556f9368492bf0063a58d8c8f5 |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/a00d3175f1c1113d9a64113b127386b33604119a |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/5d171dbf34202b8a30cebe76b96a738bca51ceed |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/41c8ab6e48f519d8bdf03b2c682201e1fe3abd6e |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/9b6369261246db689d3aded59c607ce557c8d5f6 |     
 powerpc64le |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/ebb93bb3be7d5239aed7ab8e3fb174bd99b29f6e |     
        i686 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/581127dd0cdbca496c1dcfbf6059fb512cdc42c6 |     
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/429ea9917e7fddd985847648236fbb51e566c5a0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8483c90b0a130e04b7399ec83d2e6e63cca56573 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/668e173a0c6e3b3b94349aaa25e557187b1b0d2c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/66cbae9e08dd56f17b357f844d8f607060a854a3 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/11deff00359aceff1bf16ffcfd3e1d9ec4b46e13 |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1686e263534ef80990bef0baa8d9f9e7a9e2493e | ORPH
        mips |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/040d7f8069fbbcb0c8a11ebd6afb4bc36246d8a8 |     
    mips64el |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/24306c5499ce25823eea4a16f04dbdc151ddabda |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/025f3fbb059daa1a5ee609b06815761dec803e4a | ORPH
      x86_64 | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/ac648a8d0669ea30507644f5568da8193f37b936 |     
         arm | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/cc6ee1d8c97b40b24fce5dac5a06fc701d57b153 |     
microblazeel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/fbcdd483cdfec265e95a3726b2325aadec9bf6b2 |     
microblazeel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/8918121581f9834fef55169599766a9134600e89 |     
        m68k | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/4685c0f3bc516f90c8308e8c2260f69e3cd907d1 |     
     aarch64 | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/475106ec793e16bf8c250d3a69e853537e3e0def |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/acf14871421d7272d66db21a66a8b0e4c394d750 |     
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/9898d5944cdbc72cfbeaa426ebd6527d926436f4 |     
         arm | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/481a454578d4b9caf38efe99038012b5a91d1ed3 |     
     powerpc | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/722e043ef7503abe5fd6517c82b0f12627f4b0f4 |     
       nios2 | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/bbd6f17eee180c921464a53aa36aa550b7e38a6f |     
        m68k | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/7f02a0a118c773cc712dbc8a765c669ae314e8a3 |     
        i586 |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/b35f804a1840c5cc5eba292f03a856f87bd77a78 |     
       nios2 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/11ab63f2c8423db1deeb42dbae33d0b70bbd24f0 |     
      xtensa |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/67c89f23a66cf15a89c0cba2ab20df8c816471db | ORPH
         arm |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/3c6c3e0391c98ae35e8ab7088b4d90c59b7f706e | ORPH
        bfin |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/a771f32f17ac51b44bedecfef3da9df9759f258c | ORPH
        mips |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/5bccef441d5365bf1bbebf48d67868247888ebef | ORPH
         arm |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/f5a1713f1660d9dbc14e4de3a40293ffe582d3d1 | ORPH
     powerpc |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/ecd8cc6b816863fed339a5d3302159800386c050 | ORPH
         arm |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/b964acfafcd26dc360d329f71f9ffa6649adf758 | ORPH
    mips64el |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/8091bb1c0f3fc208dcad9b3e98a6d710f91388af | ORPH
     powerpc |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/085a828fa9baeb4c3ca3ab30b668e999d6cb40bb | ORPH
      xtensa |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/ef2496c4e39036c2f9ee22dd0de6ba3d08570d4e |     
        mips |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/75052d33f89d080f4bba3c49cd981569c222595c |     
        mips |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/2c12c7dcfe019d7da61e8a564cfe9365b2243723 |     
      x86_64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/5bad1dc8c88deb2a8a941d96d93db7adb8236d4f |     
      xtensa |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/ca2cd56618e8a3f347b07c759931312b1c5e97d7 |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/afa5b8490b32dbed9d853679f4fb2fd53fa41707 |     

-- 
http://autobuild.buildroot.net
