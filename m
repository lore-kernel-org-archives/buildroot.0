From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-29
Message-ID: <20160130073022.9553B102C95@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-29
===============================

        success : 217
       failures : 82 
       timeouts : 1  
          TOTAL : 300

Classification of failures by reason
====================================

                  boost-1.60.0 | 6 
iputils-c8ff6feaf0442f8efd9... | 5 
canfestival-7740ac6fdedc23e... | 5 
                       unknown | 5 
                      qt-4.8.7 | 5 
                      icu-56.1 | 4 
               valgrind-3.11.0 | 3 
                    ruby-2.3.0 | 3 
                  gamin-0.1.10 | 2 
        ltp-testsuite-20150903 | 2 
                   erlang-17.5 | 2 
               libcap-ng-0.7.4 | 2 
               nfs-utils-1.3.3 | 2 
                  stunnel-5.29 | 1 
                  ffmpeg-2.8.5 | 1 
                nodejs-0.10.41 | 1 
                  prboom-2.5.0 | 1 
                 mesa3d-11.1.1 | 1 
                   perl-5.22.1 | 1 
                rt-tests-v0.89 | 1 
               trousers-0.3.13 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
                    cups-2.1.2 | 1 
                      axel-2.4 | 1 
                 dropwatch-1.4 | 1 
          chocolate-doom-2.2.1 | 1 
                 setools-3.3.8 | 1 
                 opencv-2.4.10 | 1 
                oprofile-1.0.0 | 1 
                  connman-1.31 | 1 
              gst1-libav-1.6.3 | 1 
               iptraf-ng-1.1.4 | 1 
                 rtptools-1.20 | 1 
                    vpnc-0.5.3 | 1 
                    faifa-v0.1 | 1 
                   open2300-12 | 1 
             e2fsprogs-1.42.13 | 1 
                 lvm2-2.02.138 | 1 
                     qwt-6.1.2 | 1 
                  samba4-4.3.4 | 1 
                     fastd-v17 | 1 
                 libdrm-2.4.66 | 1 
                   tinc-1.0.24 | 1 
                sqlite-3100200 | 1 
                    sox-14.4.2 | 1 
