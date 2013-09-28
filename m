From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-27
Message-ID: <20130928063005.60BF152C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-27
===============================

        success : 87 
       failures : 53 
       timeouts : 0  
          TOTAL : 140

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 11
                netatalk-3.0.5 | 5 
                 omniorb-4.1.6 | 2 
               libglib2-2.36.3 | 2 
                 libpfm4-4.3.0 | 2 
                      qt-4.8.5 | 2 
                     nmap-6.01 | 1 
                libiscsi-1.6.0 | 1 
                  connman-1.12 | 1 
                protobuf-2.4.1 | 1 
               uclibc-0.9.33.2 | 1 
                      pv-1.4.6 | 1 
                    php-5.3.27 | 1 
                 fdk-aac-0.1.1 | 1 
                 dropwatch-1.4 | 1 
                beecrypt-4.2.1 | 1 
         matchbox-keyboard-0.1 | 1 
                      icu-51.2 | 1 
                    crda-1.1.3 | 1 
           imagemagick-6.8.6-2 | 1 
                 zmqpp-31220ca | 1 
                  sysklogd-1.5 | 1 
                  ne10-88c18f0 | 1 
                sdl_ttf-2.0.11 | 1 
               qt5webkit-5.0.2 | 1 
                  nettle-2.7.1 | 1 
                 mplayer-1.1.1 | 1 
      host-gcc-initial-4.8-arc | 1 
               audiofile-0.3.6 | 1 
                  tstools-1_11 | 1 
                elfutils-0.155 | 1 
                 libevas-1.7.7 | 1 
           argp-standalone-1.3 | 1 
media-ctl-ac40b79f002a2315f... | 1 
          host-protobuf-c-0.15 | 1 

Detail of failures
===================

       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5d5bfd564284562313b201fde82af9417055254b/
    xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/64026f4983aef2ac87258a0e086beef314f02c74/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6043579b6ba353e22fb6cfcff143156418ffdabd/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/7b9b18bd67ff2350598acee8d9db0e552a4f96f1/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/618fc7547121a08624ec22b5b7176cb2d8e5567c/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/26bb5b7031d69ba1222ba6cd0a2bae311d49bebd/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/f85810b2aa1f8abcd3c8ebd9654609636d8f6381/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/4c4d5a3b587061a43478cf80cb8192d576ed8d65/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/b0b47b5233e297d46f649e88adff32e8d0589580/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/efaa3270d4638b307ded4475d7d7e60474c8473d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/859b0739d6c2817d2185165b97889db38ca2439b/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/7917ce8ac224ef20918ee2f2f2bc4662f44db3e2/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/072d48c8aaefd6ed1de561e4d515e42afa5f317e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/27b7474289289e2d858b1e06469a1c56d12862ee/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/37b02b802847cc49ef3bba052267ef97d25f7411/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/44cdee91c2af1e0375e80ca340fb16ad1f013b20/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/b015bf0a7286aafa94031b4661b7f6b209567908/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a223e1b70d0a2b28a5cf4baea5b64880a7692a67/
   powerpc |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/375851549ba7a6eddd3bc697ec34610738c797e9/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/9fc222d96fcfb0e8d5a67b3bb358ec990495d21d/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/1e842d01f5e8ee1554324cd759e9af4f758f27c5/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/8b56e1bb5b2290937e390d8bf165144254d2aa10/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/3e25bdf1d766d6e536fa2f07866c2e60552db735/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/1d4a3a0f90bd65a55ebeef7343a913a2ab054d1c/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/b97dcea70eb80ea140cbec04068a2f90e2de3add/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/d380eeb46d7af4d5f03ea3a336240e694c2d2b04/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/df8d07c8b9a1fa130c4691511daf10fafb0d4b7c/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/abb3ef0e64b0d15cf443740ef2f6dfa95a6736b7/
   powerpc |                      nmap-6.01 | NOK | http://autobuild.buildroot.net/results/c6b49c9e1287e3585413379439b79524e0d792f6/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/ad61725989047d2f834f31331eaeb7ce57baae81/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/89437d32daa317533b07405bc19e6b527b3f22eb/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/9f983c36714fc692fd1f20c1d5a3f0a37216c941/
      i686 |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/317c097f48909411754bab64c3e3069eb2044440/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/136c694fce192e5423d821832368cd020ff1bd11/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3951e8d08d56216a7f6fd027fb8fc03f48226318/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/af83a049a8210677fbf60b9b67c148c5a3e4b8cf/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/16a2e616cac48e00f13b140d477e7d915fdfce2f/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/3cfde10ce71c1d53fbcd1009a03de943c353915a/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/f7f27d3c97a6a2fb7167a89df7710d4fbf4457b0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/971bcccb252b4575f458e0b62ab5d8afb6e419b1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fec9691d2f92b70d5f6aaaba3d3ca5d4ea98434e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f21fba77a93573f9e7d9ff6fadedc8f4ecacd1d6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ee8e4e3898d3deaa2e2a149396a8ed8ed086758d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cb97471b6c3006f878f563f64a7cce8ba786f515/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2b5901735ad8bafb0e7892f985684ff503b7ed0b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/63994f234a283bbafba46e6fa43f50a4fb1889f9/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/98ecec6d29b6f97ec909295322fe3b1474c5c49f/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5ca0ead1879f922933ac287f3e0e88368efc4988/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5d67d839b8025ae071c0069e11c4a9ed24a99b37/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cf1eeb9ed267172af662a545ce2cc9bae2177dd2/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/72d77fb45170b7747b929b4aeb8e5c72f853dd50/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/523d3fd0e4be4e019caefbdc33e2863bce0dc33d/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/ce042d088075a350f0a00937bcbedd52f1572145/


-- 
http://autobuild.buildroot.net
