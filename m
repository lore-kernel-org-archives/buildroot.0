From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-16
Message-ID: <20140917063014.89C20102551@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-16
===============================

        success : 231
       failures : 37 
       timeouts : 1  
          TOTAL : 269

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 4 
     openvmtools-9.4.6-1770165 | 4 
                     rpm-5.2.0 | 2 
                libcurl-7.38.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
               iproute2-3.16.0 | 1 
          perl-net-ssleay-1.65 | 1 
             lttng-tools-2.4.1 | 1 
                  tstools-1_11 | 1 
                  autossh-1.4c | 1 
                     vlc-2.1.5 | 1 
                elfutils-0.155 | 1 
                  fbterm-1.7.0 | 1 
                      bash-4.3 | 1 
           xapp_bdftopcf-1.0.4 | 1 
       directfb-examples-1.6.0 | 1 
                    sudo-1.8.8 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                  thrift-0.9.1 | 1 
               iprutils-2.3.15 | 1 
                busybox-1.22.1 | 1 
                      qt-4.8.6 | 1 
                 webkit-1.11.5 | 1 
                  xl2tp-v1.3.6 | 1 
              sqlcipher-v1.1.9 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                    ruby-2.1.2 | 1 
                    strace-4.9 | 1 
                 libpfm4-4.3.0 | 1 
                  opencv-2.4.8 | 1 
                  python-2.7.8 | 1 

Detail of failures
===================

       nios2 |                   autossh-1.4c | NOK | http://autobuild.buildroot.net/results/425bd699459bbef1ea914c6979871aaeba2e508b/
         arm |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/c8ce0df96f0d1afef43f0bb3c5cd16bf5d6faaa4/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/3dbd6465d53bd662f6fbfc2f040763c44134b00c/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/0dc51f094aca66586faa71aeeca6a72098d77f22/
     powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/df8814dbf450e974bb76e50968c81e18f7a0edd1/
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/a4f72a57314a95c7c1b52d80eca9f933995ad52a/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/a9bbd8197752774ba69451b27da605b7d71dbd71/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/4c853d82225ac7944e1459ddafca7d7286b6398c/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b1e724695fa7da6e142febe08f46bed6ecbd1918/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/2607df5580eeabcee779058cf9759f47004946a4/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/787dc36ec272005d16fcaea77a1c284ee08cc909/
         arm |                iproute2-3.16.0 | NOK | http://autobuild.buildroot.net/results/61b2c4f7c631ec0c844e6669061c6302d7433ea8/
      mipsel |                iprutils-2.3.15 | NOK | http://autobuild.buildroot.net/results/5004e7b230635e0605acdd17d2b7d2d01fc5075c/
        bfin |                 libcurl-7.38.0 | NOK | http://autobuild.buildroot.net/results/35899961b6dc01c1522b17f63946da5ab809bff8/
         arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e17ddca9805bd2f8f5c971bd5d277cc712319ef3/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/9f4f7e1d18c2666344f37c700ed00014a652ac00/
         arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/d8c34f69d7097b6a63c1d01d7845e8588a3b3638/
        i686 |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/2418a09f68f873ec346f243a93b87e21896e4be1/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/b3b79b368b77efcec0389cff2935cc530f2819d0/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/1f9683262d59d7288ec8a417248cb682399304ed/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/be86413992ffab72369650ad9c4e4aefced59919/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/eaedefbe4c48d6bb0a2c66c34fc61244967c70ca/
      mipsel |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/944ef693c9e3a0f0dcda8a930a3bb4f627827059/
      mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/a02035dd4714e08296a0066b8a52665c7e8c80dd/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/bb24ac9b95831340e44cfc6615afcb411ac8cc55/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/69ffab8c3bee38836919e98602d5e9fcfe94b940/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/f577274265fea724a4cf36e17ce37ee99b933f2a/
     powerpc |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/74d0b3812b11a008d2fac25aab79c206ce873aac/
        bfin |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/5145617f7c3cece933c845da3c9836d80d062bb6/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/93e54d8aecc5c178cc3465eb9fd5415461325285/
         arm |                     sudo-1.8.8 | NOK | http://autobuild.buildroot.net/results/bc607992c753e13ee6561bda4a4892230d44a5de/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/33cf4005402777399e39d2129b4b81cfea2adf29/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/23e75c2d8adeaee6d8520928ff84813b7212c17d/
     powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/1063a123125124745a421d355d19558f5fc51ca0/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/4d4b1ddfa286e390207d9d3c16c48b53f0dd05af/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/df2a4cb036f0c20576ba61b4b56cbd31e680c960/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/553c7372219713b0acde9370c79af33139f18bf7/
         arc |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/cd5487e76259752cbe58b171f9a58970916f7bb8/


-- 
http://autobuild.buildroot.net
