From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-27
Message-ID: <20161128073007.72527207AD@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-27
================================

      successes : 182
       failures : 31 
       timeouts : 0  
          TOTAL : 213

Classification of failures by reason
====================================

                    cups-2.1.4 | 2 
                  lcdapi-v0.10 | 2 
             rabbitmq-c-v0.8.0 | 2 
          sane-backends-1.0.25 | 2 
                  autossh-1.4e | 1 
                benejson-0.9.7 | 1 
          chocolate-doom-2.2.1 | 1 
         docker-engine-v1.12.2 | 1 
                      icu-57.1 | 1 
                iproute2-4.5.0 | 1 
                 jack2-v1.9.10 | 1 
               libepoxy-v1.3.1 | 1 
                 mplayer-1.3.0 | 1 
                  nodejs-6.7.0 | 1 
               openldap-2.4.44 | 1 
                oprofile-1.1.0 | 1 
                 php-zmq-1.1.3 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                poppler-0.48.0 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
           quagga-1.0.20160315 | 1 
                     qwt-6.1.3 | 1 
                     rpm-5.2.0 | 1 
                  squid-3.5.22 | 1 
                   systemd-231 | 1 
               wireshark-2.2.2 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

         arc |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/4e20b254fe86e2b0b2f7e72e05316e0d42982a1f
      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/abfab3d536d3ea08a784d7c112253aa7e307cc98
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/5d38d5ec4057685ddb96076eb6dfbdeda26b4890
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/53d195c882d2e25e7a942a2e60ed48a1eb5ba876
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/bc2ab3aa01ff2f7e25b3369218fc1f6e4c96aa92
         arm |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/01404639ffbdf169795bf7fef42c895f20b6557a
   powerpc64 |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/bec2a2c4801cdeced9ca72d874ec4f6e0c0a5ad2
      xtensa |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/3d9b2a16b4d2bce3aa50bf956d19feb21823c095
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f448c82cd9c22520f08cc77fe2ed1dbd5d07aece
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/deaa9ede7736d5dfb72ceb9be122f778a0901a3c
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/7ac3e17fa68e69fcbbe9fc30c87ee3525b16de1a
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/aca0ca82953f87b41dadaff92eaf5561a75a0ba8
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7a4081c7286c33c2896929f60b5638ecb9569a83
         arm |                   nodejs-6.7.0 | NOK | http://autobuild.buildroot.net/results/c575eda2917af9a77ecbbac4343f4454edc5c897
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/bea3071e4a6c96b13012589103fe94d9aad96659
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/988f8abfc8307eb81e9d70232290aaf57a9f3a80
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/dfdf09fdc7387835ad588de02042859cf19d79e6
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ef7faf07e5d56c817d4b8a6fd8a936cecaefae7b
         arm |                 poppler-0.48.0 | NOK | http://autobuild.buildroot.net/results/754d7bc2cf8d258420795390ba6bae3610719d49
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/3e49039a9446a6bedb453eb922c9b373ce0c0d31
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/ade7ee605e89ea0bcbab748dfca06b667b5b4c61
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/8b3cfe2818e797a5b8698ab9875b39245abfc0d1
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/58a1bb3867656dd1d531f58cab74c79be79366aa
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/92b8cbc37e252888129553cf61acb15e37755496
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/72f4037a91d8c1794794c956abe2a0d8cef48bfb
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/89c6e4ec1596def74e72eb071ef4bf0f1a7cc9f8
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/92a54c99a9ba918ece4c56d7beb985729bee700b
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/7b98dcbb49777b30ea25fce99a412fa42191893f
 powerpc64le |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/2bc428eee79c87e9a9dc0e8f8d277205741e3315
      x86_64 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/9cc18777bca38a24467c8e3c39019be3225970df
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/e9d93d6d8ec12da42465135d664542a5f16853a4

-- 
http://autobuild.buildroot.net
