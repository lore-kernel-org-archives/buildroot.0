From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Aug 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-08
Message-ID: <20150809063016.C661B1016A5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-08
===============================

        success : 170
       failures : 44 
       timeouts : 0  
          TOTAL : 214

Classification of failures by reason
====================================

                   zyre-v1.0.0 | 7 
               protobuf-v2.5.0 | 3 
                 clapack-3.2.1 | 2 
            c-periphery-v1.0.3 | 2 
dawgdic-16ac537ba9883ff01b6... | 2 
                  mono-4.0.2.5 | 2 
                   bdwgc-7.4.2 | 2 
             libselinux-2.1.13 | 2 
                 qt5base-5.5.0 | 2 
                   tinc-1.0.24 | 1 
                cifs-utils-6.4 | 1 
                 tn5250-0.17.4 | 1 
               lightning-2.0.5 | 1 
                  powertop-2.7 | 1 
                  boost-1.58.0 | 1 
            libnfnetlink-1.0.1 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                 setools-3.3.8 | 1 
                      nbd-3.11 | 1 
znc-b396cafdb249544164ed029... | 1 
             lttng-tools-2.6.0 | 1 
                  connman-1.29 | 1 
                busybox-1.23.2 | 1 
                  zeromq-4.1.2 | 1 
                  weston-1.8.0 | 1 
               libgtk3-3.14.13 | 1 
               linux-pam-1.1.8 | 1 
            gst-ffmpeg-0.10.13 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/e532303e864a57d691c359d4a5f61101ae83b74c/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/ea41182d4ef40afe6f0333a277a4a875e1d7728f/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/0ec8444de4e3e54974bfd71d12226551c1397a5c/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1721070736adc1b40837d94b6c7d49f2ee5fca3f/
       sparc |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/5cd4cd1c6b14f07e9a1acf2807f358a182d343a7/
      x86_64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/590fb79346bf766680675732a8d22cf927431df9/
      x86_64 |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/8dec8c46ad1959066101efe7cc1781f3d4732028/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/030869bf1ed29dfdf2d151c34bc9ebb39b65656c/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/4c6141c5964cd57fbbecc850521d7b1c7c8ce2de/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/243ddba2bb52f50e41e9245580f4144eac8d7152/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/cae3cda9be779ea8359f94d13bbbca97e68495ca/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/c9562a8c8e6ea4258c8e54a74e41a1f51578fe61/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/950f0b1c0562a1fe0a1e0dfb1ca6937c049aae11/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/c6fd45417ae427dfc47c965de54095e532053b8d/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/09b08d329e632365dd8371371706dbeaa10539a3/
     powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/6a744adff500333759d43fc0f72a64967edada60/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/18aacf8ab099b971374c14bd4d8a582964b3952a/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/eafde9a22d9cdb6f9b90cc5a94379ef83a939f38/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3dd7f8f7a392b343e9f2c4747bfe2050145aafdc/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/0ff579d45ccd224ebe01ec3afde548ea0363f545/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/353d7ea977e72d0469d7522b34914bb3ad2318d1/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/6ca498e7ef409691487a8e28a871623bec5f69b0/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6a5daebd4793906f3402b55d39c2964715b957af/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/11a9c9b0529e9ef8c2fbeb4e030e7fdbb52e6550/
         arm |                       nbd-3.11 | NOK | http://autobuild.buildroot.net/results/c5b00c744c850a6e909a8e67c7cde5142749af9b/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/713df99bebd625434e029abdf360574de879afa3/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/bc9e5532a59e0efb5876333b331a77f59c91af24/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/96ae1108fc3193df2a93a779057130b774379655/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/00c29795980319d38823eec1301e9ebd860ebd2a/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d277d8a30589b3576651bd4ca59bd575b31e1c7b/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4b9bf5bc7fc7506920d26f6f6544ba3a7d3c6d54/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/820eb008a10e427d0f66d153aa2d3aac4e802c79/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/13cfeeb26df8c4f5ad982529bbd56b4faab79e1c/
     powerpc |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/432b1fdec1e6282d51ba1d859c0f4ab9ed2a5efc/
        mips |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/c783695a5b1a18976361ea36627505b281b11781/
         arc |                   zeromq-4.1.2 | NOK | http://autobuild.buildroot.net/results/3b6497e52814431389463058604cda2cfcdfdd87/
      mipsel | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/2dd7ff73acbf226e456c8790f4b692383f9252d5/
     powerpc |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/a5718eaadb2146cc958cddff75d030330b554df8/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/805dad2415baeb63bbc1481b63cdbd301bcdb04d/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/d24d7ccb878151bd81003763ba1a6bcd91d41dc9/
      xtensa |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/16297efffad495608ad16d7de166dfe20bb61c84/
     powerpc |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/40bb0114255bc2a448de6750ed4ae27783a0e22b/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/c98e14030aa8f35506bc66b3732d427bc9890927/
         arm |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/df97a41e80db8c5b62889acd9d487f3b2259b7ad/


-- 
http://autobuild.buildroot.net
