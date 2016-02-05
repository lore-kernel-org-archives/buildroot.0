From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-04
Message-ID: <20160205073022.6400F101CD0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-04
===============================

        success : 185
       failures : 107
       timeouts : 4  
          TOTAL : 296

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 23
                  boost-1.60.0 | 11
                      icu-56.1 | 7 
                      qt-4.8.7 | 5 
                   fio-fio-2.6 | 4 
               pax-utils-1.1.4 | 4 
iputils-c8ff6feaf0442f8efd9... | 4 
                 mesa3d-11.1.1 | 3 
                pinentry-0.9.4 | 3 
               valgrind-3.11.0 | 3 
               trousers-0.3.13 | 2 
                   erlang-17.5 | 2 
                 setools-3.3.8 | 2 
               linknx-0.0.1.32 | 2 
                  trinity-v1.6 | 2 
                grantlee-0.5.1 | 2 
               libcap-ng-0.7.4 | 2 
             util-linux-2.27.1 | 2 
                  prboom-2.5.0 | 2 
                  lshw-B.02.17 | 2 
make[1]: *** Waiting for un... | 1 
                   ympd-v1.2.3 | 1 
               iptraf-ng-1.1.4 | 1 
                    sox-14.4.2 | 1 
              libraw1394-2.1.1 | 1 
                       unknown | 1 
       openpgm-release-5-2-122 | 1 
                 rtptools-1.20 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 opencv3-3.0.0 | 1 
