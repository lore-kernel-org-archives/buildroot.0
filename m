From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-23
Message-ID: <20160424063023.8F0961024CD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-23
===============================

        success : 180
       failures : 80 
       timeouts : 2  
          TOTAL : 262

Classification of failures by reason
====================================

                    yajl-2.1.0 | 16
                 host-go-1.5.3 | 6 
                    ruby-2.3.0 | 3 
                flannel-v0.5.5 | 3 
                  boost-1.60.0 | 3 
               valgrind-3.11.0 | 2 
             stress-ng-0.04.16 | 2 
                 libdrm-2.4.67 | 2 
                  ffmpeg-2.8.6 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
           host-cryptopp-5.6.3 | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
            webkitgtk24-2.4.10 | 2 
                    owfs-3.1p1 | 2 
                    links-2.12 | 1 
make[2]: *** [profile.o] Te... | 1 
                 mono-4.2.2.30 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             lirc-tools-0.9.3a | 1 
                  connman-1.32 | 1 
           linux-zigbee-v0.3.1 | 1 
                   systemd-229 | 1 
xdriver_xf86-video-openchro... | 1 
                 lvm2-2.02.150 | 1 
                grantlee-0.5.1 | 1 
                    php-5.6.20 | 1 
flann-04b4a56533faf8c8228d0... | 1 
            host-python3-3.4.3 | 1 
                 mpg123-1.23.3 | 1 
                   erlang-18.3 | 1 
                   nginx-1.8.1 | 1 
vpnc-70f1211f6f26e87e374d66... | 1 
                   mplayer-1.2 | 1 
                    cups-2.1.2 | 1 
                pinentry-0.9.4 | 1 
                     tftpd-5.2 | 1 
        lttng-babeltrace-1.2.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  stunnel-5.31 | 1 
