From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-20
Message-ID: <20130521063004.9F25652C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-20
===============================

        success : 106
       failures : 64 
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 10
                 pixman-0.28.2 | 6 
         host-gutenprint-5.2.9 | 5 
                mongrel2-1.8.0 | 5 
media-ctl-ac40b79f002a2315f... | 4 
                  ne10-88c18f0 | 2 
                  stunnel-4.55 | 2 
                   mplayer-1.1 | 2 
                 qt5base-5.0.2 | 2 
                libtirpc-0.2.2 | 2 
                   squid-3.3.4 | 1 
                     m4-1.4.16 | 1 
             libatomic_ops-7.2 | 1 
                    acl-2.2.51 | 1 
                cifs-utils-6.0 | 1 
               sconeserver-211 | 1 
         dvb-apps-83c746462ccb | 1 
        portaudio-v19_20111121 | 1 
                 libpfm4-4.3.0 | 1 
                      gpsd-3.9 | 1 
               wvstreams-4.6.1 | 1 
               libglib2-2.30.3 | 1 
                  msmtp-1.4.31 | 1 
      gst-plugins-good-0.10.31 | 1 
               audiofile-0.3.6 | 1 
                      qt-4.8.4 | 1 
                  iozone-3_414 | 1 
                 libnspr-4.9.2 | 1 
               czmq-cb9839cf90 | 1 
               pcsc-lite-1.8.6 | 1 
                 netsnmp-5.7.2 | 1 
               aircrack-ng-1.1 | 1 
              matchbox-lib-1.9 | 1 
                  libnl-3.2.21 | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/5281ad21b377e9e7e20c4c6bfaca6e576bbfaa57/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/11c329548bdcd02e05dfc692fab00b151b012cec/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/170a999839c278a6fef2ced4e9268fed9282ab8d/
      mips |                 cifs-utils-6.0 | NOK | http://autobuild.buildroot.net/results/93c005409db2c622e9f5dcf10b34a4f8b305f149/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/da87c660b5b766ddc5d06cb28bea8e56792fc90c/
       arm |          dvb-apps-83c746462ccb | NOK | http://autobuild.buildroot.net/results/b62289809221b6455fe3db501e869271a64ea454/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/65408f272b54e5a740da5f3712ed21d7bec8a966/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/f3eccd38f62bb62202aa486cd6d52ebeebf269cb/
  mips64el |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/9c77222ea4c08caf77442749ee4d695c906dd586/
      i686 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/25faec46c2e65a771f3707ad80bfc7ca65f06683/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/967189279b90941290e0d5bbcca50e8c799bd2bf/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/0565f6d3948104da0dc8758a0739274b027d4547/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/bd1181874979f7968f8fa7559b841a8aa42e0a83/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/4d977df1106b7eab46ac7084cd490bad7fcbfc7f/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/2fc40dd5c8418039285f0e2e33d6915da923c833/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/05a2e00708ae7614c3447c88fd361f76d30d40de/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/69b0b5ce14351de8c14e0b9722a8e7166db5cc1d/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/090628ab122822e1774ab74dfc680f799e835624/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/ac7bef158638ccce2fabcdbffb43f98bc702af89/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/384276743b35e2e4c88b1f02947cd97776de2e4e/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/a7b87c80fbd35786804781d983824042f2292911/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/0337a7e4ea09e9ba39328a2f78d097a85c33e4f2/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/4c6bdcdb7a27885bf6df73bb981b69bf4e1be2c9/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/f8e11b2f15804c521e06ab2f86bb4924ec1f2a30/
       arm |              libatomic_ops-7.2 | NOK | http://autobuild.buildroot.net/results/58c188ad59c62c7897381e110fe3518ccc17867e/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/ee8c48a48624af0f04e6056be6bd214f6c4dccf9/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/510e8e7416068ef71f7becc16f196c9528a7d52e/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/9b93f17e82714120a60b66633923f2e3b9fb0c2d/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/6265174f73ef1fc240a31a19d436d384775e9dc6/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/b8aae0786f885bf02ed21a79f00a5a56887c7299/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/b97a8dbc2f09a3eafbaa07cd9165d9896755c14d/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/4affa267ddc92eac7d52c0d2d52afed34715b5a7/
       arm |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/d7790eb919ec4b698179e6225bca2c5662035f49/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/bc1686778b8cee9da423469b7509abfe6ecc3595/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/19dfbfdcafdf82501106d4a4baef6430ca786982/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/5f0b3c467d4606d4de42bf45029aba5c8abb1207/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/efece39011866b6ef58e3eea533517ca3f3bbba5/
   powerpc |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/0f8d7b9d6ff78ecec77dead3c425c87a02484092/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/e6f4cc9dcce43d1ddad9d52f2fa9469baf2bcc98/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/6bb5156cf7c94240fcf1006312275c0abf9a80a0/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d31799d6a6e27c355c7761245ba1051a402d30e4/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/c0008d4e3f848e6c30125ca39ddf81f45c86f45b/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/56177939ea50455346f4b67bd1c1ad2b6ec131d7/
       arc |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/a59dd36d5f9c530fd43d90553242f232a849f940/
       arc |                   msmtp-1.4.31 | NOK | http://autobuild.buildroot.net/results/cd3c93c97287ee6052ac9ee367d9ebd010a37011/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/1b3cda545aa43d1eead9b175c733f7cddd7e55a8/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/b09302c06a5186064ecf10f9f8a430d473f01200/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/77d9eef6430977c11aa3bfababe7ea6e9eb91fc6/
       arm |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/30701b7933bc4c86cd715806a85b987bed647923/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/f6a93cde204bef56cc6220f483c33306d8eb384d/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/8412bb2d558fbad0e050e22136ea283d9eb4812a/
microblaze |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/1a7edd748c90b5449d03e9582b6eaa152fad94ed/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/c327f2df1ab2453d6a2b03ce106662a1da8056be/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/66af6baece52d7cc51c485b3162f17293e956429/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/e1e4b9a215a8cbe456b8a00ccc1e6cefa812993d/
       arm |         portaudio-v19_20111121 | NOK | http://autobuild.buildroot.net/results/ba2d3832cb6838b2126e0f7db223305eab579d59/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/05ab29f6ca80e734f95eb147f62435e6752979fc/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0fc4ba71b3f9a289db6a0dc301ee5360d26ba21c/
     avr32 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/2ec48b80fd85fc727430c3cdba8fa7f18aa6f7c8/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/ea7a9128924b967c033f4b67e8ee06fe60c3df19/
    mipsel |                    squid-3.3.4 | NOK | http://autobuild.buildroot.net/results/e2bd161354cfc41982f0104e2a8799353f329f01/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/0c13c4c2bbafc4f110cfb2fbd59e7af5d0aa152a/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/1efeab2498e9b9ae554591b35d44d4f7ad685714/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a0ab7c2381497a6e8f60b7f74b28e80664e88821/


-- 
http://autobuild.buildroot.net
