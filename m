From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-09
Message-ID: <20150110073017.0B984100FB0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-09
===============================

        success : 198
       failures : 53 
       timeouts : 9  
          TOTAL : 260

Classification of failures by reason
====================================

                  squid-3.4.10 | 20
                  newt-0.52.17 | 9 
          sane-backends-1.0.22 | 4 
           python-pyzmq-14.3.1 | 3 
               lightning-2.0.5 | 3 
              host-erlang-17.4 | 3 
               qt5webkit-5.3.2 | 2 
                     rpm-5.2.0 | 2 
              wireshark-1.12.3 | 1 
                      xz-5.2.0 | 1 
           libmemcached-1.0.18 | 1 
                xapp_xfs-1.1.4 | 1 
                    ruby-2.1.5 | 1 
                      qt-4.8.6 | 1 
checking for pthread_create... | 1 
sconeserver-3b886c3dda6eda3... | 1 
                 host-xz-5.2.0 | 1 
                    fltk-1.3.2 | 1 
checking for suffix of exec... | 1 
                  xerces-3.1.1 | 1 
                      make-4.1 | 1 
                     ntp-4.2.8 | 1 
                  thrift-0.9.2 | 1 
             libselinux-2.1.13 | 1 

Detail of failures
===================

         arm | checking for pthread_create... | TIM | http://autobuild.buildroot.net/results/078300b74e43d721867a5162056250261337b8b8/
         arm | checking for suffix of exec... | TIM | http://autobuild.buildroot.net/results/2d7d0e2dd565f323b354c58c09d7689ed4090f86/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/55a04df2e58eb9d3d8f6998e79d19bf07b82ce74/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b55c7342b912503780e9ad5f69d4a110e2cfb848/
        i486 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b4cf01b947562919bc6efe24103e03ce6471dd38/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/19fb0a425060379d4764d9b52e9bbf2e7715e36f/
    mips64el |                  host-xz-5.2.0 | TIM | http://autobuild.buildroot.net/results/f9f59db97d85d71fc8c9231af3b891ad9a95aafb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/abc848d4dee80a54144d172e3a0425b07eddb493/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/57814a4521eed04a7d38676871f434ee43ff7198/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/e9c1b270ce1a4f665fa6daad1c69fc6b2b233698/
      x86_64 |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/18cc10820c794ad0cc9852a01a3e14083201ec22/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/1424745c2439ee48127c4996ef1f5f0855cdef54/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/c63bf7145cfff85f2c05c456bbbec9bbbdda1e93/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/cb908f73b14e1510bea890167b3927afbf708d6f/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/94693de94eab15a5827299a614dc840df06d888c/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/44baa375cc53996aef2c15ce5d8b904f542c1d4d/
    mips64el |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/3ccb230480fb2b761a90483450caafbb63ed43e7/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/bf040acadbb53c5971800d340a0bc334e5f4f8ae/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/4e6d7ccf9e0537309d52f517b58ae317c372e458/
      x86_64 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/ecdfe67130126ec54909230af300248251b67223/
        mips |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/7300c603dffcedf10534aafb2e30e1999413fc57/
        i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/fe00877241d438a07a67dfb9789056ab1e3fdb89/
        sh4a |                      ntp-4.2.8 | TIM | http://autobuild.buildroot.net/results/afdedb204a8d49756a8becaf727de7ef2527ec02/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/2ce316a06407eac51b0ed3d955f7399f41bd209c/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/9566579d7ed17f737018e3ff99389594e376d996/
      xtensa |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/1c3ce0355eb01f067f6c7ac53e9c44c410f60d5c/
      x86_64 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/60add89c360cccdb65dd09a54fb64a49a31e1576/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/0d5b065d758e77470f7a75126787fdcafd575626/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/3fe762bbffdb5a921fef444de1cb1bbb7bb1be19/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/cf2eee195cc57ee25c6c42cfad36597aaddf25ae/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7be1e27846ba7c085e9167a3ce4393b311f71da5/
      x86_64 |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/ae813bb59b8ddf3eff39309e8d4a9908552a37ed/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a15cf94e956c86568775032005cf5eb580713898/
      xtensa |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a96ee081af1a25671c3aaeb8a5953c026a05a433/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/21e55260130ee93b47df9f23da48d74834c18abf/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/dd43baed198f8850429c894845e63b89a2175d5b/
    mips64el | sconeserver-3b886c3dda6eda3... | TIM | http://autobuild.buildroot.net/results/9486dcb75dbb6101f1435ae6e13dc67c2911f37f/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/63af361c530d93d6cab5ee846245d35f510c583a/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/96e80238b0a55d6e717008d3178e854c40677260/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/a5892e89186486f3cc8fa7a87aa1405bc47622c2/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/3151cc94bddae937a8ece0abc03e712bb779141a/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/3bde28b651c92408f493af9243b93afdb3d097b6/
      xtensa |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/2f87ee70299a82d6034d1cf48d786194379c76fe/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/9a0a85d2facf1e122a7359eeb1314d6aa9220790/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/a30ca315f3d9c3dc12b9013e6a2680381181a419/
      x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/16076e392c687a0473b6488751aacb80aec8b3b8/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/1d27b36d9aed791e620dc49e8d22f0da91b2d389/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/90d1474205fe2a01cc75b13fefac88292912eda2/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/231c45d81855c3203045f40e5c3998479727950d/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/33403f937be2e1e845b3f8ff5a6f6561e3362d47/
      x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/f09992431ebe94f956c37978ae2587964f7fcf9a/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/a13ee41bc068d87c8102bec7ccf3df7b4d980259/
      x86_64 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/05d0f2e9159cc63ff841e75494f70be525c2e2ec/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/1336d6f6ef77d569b279347c20661dd6ddc19efa/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/c5f00553048f40e52d6d33900a40876d3a198b79/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/137ea04574b8a2f098937e25ba5f11248103c962/
         arc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/3c052170b1d7a28e249c1e4ca0fe53dcfd6b3401/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/648d1d3bb4062bd7a0ec203ffe15fddb88cf5a60/
         sh4 |               wireshark-1.12.3 | TIM | http://autobuild.buildroot.net/results/7a104d63302faaeb3c6969d0a9d4cfe5096b3c58/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/37c56a0e7086fcae953cc9d6d36db5e1e7aae324/
    mips64el |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/04eebad25e8fa06c30969bdacae84a741e0a7a04/
         arm |                       xz-5.2.0 | NOK | http://autobuild.buildroot.net/results/e86e97ff7887f1bdc6bf913498392ff50f56ea88/


-- 
http://autobuild.buildroot.net