make[1]: *** [libleveldb.so... | 1 
                     ola-0.9.6 | 1 
              host-cmake-3.4.3 | 1 
                     rpm-5.2.0 | 1 
                   mplayer-1.2 | 1 

Detail of failures
===================

         arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/fbc26557027de6ddee64a4f277f5c7986d480333/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/33643d91b2112961a29c4243d1eb77fc8dcaef0d/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/00873012155e36a4278851b0608412d2357e1892/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e16e57563770ba516a93cd32c2b8460797d20e19/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d1f094b94c57ec3d4c3e855866db9e6d2708c651/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a3d89c7bc0b06575b7071c2737265b2f72d2a30e/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/21eb0ef4c0c6475384d41e32f7a61e6680eadb6f/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/1b778c076553c5f3bc628572559913b258505137/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/50ec2ccbda575a902bd7252b09f2077e8f6f3486/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/56decd95899722f4920d39c79a1b69887bd5f9b0/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c83b2885f9f6d66c92f048ccc978ad2cfb2caadc/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9bcab087e5784b576361133eaa68099e51e69efc/
        i686 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/efe34c5ac20f2dd9565c08e58a44ce2aea00e2ff/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f7acb9fb2150fcd53baf3917f85c143ee0c86b17/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/cceff52d357ce1b89c92b4db57577274bee0ac64/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0ea16f27b213bf874d93fe336c8b3fba830fdebd/
      x86_64 |              e2fsprogs-1.42.13 | NOK | http://autobuild.buildroot.net/results/0925830416fe8f483b9029a3999ab7c0ff941b04/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/25ebb2f9669019a9b1b9c023514c6f3686296a92/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9d91e1f7a3b32dd4e00077890f53ea9a29dc681f/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/dc6e4d7327d2031ef921cccd814605dec73a0f9c/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/3758ccecc92f9fd170b32dd8b51b7097562721b4/
         arm |                   ffmpeg-2.8.5 | NOK | http://autobuild.buildroot.net/results/e77b44271f979c77aea1fcc0e169bf0b141b032e/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/1f3fb4acab43870a185c06aec9f8d02014b59052/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/8e9f0bfb6726fc57c8ac90ffae3f94d2cd1c28d5/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/bd0efa5c41ca28a849361814499d94950bd445e8/
         arm |               host-cmake-3.4.3 | NOK | http://autobuild.buildroot.net/results/507b7f978f8e4ff864b6b336684de8cc32f472cb/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/4f6911afd6f794c3ce83974d9003e7b11d984aef/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/642f7cb655fc866be50249bb1dac97fd4ca4f0d6/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/30891d93a3b29b96d447fefa9126d38eb8552d49/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/21b5417d3220b1029a753dcbcd67ef5634d8fafa/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/dec8160d0c31d5405e3c60d12c5c4af467d054ec/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/2fe1b515303db46a5a3e4b96246a7f89e267a770/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/c28f420b4bec240f1e0c691a86a7f3f6a22cdb0c/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/4d7c9c1e5bf605623dc2cd8f67887b620bd7553b/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/7f06253a35366b4f2d49a48b486651afebccb1b6/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/f3de3b689c15081375aac97cd4281361631fa7ec/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a249b3c377ac71d2324d3bc2dbefa0dc82d68b40/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/615c891808c945b491efcf87adccb2f64409a2fc/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/d046c470b1680ffcd3549602978991de8dc00c64/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/bbceaaa26b238b11446dbb6f7bf58d6f986e5605/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/c99f10631243ac6015b74f33879a0e4dc9c27037/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/c232f8ea289bcd3a2d6487545d24b755a5ebb39b/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/2e3ad994aafbd5f4df3672504c77b6f92b6d58a2/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/f08aed4bedb1e8655c4106d4f57df5500709a0ec/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b9fe472d47b6ce93cd42d5b74f165e5c369a2dc7/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/ad8befde155902774054d473a24beecb3629e4fd/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/82898d4562ba8c7023b2024149f01a0628638638/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/34eea6aec49e391d6fd7455cfdf4f2414d59a6ab/
      x86_64 |                      ola-0.9.6 | NOK | http://autobuild.buildroot.net/results/17fe88868acdbba074561da14c4417e31d506823/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/470912fc5ff4e3115578488b91ea86b455af2ad5/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a202281fe80fe6048807b3dda1d5026056d2e902/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/be906c3c7a607fe030dbc508f0dcab51ed831eee/
         arc |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/14ca7f83c04a75691aba003a6c5d8b6abe9a48d8/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/a72355fc83fc9f5006d874332a35c35cebd0cfdd/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b2ab73644c767bbe80dcdee5d66dc69275c03fef/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c4b89a86d6c05870ea9032209fc4576a1acf7ccd/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee8848ebf8acb2c811d8e1d0c7b1079ef610cc2b/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/06e8a2a72da74f108f94b17bd8dff334138f9a40/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7efc67ca130e1e850268213c0760c7a62417190d/
         arm |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/ebcda8d34a7f6a105cd966766a918e0136643e02/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/9be7d7376c11ab584a9f4c7ba0cf29b97054f2a1/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/8fc0fcc0971b47ab29fcc9b9baf1d3df16829acb/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/953fdd2ffa5d81492f6c80aa653c2b77e741ef34/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/d7d4293c0eaad003e2ce9367fe1db6b214b74ce2/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/143f8fa3365bba6600cf42060cb2bb139bd862ae/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1a91e98bf0fece91ba6f9398f1dfcffaa744f565/
       sparc |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/65b66b9da75a9aaeba68b66a5d4e19ba8e748e3e/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2fdb3b617b5a4aaea3f7ff8629f4ab82b6d9768d/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/c41514856ba69806782ac009da9d8d4642bbad05/
        bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/629c2a3f0eb86869cf1d00091821fffd624ff480/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/fd9ec37a54bd26d6435e2e1fe27b2fb8290bb588/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/e2bf07ede5a1ed8d5d515094292a222786e16e93/
      x86_64 | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/881b5279c619645b7110d9706fe8182fc44578c3/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/566fed670a98beaa1a5e84429d5df5d52b8fbe5f/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/98887e469a6b490966a3315ce674bc8d2cd68753/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/317919f31725cb9f8e12bb10ad502bbeea84e3be/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/8a4febe2f56bc772be84d325796225fae3775506/
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/f398e959d7307e29e7dc5cffeee14bf902d71368/
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/ab95846459f7aceeec3c4cc6481c36851b97a8f1/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/53e445b9d8b38620846153179551ec8d177bfb0e/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5e154f977b4cd1d8e6443d7740292faf83a3f7d6/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3407c3a4ab78924649fe9752a726fd4cdd7d1266/
        i686 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/2eae2a178bfaa8a1e4d6a61fcd9f558594ab2baa/


-- 
http://autobuild.buildroot.net
