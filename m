From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-17
Message-ID: <20130718063005.73B4B52C0FD@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-17
===============================

        success : 96 
       failures : 42 
       timeouts : 1  
          TOTAL : 139

Classification of failures by reason
====================================

                 libnspr-4.9.6 | 4 
               libglib2-2.36.3 | 4 
make: *** [/home/test/test/... | 3 
make: *** [/home/test/test/... | 2 
                  poco-1.4.6p1 | 2 
                     apr-1.4.6 | 2 
                 qt5base-5.0.2 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 rt-tests-0.83 | 1 
                   neon-0.29.6 | 1 
                  aespipe-2.4c | 1 
              e2fsprogs-1.42.8 | 1 
                openssl-1.0.1e | 1 
               uclibc-0.9.33.2 | 1 
          host-protobuf-c-0.15 | 1 
               erlang-R15B03-1 | 1 
/bin/bash ../../libtool  --... | 1 
                libiscsi-1.6.0 | 1 
           imagemagick-6.8.6-2 | 1 
               ruby-1.9.3-p429 | 1 
                      qt-4.8.5 | 1 
               pcsc-lite-1.8.6 | 1 
                 ffmpeg-0.8.12 | 1 
                 cdrkit-1.1.11 | 1 
                    acl-2.2.52 | 1 
     xlib_libpthread-stubs-0.3 | 1 
             gdk-pixbuf-2.28.1 | 1 
                      udev-182 | 1 
                  libedit-2.11 | 1 
               qt5webkit-5.0.2 | 1 

Detail of failures
===================

       arm | /bin/bash ../../libtool  --... | TIM | http://autobuild.buildroot.net/results/78a2009f6c5b91671c18d813cc716ef5cdf4be73/
  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/df2fc40a4f9a42b4d4b13de898c23a7ea4ad2564/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/abf46533d3b0d93c2ce5dc1d74523d2161d73607/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/7069babca199f56811b8e8d7a5e00879f95456e5/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/1e2cf902c0b83532b29c4fa1d33d8def60b10ca7/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9fb7f40c0cd2c0bbec2a3f5fb184392bc383fdca/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/41c565002978cafc6cdb3d5520620190eecd458f/
       arc |                erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/d1cfc3be3f6f998db126b61f413e612338c77242/
       arm |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/4eb4e1efd71236524a802de12d161a4e17871999/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/37c08ba9d2e2f0d2816ec184b09929b26bc86428/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/1c4ab6af68d3b3ef8aa2ad11b3523296bebe146c/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/cb98daa169d64d51c57f44535803ba82395ebd8c/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/9c4c4b30fc279b0d7cf9cc113ba3880fcc014e96/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7d9a3303ec0fe30e187b6335be57f1f695e60c1c/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/bf5db48d23cc665331ffb3575ed8fd7da284f4cc/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/5ebaf03c1d63a86bea7a9467f9fc6dc953de13a1/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/01306915de6eab8064c1ce1b6e3d5eda2cc7a499/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/6df0140dc22de1db7aaa2112738d9aeb90a152f5/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/2808d071125c7595930753fe4246d55cf824377c/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a70b911cb0e6166371f1ec22ad7157cdc134cd2f/
       arc |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1388fe5c22ad06995a986d6ea76ffce745077924/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b7f2fe597a3e40e5f0f825040275f1c9ed150ee6/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/8070ab03a843fe6bdae16fe6085eb6cd8be8c7ea/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5f576d1a6550b602f05492eb30f3511fb21d3e57/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c467fe0d6262dfad2e1b580e93a4e381aa6deb50/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5ac7c08e15e0113a6807b84512087818ce3dbe32/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/7c3c790c6416b6fc7d2aa966614ac061705b2c95/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b23279a519928535d22734f494c872fab88ee82f/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4879eaff1c8214e345166a48a4ad6598095dd481/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/19f306078625dbf1703a38547ccfcc5d903d0ed4/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/5964bc5fef46e81342fc84f38857920ce10b0895/
       arc |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/0a596cde97806b943bf5094c9ca83fd97947aeb6/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/7ecb629af6f3f37c7f89b5e667f2b678c75e81fc/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/ab2c663cac2deeacc9150da79228a0e9a62c6067/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/558960085c0f23bf0cdb8dadacb93613ec298118/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0dff1395c6e16ff001ac914b9a33bdc4ec0f13e3/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b1ccda6c30b4eb4f0055fd3aae55aaf733119385/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/7f88e56dd2dd8834a583c1a19b6f728e48569c3a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/66d8dc75dd42a5c2d13a2d483966146922ebac72/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/d068c93d2f3385e2ccbf914da059f1ad71719330/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/5ea62697ac3de7e62364230dee24471f2a6abe5d/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/846d496d699af61b23337d670724aa4948f964d3/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/01fa719d61694f3d7229e7e131787b089c462a22/


-- 
http://autobuild.buildroot.net
