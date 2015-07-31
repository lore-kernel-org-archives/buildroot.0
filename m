From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-30
Message-ID: <20150731063016.B58511016E2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-30
===============================

        success : 225
       failures : 55 
       timeouts : 2  
          TOTAL : 282

Classification of failures by reason
====================================

             libselinux-2.1.13 | 5 
               linux-pam-1.1.8 | 4 
                   audit-2.4.3 | 3 
             expect-2014-05-02 | 3 
                minidlna-1.1.4 | 2 
                  midori-0.4.6 | 2 
                  mono-4.0.2.5 | 2 
                harfbuzz-1.0.1 | 2 
                yaml-cpp-0.5.2 | 2 
               libsigsegv-2.10 | 2 
              strongswan-5.3.2 | 1 
libsigrok-fe473123ba836445d... | 1 
         qt5connectivity-5.5.0 | 1 
                       unknown | 1 
               madplay-0.15.2b | 1 
                elfutils-0.161 | 1 
                 mesa3d-10.6.3 | 1 
                   ncftp-3.2.5 | 1 
make[1]: *** wait: No child... | 1 
                 setools-3.3.8 | 1 
                 lrzsz-0.12.20 | 1 
                  opencv-3.0.0 | 1 
                  connman-1.29 | 1 
                gnuradio-3.7.5 | 1 
                 libepoxy-v1.2 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                busybox-1.23.2 | 1 
                  weston-1.8.0 | 1 
                      qt-4.8.7 | 1 
                 mplayer-1.1.1 | 1 
            libnfnetlink-1.0.1 | 1 
                  gamin-0.1.10 | 1 
               protobuf-v2.5.0 | 1 
                   bdwgc-7.4.2 | 1 
               arptables-0.0.4 | 1 
           mediastreamer-2.9.0 | 1 
                grantlee-0.5.1 | 1 
               ipmitool-1.8.14 | 1 
                  udisks-1.0.4 | 1 
           libcec-libcec-3.0.1 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/cfbeeb6d8d82c4f1024530a08a78d7f638642e19/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/e3bdc6d34e629d5f02af9cac621c2e41097bf4c6/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/ff8d10723293aaf7e19234dff03ca194281cc1ee/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/9b9629ce798540f5037e6baaae853dd7f8698f27/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c0e7ee13290f04e390957dc91b7fd2e6736591e6/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3b94713033a30b637b585f838a21f0216e47d224/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/090665cc74016080cd57a7c903cde6a2f6c7effc/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/49d28740b85f892b92bcf87ed0b0051269488b6c/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c5d18a00e9d259dbe11b388ee486e455463b0a7c/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/fe6e4e08a59bffec29b1fe2d0396410e7af9f7d1/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ef459a6322fae25b7a1d4fe08b09c457e8cec75c/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/16ad698a9c30400ac94828d8425f82f646b36996/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/42ecbf899587430332612a00c4da4411cce844f8/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/4dfb0ddcdfb61908e1601506373e990abf5647b7/
         sh4 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/86146b3ec03a5680158983108628fe2ca6ed4dd1/
      x86_64 |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/04537a84f041fcc013b91927f4fd9467411d1f54/
       sparc |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/fd0f3b1bc519f54536b8a35fc2a3a9ab3cda3f91/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/c9dfc2cc8db041f97caa0b16e4cc5ddc522cc471/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/2130520e0c7aab8030406d4d43a50a1198358c6a/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/ebc87faba026fff998aaa55a12a1e8e825ead7d6/
      x86_64 |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/26b5ac1ec0ac8ecbb4d1d6a9c67eec8aaa3755d4/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5dd7e1b951328da1c4d3a92fbe893dfe88aa64fe/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f4038c859e6689694b376af655028c816fdf55b9/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/19c39387d0321577a4d9e34be03778749f799b45/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e591083b87edfedb059a7659b0de69a70fa8a9b8/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/083a036f31a367227ab3a162134d396256ea7e62/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/0b1ea283f5b4cf484d284a49170d83faa242dbd6/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3500bfe17b8388ec510d8753ce34eff13d2679f7/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/baf247efb3fb3db97b142e6ec56dd31c43011564/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/ef6ac781d1044431bda7d10a0f3e6ae4ba332e3d/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/4810824ad6ac7c3560d05b11d573104df4cf8292/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/0392eab340cb0cf1e39b0e58581b3d70ff455bfd/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/59e54cbfd3393ef7edde3723aa932a9a18a9eb80/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/53c7ed2d7b17f553bd8cc13fad0bb490719e6878/
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/cf011286be839674d358a8bccaf1c5c52de75e46/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/f552be17f9dfd4efecbce87f882718b09248b6ac/
        bfin |            mediastreamer-2.9.0 | NOK | http://autobuild.buildroot.net/results/b4c94367babb48247f74ce3ff585046abcd8f2ff/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/2c40fe209e6006fdf148e547b1fafe9180afc85d/
         arm |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/8f9f53bbab9de235489c44d38279e0959002d79e/
        i686 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/a097a64c5bc81fe9618a7a55302253f80bf5a820/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/6a4c542545d3bdb06779fe9b1d1b14629de18343/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/6b90168dfa4380ef5e294f06d61480431898cd8e/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/946b7b67d8bb7f670bdc02a46181dbecaa0fa1ac/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c82bb8d8529685dab52dcbdf1e45438cf189b08a/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/e41ad57c1952965da02beb9d3323d3bb7dddf4da/
        i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/eab8952d028e641571c9540370325ccad2d0cd0d/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/8032144fcc1bb0e4c7c6f77503377ea785ffff34/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/b4f64bf3233338701a2cce17085d61bf367424a7/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0a72313ba1a590eb0d3ff4e89c4b3ab0e7a282cd/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/b24f94f451b3b3df4d611b6e7c72f31d55eaebf3/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/76dd4e6a5d39d0230715ed976457d02c3ba6a1bb/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/4432c426680032c662156a4aaf4708bfe6ed17ac/
        mips |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/f4e966d6c2c51c5811871cb238e50c3a17bc149e/
     aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/2d9272c84f07d48281961b2f1bcf482b9f64ac31/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/ecffeadb72e17d71336e04ec1652f3f1acc5cc8a/
        bfin |                 yaml-cpp-0.5.2 | NOK | http://autobuild.buildroot.net/results/aac272ebb5b1b74eae2a2a50e32f28dbecab7391/
        bfin |                 yaml-cpp-0.5.2 | NOK | http://autobuild.buildroot.net/results/152326f70722a459214169c5acda9fb5bff2c2ca/


-- 
http://autobuild.buildroot.net
