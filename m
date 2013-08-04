From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-03
Message-ID: <20130804063005.9ADC452C616@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-03
===============================

        success : 99 
       failures : 60 
       timeouts : 0  
          TOTAL : 159

Classification of failures by reason
====================================

              strongswan-5.0.4 | 7 
                 libffi-3.0.13 | 6 
               libglib2-2.36.3 | 3 
                    acl-2.2.52 | 3 
                      icu-51.2 | 3 
                   mplayer-1.1 | 2 
                 cairo-1.12.10 | 2 
                  aespipe-2.4c | 2 
                  zeromq-3.2.3 | 2 
                    zlib-1.2.8 | 2 
               audiofile-0.3.6 | 2 
                  ltrace-0.7.2 | 2 
                 qt5base-5.0.2 | 2 
                   attr-2.4.47 | 2 
                openssl-1.0.1e | 1 
                  boost-1.53.0 | 1 
                  libusb-1.0.9 | 1 
                 libevas-1.7.7 | 1 
       foomatic-filters-4.0.17 | 1 
               binutils-2.21.1 | 1 
           imagemagick-6.8.6-2 | 1 
                     m4-1.4.16 | 1 
                 libnspr-4.9.6 | 1 
                pulseaudio-4.0 | 1 
                     apr-1.4.6 | 1 
             gdk-pixbuf-2.28.1 | 1 
                 rt-tests-0.83 | 1 
                      bash-4.2 | 1 
                  connman-1.12 | 1 
           libcec-libcec-2.1.1 | 1 
               qt5webkit-5.0.2 | 1 
               libevent-2.0.14 | 1 
                libtirpc-0.2.2 | 1 
                sdl_ttf-2.0.11 | 1 

Detail of failures
===================

      i686 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/4f32e6a712790b815b70bf0da5d4152fae16d738/
  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/f0479c460851c9c6b6a67598a279bdd7c6319d5b/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/2e60eb5ad4b3376080899a6f367c7b85ff8fa2e7/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/4c4e0201e54847515eec59cd861e2625df8c60ff/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/85097d3b2e6270ae4badf2e031d5f391a3e8213f/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/2a74dcdb2cb7d39fbd89bad0aa4cade9978c75cb/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3cf5d3e5d80050f755c0d97be02597cf6687b983/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/8a7b31f73de6128576b7eef3fcc9f12223621ab9/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/75a15ff9598beff006b45eb7cfc35431d7cbe799/
  mips64el |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/27e432e83508e46dade24f6e4cd72f12f09c2e00/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/1f3192c6043d829da05fffcf332898991bd61114/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/7d5a17354848c538f2f04516da1d2b619c05b46c/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/aa20edaf0b77c7432aec3ee2e2f926c7ff6a073f/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6e0227b85e82d25fe1069a8a88aaabefba85db80/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0d8a5ab2844bec9076a069bb53d0a50255286781/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/697211916e528b578294bd122340b6d082afa87f/
       arm |        foomatic-filters-4.0.17 | NOK | http://autobuild.buildroot.net/results/035ab3e43b44aeef093ffe208dde0d73e2a9de2c/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/39d11c93ca0b473f50fa447cb551089fc54bd7fb/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/32c3b343fc34e528f7a35f3282ba716d69404e38/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a9b690894e8156bb8686b8153b288c67f1badf59/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/71583f391ffa158391d9875371183c3b11932689/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/26f6c432075ceb553b95408b8603d9b1fe1f91d5/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/a373cea10ee2177fe66316968bac61af70fc3390/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/20d09bca7af567489d37a3e8f95c992cee0bd085/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/444b73a9cb3e62b6c559a6d0180ab9e32a007353/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a91a751bb8b674b24384bf92aa1da5fe4863967b/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/08c50538f89e621db0cff2876c8611db8a0a4a62/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a9f610511e1d8d573670161d1767c86dae36cdc0/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6669ba3ea26ced4458332e3003984855cb6b6eb0/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/bc66ad823b6f87d7e4be92f8bbe73ba71c2ecc3a/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0e286ac1ddc0daf4dca0bbeff2a8856b15ac2eb2/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b69eb4c1e69f982b80c7450b1ddfff434f6805d6/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/96a5e2b1f20d001a5c1fe52611238878d225b6ef/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/71713abd04fc20368c388d9a6158f2c1e7a1fa00/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/c91ead6b516cb7d0e2995d054dff32e218a286ea/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1c5869f7c90570aa2040ab009ac78ec84ddfc7dd/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/b20500eda7645837ac4d65504967ca8fb2f7b494/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/28b5ac997b65963e9b9c72fe3dee78df2d7e4c32/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/6fb51616f8858d058d3a8df22ddb68ab0b7b2aa8/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/3bc1e024dee68f0506e5bda146eaec88265f2ac7/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/e0c064a1a8b65740aadbd1b7a314a3f80ec42162/
       arc |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/a6760264918529edf0f71e9da11343b136609801/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/88d72be3f02cdadaafdb9f3e6aa3655251324a2d/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/b4ac6885301dba9b69b38637ad3285a57412f96b/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/851382cd890bd24dac3aac1e0760fff1d42a5d2c/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b85b2dd334091c0ad50764efe2d4f3c1871222ac/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/af0a3b2ba8c88108397ce56427f7e5bbf2cf80cf/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/fda54797ea51659f13d9410e5d52ccd53a70f564/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/8cfc2a373fe284553c5cc301861e2e5548cd04ae/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/cc900383c3d8be76f4bb50a2c2c9495f57c81683/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/a6ccee920b3063b2406973abd8ea221070776be4/
       sh4 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/242dc8f86afb9c22e93953a00ac8480c28a7b1fc/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/38754ac42672e376182f15dcbcf6b4ae729d84f7/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/6fae2e8d3df8a9820217fb929e5c99610ba6a498/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/fd04ebec8fe5a6c3612d33ed5bbb960655c5c501/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/457b467f3425e2ec99f5f78c25d1a7d498d35c30/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f24176ec593bd90d09a03703dc47088c2ac07a5e/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/86fd07f4296ffacc806f707e1ae6783a059cb5ce/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/f75fe21bdac44150baf007eeafd3ded18b173e49/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/584f33c900991325f2182b7cb53ac08645a67487/


-- 
http://autobuild.buildroot.net