make[6]: *** [libavfilter/a... | 1 
                sg3_utils-1.42 | 1 
                libinput-1.2.4 | 1 
                blktrace-1.1.0 | 1 
                libpjsip-2.4.5 | 1 
               ipmitool-1.8.16 | 1 
                  squid-3.5.17 | 1 
                 jack2-v1.9.10 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c943893e70db1c84d29b77baeb2bd01268046ad1/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cddde0c5113bf8275b9db1f125087c16dd3b7aca/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b32c93ca4bafef9aafcee2155af7b0630c4868ad/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ed44c57ba178ce30a455c5925326f21d2a2daeef/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a87056c74eb0677d026c1499a1dcaed00d5cd99d/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/735a008458d8cb534b3e29be19d19a7906b1ec0e/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/2131735351bc91d8fa5c98c831c6ac483382214a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f39350c7c4e1638874cc1b4ab2f4184dcdcd8b80/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/177795ed2ebf67014d1a65e983080cf518f0aefd/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/458c0c6cd53420f9b58837b90d941b973b2e88ab/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3c171732ccb85227fad1f171032ab2e14f308c1a/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d2350c7b878cf2ab6bc19558940ebb128bcc7618/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5d70ddac6c7aace6d3e8b9f5b5258a06bcb29f2c/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/df3c589cc0814243937979a7d53e70ff2167c053/
      xtensa | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/ac560e36977f90cf93098c987d401d64edce24cb/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/7db8051492fe83899705e3aa3694307135669853/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/b94590984e4429448b8feb4b5c8c33da35662c74/
      xtensa | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/d9f40d3079a81025b10854cdb93278cd3d49e74e/
     powerpc | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/63341b5b98b17031cb5dfb6e6dbdba97506b068c/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/e860ff02069e305faaca70758dcdfadf9492c567/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/7de92d7703546ebd57dd6cc60f11f4893428fe22/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/6dcc0f4b208bfa664ce91e16ca1f140c9cde5722/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/a7c4268fac744a63246e893cd204164e6cba429a/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/cfbcb4600e0b1ca8cb5e673187bf87142c51549d/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/8c89092320a9f238357679d44461b225d83fe09c/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/4e6f84f863ab14b0c74dcee7760be7f370839422/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/5bc756822ee5bf06cbff0c9c8f192f789f29d33b/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/8c53d1af7d383a77dd577d9c8ac7b1433df4131d/
    mips64el |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/068c5ddb493727192cdbb61219bb1a6ea2f773ef/
        mips |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/c75496d185b73c87bc5d37951a8e2e0cfe24d41e/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3fbedb510a5d7d1ed624851d59a201b08747184d/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/0f5b192ab68b66bfe349e6c1398fa5cc9e89dac3/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/477d6fedcb2cdff7c5ae020d0ca43be568bcfea6/
         arm |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/166c7486f7f1c4b88a53c2714ae8b059e4ce82f3/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/873771fbcc859578ed40a3c81b69ac3a388ae585/
     powerpc |                     links-2.12 | NOK | http://autobuild.buildroot.net/results/042cf960c14bccb16453c5a07d3c5843908f8dee/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/10e49b50d417c93ae368b9cf951dfec4c7e71261/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4632f501935e18b09789482c8078a0acec010f5e/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/dbf436ce6f4616dacd28faf93846dd7b3f2767e9/
      x86_64 |                  lvm2-2.02.150 | NOK | http://autobuild.buildroot.net/results/09b6989d367d6d702aa618dc09e0ddca67725c04/
        i686 | make[2]: *** [profile.o] Te... | TIM | http://autobuild.buildroot.net/results/1d5d2996db2ab014387e14ce72ddec84f15a48d4/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/9b7d36bd1204652cd5ffb32f254a66fcccff4f34/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/714e5cec20ab0bc74fee707a5440f6d70eefaf90/
    mips64el |                  mpg123-1.23.3 | NOK | http://autobuild.buildroot.net/results/ad3aeab54ae54305a2856dda3e6022625467c96a/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8812819b6778a83dc251d3c6c71a1be59ee737fd/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/19c765e120764276533d95211e1c5cbf8606d476/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/4faedf3c55bfa7e4e689286291d46349364b348d/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/8aba4f4443caba40f240a1a0fff5708209945ab9/
        bfin |                     php-5.6.20 | NOK | http://autobuild.buildroot.net/results/5f0d7d42b6bdc4e06b453d18ff06e2e62eb2b464/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d7be0c6e26ee7a14bcf3fa5930303f7a120be288/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/b70b5e7c0364126d20f766139d5b2dc2a0617c55/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/85c0dd52566ec27b5dedcd34df0c7e3c96e9eaf3/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/9510eef1b9766115ba4227a2082b71826880b58c/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/bc98979fdcb00e6dc7b0c6e33bc569dca951f9da/
         arm |                   squid-3.5.17 | NOK | http://autobuild.buildroot.net/results/f64c66900296ca696cc2fe88904b7f9c756764ef/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/1d7e244d72e2d06bee7fd17fada1419094fe3ad6/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/1144f3ff6231300a749b122b92a276b3930c976a/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/cf6ae14e6aa2ec39b7cff9d0af88210c80bb7ecb/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/19043e2f61a142a03494bb427619744be6f3c165/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/bd18752f1da13fd8320d5dd47be28709012bad0b/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/717ee35225f6c2319df6670fa252f52b98ded93c/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1d8a5e62d9df1f817e28aae7abcba82bf4eef0ea/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/20591a5efc5aa84d5f3cf1034a7301f9fc8027c6/
      x86_64 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/b1c87b924531ece64d695f1daf0d4cc0e3440be3/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/44ce7174e5549e9ba5cbbcd054ee3433deacc43d/
      xtensa | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/aac84d04057d9125aca5c9c6d3824040d6c14dea/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/bac0d942de7bae625f97d30435ba562bcb30394e/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a7311d704dde59dd2c652a60d3b55b2aa73952b5/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/33e432369f736953138eb4f9074d0ab949580729/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/18152555600f69759bf874e92467e3bfcfb96174/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/4a63017e9fb9fd519ea07e36d64a07e01b876e8a/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e91666af7f5d0ee04ad80e6f39cca97a48496d81/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/64c70a6d589de0da6dfe2ed416b50f6d250c3f86/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/bf55689354d24fafbb33ab55a6b932864ff3d706/
      x86_64 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b3141a14715b5508d60fd5f3e7c78b91a1c0c15a/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a41f85b2e13d673065d17216a52f663732613cdd/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/fbd81c04af0bc108a6f8b33a834b263aac2da541/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/53193ea67e13a62b736bafbfe5915a6572e2992d/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6b1fd7c55a492316e6513d72c021bd3918f314b8/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/548cc9d81f3de99fdb9449eda53290b055968d77/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/f46732610f6ebdac639a8fb30d4673c493c0956b/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a6cb4e0e6a404be3a62142a2c6fb203eb882edb7/


-- 
http://autobuild.buildroot.net
