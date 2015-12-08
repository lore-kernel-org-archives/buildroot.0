From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Dec 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-07
Message-ID: <20151208073019.9BDA510542E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-07
===============================

        success : 205
       failures : 168
       timeouts : 0  
          TOTAL : 373

Classification of failures by reason
====================================

                 libeet-1.7.10 | 16
             lttng-tools-2.7.0 | 15
                     crda-3.18 | 13
                 libass-0.13.0 | 11
                xfsprogs-4.3.0 | 11
                    gcr-3.18.0 | 8 
                 pixman-0.33.4 | 7 
                     flite-1.4 | 7 
            libsemanage-2.1.10 | 4 
              alsa-utils-1.1.0 | 4 
               arptables-0.0.4 | 4 
                  ffmpeg-2.8.3 | 4 
libbroadvoice-f65b0f50c8c76... | 3 
                   erlang-17.5 | 3 
host-gdb-6be65fb56ea6694a92... | 3 
canfestival-7740ac6fdedc23e... | 2 
               libcap-ng-0.7.4 | 2 
                 liburcu-0.8.7 | 2 
       openpgm-release-5-2-122 | 2 
                moarvm-2015.10 | 2 
             util-linux-2.27.1 | 2 
                      qt-4.8.7 | 2 
                   slang-2.3.0 | 2 
                 mesa3d-11.0.6 | 2 
                   minicom-2.7 | 1 
                  libnspr-4.11 | 1 
              strongswan-5.3.5 | 1 
                      pv-1.5.7 | 1 
                   libnss-3.21 | 1 
                   systemd-228 | 1 
                rt-tests-v0.89 | 1 
           libvncserver-0.9.10 | 1 
          binutils-arc-2015.06 | 1 
                 gnupg2-2.0.29 | 1 
               iptraf-ng-1.1.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
              gst1-libav-1.6.1 | 1 
                mono-4.2.1.102 | 1 
              memcached-1.4.25 | 1 
               wireshark-2.0.0 | 1 
               valgrind-3.11.0 | 1 
                 lvm2-2.02.136 | 1 
                   libndp-v1.4 | 1 
                  trinity-v1.6 | 1 
          modem-manager-1.4.12 | 1 
                  gnutls-3.4.7 | 1 
                inadyn-1.99.12 | 1 
         network-manager-1.0.6 | 1 
                   mplayer-1.2 | 1 
                libvips-7.42.2 | 1 
             bluez5_utils-5.27 | 1 
                   glog-v0.3.4 | 1 
            mesa3d-demos-8.2.0 | 1 
                  udisks-1.0.5 | 1 
sconeserver-3b886c3dda6eda3... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
freerdp-17834af7bb378f85a3b... | 1 
flann-04b4a56533faf8c8228d0... | 1 
                   hostapd-2.5 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
