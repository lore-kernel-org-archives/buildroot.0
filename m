From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-24
Message-ID: <20131125073002.2FB821014B4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-24
===============================

        success : 84 
       failures : 29 
       timeouts : 0  
          TOTAL : 113

Classification of failures by reason
====================================

  toolchain-external-undefined | 3 
               qt5webkit-5.1.1 | 2 
                sdl_ttf-2.0.11 | 2 
                  nettle-2.7.1 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                  iozone-3_414 | 1 
                     m4-1.4.17 | 1 
                  gnupg-1.4.15 | 1 
                 webkit-1.11.5 | 1 
                 mplayer-1.1.1 | 1 
                 qt5base-5.1.1 | 1 
                  aespipe-2.4c | 1 
                   duma-2_5_15 | 1 
          host-protobuf-c-0.15 | 1 
                elfutils-0.155 | 1 
                 erlang-R16B01 | 1 
                 cairo-1.12.10 | 1 
                  python-2.7.3 | 1 
                busybox-1.21.1 | 1 
              gstreamer1-1.2.1 | 1 
                     gmp-5.1.3 | 1 
              fontconfig-2.6.0 | 1 
          qt5declarative-5.1.1 | 1 
                log4cxx-0.10.0 | 1 
                    crda-1.1.3 | 1 

Detail of failures
===================

    mipsel |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/c5513b3811ab55700e7eb1c772c94073d84371f1/
    mipsel |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/cab584fa4f4f932cc37d21e275c96823d67c5b60/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/fd37d7a4f2f86b85292b903ab58a0b6be55ff8d3/
      bfin |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/51934d18c8ef49455418e81a87aa5fb82e8a06ee/
      bfin |                    duma-2_5_15 | NOK | http://autobuild.buildroot.net/results/e9e970a6579ca1d1e98a2eef97fbdd4de0185092/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/4c24917998f781ff69d949e61f7535a3ce8a91cf/
       arc |                  erlang-R16B01 | NOK | http://autobuild.buildroot.net/results/5067dd07df0da1c91b1d288caf7b1210eb01eebe/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/8d0f9d18eaf3c7cf048761650f7a9f1fac19b5af/
    mipsel |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/485d60cfac81c6ed41d22590165f8ac6b8ab6961/
       arc |                   gnupg-1.4.15 | NOK | http://autobuild.buildroot.net/results/abcdc7a2371a7f8811d7648832c13e03a770f7ec/
    xtensa |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/68c48ff352ce4cf273b158540aed69fb55f9d033/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/10db94f960db6cc8b2fbcafa66aa487fc66f99c6/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/6a4783138fa1918c274a0c72b02a480c0baee494/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/0e2769481aeaee7f61ce3d45bad161b47798530e/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/12d5db2338b0ee3a4b481a82ec4707eba2acaadd/
     nios2 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/efddd9d6fac491b9344dab06c6e5d863dcf5f57f/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/a140a5ecd98805bb094d5ce37f68cb7beb42862c/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d7f01390da67629e8494ed16e54d25a1909fabb6/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/5e0223c5c532d079d4f987e68f0549f4d3278ab9/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/592acfc6508f01ab82b5692ad52e0fe6d16a3ea3/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/452759ecaa0b44367ea9d504169ab31322f4e6f2/
  mips64el |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/6739a4c697d8f8442dc5edc16dfea835786960b4/
   powerpc |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/f8f2247378bca52dfb169bad90b01ec7e0b216a7/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/02aae20abd9c32d173ed493db3d51fb35fcfd066/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/0eaf43b65d14374c3fc1d022cf222fd040d3a6d8/
      sh4a |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5a45a24b3740cfaebcc668f2922a2f2226a0d4ac/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/24a4797fcac9b5e8abcd9839e0679954e61d6c2a/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d28ac363a3fb5836bd89da71af0174a05b952cb5/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/39e384298f791d95ec711dfffae514b4d5a5f70f/


-- 
http://autobuild.buildroot.net