make[2]: *** [DerivedSource... | 1 
         qt5imageformats-5.5.1 | 1 
                   glog-v0.3.4 | 1 
make[3]: *** [DerivedSource... | 1 
               libgtk2-2.24.29 | 1 
                  connman-1.31 | 1 
                 libraw-0.17.1 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                 qt5base-5.5.1 | 1 
                    ustr-1.0.4 | 1 
                   tor-0.2.7.6 | 1 
              gst1-libav-1.6.3 | 1 
        ltp-testsuite-20150903 | 1 
                  c-icap-0.3.5 | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/905c57f7f7314608d91ac2ebe5309c8dc9f100b5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/372e05131bbe1a40ecdad96eb6892f4b8de2cc7d/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b8fea2a19e00260ee2b2520c283df2ca77fb807e/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6ae485dfc3d947dbccaef3e09270ad7877390bdc/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/da628421ede1bf73333e5895ff7b650f3586af81/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/afc635930cecfd788a806d9207773fbf311c0d0d/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/aaeda9b81cf05c66828c51444949559b88c5c12b/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/160e1b98b204148ecf128144826554b6c523931b/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2f9b0f55d80b01dba4d9bd76665cff346dd5f5d9/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5d78ee902b704aa89e4a23b0a61005369857e9d4/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/54823f7870c2fe809fb730dc68f2293100cc7195/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/675a6a9683b814a37283493bb919b25e4deef34b/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/f4aa377ee66767a975e60ad61f9fbcb2a5b0c3ec/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/8c202b85b05fca2503d23fa9571276276167f089/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/41c3fb8f4625cbc2fb904501ed747d91729cf790/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/70a5f5b666b7cff23c29b7af3d833124cb1da4e0/
       sparc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/ab1611f1d86c6d23d5c20645289c2d99b3d5ef25/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/7d9849da33d41c770c0b1c3110cae1ee9adf3172/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/0377c7c317b334b8ce9f3d7138b55e703543b3fc/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/6c160dc8ef291b3b169bb68e2c4b0faba04329fc/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ed8e29156bbdbb29ffd5cccb6da60d6566a9790b/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a9643172eb4cc64095459e8f5a3d5f5079183124/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e64a95baa34244f83700c9de48d96b1a9876e6c7/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/dd83676f94b5f4d5d70dd188cbd74dbb64686e1a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/14991b1c62d78543e2c638820703384eeec6969d/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/0fcc86af5bb17194056c1fdf5cfd646d9f672ef8/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/7820fbf636811a4fa6250182f560309d04ac904a/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a6bc2aab4c0b80ecceba9b2545d5b624687eef30/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/33d9d757a3d9e8139b9148d8b64589aa16b0d9ee/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a2488b04c307be0c8193383ac5edba371da0b2ca/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/a8d67f557d98ec83c9cdfa7ed44c727aa5d5a721/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/f31f64698ff393519009c5e52f9972617ad556c8/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/e19bc0dae92a2e1263094a56cc0a8fe71ee6a848/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/b35c387939c4e79217d155d2738b347795ab0f40/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/058a0b11b44dc5dae89ac4157f38e2c943394f34/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/acba6901d74d8027f55fb8134223231b4ceba7d1/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/d2307f01e5045e61b1eeebf8b87ef9f063c1b04e/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/31568de0cd59bd122e83d48d5d811c4c5585d4a2/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/f2b0d0fc31fbcc20a38b417f14f0a2bc912280c7/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/fb4071345c49e409c40dc231934bd0940e3689cb/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/eb18dbdf8cb4e51d7c4ffb8caab9549f26953374/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/c8e56098d3e94f2fcdec9cd73cba98b207b1ca24/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/71af4d77f555cf3be7a044ee2ac1fa6964df6299/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f583b438baeed3ba1ff524bf02259bf6512bee68/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/ac9954a3ae5993b660523a3e206948c29e597796/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/d167cdcc8a5d4f08d2608a59689c5f0f60486e1e/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/5d93e419d804c4bb78216813e522cef8eb3d059c/
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/a04273e7f12f7620b699a771c86416ca6b439625/
    mips64el | make[2]: *** [DerivedSource... | TIM | http://autobuild.buildroot.net/results/05f49a1cf9eba9802a682aa1e7857f6c132438d6/
      x86_64 | make[3]: *** [DerivedSource... | TIM | http://autobuild.buildroot.net/results/23844d26039397e3a15e4659cdc7ac7be8d752eb/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/451abaf2f30b7918ebe9d3ddb07129c15e220a85/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/7c028d3a7cf4ff201bc74023592977f091e92dc3/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/4f59134cfb364eae160e38edfbfe032303506686/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/d29702137fbdb9ff4f4ad2288c84adf83d0ef96a/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2d0c50e1c5a3320979c8da292228c7bdde076700/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/ab03d4e07428e7f7a4a8b1fa3e00d6f4277528ec/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/0fea3985d6d7b11431ba65b5900bb1a0b1135c6b/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/f960fb81b8ed369407fa2eaaaf36e38e5a8c1419/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/930be8aa556db7b28f5a831434ac0ffc1e2dae8c/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/810006a2a33494f972513ff46483c5edc326a03c/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/56b5d920b16425b23d9f91d56c1f0dcac1230c31/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9144fbcbec6ec5ccc11b17f32db35f2a4ed0e622/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/92f466c3487493e09b69672e00d71dce8ed3e588/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/16626a7e5df37c4ea19db5cdaaf6f8d447b9575a/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d90152abb6528b83f53e81929aca67230a80bc30/
         sh4 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ae382c6e138687a144c176563b5656731bc16405/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9bb5dd7bdf710287410cd357d341450df275bce9/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/719a990d105b4e4a99fd89faaac552e0d1cb88df/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/a2f3759918638df6b54db94cd899db8bd47351a3/
microblazeel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/00470a4e1795936bb92ed5b4d8f433f330b4164d/
     sparc64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/e19e1583cb285b8c4a87364e570eb0af6354c0e0/
     aarch64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fc3966b73378afd52047c21510fa8305d770cc22/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fee2eb27120fc840cbb6c833ebb598213a26f676/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/df03470210764027f60590f0e8af50090d0058d7/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/92e6e1bc96543069dec2d5afb14444286b1a6d9f/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/5e3928a601f4c3daa449c18d6e78ffa8d8a1317d/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/56950f86c995cf0d60cbd66329549c80a4fe645d/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1e0b6ab23e1886ea76fad1dfbd3e69ef44ea1a52/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9d228c2d96a2ceba50a036b88ee4c06cb189a21f/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d000dab8365682552109001be106fb24585bf5ac/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f6d620a8661d1df5329af68682ebd6faed10d23e/
     aarch64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d51b873223083eafe799dcb56bdd509245c15afe/
        sh4a |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9b0af102d15b60e19905865873e6668193185d2d/
        mips |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b57cf9e78266169e3753a00a8da76250cd2725cc/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/95a0cdf73ef7a971238486964e13b831f6ce5d16/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c2e0b0eb3e9be80c9748560871b5b2c22f7368e5/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f885777e0f679151fb2dc03de85fdb367a0d1ed7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6a30141afedc197e8392cc9fc289b0cfeaeb4362/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7d331a4766f9ea5237ee1ae5375505ca73db606f/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/313c3c99ec2f08a3a7c9f8231f68a51d640931cd/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/844ff339d1a3b51138174b7c82c382735c58598a/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a406705915be82dc56a05efc89b225ccc829a713/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/e87d615d70d320c9c2cb96e9efef6bec1e632679/
     aarch64 |          qt5imageformats-5.5.1 | NOK | http://autobuild.buildroot.net/results/c84ed92b638e8aa2fd21e2c892966066c58592ce/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/586a829342b4c147ae66038b3dd896bec4077789/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7853ace567ce6cd8585f6e148c869c745b96aa09/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/43f1b83e450654a55479f628aafb6f43a99a4d55/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/6b65de392ea573567ce69096e2c67d1fe901c1be/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/821d44c9217831915db7393a1504f2c50ead0610/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a647ede9f37dd949807eceeb3acc044c32bb4278/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/906377b65d2fc10993ceaddc71cd3a07d66bb9ff/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8dccddd8495caa75995a6bd212c46dc02736ae88/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3c95e22ceddbc35b3208fb3153c670bdc0426047/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/6d9e03a643ae79964dc79bc200f0a1db6aba836d/
       nios2 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0889b46b71947db63fe6e28e47dd28fbdb368ab1/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/710e5e6ad16b8d1b0c327930e127df20371da130/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/24ede5f2a2d86a2cd9b47933d36da15768994327/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/37f08a26fcd943f6b92ec88cbdb7da05269e4a35/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bc4883d517c2ab56748478a1c3f7cfe17cf82f04/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/86253c1a3cc5e9b3ba27924816ccf1669d72faeb/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/34d3af565c4820f414331097a2f62366af26a00b/


-- 
http://autobuild.buildroot.net
