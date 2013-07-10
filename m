From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-09
Message-ID: <20130710063006.CFE9552C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-09
===============================

        success : 67 
       failures : 74 
       timeouts : 0  
          TOTAL : 141

Classification of failures by reason
====================================

            host-erlang-R15B01 | 12
                classpath-0.98 | 6 
                 qt5base-5.0.2 | 4 
               libglib2-2.36.3 | 4 
               qt5webkit-5.0.2 | 3 
                 libffi-3.0.13 | 3 
                    acl-2.2.52 | 2 
make: *** [libgeotiff-legal... | 2 
                log4cxx-0.10.0 | 1 
make: *** [dhcpdump-legal-i... | 1 
          enlightenment-0.17.3 | 1 
                  connman-1.12 | 1 
make: *** [gd-legal-info] E... | 1 
      gst-plugins-good-0.10.31 | 1 
make: *** [googlefontdirect... | 1 
             uclibc-0.9.33-arc | 1 
                     gdb-7.5.1 | 1 
make: *** [mongoose-legal-i... | 1 
                elfutils-0.155 | 1 
                 cairo-1.12.10 | 1 
                   mplayer-1.1 | 1 
                pciutils-3.2.0 | 1 
                     pcre-8.33 | 1 
                      icu-51.2 | 1 
                openssl-1.0.1e | 1 
                  prboom-2.5.0 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                sdl_ttf-2.0.11 | 1 
               binutils-2.21.1 | 1 
make: *** [bwm-ng-legal-inf... | 1 
make: *** [mediastreamer-le... | 1 
                      udev-182 | 1 
                   libcap-2.22 | 1 
make: *** [libcap-ng-legal-... | 1 
          host-gcc-final-4.7.3 | 1 
                   neon-0.29.6 | 1 
                      gpsd-3.9 | 1 
               w_scan-20130331 | 1 
make: *** [libffi-legal-inf... | 1 
                  webkit-1.9.6 | 1 
               libgtk2-2.24.18 | 1 
              e2fsprogs-1.42.8 | 1 
                    crda-1.1.3 | 1 
make: *** [libecore-legal-i... | 1 
                  iozone-3_414 | 1 
                      bash-4.2 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/68eb99784ff6059e3c8e6146c87e4d6dcebf7fc5/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/af463794488f02e2f5614ac677cb4a7a997bce19/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/28f7c4ccc9ac23935ed052ac704f16b59204c413/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/c961d84ad7b12a3e614ceac1062e5b4d98567a24/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/cac6d95a3c4f37a1a29a8b7a6010fbb6c394a574/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b1970bd21722c8cc69648b0d5eb762c471303ac5/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/c173521b49f4b15a361912b7f94c1e80df497004/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3a621681411837037dcb7e8bd69078229a6a2ab9/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b4ce1646ebc512bd6b88bb769326ede684ca87b5/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b976802a0f671dee88c2b60ed7a785d74a832b06/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/993bbe4c52e475e3a4e6f9549650413e5bdbeb1f/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/d8d599497bf715fa5a9415b606b2bd73a6ee2d34/
      mips |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/034f3591bbe2f6d66e41d34edb84bbbd662c38af/
     avr32 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/5a14ca32c1dd8d0624e835ece827b0a74e081f91/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/138a65c5bd8c81cf3e4b9c5815780ad2602af220/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/35008e919b76c4808f71c791f1107fb8aa344fd5/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/6769f15720f4efec7086e989437fd2262318339b/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/4217c54614b69a1a91c720b1166dc0f8a49b4077/
   powerpc |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/e2b1c5219676c7d033353b7bd8273440c40dcf49/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/76d2952dee8ce67f9c231051913270c6352abcb1/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e6af7a6406a408baebd1535093bad831d2079c0d/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f4847dbdd904778c173e8b134139e83cf96ade05/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f175e13499845efce28d44bf0317895f821d49fe/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/29f58199d2387e70373ec234b2139ae021fc8b93/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/db07cdab8473be995f9bbec2d01670f6db14d9c1/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/688cd78f23b4d3a2ac8b8ecad8912a36c357fbcc/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/16c056978b77f2c7810c10d7cdfe74383bbd40c7/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/f090f7c6ece65f552d3970e6dc7c53d50c1ff5b2/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/6d38055d69f4c0480728ad9abcc62b771f8080e0/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/7f601004444ee853740bcadb18e04a93c9b74be5/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/b3c44def57c01d65ce1a9706ed47fef3a6c15a48/
   powerpc |           host-gcc-final-4.7.3 | NOK | http://autobuild.buildroot.net/results/3688f330dec07ebe3943c3603cbbaab00bfeddd8/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/9a9389706f7bab637372c5159b01791faac11dbc/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ec919c91517d6083fe3c8d7a722030378d43c4cf/
    x86_64 |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/cd1c712dea715eb07cd4c94a8f160f2b2a03af36/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4f4e9b951c54c5e4b96b6a8558a02fd389e376de/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f2c626e53afb457297bf433d32a221a4ac3eb207/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9c5fe90e562f52cbcc4a55b3d3606a5b9aeac6e5/
   powerpc |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/59da0803d5538c17f59a6a4a2772c6e101991f96/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e2cb9c7a2d027d9741b6529be8adc16ecc0a63dd/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/117d19c4ece5b9639ad315359df4052214f8bce3/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8e386b0d6919235bcbf12559dd61a2a1538b9eb7/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/a6e54c9930ae3d17025138474f9c829c0342bc6d/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/f0ca24b265cd477b21957875e2be429bacfe01f6/
       arm | make: *** [bwm-ng-legal-inf... | NOK | http://autobuild.buildroot.net/results/fb7b7328e6669f8dc28d9004668afc420d56ee29/
    x86_64 | make: *** [dhcpdump-legal-i... | NOK | http://autobuild.buildroot.net/results/b6da4271216c4302ca0c1068709ed935a31c9acc/
       arm | make: *** [gd-legal-info] E... | NOK | http://autobuild.buildroot.net/results/6d9e9872edcdf72546f00337c8518cdd0a95ffbc/
       arm | make: *** [googlefontdirect... | NOK | http://autobuild.buildroot.net/results/d3a710ec61c7ff636d84d583e3b37106cde1ccf5/
       arm | make: *** [libcap-ng-legal-... | NOK | http://autobuild.buildroot.net/results/3793d85c1d8298fee8fddd9b6d34098160f6c94a/
    x86_64 | make: *** [libecore-legal-i... | NOK | http://autobuild.buildroot.net/results/b51924491229fa2d3aea4686cf7de05dcb136419/
      i686 | make: *** [libffi-legal-inf... | NOK | http://autobuild.buildroot.net/results/9b0ffb67e4f8d7258498ec8503cff329adc85e7b/
       arm | make: *** [libgeotiff-legal... | NOK | http://autobuild.buildroot.net/results/9adb2118d239b9b0be54c17002657a4eb030fe34/
       arm | make: *** [libgeotiff-legal... | NOK | http://autobuild.buildroot.net/results/d8bea0632e822981bdef5ee6ea4cdf069bf54c48/
       arm | make: *** [mediastreamer-le... | NOK | http://autobuild.buildroot.net/results/93f7ca3206fe1e52d69fe7ed1c21df0259f681fd/
    mipsel | make: *** [mongoose-legal-i... | NOK | http://autobuild.buildroot.net/results/6f3dca8e49e3843508fa977e09a3472291e7271b/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/f742b075612ad714faa14612e67d86795f038309/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/8c28bf93563b44384af58ab448196d8c47409147/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/dcaf8343b57a3410a4fd0dd5741f3e102313b2fb/
   powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/073f2d4840f52eb3356ed5e6f554f81828689bd3/
    mipsel |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/502421b60fd2ed9c430aec7d3070059a1e4991b4/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/69ed067756b6c36cf4e3b7e6b8903254c06dc99d/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1e744d5b15dee2e2a48198b8fa25e4b85b97c635/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c5f7638afb6adf2b9f13be3b260da1480763b801/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d31c9d99c7c77841839e9b12ed11a0ffc42b8baf/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1039373d57d672cba0e9352fb4af0697475968a5/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/2115154b5d89dddad969fb369516122b32320564/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/146957b1d8c953920d4b81a5d7fd831040e8891d/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/acfac9e2e39737d4b1ce4a22a5a4823aa060e84a/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/b89018e803ec0fd97f10fd925d5b1c2c5e21a1cc/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/eb0acd37949767aeecb25150dd498e5b16b85c3f/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/8648879f3ddbd5c7bef6354919d07688f0116f25/
  mips64el |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/5238f4e7d34c564f369df4cc612af9dfc7a53afb/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/bc0f730fe5b1eccaa7fa2c0dfd82bfee5a3a56eb/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/68603906f903ed64e201ca456c3f9d53c8db5eec/


-- 
http://autobuild.buildroot.net
