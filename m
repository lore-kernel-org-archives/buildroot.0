From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2015 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-14
Message-ID: <20150915063010.96C98101A67@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-14
===============================

        success : 230
       failures : 51 
       timeouts : 0  
          TOTAL : 281

Classification of failures by reason
====================================

             stress-ng-0.04.16 | 4 
libbroadvoice-f65b0f50c8c76... | 3 
               util-linux-2.27 | 2 
                busybox-1.23.2 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                  mono-4.0.2.5 | 2 
             bluez5_utils-5.27 | 2 
                    ustr-1.0.4 | 2 
                   bdwgc-7.4.2 | 2 
                 lvm2-2.02.130 | 2 
         conntrack-tools-1.4.3 | 2 
           libfreeimage-3.17.0 | 1 
                    faifa-v0.1 | 1 
              drbd-utils-8.9.1 | 1 
                     tslib-1.1 | 1 
                grantlee-0.5.1 | 1 
                 mesa3d-10.6.7 | 1 
             lttng-tools-2.6.0 | 1 
           qt5multimedia-5.5.0 | 1 
                coreutils-8.24 | 1 
             ebtables-2.0.10-4 | 1 
                  tstools-1_11 | 1 
                rt-tests-v0.89 | 1 
            libsemanage-2.1.10 | 1 
              strongswan-5.3.3 | 1 
                  apitrace-7.0 | 1 
              wireshark-1.12.7 | 1 
                openssl-1.0.2d | 1 
                   perl-5.22.0 | 1 
                 sudo-1.8.14p3 | 1 
               iptables-1.4.21 | 1 
                    ruby-2.2.3 | 1 
                   argus-3.0.8 | 1 
      host-gdb-arc-2015.06-gdb | 1 
                   ushare-1.1a | 1 
                harfbuzz-1.0.3 | 1 
               qt5webkit-5.5.0 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/4cb5bfeb2e7d17c099ddb4753cf1135b2dae0df5/
       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/f6855dc60e1805fe01acf47fdd02f281cd0b8c91/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/14b4858aaf3bf31a27bea5a3d14b1956b3bfb2d4/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a95762d34d53baa7f84439e1b359589cc00b938d/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/d84d82c76a1283b1c0732bd2492aa1aef7d4fb48/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/deb255c19a66ace3d215d1b0c0642e112e95e17b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a03e220030a747b266b14d8e87984f62eb7bbf96/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ca78b68acd96225d36cc8d389a1a041218ffe4fe/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/4ffdd01a291e18db10e25df2480717bb785cd56d/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/c1d5164e774d4dc9f866902167c097160a84d714/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/1e8d3e21aba045902e1e2244a3841eed1c82526b/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/3303dc1f157f1924e6abbfe41fca8b05299ddcce/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/1319c5395e76b1ee2fcddf100761bbd16e997746/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/17bde543db253c008079b04c5e341f804160f59c/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/557de7e7c7d3f99a9ea6031bc955e629baf37f0e/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/1b208dcfec1c58628db21814ed76aeb9738b64c1/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/9be496618ee00a893dcdc9aee7e1f0c161aec639/
       sparc |                 harfbuzz-1.0.3 | NOK | http://autobuild.buildroot.net/results/306b00e7bb13abda61d6357be2c5550ff302eb70/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/6c2b1ebc846d064cb00022dde927547df78f073e/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/87c5b87344ca08f9d0aeae8ef1b586ccf71f7ccf/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/51a55c89ce6aef4cdcdcfb1ac37fda0ffd79a241/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4088e395943b812ddc91957f16af708e26baa4ad/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/285c02c05a5f29935832434ba337c2088d613f5d/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9e72604a9be99777e35bdc73b0a8eac93b23b3a7/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/f060545843c20228a07323599c55bd3e67ff05cf/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/9b1021ed9a1715a72ebc1c6fbda1cc381b7389f1/
      x86_64 |                  lvm2-2.02.130 | NOK | http://autobuild.buildroot.net/results/84238ad38f3cd8554bad95a74f1031675146424b/
         arm |                  lvm2-2.02.130 | NOK | http://autobuild.buildroot.net/results/cb02fd1281f022a6f48ff771165a39fee0348f29/
        i686 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/2d8cbcee2140288e5940402a0766c50d25fbfe13/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/179c42eed63c272e4488b58db31c4355678a1238/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/86f4030c2eefc499258a6e8b896c0ecf36d387dc/
      x86_64 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/b630621d907b3b00ef0792ab42694bd32784a0dd/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f1b887781655c47e8a637a2df2a8029ef439083a/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/e8c46e32101d21804f602aec3ff334f7260d2372/
         arm |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/8f7ce37fabcff3d6d90824243ca9eaad0afbafba/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/e473c8af84b2ceabc3751f3bb96c103f8857878f/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/22eced2dc9ca1bc90ef193b4dc40891c47157e89/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/4624fbb6d669196be7da00a3467e8d4bbbf71e6f/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/5395af15470c886b892b12391edfbb752511ee99/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/b97a24cd30f3e8ad8cb9a2633a8d671a8aefc82d/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/8a4e8140c7426aa225839201547ebcb8214af9b5/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/6957c5852f273271e29a6a669715f9620904283d/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/d9390b929328e6253b883f000f6f09972df90f47/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/a55da3bb2e3550cb24fc31c5a411ddb772c120ef/
         arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/ad1f86660d249f7a9f520c6f5e6f6672f4d3961a/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/79d4c33dd9e42b415cd121cf4c70628471c2e12d/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/f30e930d6c6804b18bf7fd0093fda21573f80cf2/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/bfea63d885e98c14592ccc61120d43a41e129856/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/4027a50f1d2b7f6c43565a5a5b1fcc34e5bcc423/
         arc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/829bd5dfdb365aad4bb108d8e0f641844afb36db/
         sh4 |               wireshark-1.12.7 | NOK | http://autobuild.buildroot.net/results/f89c45d2346e80a8405b28c09741bb8e29701163/


-- 
http://autobuild.buildroot.net
