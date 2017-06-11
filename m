From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 08:29:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-10
Message-ID: <20170611062958.442B221D66@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-10
================================

      successes : 131
       failures : 40 
       timeouts : 0  
          TOTAL : 171

Classification of failures by reason
====================================

                  cppcms-1.0.5 | 10
                     gdbm-1.13 | 8 
                 lcdproc-0.5.7 | 8 
                beecrypt-4.2.1 | 3 
                 sngrep-v1.4.3 | 3 
    erlang-p1-stringprep-1.0.8 | 1 
           host-doxygen-1.8.13 | 1 
             iprutils-2.4.14.1 | 1 
            libpwquality-1.3.0 | 1 
               libupnpp-0.15.2 | 1 
                     php-7.1.5 | 1 
                 qt5base-5.6.2 | 1 
                   slang-2.3.0 | 1 


Detail of failures
===================

        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/be722a655e536f8ca2a4f380e3376c7e0bf772f6 | ORPH
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/622564fe85b109e3e4b01d89f47e3473648a53f6 | ORPH
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/10adbcea14056720c0437d153bcc14ad96bb7e18 | ORPH
       nios2 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/11ce26dba944b9ae0a5cff2b898719289a8b2a20 | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/50d3e4b5b6ef59ee129f87744e38b5adc7429e08 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/5bb0343169a1ebc4fbfb9b2ac3a79c99508fd710 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2754e93e6bd3fa082c77885cfc63cfe87d27a77f | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9496e06cfb4ddc473851ef37426e9f5ff04267bf | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9ac1f07dc52ba8cfbbbd288b2184aeed54c0a91f | ORPH
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/10eb63c5ab44e2ab30d302149978319ea4727a3a | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9150414d60aff18f85bb5af29fcccac765bd84af | ORPH
      mipsel |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/222f7a7a79ca5964e128a98bebff55cfe8c8c9ac | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6d72f48dbeb0ce4cb8defd1254952b888894e117 | ORPH
         arm |     erlang-p1-stringprep-1.0.8 | NOK | http://autobuild.buildroot.net/results/fe76971fead52acdd64612161e92a48a4ad36572 |     
         sh4 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/a19a43a68d292e2a72a47dddd3309e5b9c23057e |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/8f451c28d41449054f9e66a71f2198559eb5cdc7 |     
        or1k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/e1e4a96f2def47e64d52af1f5e2cbfe858d1afe8 |     
     powerpc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/35581ab72ca6819df8bf4573ff734e83d0dab6dc |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/be545d568914a5c4c9da5859bc98e912c4d554fb |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/6d58363107e30d6743f8cc1068eb1eb424ee4c66 |     
     powerpc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9460799472605f98a2cab969ce19fca0a6d98caf |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/35b5be16a7739da3fa606acab715f7a365dcd1ea |     
         arc |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/4e26e253ccbe304a22b5dd691547b77d0b169fb5 |     
        i686 |              iprutils-2.4.14.1 | NOK | http://autobuild.buildroot.net/results/48e1c7fb920cbc81eee1cf2f43d1551a0a9ce31e | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/7230c7438d9dcb1898fe7f9040d1a78aea18d1e7 | ORPH
     sparc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/bb8d59694b3a7e8ada39b6846bb28a4cb4543f74 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d21e7e5cd3ba0220dc1ec8f731923e4fe7110023 | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/708f7a237b55390e5993416a8d6d43f7f8031a4f | ORPH
        i586 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/987c3ff909d668a20b75c419e825145e6feccbb4 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/1ad6be59471097f93f131901c94f7fcd65d17507 | ORPH
       nios2 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/a14a2941231ad8c10193a55a606c7f2f53a991bd | ORPH
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/cf5e1f79e4a4a2c179435ddd52c4811269828f96 | ORPH
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/0e93afa4b163d812a332e17264f144a70af51e34 |     
     powerpc |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/ce566ac78f09514d86f71fd0f5e8d53646c278dd |     
    mips64el |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/a3170a581c64c611a6e3c811f71fb67d1a2d9316 | ORPH
        i586 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/56ba46e19776e5400f905f25bf0befe49f0a1c50 |     
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/e4f4417bd8ccdc997039886c5a9cf5d12b579448 | ORPH
      xtensa |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/ac5104ed770a4f3ff37b9ee7c8e4e75e54e0e921 |     
     sparc64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/d56b9a17987fe90b025552a69de7e9aabd70625f |     
microblazeel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/d6b6066e990c0e2487e81f8e45d91ca82069a63f |     

-- 
http://autobuild.buildroot.net
