From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-05
Message-ID: <20160406063022.AA9751037DB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-05
===============================

        success : 202
       failures : 96 
       timeouts : 3  
          TOTAL : 301

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 14
               valgrind-3.11.0 | 6 
                blktrace-1.1.0 | 6 
                  connman-1.31 | 4 
                      qt-4.8.7 | 4 
glmark2-499aa81a68fb4c8aac1... | 3 
                   erlang-18.3 | 3 
               opencv-2.4.12.3 | 3 
                    mosh-1.2.5 | 3 
                     vlc-2.2.2 | 3 
                  ffmpeg-2.8.6 | 3 
                    ustr-1.0.4 | 2 
                   systemd-229 | 2 
           lksctp-tools-1.0.16 | 2 
                 igmpproxy-0.1 | 2 
            webkitgtk24-2.4.10 | 2 
              rabbitmq-c-0.7.1 | 1 
                 mpg123-1.23.3 | 1 
                 rtptools-1.20 | 1 
               cannelloni-v0.5 | 1 
                linphone-3.6.1 | 1 
                    dash-0.5.8 | 1 
             bluez5_utils-5.37 | 1 
                sg3_utils-1.42 | 1 
                oprofile-1.1.0 | 1 
make[1]: *** wait: No child... | 1 
                 mono-4.2.2.30 | 1 
                    yajl-2.1.0 | 1 
                 lvm2-2.02.148 | 1 
iputils-3a86a2542c6fe29413c... | 1 
             netbsd-queue-1.70 | 1 
                    pppd-2.4.7 | 1 
                dovecot-2.2.23 | 1 
                  c-icap-0.3.5 | 1 
             lirc-tools-0.9.3a | 1 
                 jack2-v1.9.10 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
                  cairo-1.14.6 | 1 
                    ruby-2.3.0 | 1 
             ipsec-tools-0.8.2 | 1 
                   exfat-1.2.3 | 1 
gmrender-resurrect-aa3d02cf... | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                pinentry-0.9.4 | 1 
                wayland-1.10.0 | 1 
                 libdrm-2.4.67 | 1 
                    php-5.6.20 | 1 
                    vpnc-0.5.3 | 1 
                  squid-3.5.15 | 1 
