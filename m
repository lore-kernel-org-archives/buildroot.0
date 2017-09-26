From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Sep 2017 08:31:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-25
Message-ID: <20170926063104.8D682208F5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-25
================================

      successes : 157
       failures : 45 
       timeouts : 0  
          TOTAL : 202

Classification of failures by reason
====================================

               asterisk-14.5.0 | 7 
                 wsapi-1.6.1-1 | 7 
                openmpi-1.10.7 | 5 
               pulseaudio-11.1 | 5 
               iproute2-4.13.0 | 3 
                     nmap-7.60 | 3 
               librsync-v2.0.0 | 2 
           python-numpy-1.13.1 | 2 
                  cc-tool-0.26 | 1 
                  ffmpeg-3.3.4 | 1 
                host-mtd-2.0.1 | 1 
              lbase64-20120820 | 1 
        ltp-testsuite-20170516 | 1 
                   mp4v2-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                openjpeg-2.2.0 | 1 
                openntpd-6.2p2 | 1 
                openobex-1.7.2 | 1 
       poco-poco-1.7.9-release | 1 


Detail of failures
===================

        mips |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/7683926e58c5bacbffe2a4f988f9a6b4834a8e49 | ORPH
        i686 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/23da80beae3263fe21f249656d206507b7dee460 | ORPH
         arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/565dd4f6934cc935a5e8a57c8cb7260d2b4dd0b7 | ORPH
   powerpc64 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/3278e85d000437b7da954d9c03fd49504f267aae | ORPH
      x86_64 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/45f4ac05f360df08235bd51fe4518f666331ab48 | ORPH
         arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/6b00c9718ed961a38f01917ccfc3d3f7d0340ed7 | ORPH
      x86_64 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/28a64f702ceffef9b29a4d5370be0592d6239825 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a1f818ec77c0770e27a3597abbeb4aef151b9450 |     
       nios2 |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/910c19907deab4cb67a8230ecc45f18847aca202 |     
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/6e89636d490cf3c6b5ae0e360e1b0a209a31aaa5 | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/a01c5775945f5ffe75451722b676fc93333a0f14 | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/f3753a5d18019527361ea2960a72c33619031bec | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/38b81c17aedfd5959ca68806a990bad9551a0757 | ORPH
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/f5688afba3da08c887f2c54d1320e3c63c94a1c6 |     
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/6c9c521169ea091310de12974cc85f1a4bb8a9db | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/5442ca3e9435a5dc2333fb898e95663ed3349d72 | ORPH
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/efb3581a1ccb06c23f722c6a3766747c78637d09 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/91bea25e330222ffe54c3947f250741589ad268a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9ca2011583caa6f478070ee8d1adf3cbbb0fce5f |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/cc66b5cc74d581c9770bba41d5074cca25f7801e |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/92636f95f4894508f1f8e9004efe411540d56809 |     
      mipsel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/bb6e8586bdefd06df8c9da98ca5f481e6be1b6b0 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/db68249d687196a764126dbd63d4303e9642d45a |     
      xtensa |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/6ee1f6edb53b8fde565841737dd8eb72a53ae494 |     
         arc |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/9f6478e22d4fdd43df7b64257c655a45a52b6def |     
   powerpc64 |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/7939f85bf094c74200c882f029188960dcc9beaf |     
         arc |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/c4e19319ef9ced7c10351a66268f73d0f25ab9ef |     
         arc |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/0224ef58539d3e50e4ec53a53d6b32688cb55418 |     
         arm |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/7b08c987ce200deefa21ba85a9361d818be6b206 | ORPH
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/2d6a386eaa2b9e5a204196b68519e8baedec8dda |     
        m68k |        poco-poco-1.7.9-release | NOK | http://autobuild.buildroot.net/results/6090f5a0f4bf96b9dc2b3e48eb2e33c83d2ba7d2 | ORPH
microblazeel |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/b9714cbd347e857e18e53a2a226cd3165a3344f2 | ORPH
   powerpc64 |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/7ac162df799ec430e43fc2a696b7ba1a1585d652 | ORPH
      x86_64 |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/6c5076a3bd0ef59a38ceed18f952a96d2d260536 | ORPH
      mipsel |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/2d379e5226deab1e40b6a77f485818bfced214cd | ORPH
        m68k |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/cfe4e9b43e5e06755fde3115938268d98a9b3f06 | ORPH
      mipsel |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/37b59fb014d476303259a8c046216b334a4c48a0 |     
         arm |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/acb1430df0d74bc954de5aa7191a3b91d77ce5f6 |     
        i686 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/66cdb2394db5bfcb50c875869452fcab1f674ea6 | ORPH
      xtensa |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/34a83e01ed758dcba3843ad2fb7008cd3042c7d6 | ORPH
      x86_64 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/a98edd96f22618326d66557ed5a3ed9667074914 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/4324d3f6962fa65ab02e4c4ca52105f5a1e138ac | ORPH
     powerpc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/0ac894c9939961b76476c85e7774c24683bc6624 | ORPH
    mips64el |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/ecbea917f6bee4dc501cdc749f96445defa251ec | ORPH
    mips64el |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/c651d9a252c792f8c760f869451ffd5863aebcd6 | ORPH

-- 
http://autobuild.buildroot.net
