From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-26
Message-ID: <20160127073021.C898C102373@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-26
===============================

        success : 203
       failures : 78 
       timeouts : 2  
          TOTAL : 283

Classification of failures by reason
====================================

                  boost-1.60.0 | 10
        ltp-testsuite-20150903 | 5 
                      qt-4.8.7 | 4 
zbar-854a5d97059e395807091a... | 4 
iputils-c8ff6feaf0442f8efd9... | 3 
                    ruby-2.3.0 | 2 
      kismet-Kismet-2014-02-R1 | 2 
             host-nodejs-5.3.0 | 2 
               valgrind-3.11.0 | 2 
               libcap-ng-0.7.4 | 2 
                    sox-14.4.2 | 2 
                  connman-1.31 | 2 
             webkitgtk24-2.4.9 | 2 
               trousers-0.3.13 | 2 
               nfs-utils-1.3.3 | 2 
                       unknown | 2 
                  gamin-0.1.10 | 2 
                   erlang-17.5 | 2 
                 dropwatch-1.4 | 1 
                 mesa3d-11.1.1 | 1 
                  c-icap-0.3.5 | 1 
                   mplayer-1.2 | 1 
                  trinity-v1.6 | 1 
                  psmisc-22.21 | 1 
               host-efl-1.15.3 | 1 
                   libndp-v1.4 | 1 
                    vpnc-0.5.3 | 1 
                   kexec-2.0.9 | 1 
                oprofile-1.0.0 | 1 
                 libdrm-2.4.66 | 1 
                  prboom-2.5.0 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
sconeserver-3b886c3dda6eda3... | 1 
              rabbitmq-c-0.7.1 | 1 
             util-linux-2.27.1 | 1 
                 qt5base-5.5.0 | 1 
                bind-9.10.3-P2 | 1 
                 lvm2-2.02.138 | 1 
               libgtk2-2.24.29 | 1 
              gst1-libav-1.6.3 | 1 
canfestival-7740ac6fdedc23e... | 1 
                 igmpproxy-0.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
                   slang-2.3.0 | 1 
               libsodium-1.0.6 | 1 
code/CMakeFiles/assimp.dir/... | 1 

