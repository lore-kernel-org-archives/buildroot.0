From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-14
Message-ID: <20151215073021.58C29101E77@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-14
===============================

        success : 218
       failures : 114
       timeouts : 0  
          TOTAL : 332

Classification of failures by reason
====================================

                  boost-1.59.0 | 18
                 libeet-1.7.10 | 16
       python-pyasn-legal-info | 8 
                  ffmpeg-2.8.3 | 7 
                    ustr-1.0.4 | 4 
                      qt-4.8.7 | 4 
                  gnutls-3.4.7 | 4 
                 libass-0.13.0 | 4 
canfestival-7740ac6fdedc23e... | 3 
                   glog-v0.3.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
                      pv-1.5.7 | 2 
                libvips-7.42.2 | 2 
                   erlang-17.5 | 2 
               libcap-ng-0.7.4 | 2 
                moarvm-2015.10 | 2 
        ltp-testsuite-20150903 | 2 
             host-nodejs-4.2.3 | 2 
                 opencv3-3.0.0 | 2 
            gst-ffmpeg-0.10.13 | 1 
                 openal-1.17.1 | 1 
                 gnupg2-2.0.29 | 1 
                    iperf3-3.1 | 1 
             util-linux-2.27.1 | 1 
               arptables-0.0.4 | 1 
                 setools-3.3.8 | 1 
             irda-utils-0.9.18 | 1 
             lttng-tools-2.7.0 | 1 
       python-webpy-legal-info | 1 
                     fbset-2.1 | 1 
                  c-icap-0.3.5 | 1 
               libbluray-0.8.1 | 1 
                     nut-2.7.2 | 1 
                  connman-1.30 | 1 
              gst1-libav-1.6.1 | 1 
                   mp4v2-2.0.0 | 1 
              alsa-utils-1.1.0 | 1 
             stress-ng-0.04.16 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                   slang-2.3.0 | 1 
                elfutils-0.161 | 1 
          sane-backends-1.0.25 | 1 
                   libnss-3.21 | 1 
                 lockdev-1.0.3 | 1 
               valgrind-3.11.0 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/3e5c2c19781fc88c1bddde7478bfa7e8149c045c/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/05a9fd3d8582431935bd250e2a6e77f2738ca234/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/0c9953f4fa8e6c6d004a0bbebc47bc1be5a7fd25/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/2e88cca05c08b6a95c149929e518119b89082d3f/
    mips64el |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/c9a5bee510599963d953fc4033e129f548591610/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d9095a5629eebe600525702394b92bdca3879fd3/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a92e6fedd7d84e60cd873b4c3b4b296e61a9e556/
       nios2 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/8e0e56beaff710c4df24a059134342ac4bda13f2/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a5f8dd0bcd9d5abd8fb137eb06e3cf1d76db07ab/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/e616bd3da5459fd33ad2b875da7a0178f5246907/
         arc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/7c45615dbf6642af470650ff54de04ca2f19faa4/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/06bdc4cd4ac6ff89da7c4fd68303de62768183c4/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/99af5c5b6ea4994fbe2a461a1d93522ce9a4dfe9/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/28db2fc2d6bffeb7c842fbcce2eeaf89ae5f8b01/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/cbfdfac17fd6c7cf20d53f68abbbb1df536c6976/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/de7dc4b32e621543d4c9ba372cab009c7eac9459/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/fabaabcee9c184e82bb370eadfbe2abc47aeb620/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/134c00539315210d983d179a78e181712b49b949/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/9d3ee6dae808499e261352b0c29df74961613f76/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/222228fe300030288c332217f7827c549792af56/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/04ffe8419ee0ff72f3fa2d613dcdb556556ba191/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/dc18cd9a8a6987f1cdf34bd67fcaa542361fb273/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4385742f8980563aad11751b5bfe9015bd62f3ce/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/67570c4b0665d403a7c748c1a0b5fbf1f6f9b5af/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/b65f6a8bf3ad62fcb8669fec067c9b0928abd9af/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/70d56bd54e1027c5efc3470d6462e0323ed9e896/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0929630be1d3142ff948b2835f6d69e628227b28/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6629ca2293c2e194089ddc850919a61c93337135/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/2efd60e067361e715cbbd5723d3a65ac387be14a/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/f21f4745e685fe2d7cf651738b666e65947cd9ae/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/28376be2134dfd9200a5c618f3f196b49c942134/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/e30cb47eb3e825bc63b73ea36131e413d4c222ab/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/d9fc19dc3edb521a4527002cd171f54b2c87b3f7/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/c833e758f22c57440e1725f54943c63b54547bb7/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/feca671bbcd536d7147bb69d6e4a47f79b3dfa9d/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/b5c42f74d249080d7b5996f4837e7fb5fdca1577/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/aa5d9ae31c22cfa252d11d80c6940b4c28f7ddf2/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ec38da6faf96ba66b300f20a2a3c3a6470a02ed5/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/bbfb269cb461255818aeda7bb1f0093598061892/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d6db4c06ee0a9a1f9581d8e821b3224bd555e394/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/4c0ab2b28500a28945da3f4df742d8c2e2f21cd0/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/cc79b8e00c4bf1939219d7b77fa452c46620b9c0/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/f41dad06e8b7c6a076ec9e279b7e00fe5287c23a/
         arc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/4c542a1e52152bc26715401fb3d6b5ac53a9ed2f/
      x86_64 |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/118ffbe313daf9e57f708847929598c195126143/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/10bfb1c6e4d74b44f0c24005ba8a859553f283c3/
      mipsel |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/8c57bb4b6f949252eb859d116160dcd6cebfa939/
        i686 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/fc3c4442287b527a3a5d3cdbe3256ca912dde063/
      x86_64 |              host-nodejs-4.2.3 | NOK | http://autobuild.buildroot.net/results/7b0e06f94f062e84c0dfccbed9cf3ccb0b5211e8/
      x86_64 |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/53d02741ef1c1705939ceebb674c65e2b4fd9eb4/
      x86_64 |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/cdfde680bb88034ea32538e352e7d5f557919263/
     sparc64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/5d606d32abe910337ba0a4b1a0aae28543a68fde/
      x86_64 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/0f8c77a060097704d2c3102b31e87d62fdd07c5d/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d25b6b8bde5373a021cfc300ea4b685ce8c1c906/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/7033d7663d7ff8ab67b97ec5012dc2f854110fec/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/4933744dc97becdf4373be5d97ab180237afe5c1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/46a0a62541c108fb6a91727834f182323c416ef7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e907840b81118522f4a89804f2837d8f7da3d1d0/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/605b502b4d5043afd58db61b4d4e48d9519ac16f/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/50c34c2d93978a71de7ef6826a95561a56221ca5/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/027194266cbc774c9593ee02edb55c0eb95426f8/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/eb6d6a5f976633282d7c92699bc2ca77207fa885/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7e4722a6ab49838d273295f02fbb66c65823d6f9/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/ce8cb5d1d1a2456476093fd8627e02a62cc08d0c/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cc46ddee7729550dbb1c2804801562eb4fc3b5eb/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c622607315757ef6db0ac3639f95dd360624b621/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/fe6a027eaaba3d7678b4b33482a2485a53af2a69/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/96002b974f6ed3b0e31be02ebc97b9b0b704ef4e/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cd839139f23d0593591cff6db74ac470f2511618/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/2e96d66cc707ef6679c9da1ab6af2814109fa859/
       sparc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8e32af4359854ec7c1bceb75a42d276a7d963a47/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/72edc943ba8d6eb08b66b2e44ae3c38ccdf62d91/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c0bd579e49616d6f10a48164ae25d956f89a762a/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7d2d0dc712768344baa0d57ac932498b2e9d1c04/
      xtensa |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/7908e127001eb8e94a78fac8b07632e8ccc136df/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/2bbeec3bb3078361d1367346f66449d4afcaeb37/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/4b6355c8693d4330f6a200367bb2a970ae103965/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/d63054457c17fb12ce4c19b61e0c583aa1ac7312/
         arm |                  lockdev-1.0.3 | NOK | http://autobuild.buildroot.net/results/73fea4e6052a262fcd38bf622cbcb644450e663f/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/e2c86fab02227f7cb623fe9312ec4c0b4dfccf1f/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/7d833dbfd277c25561854825a0f13b8b49f0cdb9/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/f025963ab021dbb47dc345b8b5516bdc843796d6/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/4d751701f33338fc2ee4e9f7104707f9b03587b4/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/d4eb0135c7b746877d6ce365f7f7d29b4ae10656/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/be34054fe11198a661bcb727d72c92e9a743a073/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/2af9421c8ca9049e2d7b974c9d1c9b6331033b84/
        sh4a |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/b0befda42ee8ddf52e12f966374c509c93c0a966/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/536ac38fabb1aa769f2c69382676ffd021ac7600/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/ee56234c37d3cde525a3a551edd5bc1258988081/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/2d383f2605ad22eb52ce9e1877582c1aeaf1a007/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/a7b4489d78d79eb317e7d99c0ebc6c71a778ee66/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/efef5c82e52a00a20ed50d6e8b18ec070acfabb7/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/4a342c4e9c87e9cc6bb948917ba1ede556bba864/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/6e1a4821ee9705e0b4f3bd4cb0d4725f96d56650/
        mips |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/a96800be3bdf14e891413668e4df19c155779d01/
         sh4 |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/a2db52b906f0f1ede7f2a6fcd1288daba360a652/
    mips64el |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/18ec3e59027090eacb6244b8831995d8d5dcfe01/
         arm |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/304c1c4811ffe5472c6a96967624befee47c0543/
