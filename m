From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Aug 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-05
Message-ID: <20150806063016.4A0BB102D1F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-05
===============================

        success : 207
       failures : 41 
       timeouts : 2  
          TOTAL : 250

Classification of failures by reason
====================================

                 qt5base-5.5.0 | 2 
           libcec-libcec-3.0.1 | 2 
               linux-pam-1.1.8 | 2 
                   argus-3.0.8 | 2 
dawgdic-16ac537ba9883ff01b6... | 2 
                directfb-1.6.3 | 2 
    xserver_xorg-server-1.17.2 | 2 
                   audit-2.4.3 | 1 
               dvbsnoop-1.4.50 | 1 
             bluez5_utils-5.27 | 1 
                 mesa3d-10.6.3 | 1 
                    cramfs-1.1 | 1 
                  weston-1.8.0 | 1 
           qt5multimedia-5.5.0 | 1 
              gst1-libav-1.4.5 | 1 
                     aumix-2.8 | 1 
             webkitgtk24-2.4.9 | 1 
                libmbim-1.12.2 | 1 
                cifs-utils-6.4 | 1 
                 setools-3.3.8 | 1 
                   systemd-221 | 1 
                  zeromq-4.1.2 | 1 
                   squid-3.5.6 | 1 
             libselinux-2.1.13 | 1 
       host-erlang-rebar-2.5.1 | 1 
                gnuradio-3.7.5 | 1 
ltrace-c22d359433b333937ee3... | 1 
                 clapack-3.2.1 | 1 
            c-periphery-v1.0.3 | 1 
                moarvm-2015.05 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 cdrkit-1.1.11 | 1 
             util-linux-2.26.2 | 1 
                  boost-1.58.0 | 1 
                  opencv-3.0.0 | 1 
 make[1]: *** [all] Terminated | 1 

Detail of failures
===================

       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/cb455f538319a62ae730943190d3a8896473091f/
       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/062e08ed5b4306ed64f986f3a9f0938594125c67/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/549492270f3f43747a96a8326aef1d7ae1d3b213/
      x86_64 |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/f1688b70c0e29f9561fd063fe7b386a6e8016648/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/c66d29ceee404b84e3fc421c77e5d48032744067/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/14591f0ce708f68f925c9223471b3c4f0ddb9eef/
         arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/9bbdd2f2c132c15414faf5390d0f4ab96c1f95c7/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/42e6ea302bb52a4d4e62693fa83760a2f4e06407/
         arm |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/cc38e7581b4bba362a9be388099b0ea237f4e580/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/66fa17376cbb05351988e7ef0dc0c232bbd19f2d/
         arm |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/57de9e838fa953e2fb5e358cd535603fb249b7d2/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/2309cfa7c11d89388a18ae2da9cfd280537ec908/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/1640dc4e38bde6b8af3efb683d8f2cf22f4caa27/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5e346931e8022986e70b0cf06042f1fe17789252/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/84b3a7b75bda89069476d391ed14bc3b8a098017/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/8288f90255d546d08cd3a31e84bd31ea83651075/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/d44aec8c82ed6a315322726dd698e6b48990ba76/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/6142f23c3095145039941ef26a5ed1e3d6ebebb1/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/69cc19557e6de8f3c5b292d498188e7aea8388ad/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/c13a38ab434e4b7d75295d1ac401ae4d06497a4a/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/af970a24d9fdbc9ad6ab05161509fcdf9bdd1b89/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/3b5611725c13668472482ed4ad3b46886d4c63d9/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/be0bf8a9579c8a93f3e77c2ac7414b274470631a/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2fdea2bbcdff4a70ffaac1eecbc8faa81a44e90c/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/c865d16a7f878f2ecc52c30f285c43e5cf45bdcc/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/4dfd26c01fb8d64b2793402b7ebdc2992ee5a54d/
        mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/79b51941ed57b0564c68112489b03cac39a04e9a/
        i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/049ebf21a9d00ef0db54de295cb7fdfcdc5024d8/
        i686 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/08305f397ef523ee864827e1e267475a9f6f397f/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/063b8e47a39eef601fe6d7d9578a64216c8eccb6/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/15ba0b520043b884fc7dafbb84da171072d7d3ee/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4edecf424246204aa68c9670b4950bafcf8fe973/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/1f4eee3423650651ac37f55dafed269c6d9baa98/
     aarch64 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/10a976146373d3cfd8c218b56a4288478a8e498b/
        mips |                    squid-3.5.6 | NOK | http://autobuild.buildroot.net/results/cecb968172cb00281e439566e5ae154538435a51/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/88ef5155c94621a927b7a4c599b96190d29320ad/
      x86_64 |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/b92c4f1090a937f1005cdc1c92dd22e19ffe8080/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/672a09204ddb0b92f4aa2765a993862edaf2104f/
      xtensa |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/5d2cdc27418fdf392ec572c388cbb6301b1eb4a5/
        sh4a |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/73f9c94178b7f4e2f2f183e51cf39d18046a8c36/
     aarch64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/4de40e0b87e39757c6b7a805a931525a0684f351/
         arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/be46b621ce5443788b0a1bc9fab614c4ca5d0859/


-- 
http://autobuild.buildroot.net
