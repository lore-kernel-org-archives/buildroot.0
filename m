From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-22
Message-ID: <20141223073018.9679810194A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-22
===============================

        success : 278
       failures : 121
       timeouts : 3  
          TOTAL : 402

Classification of failures by reason
====================================

                  mysql-5.1.73 | 33
             libxmlrpc-1.25.26 | 13
                  guile-2.0.11 | 13
                   opkg-v0.2.2 | 12
                liblinear-1.96 | 12
                  libdnet-1.11 | 4 
                  perl-gd-2.53 | 4 
                   erlang-17.4 | 3 
             smartmontools-6.3 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
          libmicrohttpd-0.9.38 | 2 
                gptfdisk-0.8.6 | 2 
                    vtun-3.0.3 | 2 
                    libcgi-1.0 | 2 
                  thrift-0.9.2 | 1 
           python-pyzmq-14.3.1 | 1 
checking for ANSI C header ... | 1 
                       unknown | 1 
                 webkit-1.11.5 | 1 
                   libiio-v0.3 | 1 
           libmemcached-1.0.18 | 1 
freerdp-440916eae2e07463912... | 1 
                    ruby-2.1.5 | 1 
        gst1-plugins-bad-1.4.4 | 1 
                  xerces-3.1.1 | 1 
               sdl_sound-1.0.3 | 1 
             bluez5_utils-5.25 | 1 
               ipmitool-1.8.14 | 1 
            gst-ffmpeg-0.10.13 | 1 
                poppler-0.24.4 | 1 
                  sispmctl-3.1 | 1 

Detail of failures
===================

        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/3fa530cba9c84dd89bdfb1f258e803f084e8a7e1/
         sh4 | checking for ANSI C header ... | TIM | http://autobuild.buildroot.net/results/41da6bab3135a1e7ac2909c85e8daeaadad2222a/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7a381ef66232bf4a5d026e8058a3bf41816ffe93/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8363be9960d572764c4dfc13770008512c6b53b3/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d3936b1fedae578be78ef0eaef5e07d8cf19cc2e/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/87364d7198162a1cb30082642a294cc8ccdf634f/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/1af32b2fa57ddfb1aa60725b18dac3e602cbaa83/
      xtensa |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/5407cf07873e2c72adbda3d021c24a7b128c365f/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/fa3a54989c16359547e64e4f86f0c8b05b11da53/
     powerpc |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/37adcaf596860bdae795fe9ae37a0dc389b92650/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8ad3e845035f33390e8026c265f4e6bfe62c38ca/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cc89f727dc1d46db5a9b61307a4676d709b889f6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0db965518c624fa61a43c79732f27ebdf0fb1697/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/29e7381824641d94330d13ce68aaa58e97bbfad5/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/acb2145eb3fa486444e6cb8db6e0a1eb87a5474e/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b72348afdd7b1f66583515e4eebea35ccfee21b9/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bb2576df34432f49d7ce2c9e59bcd57c46bbdce0/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3725d0bba0bebf07fc7da74ed8da5b1741565b31/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6577228e5d48030287c3834ee321ba6e8902b0b2/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8e1fc45737eeaae22657fadc4f9770bce14984fc/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/503f77154443ce6e98036edfecafafbf27284410/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6ba179427489bbe540a16f03b502971842b0c804/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8b9e53448cbab7c380a7806bd4471718ae355d23/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/8ea810f568c2aa0528937a527165043baa99b9e7/
      x86_64 |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/a8a23431a41d1bd053dacf4f8968d06d8f12d0c4/
        bfin |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/56ebf351d89fadd845b28bfbad4296f2741c661a/
         arc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/ea15387562805c3a5d682add02a888faaf40d6ff/
    mips64el |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/e0819186b253beff4f6d3b4775c638c437fe2a97/
        bfin |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/681cb2510931477a3b50b2ae77723d15dbf9f8cc/
        bfin |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/b3109c93adab8c77eda2d53a29fee861f367a257/
        bfin |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/6795e8e3216bb7b4dd9ffeff50aaaead522d7862/
microblazeel |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/661f7286ea0fe36fdb05f8174f857c1f36161148/
microblazeel |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/f59e0fade9dbf851cfee5f82751390df87706e6a/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/f810d425969291d49022f2921c09d9156c95ebe5/
         arm |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/1be890ece519ebc0d0ff4f3f31abc06eb0b7356c/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/c816a0982733595438ed7ad90ae1231001c285cc/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/5b652c08e2bad8a9152d4d699fa97833cde8ff33/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/47d62d66c65cc77da9d48981ca6612257e616a90/
         arc |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/5d63bf2f1af7977ff81116e767b399d4d0a30a99/
      mipsel |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/a744f663259bf072cf829aa1656118a6c0c61239/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/bf5bbcd09620adb0b95ce35fefd7f8cfb766385d/
         arc |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/47ef10eea0453f53eede304498ef69d2bbd97724/
      x86_64 |                 liblinear-1.96 | NOK | http://autobuild.buildroot.net/results/54d07e6286373d92e96e3ba89724006679a09ba2/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/dd94088f1427475647bca1f9d4b32d73b0d3c038/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/f602708510478017ae3422bdbcf9309a6ae46f5e/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/7f7177c49b1ef9a14228146a8ab7ce1e37ea3e06/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/8c6d24e7206bdfbaac3f5d940d57d25fb79b4370/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/782395bfdd2902a607bc9f3444773151d4d26ce6/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f9abe580c235a57074fd2a435570c49ac7773889/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1869356bb8a554c38a85f0b6a885ddcf1528da4b/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/0d7812deb99eefdc84c3f6ad7e95c0c1e71f21ff/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/344d3b8a9f446313a13fd6d8e3b299193c4b68b2/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d3f58ddf33e4ba04fff35faaa234940a6a2518be/
