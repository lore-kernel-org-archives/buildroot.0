From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-15
Message-ID: <20131016063007.6898652C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-15
===============================

        success : 84 
       failures : 49 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 15
                 binutils-2.22 | 3 
                      qt-4.8.5 | 3 
               libglib2-2.36.3 | 2 
                    php-5.3.27 | 2 
                   mdadm-3.2.6 | 1 
                    ngrep-1.45 | 1 
                 omniorb-4.1.6 | 1 
                  boost-1.54.0 | 1 
               uclibc-0.9.33.2 | 1 
                     wget-1.14 | 1 
                     tslib-1.1 | 1 
                 fdk-aac-0.1.1 | 1 
              e2fsprogs-1.42.8 | 1 
                libiscsi-1.6.0 | 1 
                     apr-1.4.8 | 1 
              sdl_mixer-1.2.12 | 1 
           imagemagick-6.8.7-0 | 1 
                    nano-2.3.2 | 1 
                 rt-tests-0.83 | 1 
                valgrind-3.8.1 | 1 
               alsa-lib-1.0.26 | 1 
               audiofile-0.3.6 | 1 
                      gpsd-3.9 | 1 
                    systemd-44 | 1 
                  zeromq-3.2.4 | 1 
                  libnl-3.2.21 | 1 
                 webkit-1.11.5 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e2bdf2ec0f44420413faabd41c0ece7bc09ee664/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/6d267123f436fd12d2ab43dac0bb635ae0c22118/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/dcf71c7d74523099c5e63850affaf5aed0e172b9/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/02c9b14ab7cd784fb09b9bc02ade6238b3761588/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/1fa265c9cdda8c79cf3ccf9fa9ca6cfaff160bd8/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/8c20156bb4d8be909ae1367e1e8e043867d477ae/
   aarch64 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/0b69d7b33dc16ea27e395a949cefbd0a35c92f61/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/1f877ff3d8023b4fe38e20dee5d3613f24d3f1e2/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/e20e37068de0d8c31acc3f8195fcf67970d07d8a/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/9f6bfd3e536ad63a6e46f255e563e987cf1c22c8/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/df9a48dea35400c9368ac40cc341092078f2fc0f/
   powerpc |            imagemagick-6.8.7-0 | NOK | http://autobuild.buildroot.net/results/185ee8a265a4b0bbd98cf04951a15162ad4b6a56/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9ff31ed605528ac4096a6e84ad3a46eb1754c720/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a63906edb6be18ec9c140a7e6dea764228b3bfc0/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/fa278c3ce9925b794cfb49571496216dbdbfd82c/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/9addefe5128b908d59308ebf3365aecd81d1d95e/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/0ee64da1d0594ec983bdea92c72f3e6a3845d690/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/634bfd89d1bad7a3a563b2caded28e63fd55b1b2/
       arm |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/d828389f03771b76af3cf71ceebef0c5ced0de83/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/915e5ad9f888f3a26741315b7a5f1358726cf1c1/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/645b5fc98f1c8243de69f0fb89dc26f07ce17a7a/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/0e0601bf768f55da6c91aa9750c3fd0d15cc24cf/
      mips |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/92e70675b1184274227632a6d62ead83cf422a81/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c6640e46b032b605c51d2ae4bcc332215c06c922/
      mips |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/892297a252e66ac842409f9ab4d0fe0abb4f646f/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/297484a07d86127488e0e5db23b036df084ed5b7/
       arm |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/711c600c7ae26c01c612b7e7cbee39a4b2bfaaa4/
    x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/8a698d3c01c8e138da7fbec0357f20507536fc6b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d5d9b034d5924b06f86201d1ea8d8a9dbac03e17/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e707df0f71a38d7d1c2d734703dbea7ebfa0221c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/023e90caa430db10917829046b6493ee94909d74/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7a7394b5ed087aaa778660e0b4e05edd509d5236/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9d56da2d6ff9b418204d190914b8c06b629cf161/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d216f4d6f71f1a23780dede3e70516d7bb79bcdb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eda7f1d4d02cdaf88a1481cf87549c874764ca5c/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6a4e0af47b0740cc9175bf72a45b7f50d4575cbc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/32c9de8c8c145390bc1d9a0ab0da9b53a3265682/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/10ca3d53c083d80d8ba7d89fb3ed6ee6805e11af/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6af384dc37b8f6cbd66150d0b520c5d90a9d20d1/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6887beb9aab33b6d629cfd6d506a4e047537b3cc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/043b7fd068f3dad8089c5d532efef35627fd8241/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0cb2bad47929b2f3e6f0f96c2c44c60ac1e4b749/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d91ff7b4f9845536dd3cffbc804b2f29784c7047/
      bfin |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/1242cbea015e5a24a6621d1bd5569d2a1a819bb4/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/a0a439e40b59fadc3f3688226897f9865f5b0a86/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/e4201d29d4a5456a7276be9ffc47ead9cc90441a/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a70da0be7f31783debcd248b62131932d3fa49bc/
       arc |                      wget-1.14 | NOK | http://autobuild.buildroot.net/results/a674df2ded173262bb5433670bfec45b96637315/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/ce538345c942c1b617d071f53331108aa7b4f162/


-- 
http://autobuild.buildroot.net