make[2]: *** [libWebCore.la... | 1 
                   nginx-1.8.1 | 1 
                  boost-1.60.0 | 1 
                moarvm-2016.01 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/97702c11ce07b18454f8aa4c840b5bf699fc4c88/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ed925f4142f335b8f4e02d223797a0dd9d74b9a2/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/37c455224c5e9a2adb141df3bd9c5dd8897ecd1a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/80b2a3613531a8ee048ba24f411d1b424eaf1263/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/34a13f22592fd7bed58249fb16f91ecfc4068b80/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d48036dbdbbb4d878ad4f8e350679fb2b8308613/
      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/591bff72da14744d7501c567a5e24bd7be13e7e3/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7dbdfc62fe4169a721e5f17649afff8f9e4b269c/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/e9b4c322838deba04cc05113f5e5c797b09e3248/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/397a377d587369893e41f187eeb2478bedd5e0c6/
        i686 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/ff0d1a3b0ec6174bade95e1aac1383fde8c2d36c/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/637e455f11f988ffdee355309e956b832a31cb21/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/2baf198bfa0faa59ddf494dee02df3471f9cc9a4/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7d72791010d05a77cec4fd60c7a1bad1a3f67d73/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/91d617517ee722e4c78597e747cc03799c9317e6/
         arm |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/d65029c2515d8426125b48767ab7c38e6167f5a7/
         arm |                 dovecot-2.2.23 | NOK | http://autobuild.buildroot.net/results/5a8fd664b81b661cdcd834dc5b4d22d05823cca6/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/3174c08234a9392e9cca93870761496128ed23a3/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/24ef8e6abf6d3e512bf19d3e8af73c2d569613b9/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/2aee0315e40c4e73a8d3a8ec81fb09c02efbc54e/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/edd1994575869739fdc5ce69b9462513aae5ddcd/
     powerpc |                    exfat-1.2.3 | TIM | http://autobuild.buildroot.net/results/78ce5224a7cc7f251c761378dd5f25935259183b/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2f7b795549c26f6798bacbf1b49e08dab64aa9fb/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d88f1ed4c595c31b981217ddbbd63edb038266f9/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/abd9da80ad1d772918a5d74df91f3b0e0fcae6ec/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/424c5947d9c16fc0add692962cf62fc2a39d841c/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/fe204471598e4180b8896969015f8ee9a2efa1e1/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/5ce1dbba89670d231f65b92e872a49a47790d558/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/49fab119283b7d33b3ac49d5477991a2fe887cde/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9d9d1c5d355fb03abf69920f3ffd426ecee854b9/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/eac07a8a3844c6bd42d8ef9924a8c823cb261a20/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/282db5ec4275a66c8e2dfeb925d3fd857b35c631/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9627e76e6abfd50b9b14892ca913251430bfcb33/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/387bafb3158987ebe7e99042e57272b11f8faa2a/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/c02e05c4615d7ae586f070c3d9b7e44ca902b642/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/e71b164180bb1567677493b3f80fd908a9df9516/
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/fd45ed1175a44100f3b0941115d8f4ecf8b45c82/
microblazeel |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/01f0f736decdba38d82d97b09a4f73f3a794f71d/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/7d72d71e250991713712f0b293aaca202a99d0c0/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/e428bb9134167385a6e4783d0727575d156a3536/
      x86_64 |                  lvm2-2.02.148 | NOK | http://autobuild.buildroot.net/results/2a317c57200a86d0b47ddb3f1f06e91efd98919f/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/5f552cca328de4782355837b8ed2d0e2a99b4b9d/
    mips64el | make[2]: *** [libWebCore.la... | TIM | http://autobuild.buildroot.net/results/c8c0abc85b50e0f3a17905a4934131e26178b06f/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/73da6aebd0f9fc1e92517dcc559d35ac9551d2c1/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/1a41db695dcfbf62daa706053996f18a30c0fc41/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f571cf13462833984504b6dabad98a6b0fb3facb/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f0518f1be96e0b170baa491155e3a6965fd0bca4/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/9e567648e7967cc6deda5d0db6f8f5decbb4a1b6/
         arm |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/0f4bc38d9e066825dedb66bfbf177e40a1358c60/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/31cbe437464e9259576002e8ee7b41c35fce0f74/
         arm |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/d1806140eccb1202cb8b223289510d64fb28acb6/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/ed3d393f408cc087f241a9433d3d8c2eee7ca759/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/820e97e905f1faff5dc9b00e374053b2902cd31b/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/bbeedc28badc60fb5aec3d14d21a04fa69c052e3/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f77ed06cffbf684d03101a9c60aa39584aacf2e6/
         arm |                     php-5.6.20 | NOK | http://autobuild.buildroot.net/results/6d599c4366e6d6fc2bbf044a70e07157af36db15/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/12bd3525d0fb5073db9fb62edc0b6ea94c3e5030/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/fdcdeefb9f5848b2669c269743e67f11ed4fa982/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dae4d48c66679d6529e4011a817ba601b6ad1e98/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6fba301d18874bedd7866ece035d2a0d4eee9c89/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/edcca5b8669015f26386ba90d2cb6c35ffdf0bb7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/54da716610d934b69bba300dcde42eeb7fc6611d/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/6500a0ac2586d7ab4fbf025cb90e8a2de9b6f018/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/5bad40610316392c3f213c3e2a27ac76abd88de6/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/91d5c55210d7c41fd2a2df8d59086d39692b69be/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/d2449732605c46701f41eb9499d405d2fd8dca07/
         arm |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/cca26a97f41571af7a9bae9f4222ec49ae1a0213/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/9ad3e45fb3082586aec4836b62e162dbcfe8ccdb/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/b46980ae96d34615c85f1d85f077df26ef90c00c/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2633143cd94e9e5eaa35ea4727c18c7e205d380c/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5264943bf58f531008d4ff2318c77dc0cfbf5309/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/3ffc5b6c4470c501ac5058fa2df42de183602ea8/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0759a74b03c5a5ca47f0fdda5b37432ef156bf05/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c75965f9ee226e187122f4534b46cb4639789588/
        mips | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/ce1e8d733e3cc54cfebc923434f20a73b05d5e31/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5016ba605713b6556945c3f43278ec5d4814967e/
         sh4 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/10022000929b7591d1163c41664d4843557de5ff/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/b4af59e0beb7cbe1f0bf8df930afb5de3e18e440/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a6f808472af3cad347bf5b28bee6caea9cffb068/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/1c8eced091827b76482c351458307bf19c147462/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/3ef1b818a633d2f0de7a3463fe6c2f11de7f6d17/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/6159f3f520aab95982e91f30b78511cff56eec50/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/533be4cac771efbd869b951733f73be037459e98/
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/3dfd4b73c0169955ca0f306792158df36a7a3c7b/
        i686 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7db34a4427f3c0380a38d8eee78c404cb2080648/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/eda980e97f3474ec66afe5e02e410b9809f780f3/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/540995f86aa39e6ccabbfa88180430381aaaec65/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/34c988a445e035a1f5f2fc480f8cfb2beed9759a/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d8ed7309db295b422dbccd8d0c04ba4ceb3026e8/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f296680979c45f69e487d95826257011716a762e/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4683b4725a09482d487baa7e1cdf90ab07959555/
       nios2 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/2d629148cc31d3c51cabbf64c15d92cf48608c5c/
    mips64el |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/8c42743bc9f1d4fccb4a670fbf132f9798ddfd1c/
      mipsel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/50c04adbca3735a36f9046bf92676a44191b8dc6/
      xtensa |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/8740aa05efdafd559940e9f177cfac51b55e57ae/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/11e322bb58ee4735cb0068b450a4514ce50d065c/
      x86_64 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/084ec92aab634d2cc7b882fc0ae96e6998bba0bc/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/9e5cd2adc7d83c34d4fbd03e421e9a2495774739/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/358407c4c18317633c0025aa1e7c06114df70722/


-- 
http://autobuild.buildroot.net
