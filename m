From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-18
Message-ID: <20160119073021.5FFEE1023B3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-18
===============================

        success : 214
       failures : 81 
       timeouts : 2  
          TOTAL : 297

Classification of failures by reason
====================================

                  boost-1.60.0 | 13
                  libffi-3.2.1 | 6 
host-vboot-utils-bbdd62f9b0... | 6 
             host-nodejs-5.3.0 | 4 
                  ffmpeg-2.8.5 | 3 
                   mplayer-1.2 | 3 
                    ruby-2.3.0 | 2 
libubox-e88d816d6e462180f03... | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                 opencv-2.4.10 | 2 
                      qt-4.8.7 | 2 
                   erlang-17.5 | 2 
        ltp-testsuite-20150903 | 2 
                       unknown | 2 
                  prboom-2.5.0 | 2 
                moarvm-2015.10 | 1 
         qt5connectivity-5.5.0 | 1 
               dvbsnoop-1.4.50 | 1 
               wireshark-2.0.1 | 1 
               madplay-0.15.2b | 1 
                  connman-1.31 | 1 
                bind-9.10.3-P2 | 1 
                iptables-1.6.0 | 1 
               libsodium-1.0.6 | 1 
                 setools-3.3.8 | 1 
                rtorrent-0.9.6 | 1 
                 opencv3-3.0.0 | 1 
        host-gcc-initial-4.9.3 | 1 
                     fastd-v17 | 1 
zbar-854a5d97059e395807091a... | 1 
          libedit-20150325-3.1 | 1 
