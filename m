From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-23
Message-ID: <20131024063007.59F8452C5D6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-23
===============================

        success : 68 
       failures : 59 
       timeouts : 0  
          TOTAL : 127

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 12
                    mpd-0.17.6 | 10
make: *** [uboot-tools-lega... | 6 
                    php-5.3.27 | 3 
                 zmqpp-31220ca | 2 
                      qt-4.8.5 | 2 
               w_scan-20130331 | 2 
                 libvpx-v1.2.0 | 2 
               alsa-lib-1.0.26 | 2 
                 fdk-aac-0.1.1 | 1 
                oprofile-0.9.8 | 1 
                 libevas-1.7.7 | 1 
             alsa-utils-1.0.26 | 1 
                  nettle-2.7.1 | 1 
               libglib2-2.36.3 | 1 
                     apr-1.4.8 | 1 
                 cairo-1.12.10 | 1 
                  zeromq-3.2.4 | 1 
                 binutils-2.22 | 1 
                     gmp-5.1.3 | 1 
                openssl-1.0.1e | 1 
          host-protobuf-c-0.15 | 1 
                     m4-1.4.17 | 1 
                 rt-tests-0.83 | 1 
               uclibc-0.9.33.2 | 1 
                  poco-1.4.6p1 | 1 
                 qt5base-5.0.2 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5f03f0cead29a65ef7d158050dc7bd486c299364/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f45c8af6006c9a928050cc7770057363543ad5fc/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/661abd50e98d09853f4e8b8ead9b6845e3eb734c/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/d033ffcbf8d18fc1d1916f892062869e86ae3453/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/fdc5d439987d988cb14f58726443f2bb41d0b1cb/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0f24604e496cb4765df6c4af34d5da1081292030/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/db57bb423a3926c7e22a70d2ed2503c843f3ff94/
       arm |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/330838ca736ca7f22b6a711b92f1686943d4d153/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/80b83fb012b438b3e53e8f1bdc4dff180d86b4e6/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/661982a8409ee182a92718c98c8f00cedfa16d1f/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0ee2ce3d7646df0c133eec82784cb4226b2ccea8/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/ad7ce3f78d4750459b43c2f895927ac6ec6624c9/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/9e22e9d9e4fe78ee2682a8b30248b8085bb77483/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/02c45381ee45608960ce02b5f91ef9aaf3127030/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/a14636ca8c2d890e96bfb0e4f596819bfdd6dd5a/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/7ee83ef63c3d920b6cdd513d02f6854b321706ea/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/9307e146a91317ee391295f85d474d7143bcaaba/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/623a04f0fb0fb9815bdc04a26c3ecd71a4019486/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/95bc11fe920bcf6cc62032cf39bbea05572de64d/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/eddd50594416354bb439aefd21c4da910b406ed4/
       sh4 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/9ea8764777bd8692c8e057ef6ae7739a031e4e8e/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/2eaa9ddb408ef14900a5f2244efddac0c8cded33/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/b1374d1e9a766ba7656e29113abf563034657957/
      i686 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/33b6288c86b5a665ea4716164e21088bda8cea4a/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/ec2c40f561bd73ea4d8bd27d8c5aa2e7f081f758/
  mips64el |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/74c3d32bbb259e8b82ad6e65113b7d92febe3d98/
  mips64el |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/34f9e2765d5206422ed54c01bfcb280934783d09/
  mips64el |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/cca859bcb9ee70fda5af124856a7d46eb7330819/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/9481b735b14350ebd851f4fd4449eeec8275273d/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/7ec0479d705b9e0407fec55b851e6abf782cc8f0/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/219b04d25bb9c0790a3dcc69c7f42d39c0f4f07a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/df9725309a32b6b35c62fb3a9834b78640118dd0/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/5fc1f9ce385b71e988c5013171535f8177379707/
    x86_64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/42b5ef54d0089b64d347c681753b819ee81a3326/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/928adf0e660a75dd8b9c9705ed21991bc342276b/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/d551870041ca2e9876bf101605db864d80f8cc84/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/f813e6e2a94a7e41868a515f8b2db09de792bce0/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/7a1b58c92c9e40c2391783a6a501e6800ee95cad/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b98ed5d41b4786cc0f30aa7b83484e332b15cf3f/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/2fe66018b0074a5806b1bd3e54f40b05acb013d1/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c444e43dfdc673dd7b819692ecfdb082b98570c2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/53d4d0a62c616aedfa2cd194b346943e6e781dfc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8895b6db7b9c1a5f2563f39f2942c0d3acdad1bf/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f2150b5b0636972c4bcd7595a4472ef05c4fb42e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a5e53f84b1ca7b2f2e478436e80e2f161c3b7440/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/718c9afce629df87590e0a77797fa5ff3d3d087a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/35290f0af484f2f8dffdb582681502c167ff6cb8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b04f09dd9a61fc9d9938b9ac1869fd6b209ab792/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fdb8c16c9fe5469cbdf6494eee9b429c1d20d8b3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4fff92d88a094132ae2a2da673f550e632694de8/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e9e78c7c3a5bc6116f38b9972d12a5d41de02ebb/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/693ff3be7e36e2c137e1eb490448371b381aa89f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/699c8dc9924a014e61bcbc99441b620a17b89ffc/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/da480ac3a6944abfb771a6af440391406e8c1ae8/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/30c7cad389f0dc1af894dadcbd7599122bd93120/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/a850e8de6e740851413de94c857f088fd3fe5e2c/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/ecdc4fc629be8e3eab08a82b688e108ccaab63a0/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/833336c10aee68423225e551b7df48b7cc13c0e8/
  mips64el |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/2062d469d92e198d20e90abdf2340f7a3d52a864/


-- 
http://autobuild.buildroot.net