microblazeel |        python-pyasn-legal-info | NOK | http://autobuild.buildroot.net/results/556cb850784e6122df74ef052b39ac702d17502f/
     powerpc |        python-webpy-legal-info | NOK | http://autobuild.buildroot.net/results/44e0c6916e08f0f94173dfc8d336484604503f55/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8ef3d52def14dd15d8f54e71ba75cfd0799fa304/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b4b5e61a80ca031d290ed94708a25950ddf6b001/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/53124aa8e7ad536e09d966f972854bbc79443dc2/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bf98c88639eae0027732c5d89c1c32eb7fd99b37/
    mips64el |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/cf91127e633de92a72944e81fefe9bc7adfdb390/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e4c857f398d6fbe36c0b92fa40f21e0605a6826a/
      x86_64 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/4528b55a8655c5b6a49cc7ca0d4de3e58f058e38/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/13506a1b734562874ad8327e2302c86235b94643/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/deb2eab8bb5c96b43095506b226e116507e672eb/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/dda13a9d10c40d42c3f6b1dfbf49905826a20b26/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/07edbbc45bbc22911536afd48d9085b51f9018c5/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8be82bf1ba19a3ffb77b2923d8f42c208843e3d1/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/27d09c16d4bf1e623858fd01e0559f4ec8ddb975/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4dac193bac71be55d331e1fc9382419dc282cddd/


-- 
http://autobuild.buildroot.net
