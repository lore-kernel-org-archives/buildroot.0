From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-19
Message-ID: <20130720063007.08E3B52C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-19
===============================

        success : 97 
       failures : 45 
       timeouts : 1  
          TOTAL : 143

Classification of failures by reason
====================================

                 libffi-3.0.13 | 4 
                 qt5base-5.0.2 | 3 
                    acl-2.2.52 | 3 
                      qt-4.8.5 | 3 
          host-protobuf-c-0.15 | 2 
                libtirpc-0.2.2 | 2 
make: *** [/home/test/test/... | 2 
                      icu-51.2 | 2 
media-ctl-ac40b79f002a2315f... | 2 
make: *** [/home/test/test/... | 2 
               qt5webkit-5.0.2 | 1 
               alsa-lib-1.0.26 | 1 
               bind-9.6-ESV-R8 | 1 
                  poco-1.4.6p1 | 1 
               libgtk2-2.24.18 | 1 
            qt5jsbackend-5.0.2 | 1 
                 ffmpeg-0.8.12 | 1 
                     m4-1.4.16 | 1 
                  stunnel-4.55 | 1 
                   expat-2.1.0 | 1 
                  libedit-2.11 | 1 
  CXX    DerivedSources/Web... | 1 
                  ne10-88c18f0 | 1 
           imagemagick-6.8.6-2 | 1 
               binutils-2.21.1 | 1 
                libiscsi-1.6.0 | 1 
              e2fsprogs-1.42.8 | 1 
               w_scan-20130331 | 1 
                 libnspr-4.9.6 | 1 
                   mplayer-1.1 | 1 
                 fdk-aac-0.1.1 | 1 

Detail of failures
===================

       arm |   CXX    DerivedSources/Web... | TIM | http://autobuild.buildroot.net/results/0e3a37ef4d4ad6afd82d099c53b5ea54f7a014b7/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a876a90ac7028e389aabf0dc8c65ba6ac996c7a4/
    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/efbac53e96090ce107e92c57025d0b232f46b59c/
  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/afd344dec49b858a4d3c4ddd3f94e5f459430876/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/480db76fc636e3a11cbbd76ed33d46438b563c12/
  mips64el |                bind-9.6-ESV-R8 | NOK | http://autobuild.buildroot.net/results/674b4d086e6f5930744eb06920855d5a562b4611/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/e7798703288eca4df834c93caf3f146e40d1b362/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/4de82ff9e56042dc22b5ac8a15d040b3eea8da5c/
       arm |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/41c292756a3b2a57897f2c03bbe89855d0f7627f/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/8555adf40956a9efe661637b1ebfafc8196ba339/
       arm |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/30dabad9746bcc9e24296f8f9de204f1c331f7a4/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a560e2d7e8ef98209b17c3fb47ed615c1abeaae4/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/792a50d645bbe5115662768aff04e91b6c3c7cc9/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/cf2943972293b7c962c32a73e969730ac1e90961/
   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/90e7155e57852449ac8fdb03cb761af0a5ba2c1e/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/33899410e9a81912610e59797cb99afae655d613/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/1aceea19b24328148148f54a7779333da0b1fbc5/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a9315c20014b73ccb9abe02d9b69459480600914/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c81e2fceec90bc7fb28f939eb1e16f2e2809cd07/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e0790aeae3e97a556d341fa9ee748e07efec2be6/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1ae9c08e86c0ee23587c64017dc118c866a8c1fd/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/840d1fda9738a1af9c1a6d88a531a4b544ae69dc/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1ea9588bbd0e55e972342aa0286c66bd8a2dff8a/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/214b0e9b170fb284de9d87bf4a89eaaad5071337/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/4eaa8a5f7a9d838dd17f0e28c48b084005b7f34a/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/75f9e73b95ca4e66b2942c0ae6013a3e4c9a5c29/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/5aecd1db1aea7ca1c711f3d532f098de0922b0c5/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/9869dfe6a9584ce0ef9b07fcf73a86f8443b9705/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c669a6d42af5a3c9a6f813ecc586e827dfbda931/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/025a5a51a49b05d8b394cf38e1ae3514cfb54f20/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/21d97deeab12301ad9cfefea5e0791a6363df20b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/2f066a9f8f7ff3d461df99789ac491466afb01cd/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0c1092527a8c1173c20713eaaa750a335fac50c6/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/ca7c7251991ad733613bea6177e53e0bdfb37b7d/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/3f5a940f01d24f815f2c7b8368417dc8efa08295/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/d70d33f8b3e1a7375a8fe9a41a63bf11d73421c3/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/f042beb5e61a9859de4add84ab0c983889f8319b/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/634d12ef7df52e2a14c0080141f58bd5f479598d/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/755e027f6f8b3cb1f4c104921de0d8318519e75a/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/edbf30e432c28308654bde810e15623ae230dd9a/
       sh4 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8afdf1e91fa48b64b58b525e2a7ac13678c4dcab/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/46ce8368686a38288353e56c1906d3462ae7730a/
       arm |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/748b5f956d4aac801fe5694b39031a1754a4c9e2/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/19d3f1942705f60a67af7f5e230b303171180be3/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/a7ea88eb9941605f384f61f75e7c61e8c55b26ad/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/615105e2c72108df03e900c7763d2f00747ec421/


-- 
http://autobuild.buildroot.net