make[2]: *** [Source/WebCor... | 1 
               nfs-utils-1.3.3 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
               wvstreams-4.6.1 | 1 
                  trinity-v1.6 | 1 
                   libnss-3.21 | 1 
                    neard-0.14 | 1 
                   nginx-1.8.0 | 1 
                mono-4.2.1.102 | 1 
             lttng-tools-2.7.1 | 1 
                python-nfc-212 | 1 
canfestival-7740ac6fdedc23e... | 1 
                rt-tests-v0.89 | 1 
freerdp-17834af7bb378f85a3b... | 1 

Detail of failures
===================

    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/6484f85973f42bdc817fdfe2c3819394ecdda7e4/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/873e7066c449a7283e6ad3e06cf1348130a79cf8/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/585e8189e307ef2270f26afaa1c941b4fee0b035/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8b1fe87c4bd79baec783b32583b9b3a9913cb238/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c4d9dd3390f73c784e1f5fbae76095e63894de20/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/bc1d5ab217f114b8376dbb16c8ea1921d61f3dd5/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/68e696983a5818784d4657a9c4631fee9b77849c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f263c71668ba21ffa997e96f61304a2b321a143f/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/66310f3c88a6ac9c43da4a369f2ed4f895c81698/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2724b04eec636ef44a67bbe886b262c7c96de158/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/156e1a5ae92924127efd9833baab32bb63c27a48/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f30fbc92a09f493b44a877f475422a336c85eb0a/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3607a0a8c12a112baedc9fc87c27a20e1393d0bb/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/68f995f08bb9685588033501989c1b69ca082181/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/683898576be4da5a41ec9399fc7b58e384feb6a4/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/810ecc1bab2c65570870a403a75068ac5bcd63fe/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/0e1ae09431334ab6fde20521b3478651860d5034/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/431f1cfdf89cd38f050ac4ff5d39bb5b77243575/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c83feac537620748866c30ed1f19694df8d85014/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/c2116b8b327d4e5e73046fb222f8cc90a39e9a4f/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/d0b08b4961f62e9f91fcf4554b2bbe949cbea2ff/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/446635b2401136689a88927c9a113238d35cced3/
    mips64el |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/f3ba35e970b5a2fa9b282e769850275ccce2280c/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/1d57a0e1f3569d638ab4558fc57ebd87c8ebfd0b/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/c1493470de5fa8a89643b9dcad87538780c220e7/
microblazeel |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/58308aafbf271605e1d9c4cc8f999e7ec86386e6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f7c8edec1ba677c9f20250491356a146dcfe0dd9/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/bfe94988c3b1dc814f8db91d87c139aa3dfe3b59/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/0b32c498770e932ccc21521c127074a388e5143c/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/ece1728a2dba68e5861b17d098b9a923c145ec02/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/820e9043a28338eec415d14cd609803d7d33f0ee/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/ff3afa0268965f95254bae4c68618b88fdac1013/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c0b1204a0846e8ac76f6c3ecb60233bc8fa931d5/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a6008fa7e623ed6b2acad9d033fa57f70a638181/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1cda1d2179b04f6197a7694217ef35fa4c8eecb7/
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8e3bf832459809dc8775da20c9bc9225d76af0a6/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c4ffe218789eb6e155260130edfba6c7a395a18f/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/58ca2f676f67faff37497ccdddf7b2a22c9cb638/
      xtensa |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/d5d9c73ad080085a61a02e4aa6082ea3fdff6178/
         arm |           libedit-20150325-3.1 | NOK | http://autobuild.buildroot.net/results/695bb9d5feb9d12b50be6a7909bc882863e722b4/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d239d68dadcb86324dad91154bfdab03512d2965/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f7d8c103e340e7459054f3ff67ef2cf9cdf93949/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/26ab0e2cf7034e63c62be6cf5560d23fafd2fae8/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6d114a4528919e9f709a36a7b1d75c8d00335bfa/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c404b87ae5f4141a2c54454cff0db3168d173c7e/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/353e23941c720f53e84ea9bafc822867e1faa874/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/089da4d1ccebdccb2ddbd997119f33ffae1aaef3/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/3ac2ea6c70b2191b0234af753b3a59d630030290/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/6c3e0240338ee9a7cc55d4c4c4ca908bf645cfdb/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/db0aad9f8d1a9c22f5cee9fdcb0ccb7e68040521/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/1bfa2ee4d27489a0f277f11f20826febfdd19bc5/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f3df6324c2ad9974276af027b4ad04e9a712e57b/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/d67ec18b5206fd6898726bb5822c70e96f025bcc/
      x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/14e6addcd3ec35f882da7ec489caa9b60ecd4b63/
         arm | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/b230d37eed8337db3dbcb0413492d1a6649c543c/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/04d3240d363f7b06d4ace21fe72791877ef959a2/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/96c3ea9b45c386ef5b5cb0d0d8cbe0a7c45267fb/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a33a2c6d1a326122ea9a308ccb8bd99665786e0b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/57196f3629ab7ce307d191bfab9dc99f85171aaf/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0a876c739b79fc5bcad3ec9cf77732c494c02285/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/42a5e83b1e84d76c7f9a0d57ec93faae0370c830/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/cbd690196493159f24ae0cc394e9e6289c1028cb/
         arm |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/97780869f6a1a09fa2039affd202ba1811dfc773/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/687b77ce648aabf2f505aa43257d3a96b72ace6e/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/3854d76152708fd9d25d56c1acaf8c941cee1759/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/09cec6567e34a2e9a70a009bf830dfd4ccc81376/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/112e8ceaaa62dad71a5229f086b2086621637ed3/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/b2c208cd6c1a8e96cff3e51ac1d9aa4070ada73f/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/76d1eaf6d4109ccfe797fba5cc8805fe5ab3be30/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cf807111c5d47dc9315445b9fcb8f944545d6023/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/030521b781a09dfc1076f7591a9d8295f575c066/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/3152f488f7ef5826c045388696c2829f6cde61ca/
         arc |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/f53833e6c886d2d3c9ac6f9dc66a493feb1ec256/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/6522f2791963455483d486585017e9b61344bf22/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/ed05afa39718b6f4f47542cd51f3c5953c36c0e0/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c79eef100adfa5c13b03610a10851eba61638947/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/4fed87afdbe5322452d75ef582880393be301a1b/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/3d606672b62391c2de22ff08667560e6fbedbf51/
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/a44f44ecffce30e5a997cd432a27998aae4f529b/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/670bac906cd008848086bdac057b612f0d3ab8c8/
      xtensa |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/1165c71c922a7b69f99292fe3b5c43912b49a7d6/
     aarch64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/1e2bf286dbb4a749e07be9a2a3d87704acc7d0a5/
      mipsel | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/fb10bbaec5366145e0785351e9ce8b24f4be356c/


-- 
http://autobuild.buildroot.net
