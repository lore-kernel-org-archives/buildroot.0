From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Mar 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-29
Message-ID: <20160301073021.01B48101C84@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-29
===============================

        success : 188
       failures : 60 
       timeouts : 3  
          TOTAL : 251

Classification of failures by reason
====================================

                  boost-1.60.0 | 5 
hidapi-d17db57b9d4354752e0a... | 3 
                       zsh-5.2 | 3 
                   mplayer-1.2 | 3 
                 opencv-2.4.10 | 3 
        ltp-testsuite-20150903 | 3 
                      qt-4.8.7 | 3 
               pax-utils-1.1.4 | 2 
       openpgm-release-5-2-122 | 2 
               libcap-ng-0.7.4 | 2 
                  trinity-v1.6 | 2 
                   erlang-17.5 | 2 
              gst1-libav-1.6.3 | 2 
host-gdb-6be65fb56ea6694a92... | 1 
                  stunnel-5.29 | 1 
                           all | 1 
make[3]: *** [code/CMakeFil... | 1 
          chocolate-doom-2.2.1 | 1 
                libxslt-1.1.28 | 1 
              strongswan-5.3.5 | 1 
                   mp4v2-2.0.0 | 1 
        lttng-babeltrace-1.2.4 | 1 
                    cups-2.1.2 | 1 
                minidlna-1.1.5 | 1 
                   tor-0.2.7.6 | 1 
                pinentry-0.9.4 | 1 
                 setools-3.3.8 | 1 
                  gamin-0.1.10 | 1 
               iptraf-ng-1.1.4 | 1 
          libpam-tacplus-1.3.9 | 1 
                  cairo-1.14.4 | 1 
          powerpc-utils-1.2.24 | 1 
libwebsockets-v1.4-chrome43... | 1 
               wireshark-2.0.2 | 1 
                    ruby-2.3.0 | 1 
make[6]: *** Waiting for un... | 1 
              rabbitmq-c-0.7.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                     vlc-2.2.1 | 1 
                   fio-fio-2.6 | 1 
               linknx-0.0.1.32 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/d9d1bd99c2c33cceb5c3ff9a41e91ab396c0ba91/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b31a9a4c52e81470e1bb4ae8b7f50fd501a6ec22/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fcabf9c71277e3c9077fe1ce34d1619006e17dea/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ba7a0a3623c95512826226fa0df2696c66abc343/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/81ceb7f75e4fdc12242dd449818e0024139d6f26/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fdb10ac27125243eb22624a21ae93d7ba3f89408/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/aa6e0be329cd8860f636cf84d158ebe783e7b1e6/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/0909fe8cbfde1b63de05233f9753fc295cb548a1/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/586865a1a0d7b04b21d8e8a5e29fd92bb6bcf61c/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/b0c685c1c9316dc92e6f7d9171dcac70ff7a118d/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6c4e1fe61882ccea8014cace18f73e573c75cbba/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/576404104673afc62e0930810d089e5f48240e1a/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/69d2a93bc97ab0d70c3acb2f9c9f28612ea95871/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/a268c86d28a79f11ac9efa6265009f16c51cec65/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/baba92d17ae6e1bd2d71153bd5230647c9fbf580/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/751eee12e1a665c5f8f007104aacf5acfb8b3207/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/b20f41e87aeba11810617fe216be46f036988c75/
       nios2 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/e07cb6030fae5d785dc65acfa5d650bf857d94f2/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/e31478066785d153c389766309b48258d9f8f1f8/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/7a4e049214d33025ee40285feb951934dfeca7b3/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/b2f70fdef2b381ff1930dde4c310b3d7014f8b83/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0f18f4b7b2e90475214a1ffb33ec64026bb156b6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d5297dbde8c2744b739aa42575d356b4dcb98cae/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/3090edb44c3c719c1e3bf235604cd299e523d4d6/
      x86_64 | libwebsockets-v1.4-chrome43... | NOK | http://autobuild.buildroot.net/results/ab45ceb8d898f86298a343db08b685347a1beb0e/
        bfin |                 libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/3f8d876ed6cfe6e73a75fa8904ebdd3f6f0fe53c/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/80335c3bb6e06512244efe71535f3d42e004d58b/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/95d1f4d70d8c52df3c35301180535ea7629f6567/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/d46fb022bc493836414cff4683cc58a9a4843f3d/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/727de0ed3eb2975bed7ca64c28bee2fa7bd910ad/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/86d1a84d382f16635e180b5bbd4f763930a1fe95/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/2a8940d8b777ab7ac77560c85902acbf2a49621a/
microblazeel | make[6]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ed577f67ec01b46f4a67f6f46289153225bd366f/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/3f6be85648550c4ba583c4c2a79fb2c9d38e2fd9/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ffa4de6dda5e33b3bce01cb6d4c6b78b016c27a5/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d8502e0f6943d008f98e14964636f0252271a80c/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c8418a5259b5bcb1e853c91a0fe4a0b17590612d/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0e04e9bd3854de284d9ea7ad6d8b6659a58181b0/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/35597069a08c2b8862ba2a09916a3c9a9bd34a36/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/afdaa70e0f67881b8f08dd05b3c4e38a1bfd5989/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/76ea063756d88242d287066310252911eafd9f32/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/34c3fafe56d0def7d1d4f8c6f9328e050d7297af/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/fa8a664b3f9c393959c5d65a69c286df111ae53f/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/4ffa3ace225cb1836a1c0ee537b158f7d2ff5181/
         arm |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/7467f710802d1f36ef9860d57001e036077dde03/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d7c20dd020c15e59f362d918d0a4c2c3f5bdad2f/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/a1240ed6facb99518d71153c099dbd7d3d847af6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1280bdd240ffed1a663494ce244bbe140bbf7144/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dbceeab1ece174b393e36fb599f7032b7ad466f2/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/75d436fec1c8b55d27595abd3a9946f37f95dba1/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/2a04f9c7a2e0efbe73910a95a2f0297c6ff93e99/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e2f36bcfb4841bb2eba69cc676340e510e845210/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7bffb0bd7fdd92bbb0c318b1d93e1e0b14a01244/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/77133da3294f1a47baa9bed90e3a911bd6deeb42/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/d4be958c263da29205d880996b84ae9594a0db5e/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/bb68101e5b700e0b640733f2f24584e3672e9596/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/61f65d297a5dc59f8ace144f9cabe2e0e01ec35e/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2e11012913af9e23f319914a0d35728abd89d874/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/bdd1554ae3f2b737c4561c15d9564acd0504aecd/
         arm |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/e0f6bf27058ceeee5f5f9068a2da7db82e20a0b9/
    mips64el |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/752eeb388e7d1ab8de28e61b3a0d91953e62c3da/
microblazeel |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/45cb459f030edf4cb519133a4b621bb44d9ce901/
      x86_64 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/8e8b12dbca4ef8cac2e5f33cd3cdcddd8e849840/


-- 
http://autobuild.buildroot.net