Detail of failures
===================

      mipsel |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/a4354a163ace893347901ad47ca6c01c8e83e6ee/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f2fa11ed9507f3ac91a0eac1ac316dc4772cb85a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a2a270ce554340a33abf9edb1e50f21fbb4d479d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cbb6a88bd5b2c1799ef17c47e71fc5e2243005af/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3abcdea04ca712ce31a8583e612c01e2ac950b70/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c933af3f6ff951acf1d1002fece9bae34aa50ad3/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5ce114d3751b80fc8a6a0f026033c39da71450b7/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e13179645947bc2b437d789f3ebe8c5a7acbc99b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc43f08be7f24f97f53aa398aa0ef3394595d86a/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/36ce1ee420f115ad42db335f364d7101e579da38/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6d9bd7b225351fcc5ec0cac44a912ffe38178682/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/64d4b5ed19fb0d7b8abb85acf1139cc18cf1850b/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/a81314ad1a27c01baf6ae6c5d70532c02a2b026e/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/4fc139666056eedd7cbd4d410e182f079b6e6f13/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/179c9786306614c2cdfbd465cfc49ae246f9198e/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bf654f4188d0e55d8790da44f1c9656aaba9baa6/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e1331892e105a32f8690eaf9f1fffadb4337b64b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2090874eee165af3349cf2d597657fc1b4ca1012/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/ac9ff02a09c73741bc5d43ca305452d191a4f480/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/69336c2ec3d88ad1dbdf9b7618100648eed0bc67/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/ea7387c6db76d5a1c00e07c4f4a9a977463e6d96/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/94c2f3b94378c1fc53549935027d3e404c44cac6/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/6728cace3c00fb9e9577c49bf547375872201d99/
         arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/bdb120a802c7cdf8a2d3b64a9c9791a1f76f6933/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/1ef588efa53946c8f5bf8cbc81452a136a7a74e8/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/12df20efdcfd489efaf27220582fe8d5b960df09/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/6b1c0763dcc20a94c2c291f087db052b50b9c8c7/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/baaf22295c5830dfa21258071236061c159f8b0b/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/4819414bbd965772c7d98b583b73e39fdfe82db9/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/a1b417f0ab524880d40176b658a29901003eeece/
      x86_64 |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/57c87a9e1993309dc30d562e26cfef2ee15a5f5e/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/e70e3d5692d67a943ac3423ff87a35a30e6477e7/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/cf3e605f7a6e7a2c9dca1b588a424c967f5aeae8/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6fdfa3e2cc5e42dd0721e672868ec2f0ded6fd92/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5ab4501d1a15961a72b1d62f03937ab7e09e9459/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/4dc03a9564f2438917f0b96c3d9e9d430e1b4a18/
        sh4a |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/c887c42ce0fd9d9f1a9dfcf54e0edcdb5734e51f/
      x86_64 |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/d42bebe51bbec38f131840b6bbefdc162f0ad194/
       sparc |                libsodium-1.0.6 | TIM | http://autobuild.buildroot.net/results/0f6fd38275b6ebacbe0bc7b26227555f43f71aea/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/fe0b211f3db0ae4df41e325f9d2b28b3e058e83c/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/38341b6f87be9f94a1c36c91f79afc5044d7adde/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/2df5daacc72794c2a85eeb24779df9a17638a0a2/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/763fc7b1e85a63c62b872dbaa9a5b175d1068817/
    mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/fc13d7ecf5ff363ea36b0f014c07eb696471ee73/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/b25847e1b8eddac6104c5777a8137e419eaefe64/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/8c63e368fdca8b27d11de2df97916e84806441e8/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/86d3baf293feae5c8f190364242277589f0bb3d7/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/2b93c11ca3a5e14f8bdc15fc56367750737c1e52/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/118bb3fe0375055957b4c4dd3c2002cce15e9117/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/b40e94a9f942eb057e792bf2ca829301f87f7fa9/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/8840d86316f883e249d6ba1645e58415fac4ffb3/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/0ae2be3bb9ec60380c63c598db8c8b343fe97b27/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/f9626c3352be644f1d46d78cf089212649ff9dc1/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c83813faf513ed1cfbfa7d7f9306b1ebd4b1598f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/360e9667a2d64cfe25a8b9a462d5109538f95146/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6b69c25deff386a35b22aace00e900ad0df40aac/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9df6ebe903a96e9f7dee2cbc0a889c2911c1a14b/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d59b55f29ce1069185be3f37ef9d1578414a631d/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/df7714bf2b8ecea50f416f5c432cba40f8726178/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/b47ea905b9570af1b6dad89356a52b5669bfb356/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8d5e6e23f85c93f24efe53188794287e1d064c92/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/c4948228e0f24d9503c5c55d6f50e0c12a30df81/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/98875db3e7c54778e6e86a70e7575db78e325028/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/e9be050a16b0ab82de642c143ff0097c9deba7e6/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/986e3069541c1d22f223cef94b413a65512cd6e0/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/021c1af48332c35224a44687001e0c8390bc6479/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1333756fd8968f53f3726885850f81d09a7bcf38/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0a5c2e89e6211a3caebff379bf576e5dd05983e5/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/d4d4c886809b4988ff26bb59d068267672205435/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/d9e3a61b50ac48d9376ee2702022703789510fb7/
     powerpc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/dd5bf5ef75448a1098a974ac07524dde0844767c/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4628936d4ac50cf88a3482b3841eccaa6af8eb00/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/03ff18c6d4f6812983829fc7bd1434ab2cffc5b4/
      x86_64 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/d71081f48b29bafe6ba95708133e19bde862636a/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/ea24f7f40eb97334e6b12957d0d194bf7b330777/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/78385d0c6494a23f2150fa9fcc8e1c56f778edbf/
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/25c99cc79110386be2ec43fd55ae063363467a26/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/477558f40f0a91ac456d73a2b6b4fa857912262a/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/c34a05d43ec8ab72cbd9d28393c3efbb88f41ec4/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/f8e341b580ce7e43d42bac8aaedd978f31b89b0a/


-- 
http://autobuild.buildroot.net
