From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-19
Message-ID: <20150820063014.C0472101DBB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-19
===============================

        success : 218
       failures : 52 
       timeouts : 1  
          TOTAL : 271

Classification of failures by reason
====================================

               libpthsem-2.0.8 | 14
             libselinux-2.1.13 | 8 
    xserver_xorg-server-1.17.2 | 6 
                busybox-1.23.2 | 3 
                  cppcms-1.0.4 | 2 
                   ushare-1.1a | 1 
                pinentry-0.9.4 | 1 
                minidlna-1.1.4 | 1 
                libnspr-4.10.8 | 1 
         qt5imageformats-5.5.0 | 1 
                  ltris-1.0.19 | 1 
             lttng-tools-2.6.0 | 1 
                      qt-4.8.7 | 1 
                    vpnc-0.5.3 | 1 
           libfreeimage-3.17.0 | 1 
                 cdrkit-1.1.11 | 1 
net-tools-3eb367aedf1280f35... | 1 
              drbd-utils-8.9.1 | 1 
         conntrack-tools-1.4.2 | 1 
                           all | 1 
                   bdwgc-7.4.2 | 1 
           qt5multimedia-5.5.0 | 1 
                  mono-4.0.2.5 | 1 
         network-manager-1.0.4 | 1 
               linux-pam-1.1.8 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/3af24d6e5fc64163fb6bc9907b36fc24a8438907/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c137f84500db8dc5ec6d73fd813f1b8375ffd308/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/105cd5b9a58bd9121d3aed2391858f2edc3eb686/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/058068848b8f78cb77961c6990cf1a66fc3afddb/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1078b3af0e083502710aefe237e4a9b413010b0d/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0cac27a6d17b508be4a575df6cd57d01f7b0dfba/
      x86_64 |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/76131532eb5745e05cec8fa2b7f8623d18cc93cc/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/80342ceb632456503ffeb5c9bbbb39df0a0aed8e/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d0a094d6071a4ef98f73a6dccb028f488f419335/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/3181f843aea88b9ea2f5f3aae156f2c8dd1581f3/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/1fd12a007ad71f1566c97e40847fc9b2a9f7d20f/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/b4c06fa372f3328535c90a7693920b45871a5ec7/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/b04b22396ba736ce88d65d687566ae26eef47550/
         sh4 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/f590b1f2b2985138514865dc4c65ebbc657329a2/
       sparc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/f97cd95113e808739e01b8c217197f2067a3bb26/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/3dd66d70c2e36f2d9fb0a0fe01bbdec009d55067/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/170575fda5b82b6ff7b1de0e0bce9a19b666bbe0/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/39337120b2c293627de135134b3ac499eecb1e44/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/25d484160c450af84ca9100a7f38559aec7232d6/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/ebfa3f6b96a1e9373f82968466bb25aee7e0517a/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/6e62dfe0d4191e5318c4199e294d7afef7fd0e8e/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/2264f8b0fc3913ba669cacd8f972d1acca645dbe/
        i686 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/42c98918f014f895ba307fa73aef889fbacb7868/
      xtensa |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/44efd7011f96862d2139490d715a14417985e26f/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/eb9405fab79873599136116ba1cbb466275813aa/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/6703d62847b1d9c920b7dc232cdcf6d38b528a28/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/096f6471c7cedd912f306c2b1c8ed84c6c84702d/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2207f6aad44a6988bf07b02b583b6418ad930dc8/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1b9dac05a18b41e6b2b9c264d22fd001b4c70740/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/29569de45503c37fbbea7b6229c103f006da11c1/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/63d684f33ce1bc8452fedca9907dab21cf64247d/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b5517c26e075c81b107c467e66180323cfd8be1d/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4e92538baadee8db3555e20c5ce96de40658f149/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/80470d17d42174d4cb7159227c564a587efb162b/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/adba0959f805980d9d36b15d6a959721290158ed/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/575735e7fea00b80e328cdb883ebd47d3ac8397f/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/036f2d26d3136510a53889708023e672734ad101/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/677ab26218baf4a3b53feaad65426bca70c20fa0/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/4d4eb9765c28708e4963b663077db7031315e39a/
         arm | net-tools-3eb367aedf1280f35... | NOK | http://autobuild.buildroot.net/results/491a6718e936a42cfeb99493eeff7e8e38ea5087/
         arm |          network-manager-1.0.4 | NOK | http://autobuild.buildroot.net/results/d7c36de77e34f8f2cdadf92e219b188b568f2999/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1b6215df5e8aee157aa60530e5a90c0e9f2429c2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/413735ce8620f61e2837bc5f9f9fce6944dc2119/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/248400d2e93589198533f0804b483fafecbdd1dd/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/7e79c950841813c5a5a3763292827e7c2ae4c6e1/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/e1635ef766f0c0ea480a6950d79de548dcb176b0/
      x86_64 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/7157dba63ef24108653ab20d9f8d505e75dd2746/
     powerpc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/927c4590ef63cc6b2eaa472c4b27a66d057e7302/
    mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/e7d4e2276e46999a7466bccba87f7d076653b14d/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/81406caf6947e1ccb22e758cfef23173846aeda5/
    mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/14242ccbe414454ec26b7e6c856241b81b45fe20/
        sh4a |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/34ba2b6c07a052e6bb0dec3ca03d14384898302c/
      mipsel |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/07a803c9de48231ff8c6c4527a1a2f42c683a7d6/


-- 
http://autobuild.buildroot.net
