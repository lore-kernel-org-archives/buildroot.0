From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-25
Message-ID: <20130726063006.7E98752C5D5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-25
===============================

        success : 123
       failures : 66 
       timeouts : 0  
          TOTAL : 189

Classification of failures by reason
====================================

                 dropwatch-1.4 | 8 
                 libffi-3.0.13 | 5 
                 binutils-2.21 | 5 
               alsa-lib-1.0.26 | 3 
                  libnl-3.2.21 | 3 
               libglib2-2.36.3 | 2 
                mongrel2-1.8.0 | 2 
                  prboom-2.5.0 | 2 
                 libnspr-4.9.6 | 2 
               binutils-2.21.1 | 2 
                 libiconv-1.14 | 2 
                openssl-1.0.1e | 2 
               audiofile-0.3.6 | 2 
               uclibc-0.9.33.2 | 2 
                      qt-4.8.5 | 2 
                      icu-51.2 | 2 
                   attr-2.4.47 | 2 
                  iozone-3_414 | 1 
                pulseaudio-4.0 | 1 
           imagemagick-6.8.6-2 | 1 
               w_scan-20130331 | 1 
                    flac-1.2.1 | 1 
              vim-699f8d8f096d | 1 
                libtirpc-0.2.2 | 1 
                   dbus-1.4.26 | 1 
                    fbgrab-1.1 | 1 
               libsigsegv-2.10 | 1 
               ruby-1.9.3-p429 | 1 
             gdk-pixbuf-2.28.1 | 1 
                   neon-0.29.6 | 1 
                  zeromq-3.2.3 | 1 
                directfb-1.6.3 | 1 
              fontconfig-2.6.0 | 1 
                 cairo-1.12.10 | 1 
            bind-9.6-ESV-R9-P1 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2b03324ab4fcb6814d5ca65ceb330b2b72b86841/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b1724a05f43701fc89826395ddb0895a28e6ee0f/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/95f6dab91d96d8825497c9ca744c94855a3f4b25/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/acaf2e115123166f8d3fbefbfd47a453cc9da03f/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/13679dff97c810e15a3ea19910e1be6770a2d9bd/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ddc7db9b4023ed327a1e4a65234fd57752b3bda2/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/4824d64213226df05970b444b21ff8dc318e2e6e/
  mips64el |             bind-9.6-ESV-R9-P1 | NOK | http://autobuild.buildroot.net/results/f2b643b94331f82bd1ba8000e1f46fac9e31a1fd/
    mipsel |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/bc848aaaf1016d68b656e094abc1ad5f925b2f9a/
   aarch64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c68a6e8c76c3c89b226629e46dc663bb297fb9c8/
   aarch64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d4d6b6236e355e2469344db7d6bc03fff380aac7/
   aarch64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/37c8acf965b6b3c8222f6cb7054257da0240523f/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fd7fa49e1ddc1fd37ae7329fce1ee6e4b3b7e5fe/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/248285d290cb02fa9f86f5f2311d6dac68631b6a/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/f487b21f7f15882735446041d2ad4fb83209fee6/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8b678a85c36d80ba4b6271adb5caa59a7de87f15/
      sh4a |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/0e1921b5cbcee036c5712825e19dff00d77ec258/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/4cc77a1d85adafa67e439bc28140a9494ca23368/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/243d9c390212b78bd6c2d7fc3f50b7c99ec4189c/
    mipsel |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5193e24885d5adb0133949f6c99953fc19bf5d65/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/72b7b68ff5e31079f2eafb9d25cb3f9c29f5c2fd/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7a8f81c1746b0adb9f8fb35606fc42ad0a24a20f/
      i686 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/df92ab512fd21a56f7258c9655dc8eddf33152b9/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3af07d3fe327ef357f1313f88aa8552845439ad2/
    x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0de05fe99d243c680562085d46fd2abf4e46b07c/
   powerpc |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b2f98e57a4c1de28ba76027a623a8ae28b456b03/
      bfin |                     fbgrab-1.1 | NOK | http://autobuild.buildroot.net/results/5dc179f054fe8eda4cd95aca8d6c41143e4a9a82/
  mips64el |                     flac-1.2.1 | NOK | http://autobuild.buildroot.net/results/0bed604ded0a0ff18f821130a3652fd68dc5b0da/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/9db36cc30f65fe6665b9e103f98ac5a33954b52d/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/ccd30081eb7898d9bf9e44b3236bebd24ad7603a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/8452a70e96c4e3e7cd78d92d7d28bbcb8e4e6066/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/decb25c8c82ea2250e4f70a4a576c0646cba721f/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/5e1e180bc4f83e44db60b0329194b7b5b6c28016/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/cf2400cba7c2c44b929a81f8277a98975d507c2e/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f81f5ca72fac2add34e9194bfbc7d9ebd5732957/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6cd937522eb2d1d51b49b889fedc0133e342a7d5/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/852eec6714c77a0c8152d26a816b310293957c20/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/bc968a7aa8bc920218eb632cbda0aa6b774e49f5/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3621b40182ddcf16e7d0a4fba2a72c5df9a83db0/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e9ab0081c878f75fbfc1e336fd52f3dd868b0296/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/57b5384756d72917e3e1212c2bae0ffc105b519e/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/41657a213ce162872a8ff2e49d358a65e95936bb/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/c59a78710d17a6325a8f3b2dffbeb306aec0b978/
       arm |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/6ce4b82a31bed979e14c5d6e7875acc8cdf42a27/
       arm |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/4e5c206a79a61ef11841c629603c49f477655e3d/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/b540ee1c0fa62bda7a4d0408dc59231038d5af1d/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7a35c00060982b29b8c9d58d27875e2c141584ff/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/528c3a541c74548e959cfae76737bc8684df8835/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d0a847dd6cf264e29778caa141c833560953e772/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/59785569a1374fe273c61d5e923c26a7871ba337/
    xtensa |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/47cb35a7790f73bb181cb5daba6d81045546e672/
    xtensa |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/4fada35bcbbd009ba3cbb3297cbe32b632896f18/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/2376dbb066a28bc8e72da695725394a86fdff42f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/76ff1cf6322d60569e50f15f3035947703950b35/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d20edc464202241cac94ddc341aceafaa7af624d/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ceec7634621ebc8bc28201606b5a253d44de0e8a/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/2c479eae809b08d0a0982a7de83102659f2c7b7a/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/4d424b2720aebed3c9e7aa1513849850fd31b690/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/87f1e84ef2e4c4264b4e04f7ba4999c7a09510d4/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/43a9dc65b6ae8e19ebeb27b76cb22bd4597b33c5/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/97d764aea00042b898a759e3c2c06fc9164dd50d/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/74a79ac52c35450c632a1dfaecdbde82faebffc3/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/bccbd10fe3dd5eef08afaf6f348b62654f48dcab/
    x86_64 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/c2c70ce2b0963971503eb5bedf17a41e566f4280/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/fb7889c326b7f033ddfcf3e2e7a1ceab50580522/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/a37f2f06aba4f5bb8871b58c67b97c4107f92717/


-- 
http://autobuild.buildroot.net
