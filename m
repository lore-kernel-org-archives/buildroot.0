From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-10
Message-ID: <20131011063009.335B352C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-10
===============================

        success : 82 
       failures : 46 
       timeouts : 2  
          TOTAL : 130

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 8 
              cryptsetup-1.6.2 | 3 
                    nano-2.3.2 | 2 
                 dropwatch-1.4 | 2 
               alsa-lib-1.0.26 | 2 
             alsa-utils-1.0.26 | 2 
                  tstools-1_11 | 1 
               ruby-1.9.3-p448 | 1 
                 zmqpp-31220ca | 1 
                      icu-51.2 | 1 
                 qt5base-5.0.2 | 1 
             libgpg-error-1.12 | 1 
             tvheadend-2b64995 | 1 
                  poco-1.4.6p1 | 1 
                  libv4l-0.8.9 | 1 
 /usr/bin/install -c -m 644... | 1 
                 cairo-1.12.10 | 1 
                 libnspr-4.9.6 | 1 
                directfb-1.6.3 | 1 
               libglib2-2.36.3 | 1 
+ ar cq static/libomniORB4.... | 1 
                 libpfm4-4.3.0 | 1 
             ipsec-tools-0.8.0 | 1 
                beecrypt-4.2.1 | 1 
                 binutils-2.22 | 1 
          host-protobuf-c-0.15 | 1 
                   attr-2.4.47 | 1 
               libcap-ng-0.7.3 | 1 
                     rpm-5.2.0 | 1 
                 binutils-2.21 | 1 
              e2fsprogs-1.42.8 | 1 
      libnetfilter_queue-1.0.2 | 1 
                openssl-1.0.1e | 1 
                  connman-1.12 | 1 
                busybox-1.21.1 | 1 

Detail of failures
===================

       arm |  /usr/bin/install -c -m 644... | TIM | http://autobuild.buildroot.net/results/1eb42e106d9babb987cb489348f906d88531a42a/
       arm | + ar cq static/libomniORB4.... | TIM | http://autobuild.buildroot.net/results/07314d0b1726a6cc9b9acaf077a7f52a91f6cfda/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4821929a8b91475a3ad6b9dd16194c6642631928/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/db2b7d7a23f64b0e55542bd0163a7c4ca99d5e97/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/97a897eb8d418ade86b308ce6660680ae175d642/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1bab15944c709af83801b4acaaec4a028387a60d/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/0424d053668bd60ef66cf199eb79a44724d1d3ae/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4521a572577937a856253d094224a65f76a91c68/
      sh4a |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/82b353ea05e1b80f2e2498f463405de04cf1ae5c/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/38a1dea49373fd4f4da95621f716f8c9324e0d0c/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/92d6c987c633e1ee2f3962582759e81d2bb4788d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9f9cee202b5993a5a70a50c06743ddc70054a9fa/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/35298da6c77681a24be218ce9a92650fe675fd0d/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/dd888335a6d371e36dedfc81e2cd4032d82d3f6d/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/0e6792ac4ffdafbc1bb8d082d390a21cad8f46d4/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/b22504ed9f43fe180c9b9dfc93cad2f4884e303b/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2ff34dee879cd94def520bc12056357272b7d2a9/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4f3df02b54842268b90ac73aa4d4d583bce8696e/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/3ab150068761d8ee95ac8b6381d1b04ade204ff0/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/cb6a6c058653c0790a960f72907c3867a0c3489f/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0f2319d2923ac3b91feb2ef16251dfdb31c7f0d4/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/3a340c94cdd87282152594a2b5dfe784d5352a9e/
       arm |              ipsec-tools-0.8.0 | NOK | http://autobuild.buildroot.net/results/001ffedc2d6ee7038d7b13551b9ff23b97eb2e11/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/0a65f0ecde555424db4ce73642a093ade8ce8e95/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/11ffc75896cb2cde1f49cbb87a8870470ac7365f/
       arm |              libgpg-error-1.12 | NOK | http://autobuild.buildroot.net/results/ff7f6abffcdbeff15f85a2e7ae156209280de262/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/93e4a96146fb7350fc36f58d9f915b1347d03f1f/
     nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/3f074f7bcad62d35f408b96559d73d060aa139fc/
microblaze |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/85f806208bc991c22938c0fa5998ab29e72566bf/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/eefedb1de3d9f964e0d4e7a542607c4c818c83b0/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/8b4d6d83b72ae83c47973076c168c2906eca3c5e/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/afeff92528c2545f0c8812fd579bc56a44c71cb7/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e1da8976263283a151bede29a0e944344b5a63ba/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/cd4684f4b4715c941dc972ce7fda1c5f174c7344/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/19320bd32ba4ac6848c1a2624e7d1c1e8a6e1cf2/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7237b7e3dfeb7ee87bae53ccf288dd3af96e3010/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/bc36e051e06f596c2fafdd3cc3745bb34b73ace3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/790ddd3b9477ca90d956088b40e4a5109bcd09ec/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b5192ca1d4d05513154e6cab5381f8a94c2d32f1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e6472d812db8ac12b50141cf308725c241780347/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/8ef703ad8813896d77ab62c57db5e81a2ad91251/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/48cc4343d1c98876116f7990d3ab9f91b4ff064b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3df63db554d97e182b91f12b7eda2f7fdd0e43a0/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0ef38df889319b76fbab7ff8cc4da1cc905f0769/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/75b4b254e8634e52d6a557cc90a53b111b2d6427/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/59c0323186528ab8af14ab5f2ef55450374ce4c9/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/8a734b40bafb5bce4197e5d834a07165681492d4/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/42504f5f7f849bff31c61c38694e6c966cdf3b4a/


-- 
http://autobuild.buildroot.net
