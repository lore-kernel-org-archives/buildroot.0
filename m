From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 08:30:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-21
Message-ID: <20170722063049.530FE20E25@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-21
================================

      successes : 222
       failures : 38 
       timeouts : 0  
          TOTAL : 260

Classification of failures by reason
====================================

               acpica-20170531 | 3 
                  cppcms-1.0.5 | 3 
kvmtool-bed2bd9e1fbef581909... | 3 
                 libssh2-1.8.0 | 3 
     python-cryptography-1.7.2 | 3 
                      x265-2.4 | 3 
                busybox-1.26.2 | 2 
                collectd-5.7.1 | 2 
                 qt5base-5.9.1 | 2 
                acpitool-0.5.1 | 1 
aer-inject-9bd5e2c7886fca72... | 1 
                  aespipe-2.4d | 1 
                   attr-2.4.47 | 1 
                     gpsd-3.16 | 1 
                 jack2-v1.9.10 | 1 
           libmemcached-1.0.18 | 1 
           linux-zigbee-v0.3.1 | 1 
          mediastreamer-2.14.0 | 1 
                 mplayer-1.3.0 | 1 
                    norm-1.5r6 | 1 
                    qemu-2.8.0 | 1 
                      qt-4.8.7 | 1 
                  snmppp-3.3.9 | 1 


Detail of failures
===================

    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/820e85ba0d0df02a0495417f674943de7eca0859 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/f5c56eaa14ea23c6f242aea91868b9bf3b6d5770 |     
    mips64el |                acpica-20170531 | NOK | http://autobuild.buildroot.net/results/c715735a70144b20eab3df5312950847ddd727d1 |     
    mips64el |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/b86c65ef2c9648546cd353fcf406ce8b3dc02025 |     
    mips64el | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/209cecb50890cb0ec1b12178eef869c7d745ae5b |     
    mips64el |                   aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/4869ffef5bc51c49eb6ed68a67c097fcea335142 | ORPH
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/ca4d8284521ac9a3da340aad458801ee657841b1 |     
    mips64el |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9d91ea647b0af71dbc16541e249a3187b869eae2 | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3f3ff99c80ac9bf9160b9ba4079cc12ada872ab6 | ORPH
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/2441e2a69d013a6376a90d375e15991e8cb816bd |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/15fd5811211d3029450b44de899b339560893fd3 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/206cf525837cf46bf0db467e7e82989fa38c8c82 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6e29cffff83bc42d9c663a1a018dad757a71928f | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ee9a50426aec783e5dbba4f90434ce8dd55cfc74 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/578ef2a6110ccd7b02919de62b7b4c3b3b7279bd |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b8f396cfe4ba0d0e4ce39cd9104c98ce791bf887 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/1f807c14f10e977858b6e410c893b1e028ac6cb8 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/43ec53dd842d687c21b86fba66a39c92df918de8 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/2b734fcdd258f661216f4bd90f85309e323f4031 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/872b8e0e6a24cbc96e3ad9e0b8b47acdf6160ce0 |     
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d5682d57f07d1038d9f417dd9f5839a793a571ff | ORPH
        i686 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/130d225750f6e4acd331d2ad0cf367d90209ff7e | ORPH
     aarch64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/b1c56393e0486f432c23ff848880ae4ef022d884 | ORPH
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/8d2101c71b9fef5d05de968d289ea5b0464302bb |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/2f990cd166229ecab05121922fdb52c08a0648f5 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b2a5ec85f5333de55c0bc6d8a57ef4630c70cb8c |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c049fcc24216f01aced8fdd18f5887058c13e9f5 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1eac77089a50d0c7ec167114548145cba8cb5f01 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3d675fcc53bfe0ecd14731ca1bd196a070c70048 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8105f15d5d324201cacb0c1091b0ecbf53b98d66 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/3579e74f3bede256a39095914aa594ea9b6db698 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dd3353278a62ab8d352af27c3efb49ff54a8e451 | ORPH
     powerpc |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/46a167da03cf8a4ed0ff4a23d83d6d5c7b478ec2 |     
      x86_64 |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/0f495a831f00fced86cee5870f0886021b5025f0 |     
    mips64el |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/c3060bfa4960f251258957c9ebdb730c1787aedc |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/1b1c946e5ff7c7ea47d67ee28b931d7cfaab58f7 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/7d181e78db3fafead990c7a180a2631058f507af |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/4591638e9930e0d65f9225f9af858c8c16d419f9 |     

-- 
http://autobuild.buildroot.net