spi-tools-cc6a41fdcec606107... | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/0ca7cd7d2f9f30bbc9cd00c56c3423ead6253718/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/886da0f0ed218c3904c9a8c45c574f8e3fa07c6f/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/9268c5b6c84e190aecaf65f49923bc51febc0490/
      x86_64 |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/1b2a4a7b8cf84bae2f7794cde44fea8a49f777ae/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/d2d0fcf3e457009e2219a3a72b88def999fbf24b/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/5646a44187a275cd0f0ad441f8163f7b1eea831a/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/c56b12693e156dab55b8be239cabcad4161cea04/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/541c0a7ca6d18069835fdf0068afa3d9c294523d/
         arc |           binutils-arc-2015.06 | NOK | http://autobuild.buildroot.net/results/7325aafff49ddbbd53d1ae44a6611ab840fd5422/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/aaac36870894eb740cc7eda1e3ba9da8838bd4ab/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/48a8705aeb864e460b3223b502da527297a7842c/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1e61922d73cd5be01ae69b6943a9efdd1d6a4762/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/dddab9dcbde6a20afa3f92596f3d698352ce9bc4/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/e9ce6bf0915e7286040dcced96067d84e957be20/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a7386f9547baf96e0d175c4a76b5e47acb833555/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c5f0d6fdad3b234556934d268aef581052df8263/
     powerpc |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/35d8cc8ff787dcfd0afadeaf34adf1606385e18e/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/bd9b312ceb704d0e02ddb376191bd1c4e11490f0/
      mipsel |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/a278b01182b242a54e00e7243b03135e064d515f/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/b521a722bfbc91d990cb169afc90434fbcdd2e2e/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/2d21c1144d84d1c3dbd945a68830fb480282e6b1/
        i686 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/702ee8db2549d883ada39317c2f864e59f4a8aef/
      x86_64 |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/1d41684ec95cbeef7724e726e993882da9b95a0f/
         arm |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/69e669e9b307a76650ca69082535a30b90fab5ae/
    mips64el |                      crda-3.18 | NOK | http://autobuild.buildroot.net/results/c7fa2b1b9c522264169591851ad09b3609d9b0d7/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f66459c604a00903fe67cd7f17e6bca22087980c/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/3419459e0328bd73957a7d4df0f6c094e4cf215e/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2a62db99d6532c9bb8199a1f71d57c4b3f314eb1/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/fba5d7dd488d55c4b55cfe65286bfeae21672dea/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/6ea5f8cf7b1e2692edadb5b957fd1247e511d800/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/65ad52184459d0d537874e43ab5439363ac220d2/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/74b4cc5358ff5db79ed3677d998768dbe2e0802e/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/3b552fbe1a4e4c36a6a8fbfcdb7ae8eb649cbdaf/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/05bdb13e3e690e08c9b60deab7b5af019b9615a9/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/528a61887e834c620c3cb888068c486e2a0d5471/
         sh4 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/c44554f31b0f68c1d897913faa77b00cc8dfcde6/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/7994111a0d7f5c0b435fa3d2613a79392a772a80/
      mipsel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/869b2c31b6d0b7c44d3baa1ab1df9249ae3a110d/
         arm |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/743d35be9f52eaf479c7118e77749bd9a2c00cd0/
