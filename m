From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Apr 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-31
Message-ID: <20180401060019.002D520764@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  34 |   3 |   0 |  37 |
      master | 266 |  59 |   0 | 325 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                     php-7.2.3 | 1 
             qt5location-5.9.4 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a1bb14d15f4f8bd2b909ec78f6e945a4653c6e85 |     
     sparc64 |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9aa3a020d302b4031a2fcf0f70c3d8c272cb1dcb | ORPH
         arm |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/4199d3335a8ddbd12139d279396d483c60df1bbc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-1.3.0 | 5 
                  udftools-2.0 | 5 
             bluez5_utils-5.49 | 4 
                  host-go-1.10 | 4 
              keepalived-1.4.1 | 4 
                   libnss-3.35 | 4 
                  brotli-1.0.3 | 3 
                    liblo-0.29 | 3 
             libmpdclient-2.14 | 3 
                prosody-0.10.0 | 3 
                     php-7.2.4 | 2 
          usb_modeswitch-2.5.2 | 2 
              wireshark-2.2.12 | 2 
docker-proxy-7b2b1feb1de481... | 1 
                   jimtcl-0.75 | 1 
                 leveldb-v1.20 | 1 
                libcurl-7.59.0 | 1 
           libfreeimage-3.17.0 | 1 
                    ncmpc-0.29 | 1 
                openocd-0.10.0 | 1 
          qt5declarative-5.9.4 | 1 
             qt5location-5.9.4 | 1 
runc-9c2d8d184e5da67c95d601... | 1 
          shairport-sync-3.1.6 | 1 
                   systemd-237 | 1 
     toolchain-external-custom | 1 
                wolfssl-3.13.0 | 1 
                    xen-4.10.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/b8fb270bb677bcd07cdb6a0c6f79e01aec6ab942 |     
     aarch64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/430627431f92571075828272245da9943ae97cee |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/76927d11b072c37f36937a24cd86cfce2d6ea95e |     
       nios2 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e5092aa985ee1e722aa6e479bf7ce4ae2ed538ee |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/c2d7ef28b3af3b680ba62a5557ecf5b1f3915ad3 |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/ca2a9770f64a10fd1b54ecdd08d292dfd67d7918 |     
        m68k |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/0215539bf726532b464e2a527140b6a06dd0091d |     
      x86_64 | docker-proxy-7b2b1feb1de481... | NOK | http://autobuild.buildroot.net/results/f6ef0255099b00ee905e989762fe9f032d3e03a6 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/98b5b21d0113c4c486de45ad879b99302bb7eb5b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/dfc147369d67cef01f3d1ae8e5189e1ed02370b7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2748c23ec076bf626874e498728453974534c50a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/21c34572e1598f900dc3fabb5ded2d9a7ba70f5e | ORPH
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/54f3df03551fbdf293d33dc1e3f08005faa15321 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f07d1691c30259c8dcbb15695a89f6c143764285 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/347d177ad4fa86ad69d5a270e4225c201febdfc9 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b02796645eb15087a5757bf796a223ba925a2a20 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/30fdb340fd188c98d3d5b1377b5a55b425ae229f |     
         arc |                  leveldb-v1.20 | NOK | http://autobuild.buildroot.net/results/4a6bdd816785ac20789113f6a9ea2510f2a95ac1 |     
     powerpc |                 libcurl-7.59.0 | NOK | http://autobuild.buildroot.net/results/fee6c17bdbf456a9354d783bb9a4c501969fdba9 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f96777cfcbe124cc1a0001f7c2976671e3c657ca |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b26344752a2f00f53b31fa57d16ff195dcca52d3 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f3d51954453b11eadd3d65229bd3aa5e0ea12e49 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/166aaebcf351cf46db9cbfa380ef6c927185dea7 | ORPH
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d9ad4a34a1d8beaae514e36f016f461d887bf9f7 |     
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/9129ec96c5b88f86c4bf14d5839e38e90a669d10 |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2f4ab9f97fb8d60206d8bee9453051f5bdebcbe2 |     
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/5a0cf9edfabefb3eb9030488a3e945fe4070aed5 | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/26475f921da1e5818ae5cb26da9581aa74b8418c | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/aa18ef673cc894c1c87052607baa271ce068e316 | ORPH
     aarch64 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/b0521020d49a9b6e49a77462d0908c4466ca2a49 | ORPH
        m68k |                     ncmpc-0.29 | NOK | http://autobuild.buildroot.net/results/c5bb5f978602896179ff9c58ecf4ced40bb96b57 |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/cbd5ab97fb0659968ff628461130627cf1745955 | ORPH
    mips64el |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/e4a841f00fca742d697b03c049899607f2eceabc | ORPH
    mips64el |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/ed7946136a01dac0070cd8460d2c891fad380998 | ORPH
        bfin |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/f69dfb1a7d1163b402b1f9bef045891c229539e5 |     
         arm |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/a6deb7440f80b072432c0f9c048e59abe4edf1c0 |     
        i586 |                 prosody-0.10.0 | NOK | http://autobuild.buildroot.net/results/29d8dcbe013e549a865c0c5953272dab1fe5f777 |     
         arm |           qt5declarative-5.9.4 | NOK | http://autobuild.buildroot.net/results/092658d6614a6485efef3b31a99e28353c932a40 |     
    mips64el |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/7d3603c93387e3480c715dd2a796e083be7b8723 |     
         arm | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/ce67e9120ab5fd656fa183fa5c503f2770e5e755 |     
     powerpc |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/60f411687726b48ffc5862b0c9546f262d54fe63 |     
 powerpc64le |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/0d32f96866d451ade030659e818f4ba95e574e5b |     
       nios2 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/6c44e328b7bffd8474d29d5bdf1ea109ec15f4ad |     
        i586 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/d2fa916613d835f856d14747dc03ef9847ad6396 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/e82ff1f7f8a4a930fbabd38353da2149cc54fd9d |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/7aaf6a7cc384b2e52109c0c31792c0d3888bcefd |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/a56e55fb4791a90c00906698676656969484383d |     
        i586 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/7aa020d115a0a3308fee1f3528554e40076ff28d |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ada2112e65eb60564b72c3ed498de834ec1633e4 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/04195d6e8bedb094b0d923a0910dd580773e180c |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/1d9ea9e015a9274bc1f181fe6a3bcd7063b53d0d |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/89acc52d7f6dd59c9d2cc888e3faa209107003f2 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/49ed0b3aba582b6c8eec47cd287a7916ec6317ac |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/52ebf8a677cbad39bd36ee0127ac238837fb9712 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/d6a6a631a9a9d98a92a4ed7fb20bbd89b1b5597e | ORPH
      xtensa |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/3336bc903eb492272a7872f718f81cb97d0a1947 | ORPH
      xtensa |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/79c7a41912881af02582e38de00ce6d0210bba65 | ORPH
     powerpc |                 wolfssl-3.13.0 | NOK | http://autobuild.buildroot.net/results/dc53bfc5ee13a167598a16ef6c6cfef3f3210910 |     
         arm |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/3360e5a9e3d007b4ed77345b5fe93b2dacb6ad49 |     


-- 
http://autobuild.buildroot.net
