From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-26
Message-ID: <20160427063023.7BCDB101B13@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-26
===============================

        success : 174
       failures : 67 
       timeouts : 0  
          TOTAL : 241

Classification of failures by reason
====================================

                 jsoncpp-1.7.2 | 6 
                  ffmpeg-2.8.6 | 5 
                flannel-v0.5.5 | 4 
           host-cryptopp-5.6.3 | 3 
      ca-certificates-20160104 | 3 
               ipmitool-1.8.16 | 3 
                 jack2-v1.9.10 | 3 
                blktrace-1.1.0 | 3 
glmark2-499aa81a68fb4c8aac1... | 3 
                    cups-2.1.2 | 2 
                   open2300-12 | 2 
                libinput-1.2.4 | 2 
                  connman-1.32 | 2 
                  boost-1.60.0 | 2 
x264-a01e33913655f983df7a4d... | 1 
                   systemd-229 | 1 
               netplug-1.2.9.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 host-go-1.5.3 | 1 
                  stunnel-5.31 | 1 
                   ntp-4.2.8p6 | 1 
                    php-5.6.20 | 1 
                wayland-1.10.0 | 1 
                   erlang-18.3 | 1 
                 libdrm-2.4.67 | 1 
                   mplayer-1.2 | 1 
                  cairo-1.14.6 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
                libpjsip-2.4.5 | 1 
                sg3_utils-1.42 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                collectd-5.5.1 | 1 
                    ustr-1.0.4 | 1 
                 libgee-0.18.0 | 1 
                grantlee-0.5.1 | 1 
          openpowerlink-V2.2.2 | 1 
                pinentry-0.9.4 | 1 
 toolchain-external-legal-info | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7ec4cf40dfa302e258534448e40495b7b0d3fc4e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b729037d69c1087d59683630d34dbae51dd15a12/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/566dcb7a044bb40d0ba527ba3e85567dadec43d5/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d1fdcaf570cf883bfe3730d433638aabee33a489/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8b7b8ee0a922f1a80185c5ce07bce8b682ac6486/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/371ee25b08a70ff07e4ade35d34153d8f13f82c3/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/8075a676c071e2af84753e653243e0e173373013/
        mips |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1a101061d0241d719cbbdd012b820cd955ed9911/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/8da316cc61d8dcce3f919549b46f11793695467e/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/7172089e9a1f0f7419f16564a8d55fb32df7329e/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/18a6021948e0709afb199cf697c111040b1641a4/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/bda7d9ecc14ec89529d1c018b10e062b8ecd6027/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0a61a8ccdd96337a3ca0f5bbeda14713b15c8360/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/848a9b0df30a9f6b38b16974290ba9fb4091ee2c/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/93a1b8fdbb6829114534586489f87d859127c628/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/5f0d8fabd96c895526a6b07dfd7f0c15d20a9483/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/de75420ab7a87548fbb328ee1e492ef1f190402f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/daae516f0237ae67a4dc4fb7adc50fe1cddb40ff/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/3a4799d698f30db2b12c1dbcaba87a04ba543db7/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/cb75e88307b2660aee219401e4a2cddec55f1e66/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/28733f7e27eb997acb027744beac59efea1c368c/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/03899f445e33337a962bd9323fb00e647faba473/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/aac97b17bb8600a4df0a9cc79fc58a0ce561d8af/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b070d42e8a73a482109f81d0e46189e469089a16/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/1c5b3ab5156d8379d976a4996b50958cb8db34ad/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/63005f2d389caea7c737b75ef08ab0ab573f15a3/
        sh4a | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/e4e17b96d8f19030e35373d8189d5c235447950a/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/5851b4264213f12ce2f63ebef1a73b96fc04b074/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d52f533e915898b19b9301bacf5d39b1bf149253/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/1a3f76846cc285e4f031bd9d27c386ae01e39332/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/af74fd8a344e28300ebdb0fe46375c109789a7c5/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/12b3e3f7b940b2975f3d3591f9cae5cf9950c16b/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/d8b462f38781169210f4bf3173650fcbbbb06b62/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/46184e184454fbdf88ddaac4f47bfc02bce8e568/
        i686 |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/eb904fdceb9a0c906a06d6d0ed08738e45fb1623/
        i686 |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/72117ec758b889b889e0f7297685fa6e652345f4/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b6fbe3eec9131a8bd3f688fac2c7b9939913fbf1/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bcf92b925128e0acbef41db800f9dbc64cf07279/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/71b778a36afbf5471482765e172f23efe8e406fa/
        i686 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/06dac6484968a23ecdd6f9a31621fdc9d19f0081/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/bf3effee581d27fc6e89f1d3412a4b3f6494473c/
         arm |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/043565b392c121476c1fa1e15d6ee0635d34229b/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/b7452a290c699724e6f3cd268fda36236ea63113/
      x86_64 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/351fd77fc08cfe95d79554d2cf107e4a0a6c03e8/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/f26d52477243af01fc90dc4c4e8c1537e35f9649/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/bcd3b8129a0d3b641716d901a4658e135d00d8b9/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/2f8a41d527cf8edc76bb235a33ef912698aa9c5d/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/3f2e3e97501df5901490fd0588167855cb0af06b/
      mipsel |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/728a3d7e8530c11777fa1d584341bfb58c5b80ce/
      mipsel |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/0a6c2103919e20a1419cc8646fb19d3b0f05b9e9/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/52b542d723855aaf31771923cf97860173d88e6f/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c23940c50ecbbf2f3aae6d5946749ea4c55d0795/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/251e2c9c3ceb6e454ce2632c02a3a8092f8b2cd5/
        bfin |                    ntp-4.2.8p6 | NOK | http://autobuild.buildroot.net/results/1c383f8001d2efa9785035f74401fd05dbc3faf0/
      xtensa |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/0c329042e96f7669ba48eea67442983b8ada827c/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/59f17f4eeea2b2fe63390f2f8402d09d49fd1c32/
      x86_64 |           openpowerlink-V2.2.2 | NOK | http://autobuild.buildroot.net/results/2ca04bb046263e479e7597867b56469893d3c11d/
         arm |                     php-5.6.20 | NOK | http://autobuild.buildroot.net/results/f9d4928555fa9e8aa33c358289950a6c63362b6b/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/99f6f65d4fdcec45bb863f87def8624eeb82119f/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/b2853300e4f233adb2b3d73afca136d88ea4ef59/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/8b86b7fc44471be8ce479b88da7a335e64d7396b/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/b86017ba5ff52a4c6342e39fe6c2acf038865829/
     powerpc |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/bdd350485941f264dfd49e522d6ef148d91d7767/
      x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/4ff4b243b5f8fc3f99ea33d2b75f247154101256/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/daafab5616b7257f7f231ca6286860d781289786/
        bfin | x264-a01e33913655f983df7a4d... | NOK | http://autobuild.buildroot.net/results/7a7d0e885419c2b3e1cd57fc91d600413d8316ca/
         arm |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/6181be2dbb8576fd50c62ad8818a97a7f2b380a6/


-- 
http://autobuild.buildroot.net