microblazeel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c9ee9825946249f0840d3a1cc07225349c9fda40/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a3b4f8f2cf2ebb37d723a000d1426a3293e737dd/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/59f20e3336b9021f9cb4082608c4f52435a2c104/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/172bbc72631a15dfdfcc35160fa7f6e104cb6185/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/05c7226186f5efd894958295db8ca0ef18e1f523/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5936cdee2d65df0ab947cfd17dc4aee17df2a50b/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e53dba0f9cc03bed85c155c4afde00bed30402ea/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d02eca68f96f4b513c5f468769ec7f519f687a19/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7393fb490d9af3ada20c04ab0a5fb6dd2bbbe787/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/54f7856f3eabda3a4fead76ed2d41ec026977a61/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/35fd4fbcc72e0f88580e7142455333ecdbe08aeb/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ed9856f35bcd807b6ab361d2c2c28c139b06ff9a/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f71fa0a6526814d93f2e4f153790b05f905de37d/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a39f2b21772b7a7d0ef8cf9f54d4daeef1caf652/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1d5197e51c4ee736b420c9e2668260685cd10122/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dcb72d05e93b600c4e18c6ce4caae0e00d2bdb29/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/32f64526ee67cbb68178e1515b7149478318790e/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ef0d143a04866836a6c2b807cf0fb0ac63f5e50c/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5b7c843a867b22fe2d02a8c330f9556d0527519a/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e5d31461b23999c58d9e0408d15535f2658e506b/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/063c8fa999d2edf9963a07a495eaf20a8a1baecd/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1174a8a8dc1146da93472b44c84f41cd0b5a5e2e/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cf31e2ada9c9765cc6b0e0b709e7f3045975cf39/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/018a579f37c9c8eca5a36fc76e93508dcf9bba35/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7e2ca2bd1bed94091b20117d1e7958cbea220c6a/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/aed2d7a9b8282011fafe9168af6c9fe77c0b6dec/
        mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/74840526227859b264134857eb93cb96b792f0e9/
        i686 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d322027c52e88284c3b93ad903071e2a2ace6311/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a1b22326db16c678b0d852f61480a47d9418811a/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0e9346dd06b420fd60dbb2c684878a5510118c4f/
      xtensa |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1b77b51a83e0f2f7deb8e407fcccd5bd87166c97/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1289caf7fd4a996a8905c70ef24519543273a5cd/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/61606dca46a5586672c88bd99ebc93af7c2c5270/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1357ad7c5c9c2717abbeed7737ab33cb8419a036/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/b13aaaff1ee566d449635173eb1bb5c8e24fe9c1/
    mips64el |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/3a1a96a48b8026ab2f4b6eb63eeed6450ebf3c16/
         arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/9387ccfef14a01c63c9b052bc35f10a105dc2f87/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cf81373c629836a122e44996e2a48e4583bea9dd/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bf3bff2ccdcd5f850acdb1cab2e4cb8436f0a983/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/113da472b5569065186f43d63dcb177a29f225dd/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/f1e54233047af4c9afc4ba9ca2b494644106f732/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/5a77d3b960fc9498dde781719dac5fec447290e9/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/eb7da36ad83892ce4522e394ba7c6cd7cb0a62fc/
        i686 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/386462ee5720c87254a6386e669af5ef417e0264/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2c870ff9be5150f75a2ea0cb2ba56b262214ebb9/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/5fc9fa24563213d1ad77e55ab52c8e59bf21055f/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/a8a5f988e1d410db85f588e73a9bcd2152ddc64c/
         arc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/65c8ec9219963f33b8eb58b6fd2b96c651f77f22/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/692e64d350f3d053fd9d844d767ea9afb30e97f9/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/80c8ef0fcaf55214ed9d3c7955a6ad0ad5ec7aa8/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/7bb7d1a7c380a48dcd6ad4248dd1c28439124dd1/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/a14c5d4ebb90fd6540444c7a1fa9fdfe0bbe0e1a/
        i686 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/168fcfb973080f53d4aabfd9722ff51a67324126/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/ac56fe4b01f06f887305659f358c0a162804c841/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/ac7ecc709913aa440250c17cf7f6c80c331c36f6/
        i686 |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/126062cd952061ccea5ce921a779e8b94ca36645/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/a3420e29fee3e1360379f496f68955382cd18bde/
         sh4 |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/a93db61efcafb335afb49e02fb42ff4592b66d69/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/1dbcfaebf93255bfaf75e339f8713194b55dd2f3/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/f204ac0398547111dc3c764d2ec065a690701782/
        i686 |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/3214d74bf44428e4cdfe7b70398b2bacf287feed/
        i686 |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/329ccd7c6a44b0efc4a693064deb3daf4a5349cb/
        i686 |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/4423b9c924a0132a6ecf1dc4234e0cef1e811bd6/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/8d898d16d6611331b122e9a643f98ff274974b58/
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/bbbcefc5cda4884d188d885a46a5ea02f5658918/
     powerpc |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/1a7f604c012fee8f3238e8021fcb72d64665ba47/
     powerpc |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/1d5e11580c5c3fbaa38845d9c34e5e0e33913113/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c192d87daf575f76f41acdb27f89ae8229583649/
    mips64el |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/288cc1fbf1c26e15ee17e44f15766a303e3d2499/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d6bfa926207c5c940313cecb6fb40089e5e3c859/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ab9adbcb439c53c2b07e4da6a8bad5adfb96e00a/


-- 
http://autobuild.buildroot.net
