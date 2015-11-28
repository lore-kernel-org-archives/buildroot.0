From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-27
Message-ID: <20151128073019.13DFF101440@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-27
===============================

        success : 106
       failures : 40 
       timeouts : 0  
          TOTAL : 146

Classification of failures by reason
====================================

freerdp-17834af7bb378f85a3b... | 3 
                  ffmpeg-2.8.1 | 3 
             lttng-tools-2.6.0 | 2 
                busybox-1.24.1 | 2 
               libcap-ng-0.7.4 | 2 
                   glog-v0.3.4 | 2 
               polarssl-1.2.18 | 2 
             host-nodejs-4.1.2 | 2 
              strongswan-5.3.5 | 2 
                 mesa3d-11.0.4 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
                   erlang-17.5 | 1 
                espeak-1.48.04 | 1 
                oprofile-1.0.0 | 1 
                   systemd-227 | 1 
                  c-icap-0.3.5 | 1 
            shairport-sync-2.6 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                   mpd-0.19.11 | 1 
rpi-userland-8306b7c757f4b8... | 1 
               valgrind-3.11.0 | 1 
            libsemanage-2.1.10 | 1 
                mongrel2-1.9.2 | 1 
               dvbsnoop-1.4.50 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
uemacs-8841922689769960fa07... | 1 
              xmlstarlet-1.5.0 | 1 
               libsigsegv-2.10 | 1 
               libbluray-0.8.1 | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/9a13d40e7cc54a632b1a4063e7e9fcea5402c368/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/9e6c3c701e09007860bf842f1877142ea20cbb55/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/6cf4bdce4af93ced374e0a8e07422273fedafbf4/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/1722c5799606044facb339481826c6fbddff7795/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c3245a3511b4c6cea9dffe1091244531fa9af9c3/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/8e32c66723925617d8d2577d0c75c08b9bcede83/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5647594f75fc5d10166f4a016e7dcd58194d6453/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a1a6d38d235b9a4fa5469cfe1a0e37b0558556e3/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0f941e3b05b4b5c4cf26039455310f1a91c61507/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ed46873f568ed26c0036574fdba3d2ac124a4b21/
     powerpc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/4384ab572bdcb1d148bcdae5a67d8b0bf26d3049/
     aarch64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/2ecee037b31e65bd4020d0e9ff6fee81fa18a037/
         arc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5448fbf658a890e1465a4a5c8f82f0691b250bc4/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/6f5c6a972a1253529befccdde864bd6b9dd166c7/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/2728396062caeedcc0e9bf285331d3ff126af46a/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/e9810d31c7cbff3e20ee7f09920cb44dfcf1c27e/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/f1ebd1ccf2eff37e2c70e63512ca6bf508953a13/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/a1a3121ff3dd7836d7be0a6dea7ee285c634c02d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/52f35fc76e0f38a36c5524e09270a50bce8fcc48/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/594ff893ab7fed581d77710e5e14dbd925074697/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/faab0211ca6d68f0c75b4fa5d42a91520adc7cdb/
     sparc64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/cf05bee9c26ca8d7deab91310c3c0a5386767ac6/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/99e5fbb52f9a645679c482e8ce4a35ac18c833e1/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/bc2d73c9e7271a2290cc72a886da53d2d7be5fe1/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/77cd5dec8a9552d1c011d81ca46be588bb7d9cd1/
      mipsel |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/f3db555dc29e0e0e87762fcace913853ffe2b176/
microblazeel |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/86d40c2b2069580a4ccf4a9fb496c9bd75207da1/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/70a58236ba1346f3f50199ba0b77b0354779ff28/
      mipsel |                polarssl-1.2.18 | NOK | http://autobuild.buildroot.net/results/dca9901c809db0719ab6b26feaf7a1f2b80119ae/
      mipsel |                polarssl-1.2.18 | NOK | http://autobuild.buildroot.net/results/c343c68d3e0dae4a7ecd59693298a9622bc56662/
         arm | rpi-userland-8306b7c757f4b8... | NOK | http://autobuild.buildroot.net/results/27bd6f32cecdb4e7c95247c1feaf2732c1d8e3fa/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/04498ba9e44f022f4bebb339f26aac76fce3e06c/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/21944cd30270fdfa3a1c5b24c8354f18f09ed907/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/acdb5ce852e537e9d9d5719811e8ca8558c24c92/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/7fb448c33912a08f10abacf0985a7c126bff5a68/
         arm | uemacs-8841922689769960fa07... | NOK | http://autobuild.buildroot.net/results/e929de08954684e275a2f682264551b6cb07886a/
      mipsel |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/488937704b3b6bae8daed7b24da8c740b56f4d84/
         arm |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/750745e59762901e4e9dc599afc6b59ab9ec01f6/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/e245b241bf97e7a6f314cb596d3685fdaca9b6dc/


-- 
http://autobuild.buildroot.net
