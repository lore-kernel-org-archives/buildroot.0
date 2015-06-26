From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-25
Message-ID: <20150626063016.4D6231014EC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-25
===============================

        success : 219
       failures : 42 
       timeouts : 0  
          TOTAL : 261

Classification of failures by reason
====================================

                  uclibc-1.0.3 | 16
                libtirpc-0.3.1 | 4 
               upmpdcli-0.11.0 | 3 
                   tor-0.2.6.9 | 3 
                 qt5base-5.4.1 | 2 
                   glog-v0.3.4 | 2 
filemq-482797b8aa30fcc9ea13... | 1 
                  qlibc-v2.1.6 | 1 
                 lrzsz-0.12.20 | 1 
                 setools-3.3.8 | 1 
                  weston-1.8.0 | 1 
               libsigsegv-2.10 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
                  libv4l-1.6.2 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                   zyre-v1.0.0 | 1 
              gst1-libav-1.4.5 | 1 
                  fan-ctrl-1.3 | 1 

Detail of failures
===================

    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0b08db79fe36fbf46eae9e9b826d4568d69532fe/
     powerpc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/cbae1051d486d6015d08d6057000232a8ddbfe07/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/79f655d381966f3aefa4142ca28e583044a635fb/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ca3703097b5e5bde7a4caeecba72090f941fb3ef/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/90662febd9bfea16c6e760501b51f770e82056e0/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/c26aef5561f83f6f7c5b9ebddb3843270087fd06/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/f50856d6bb806085519a1a375b58488d80b1542c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9f09a2e224f82f9ccf9124a8fcd49081bd68a6d0/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/8a473d25ac2fe3f7729021a94f2406fabb51d165/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/53c25715b753c103335c6cd501ad63bb1e796863/
      xtensa |                   libv4l-1.6.2 | NOK | http://autobuild.buildroot.net/results/558abc1c71280756262753ce492521a497e04795/
         arc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/1282399551583bdeb6c5e309688376103d36fafa/
    mips64el | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/392c7a234aa1c48494c3d95881fae190efd364a3/
         arm |                   qlibc-v2.1.6 | NOK | http://autobuild.buildroot.net/results/a0540ed23bd2d48cd742aa1b0228719b13e162b6/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/e09287aefc81b33f97df6534564e6f7bab11c4d9/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/6d9039de51b3fe4dc3725b0fd19a1678386735e6/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3732e51c1f2185646590e203a8a8a4a1107c29cb/
         arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/f73e6480e2421c4b8790be3061a240c411694a35/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/d3d8c96bda1d895dcb3db3249bb43873ced05a74/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/a57a6667b6ca557a1ae184b23fee96c34b583204/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/102440a8844751511c3cef2f7f7cdde84bea8d62/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/72f1b642e5479015652776d8a26b9b578b3e454b/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1c691c7576d745bf81f907d2b52a345d403fe695/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/c25559c12edd33991f1a11211add1df2884d313c/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/edbb4799d5bacf195f75e4b26cba5c58db33dc8d/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2b9d2984d1625eda5ba74d861dceeda7ef791fe0/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/52335384645f941bb2bcf69880c97516a68770e5/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/ebdbe9b901db3d121b7116c2c4038786d9a17706/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5d9975ae9314b9351a81be6b8d30a6eeb7e9d09a/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/07b4bc1539b26dc3c1b44b541ff5475b9dc57bf2/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/73e87ec9930fafc77b95304f9a56504b29f3dabe/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a3e8623855c341f18a88c7fa18436f4f163e9815/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/fc47df239e001079b6607fedd7dc1fb3ee8f5d27/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5381c1029e98d68be7c1b9608a9590025da22580/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a8b46cc11ea027a64c96901075afc44569913d1c/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/9cdecddf7104e0836b365df22b4384673e2ff9c5/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/ca7ab83f6270fa695dd6660a391d199aae61863e/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f6d45d845c4c9a39bbbfae7394566e625b5092de/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/161c7eb9922bce8d1393b69d5f8968d05c47e9f2/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/0249b838db0522bb18438d0ab5f6ed7c91115a37/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/9f4b79a6dee070bb09523fb1857586d6e9192ae3/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/a66a8a0efa3a034fe8df90e251e126c023a35ca6/


-- 
http://autobuild.buildroot.net