microblazeel |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/eebba944bac60bcf8063ac50c9f390b0eb6892be/
      x86_64 |                      flite-1.4 | NOK | http://autobuild.buildroot.net/results/7d17827ac873b8289d1723914362be12b7ffb1cd/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/0690e937fd3a8295781bccfc5bf3dc573c5729fc/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/f92b59f0d57c26ce7a66d6fec2e1de134db6fbf1/
         sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/01fd2d34d8be9ed82f950a58639a014fba2a20f2/
    mips64el |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/af5b552034b429eab3f3c171453abf7ae8625dff/
      x86_64 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/a3ac5f8b5127b93a3349ee33b1a8790889f93741/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/faafdf93d2411199a9b4eef72076fccb6678c792/
         sh4 |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/24a47df4996e295f4e68484bd02b1ad42e66f191/
      mipsel |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/5e6e6367ad05d8f7025987c7e45361ee6c918207/
     powerpc |                     gcr-3.18.0 | NOK | http://autobuild.buildroot.net/results/cef1c038162a9a71180052fac4e69ba3b6c555ac/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/b093e40a922c2052858d7ccdb997448837928aab/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/7734bf8f2397a68983294756eabb70b5b2576156/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/71bf197a6f11f946055259e7ce431ff871e8a0d8/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/209299b149c4f8d17668e486daa35875f8f794d4/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/b0316d85f54203c96764a1ac82fc00917ab492ad/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2e1e0def136502ee2ce1ee9a2a25fe9cf7279fa5/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1e4c2015a85759a13450847fec7eb7083838348e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/a6cd207e06ae1bc5aa0f65552965f250e8820250/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/464da79612555791885162153698a6771d8a4716/
         arm |                 inadyn-1.99.12 | NOK | http://autobuild.buildroot.net/results/51f7e9275c2d23952c7558a126a8843d5476e4b1/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/0cad6214afb516dbd696380869c5d98bb6b0c667/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/17657cb359416cd28968f6c30e783e3d67152c4d/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/cf22c132e53f8d198e266b72949c8f80c9ac31c9/
         arc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ae556309aced56aa5e66f3cdc2d8ee8d440a607c/
        sh4a |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3e33f50fa643a1c37b8b6cdefadb8918fc4cab19/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/e48609753aa016f7819a44d8c1badb753737f889/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/538173fa4570544cd0fe146a9652bafffe789a0a/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/cae8f2da941d656a5542fc4e7d6921a159eea2a7/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d86a6a33af3085bc63c4cde0950db295f0417b42/
        i686 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/756cd80e6552a7f6445af16c0c7398b225f7dd1d/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/32daf2f7fb4b260b10fa6f38e916989cbd3a73e3/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/e3264eb70c704155b44ee355994f1e7fc3c65275/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a12a873ea671fe2b3073adf946cb9363fdd56968/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f1f81ba5345e2c1bddea8ebf5ef32f463901fa3d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/74ddbf571a115d7e41d515b85eb5a00e1a8842f3/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4a40855d3a16768e0e574afb7f7530b27d4fb811/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/41399903d3669df411fdffaa95cbffe9a82ba24c/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6088054db6d6dbcc71eef5c5137d890e1c36367c/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/0e6efd113777c018a31ae8a9d4fa5d8d31a40888/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/96d9ec06812d05de1e5efd5de11bd907c7e3bbc4/
     aarch64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2c8f6459bd11671017ab6cb953ae66008bc8d189/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9d0a2618c104e124f8c010c2a4414044e6a66603/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d6fc7961175719913677033ab62958c5db7921d2/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1a1c0238f58da44a19add2a8f8b1d6a10af35b8f/
       sparc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d8d5f9a07e56daa918845508a79d8e7dd3a0434b/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e24de5f5ffb4536d6222d13f3db2d7fe7bbb273a/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/74bdb60d8f17c9b5aafec4fecc2c8de2b8218b51/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b0414fd83ceec65ba18230c1038704ae17d2fc51/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6c740b13be7a364ace1132dc20fc3c0b269804f0/
      mipsel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/98718de3cdf99288815e0e2bbcf198db5272593b/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9ecb09d449847c69958e9d5613aea163b9b2fabb/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/37b04fe55c8e46b7de29bc5bc1e66da0e8e00132/
         sh4 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8e9a427d8dc0dc7a712478d99cffdb19405c089c/
      x86_64 |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/114c1df1797e56f8df9934f50e15034ab6a692d0/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/9405b8a12aa86356726e5f81f1e19bec1b106d97/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/346e327e2c85888812734b51f3cc5236d6ec9595/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/69743e34a6c626c92c94ee8d57d9c377448fcba7/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/8ac9f8285638aabff1f353ca28baefb7213577b1/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/e98c82130efaaed29682cf31c1a754278ff3e547/
     aarch64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/30329a447ffdfef86a0c1f45b83e3dfe1e759162/
microblazeel |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/1dfbef085986fc1090fbf1616a8b4998c99778ae/
       sparc |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/6c680db606fae45bf984f90e384ef431670f2600/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/c51668bac06b426cd0cdeb1bbd026fe4d8ae3826/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/2a7572fbd3086ba03c9feb16f93668fe3f01994a/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/872e2cbc3362f8328d06e1c17ef21cb274649ab9/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/62ba182313dead048a559b7aa418c2d98d6d85f1/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/c92164416db81fa39bb847ab193f45b1f37226aa/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/d1ea5e00721362d287fd5790bf1947d5dd648395/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5e39ea8a235e261e60f6d0985d7f239f54559731/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/a69b4887aaed7319cb9e0675ac9b4186e106f7fa/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f60106043df0cbfeae0b011dc27b7f0e29df71c6/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/64f0ae5238b6897db91650e8a05c3bc2543642be/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5e8ee83dc593c32af5cc6be5c11c6b770c8df57d/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/708381329dcfea88b59a346c236002c6f9adbe6f/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/bfbca895f78f62dfdfb2eed5fb8719511aab66b1/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/82b59970eec70736ad57f7c8505b483372c18434/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/761a949feea8c2c84ead7e03a82044c7db23b633/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/bc8365254a605c1c032d36b2f1d6c059a7131a3d/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/cf830e7ea15bce090592beb75663c7dba2fabf14/
      x86_64 |                  lvm2-2.02.136 | NOK | http://autobuild.buildroot.net/results/08c49391de06f2bcf987808b0c266342d7241d97/
      x86_64 |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/537a84d98f3cfa13bdb933f7e46819493bfd432a/
microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/012bf69df269929efc0568e6e40cec67572b36ea/
microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/e9c6ee2bc8afd6962d2bdbff48c1d1fa54b75108/
    mips64el |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/e493af1ca44bf87e1a0d034698221afcf72e659b/
      x86_64 |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/5fff162de4bcf875b37239df8df459ed8030de63/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/5a440779db2ebfc6fe9fe944a039f5b0c8a79058/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/d61ce6a95686ed8f1242b23b16c1777d6303b96a/
      x86_64 |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/119f89049c7df28a354759119abd5389f8dc551d/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/97bb6592f8056b18e7ba0aa59ac1f9b5b21cfbec/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d4ace80f4e142f740477d44b69e4d50f9ba0507f/
        mips |          network-manager-1.0.6 | NOK | http://autobuild.buildroot.net/results/131ed13b3a2c4ce5534cc7bc1c78c87630e20e31/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/3c2d854bc3082f9bd2ce00bfe95a19c9b206ae5f/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2b6f4dcd3aef28833fdf7c43e361f86816f17676/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/b1a14d53b7c522f4766e5032657d77f14254727c/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/6cadabcec2d572686398c05bab5020a395c22be0/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/7c680a672c0470945e86913ab7b7ed988b92de5b/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/3b4cda40f074578f6b35b1fb381ba37b93174e86/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/6c54288b133e99a2116021af688a183d5b6098ef/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/963b172f25e94585b82fdb71681a54f65c5fb142/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c4844fd0cb84405661ae970a9ba417d12717de1f/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/97ad1c000528364017a4b0cdc50fe7ffead697ee/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/1d52e7b358d11e3df67c08df0271e379f7a4adfb/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/acb311357255d51bb0407d792a8ae0c1c73be79a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/31933853a214d09fd4150e1b4b5a38d952fc38bc/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/292865268e02e346de50cb3d9c11d5b83d11dbfc/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/d477dc0a6fd37301c162e4db9a13a7af69260fad/
    mips64el |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/a8eca9e4d9f4bc7306ef4834bef746ae8f716090/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/51ddef430f67944a4458ebf694f54a441426aeec/
         arm | spi-tools-cc6a41fdcec606107... | NOK | http://autobuild.buildroot.net/results/ed89fae4a722b5d2adff9826bb88e55e58af77f6/
       sparc |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/da78d4cb03d7b95d6cc73ec167a39a1833f8430d/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/09d25cf24b3387a4b260b5f2d66f1a49a9d74fc0/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/7bdb2778378c569082c5ca9aff8c4716dedf2c1d/
         arm |                   udisks-1.0.5 | NOK | http://autobuild.buildroot.net/results/d3cde89f3142086515d00d86b3602cb039bcb34d/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/a221119d512103c472a5e0c22f83535e7a4120ca/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2c3ecf4b88738fda08fe73b2f474bdf6e462b4ca/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/9d9c9fed4f3edfd39475b5a1293e3a1ea7d3b66f/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/9bf3eb8a90677be95b144a988490f49287507ce4/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/872ec5e1814f790108aca05821cfce3808a63fd9/
      mipsel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/ab89c08e25b1deea1744d2cf25042ce01c13e62c/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/fb6679f3b1473169702c303ee5060abe7559b0b3/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/44a815f403e4a04bb6b043a4022febc15ad9a696/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/5d0ed24b4d368fed100bc3c4959520ebaa48e693/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/fc6d3c5bdaa1e55646644530a6c9b32e28822708/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/aef223ee2646599eaab7c82f63ff5f19569d69a5/
     aarch64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/28c31bfa63d15acb3c860ab1b0a67feb46486ef6/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/59db73aadbd837841d459e00be61d8d4ed7bfae0/
         arm |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/fd63a57d95b2876dfe84c90b4f6b75fa310dce9b/
       sparc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/4751e59a78d29b8049141e8734c558f1153648f6/


-- 
http://autobuild.buildroot.net
