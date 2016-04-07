From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Apr 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-06
Message-ID: <20160407063024.E6623102B22@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-06
===============================

        success : 206
       failures : 62 
       timeouts : 3  
          TOTAL : 271

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 9 
                  connman-1.31 | 4 
                  ffmpeg-2.8.6 | 4 
            webkitgtk24-2.4.10 | 3 
                collectd-5.5.1 | 2 
                sg3_utils-1.42 | 2 
                blktrace-1.1.0 | 2 
                     mtr-v0.86 | 2 
                  boost-1.60.0 | 2 
                  trinity-v1.6 | 2 
                  vsftpd-3.0.3 | 1 
                   open2300-12 | 1 
                   mplayer-1.2 | 1 
                    cups-2.1.2 | 1 
                   nginx-1.8.1 | 1 
            lttng-libust-2.7.1 | 1 
make[2]: *** [Source/WebCor... | 1 
                grantlee-0.5.1 | 1 
make[6]: *** [libavfilter/a... | 1 
              strongswan-5.3.5 | 1 
                   systemd-229 | 1 
             ipsec-tools-0.8.2 | 1 
                   erlang-18.3 | 1 
             lirc-tools-0.9.3a | 1 
hidapi-d17db57b9d4354752e0a... | 1 
 toolchain-external-legal-info | 1 
                    ruby-2.3.0 | 1 
           lksctp-tools-1.0.16 | 1 
                moarvm-2016.01 | 1 
                linphone-3.6.1 | 1 
              gnuradio-3.7.9.1 | 1 
                 mono-4.2.2.30 | 1 
                 jack2-v1.9.10 | 1 
               opencv-2.4.12.3 | 1 
       openpgm-release-5-2-122 | 1 
                 mesa3d-11.2.0 | 1 
                  stunnel-5.31 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
               libsodium-1.0.8 | 1 
               polarssl-1.2.19 | 1 
                    yajl-2.1.0 | 1 
               valgrind-3.11.0 | 1 
        host-gutenprint-5.2.11 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c541eec84f2b1994bc4636e804f37fc7663d3309/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/978ceb48e190d7abafb2e12a6a62b6215f560a1a/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8534b349a5aad9ebb080d7c631e9df3dcd1f6673/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c046cd7b7736f2a87a79ed1cff6b1ebb0edc1884/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/71aec2757b5f9e402dddee14040f53b490bd5ffc/
microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/b2d6b5a4579cc1b6bc532756165953276c4db4da/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/99bbdc63ceb6f2bfa9193ffb6e7bc7c6f0eb55c4/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/8fc86677a48e0b655e1effa22230c881c8088424/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d6f43aaf380503ca4da6b9bba33de3f85302ce31/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c3018377c66845d262be24c99b58cf351b2d7c37/
         arc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d3b0fa269bef86083afab4e61e88fbf435ddd98f/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/ced595646ffd707f2936ab1c8a96b674c857108e/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/8781d4fb630391d075c548d7e9d14cbf150f6133/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d6cf538c9b43bc7966707f9efc3aff0e9c5bd264/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/2dddd636f3491a4dd4e64ccbd4821eb911a4b518/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/ed4142c88a970055fbb3b2745da735f4a2b122b0/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/814a8cf784443ecde0ec5694e0f7234bae43ad00/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/708863f96a1dc8c268b7444dfc6896b288660eca/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/cdeb93da39ba3676f835f37e7d8ac160c858a724/
      x86_64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f906ab2ff4d757b5fa2a9339dcb5ace4776b3698/
    mips64el |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/da24663dd191ba54e123d6b74b76c2efefe06ac6/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/dbf697974885a3472b9f2e8d2edcd162740de268/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/15beef766b2a895b4024ccdf2ed555fe6977f7b1/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/ad8dc2e84b9d55ae4615f7339a8f47ff35ea36ac/
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/17545f39719a115c73b773d00b62001608ddf727/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/51d4137bb3a518ce5f42a533d935e46efd808ccf/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/3e6700aa0114d0b1e6c5af9b313d9867af6c46e6/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/dc84fff403fe510190882d4517ce0a91e73b1c0d/
         arm | make[2]: *** [Source/WebCor... | TIM | http://autobuild.buildroot.net/results/ac5337c1b2a5398a8cbf0df3709dd112b19d61e9/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/2000578f047d7538da9de751252d177c59337def/
         arm |                  mesa3d-11.2.0 | NOK | http://autobuild.buildroot.net/results/e919dbe6660a6c8c087969a6646e97dd058ce2c7/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/818624f5e8aa97eb297ff60a4b73bd20c42659f0/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/b680b2d758280e52a0d5ed9340dbaf8352aa3f5f/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/dc83a4f92a93f5d24af00d21871e06e6ba0d5603/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/894ac5024d4f8cfcb2aae25b42360e07f47d6a81/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/1cfa92fc8e9f76d4f73da02b4b37a03bc2ef4fdc/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/79d6d8d950893194fa73fce7326934642a1d8f8a/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/44cfe9963343432ab882c3f16864c1a2506fc0d2/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/a744634d69514815e641a72c06434ff473b13d6f/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/7b219887fa1015ae85b2f17690ac91c8fe6680bb/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/67ef4ffff6611183473b275b9034d03312be6176/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/1544cdac1f6dec5a0e4689996d65f5c1f5ff2a2a/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/1b27d0498d8550182aa56f1a058f1cadf956ab46/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/699941618b30adc233905d5b197927f93987cbcc/
         arm |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/456d87f5131950304b2d006afc4f8182917bd502/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/ecb313ad21fc69e6edce78795359110ae0b72497/
     powerpc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/b725fcce52fd601820a40abb9886818a48ae5ee1/
     powerpc |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/2f96644e4589cdfa73cbccb0415e30dcc2c42377/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/85c52cf1bea8f039a33696efd3e472e4ce8d0c41/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5853d12f954613a1f6e9c75ec6dda4bcc429e3f6/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a4f587694db65878763e94bc03f23b68e1a2d121/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0f5eddb916c733e33d22888f367777069aa92c67/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0a472b263b4ee2ffc508dcf629194e722a0f8a8d/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5086f80a3af13281b82553be7b40f5926119b9f4/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/27cc5be58f3d2cfb76a52bf2a7f76e5e1798ac06/
        mips | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/369326041a04323d2942d03ab8e573480911cb05/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e523dfecbd9689254dd93813b78a45105c22d5c2/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/3c77d24133904650c0ce484f22a5c6cc7f666de6/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0afe7501bca30e61ffbd515829ba8d84f69b6e56/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/16c0bad0e5143c4e5bae1c14c929391c15684a95/
    mips64el |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/adb54495ae44b258a486c466c17d617ec6d972ba/
      x86_64 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/5708d22f1f1867ac3e8aeb13417be8a9554af9b5/
         arm |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/8dc337a27511cc44ef23d7c1d12a5311e684eff9/
      mipsel |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/fb8b2e9facfe7353bea994722d7fc4fd1c4c76c6/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f3d3fcc959e4841080d2ee5723d25bb594b00c22/


-- 
http://autobuild.buildroot.net
