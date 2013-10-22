From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Oct 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-21
Message-ID: <20131022063007.389B952C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-21
===============================

        success : 91 
       failures : 52 
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

                    nano-2.3.2 | 4 
    trace-cmd-trace-cmd-v2.2.1 | 4 
                    php-5.3.27 | 3 
               libglib2-2.36.3 | 3 
        gst1-plugins-bad-1.2.0 | 3 
                 fdk-aac-0.1.1 | 2 
                 mplayer-1.1.1 | 2 
                      qt-4.8.5 | 2 
                openssl-1.0.1e | 2 
          host-protobuf-c-0.15 | 2 
                   duma-2_5_15 | 1 
            kismet-2013-03-R1b | 1 
               czmq-cb9839cf90 | 1 
                cifs-utils-6.1 | 1 
                  dhcpcd-5.6.7 | 1 
                libiscsi-1.6.0 | 1 
          openpgm-5.1.118~dfsg | 1 
                  nettle-2.7.1 | 1 
             berkeleydb-6.0.20 | 1 
                 libpfm4-4.3.0 | 1 
             alsa-utils-1.0.26 | 1 
               alsa-lib-1.0.26 | 1 
               audiofile-0.3.6 | 1 
             tvheadend-2b64995 | 1 
                 dropwatch-1.4 | 1 
                     rpm-5.2.0 | 1 
              cryptsetup-1.6.2 | 1 
                aiccu-20070115 | 1 
                 libffi-3.0.13 | 1 
                 libevas-1.7.7 | 1 
                 webkit-1.11.5 | 1 
                   libcap-2.22 | 1 
                beecrypt-4.2.1 | 1 
                   squid-3.3.9 | 1 
                      icu-51.2 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/b203a5fe2f9d6aa80dd8371cfcd8efcd393c8df5/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/eac0ef939fd2870e906bb083e6541ce8e1696a27/
       arm |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/433e1fe6a6bb08ce9dc1fb49ca76b1c0c45f454a/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/22c28d363a6d73bf5a5036cc9bcb81ae3b016b46/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a039848ed4b9b61fcad34c2ec8ceb4883f84b5e3/
       arm |              berkeleydb-6.0.20 | NOK | http://autobuild.buildroot.net/results/f2f05a5243f0f15fe7f499a857c438cbb97dac0a/
     avr32 |                 cifs-utils-6.1 | NOK | http://autobuild.buildroot.net/results/56370cfdc5c7624dd1bbd219b7ea151ec30e5b91/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/f1ce1ada117a402b03acc6a37762e0418ed51ea4/
    x86_64 |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/ba0e9f604cd9e22b3c48f22669bbbe56cb908e0c/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/8a3ace0d4f28854201fe6e04194a1720076f7ed2/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/14714e1c191b00b773986d194675891d46773a3b/
      bfin |                    duma-2_5_15 | NOK | http://autobuild.buildroot.net/results/892ca985502d9e5a315ea83cd7a8dbcccf24b241/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/056a5b9126fd0d98397cc93d4cf26c35f727f8ae/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/ba4a42a8c30ab155bbff8d6e241304d42f7dbf6b/
   powerpc |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/c1efe0232678d79d717d62180e691e11daf37432/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/653d1d18d7210c297aea9a672021951262836b9a/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/1eef323a0c44f071588854bee99b477893ca1b98/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/31c54ae160de727d1a35b80a23924ac98dc946a9/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0e6d46b93b9853cf57999f3828e32a8186bd8264/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b6c21760ad053df95e4050724b525172e1959f40/
       arm |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/6d747b673c5eb190cc77a215367f3aa39a014d7a/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/6b657545c3aa7f1de182d58f93e0bc3e6d9d6520/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/eeca8fc16af9ce3c0b863f398767a7eb15753090/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e2b502d9995054996b844934001adb98f9588a9f/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/99242516997c4a636ffd904462db930b9a902b32/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/97a1624dc4c149b4dd346608c5be39dcdf73f54f/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/53786dca5d3c91537a20691714922276e4970fd4/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/c6c20dd148e82f32660454720063799006ef3a87/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/7e7ae4eee1e313a6da36aed4946d17356b6a9730/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/d88a4dfa5f1be914b8cb658927b82c8a5c60bc65/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/b6b02d0942781256ff7ab0be7f0c5d177ba4eac0/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/9339fc4db52751970bb2a8853fd84d39d8716ce2/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/89d7ec7306411b15f9ffbc2051d0d316237b4c07/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/80dfdf8d63dc13e0eda650f7804f21d2e2681d6c/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/51b9a69448b825a36d20276d982109c26a688cb9/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d6e485c402e01971efdc391b66922d85794e4196/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/e04aa533712ba02c2d1b0b589ae1f8a456eff999/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/685a2a84a653c6f39a3035e87ccd3c72bb48d8a7/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/48b3a227b78a7862e01711f33e842f6e6518e5e2/
      mips |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/b1a9ed51c09b2a8a54af43298e3010dae2a43018/
  mips64el |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/6940fa24f95d4db69962ef7e084dd46a334b4cd0/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/fa2d0a1ab67f5b8ca3e4ad0a392b5370b352a795/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/60ae434c823f232283bff3b6d4e21ac70014556f/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/0bbc684b59612cd128e197a92fe4607719d39a9a/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f577ea3da3b3637d81a81ed8d0753d7a224cfa01/
     avr32 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/b76a084109ebd62cf83ec2651ca96c762dee113d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/37d17789f91e59a79db08ef1e202d4f87216d252/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/51527b0bbf174ec778fea45bbc580f3256d26028/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5be8d43baaeda6ac0ce48e1d56aa2faf34b70a8e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/08b1bcc0134ac0631c886aacc5afbd83be172bfb/
    xtensa |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/9125220ffd9ad06b121ebd04e507c8cf9dbbd430/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3cd144965a81703d7ef0ee07028eeded4245daa2/


-- 
http://autobuild.buildroot.net
