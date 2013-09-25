From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Sep 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-24
Message-ID: <20130925063007.848ED52C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-24
===============================

        success : 74 
       failures : 51 
       timeouts : 0  
          TOTAL : 125

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 7 
                netatalk-3.0.5 | 5 
                  civetweb-1.3 | 3 
                      qt-4.8.5 | 2 
               binutils-2.21.1 | 2 
               alsa-lib-1.0.26 | 2 
                 libssh2-1.4.3 | 2 
                 qt5base-5.0.2 | 2 
      host-gcc-initial-4.8-arc | 2 
             alsa-utils-1.0.26 | 2 
          host-protobuf-c-0.15 | 1 
                 omniorb-4.1.6 | 1 
            ecryptfs-utils-103 | 1 
                 libffi-3.0.13 | 1 
                openssl-1.0.1e | 1 
                 dropwatch-1.4 | 1 
                   cups-1.3.11 | 1 
                  weston-1.1.0 | 1 
                valgrind-3.8.1 | 1 
                  libnl-3.2.21 | 1 
                  aespipe-2.4c | 1 
                  connman-1.12 | 1 
           python-pyzmq-13.1.0 | 1 
                  zeromq-3.2.4 | 1 
               libglib2-2.36.3 | 1 
                      pv-1.4.6 | 1 
                     gmp-5.1.2 | 1 
                   attr-2.4.47 | 1 
                rrdtool-1.2.30 | 1 
                  tstools-1_11 | 1 
             util-linux-2.23.2 | 1 
        host-util-linux-2.23.2 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/9bcaa81d35bd98d35ba825fbcd4a550f5396169a/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6025deabe661334e6402d9e8ec920d5de59e90e3/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a98fd3c2f41992a3b9ab30cfd439268f788a2bde/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/a3431426ad5459b6b5dca1c91ad9b30f81bfb976/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/eeb3761a0d8cae7104720408072bec888585535b/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3eab3657992d8fdb20fb9fc5ca6e2fa36558108b/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/b3eb834d1acd9927085552b30e4a175b9159306d/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ecc8c6ee7b36af3fcdd5d13132929d07608c8813/
   aarch64 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/53266d20aa831b9634c23834b69652b816518051/
   aarch64 |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/d258bcfbabd9e2993f6397aa9137bec91988ea90/
  mips64el |                   civetweb-1.3 | NOK | http://autobuild.buildroot.net/results/acfefc4f0f23ef646094ec427c9502eab7b86736/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/fba2c445ffbdb05622cac0a9b0d31f61ec7f5318/
  mips64el |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/427c8930e520042b452eaa8b3bf60b6447d2a18b/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5f526c37d804e2b30ba17bf13ddb7764433be62e/
      mips |             ecryptfs-utils-103 | NOK | http://autobuild.buildroot.net/results/d7088e421184e8eafefb73e5cc156dd55f07dd8a/
       arm |                      gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/68b6f377795ff0cc3bec7454d23906fc17595bb5/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/0a82d67bef07a440f2198963237ba2bd293bb0de/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/c7543e1af64108617bcb1d47549b5160d92db67f/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/e67616f0376c9dd2b8dc677a747930fd6df8907e/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b6a28dcc60bb30f0ea28cffb0925a6e4568b29ad/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/92d15d7ea98b97c2accfec13c4d4d5352b7244ec/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/44933b702b649fffd114f55971909dcf8ab5e348/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/3184690ccb130ae6b1cfc3020c0b7a3196b9c8f0/
      i686 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/9027f3789d97857e0f6374fb2969825da1fb1abf/
      i686 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/8accb36f3487e47aaeb68aa0780cdb95ddcea32f/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/b32c273a155a058522406cce4054080d1eedc7f3/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/0199340b47d6eca47bd9ef3380ed700b67823027/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/315f25da7152226f6500c357037670fc04c99305/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/7a60d1ed2b2c29f3de3e7ec405ee41bce07a80df/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/ecb80851765eb7440a43c21b761c8b5cd791d7e5/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/bb7a5862d42ed1a121daad25c8b24969d40fe5a8/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8014171075416e393b3a17c531853870dced5cb0/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/2f697bee1927fd8282e3eb55a17054059fc6ca9e/
   powerpc |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/4c9d7e4f129c786654d86932114ad08844817658/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/489f3ddcd023e6d1eaf8efa1da99d726f60da921/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/07308dc3120f287230b67a0da41909fcd404d82a/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/0f74bf397a9aa3b859f1596a80d776be14c92ee0/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c77005aa3d43114794a97eb01d85fabc3af1c32d/
       arm |                 rrdtool-1.2.30 | NOK | http://autobuild.buildroot.net/results/f7ab00ddae121ccfc6d54f7eda8ea8ac6df359c2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b8dcd4fc5b55f68883f976c4442a0c44b9b6d53a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/95c059f18a17ce31ccd8ac9d33fbe83c0c235ba5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/da4b113c84ecb00a91a1cbc5e5c1b93ca41db7cc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f1f60faf695a45a55aebaf60f0a206408db303f4/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9ea04ecd663d1cd763c81a93479ac760abe5f524/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0d0364714b39fcb0005c8e72c31e6245bec0256b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/faa903b1e6c898ada7fdf2fb993c0317920510ef/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/90e13e178c9ac7ee3945b18df17791df3f3fa995/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ffc4b8599685027fcd2ef0a4e12ec270d5cc7ff9/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/ad276afd0d3cdea3afdb89b5ff842c473dc3c067/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/19acc0c6c266f28f2b4b97a6d58a2e16c1ca6b30/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/d12dba90e41460768a0de453d09fe35308701eab/


-- 
http://autobuild.buildroot.net
