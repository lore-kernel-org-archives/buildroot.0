From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-11
Message-ID: <20140212073007.B3242100CEB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-11
===============================

        success : 99 
       failures : 27 
       timeouts : 1  
          TOTAL : 127

Classification of failures by reason
====================================

                     vlc-2.1.2 | 3 
                 mplayer-1.1.1 | 2 
                libnftnl-1.0.0 | 2 
ne10-88c18f02199947b2c8b577... | 1 
                 dropwatch-1.4 | 1 
                elfutils-0.155 | 1 
                  thrift-0.9.1 | 1 
                    sdl-1.2.15 | 1 
                  iozone-3_414 | 1 
                aiccu-20070115 | 1 
qtuio-abe4973ff60654aad9df7... | 1 
                  imlib2-1.4.5 | 1 
                    orc-0.4.18 | 1 
               audiofile-0.3.6 | 1 
                 lvm2-2.02.103 | 1 
          enlightenment-0.17.3 | 1 
                  boost-1.55.0 | 1 
  toolchain-external-undefined | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
                  libv4l-0.8.9 | 1 
                 libevas-1.7.7 | 1 
                       unknown | 1 
               alsa-lib-1.0.26 | 1 
                coreutils-8.21 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/aeeaaf1f22d655eb918a492d430f5cce37b8a201/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7069e1f43cbed745d65f7dd9904a3fff034530ac/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/595a83e6f1df0f0c0294d31ccb3857206c0da47a/
      bfin |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/17dd7946631354d59336259d5f31aa899e3599b8/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/c57f89ffa732e2bfbb6ebf9af9de5bac3cbc197f/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/1ae0fee94f2161ce20ba6efdccf7fb90ddbfcb1b/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0365f1e36a91f64e5c67eb1d4872ec57269ddd8f/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/4c38d5c29d3c338e84c7c3720f89b0b81ab629ac/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/314694709b3a2d812c18acc70e374b3bc2fbedbd/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/567beac5f5d0c19620a6e770d2b9302bed481332/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/2a33d2c7535a9d867d76dd5cf05e1bcc3f5cdc38/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ad90baa5e07569308a7e2b2510b67c5b2a563b44/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/8be92ceb7e93332b218d3090b1b4fbf64e7af887/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/9a5c30cccf7b7e1c68a384fa5c49e4009d50400e/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/6635f7149cd0f5192d49276b2cc3edc5be3b5868/
    xtensa |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/2c6b9fdfffe81042d7606893d1ff006f9e6c4296/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/68bb764e5b34a2862537c3bd4b57ef5af529f0a3/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ed28908a93362d76fc720cf67f6c530eed8d855b/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/4d12fc71a775b0f81afeae1fa5317c0cb319185f/
      bfin |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/dd64c2aed5291b6c083f061709d6179150440a7e/
       arm | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/9b57f76672c8d0a74980cb1de32661761b666ce7/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/451521367a12cc4eda823526ec1e25580d4a2cc6/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/23caf6deef3cbd8fd6b150e133d493d26d16d80b/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/656cddb6f22360808fbe39a9d112a06b87ad313a/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/fe79fe617e7bb8c7fabcbaefac883604bbb49d80/
      i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/39c77ffb5a5599d0b09422433c747b2bac185c4f/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/05bc24c48da6ccd9cccb90689b7457b973278f9d/
microblaze |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/67d14aaaf6b4c04225a457676c8ff7b125f6b692/


-- 
http://autobuild.buildroot.net
