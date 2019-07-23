From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Jul 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-22
Message-ID: <20190723060114.0859220346@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   1 |   1 |  15 |
   2019.05.x |  13 |   0 |   0 |  13 |
      master | 102 |  41 |   0 | 143 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 13
                       unknown | 4 
           can-utils-2018.02.0 | 3 
socketcand-df7fb4ff8a4439d7... | 3 
                    efl-1.22.2 | 2 
                 libv4l-1.16.5 | 2 
                qt5base-5.12.4 | 2 
                suricata-4.1.3 | 2 
                  flashrom-1.1 | 1 
        glib-networking-2.61.1 | 1 
       gst1-rtsp-server-1.16.0 | 1 
                  gtkperf-0.40 | 1 
                harfbuzz-2.5.2 | 1 
               host-efl-1.22.2 | 1 
               libupnpp-0.17.1 | 1 
                 python3-3.7.4 | 1 
          qt5multimedia-5.12.4 | 1 
            qt5serialbus-5.6.3 | 1 


Detail of failures
------------------

      xtensa |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/28607883ba0e194a13e75544c3ccb56a279c68ab |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/513f0772416de1ae29e462c667aea6fbbbbddc7a |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/640c9800b3c80741521fd7e64e53296ebfd158b6 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/bab7d82dec06282aae5769483b4b9d38ce8733a9 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/e705693126c3bc791469c79f5207aee07be85bc6 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/797dde5cbf0e94162c7cc7b557841605c78ac2f3 |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/6abd09b4ea80c18b8d5f87d876e9f83b8292f30e |     
         arm |        gst1-rtsp-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/8a7dd1e1ce3859a9672a18cf45aa21884d0499ff |     
         arm |                   gtkperf-0.40 | NOK | http://autobuild.buildroot.net/results/747469b359dd05cfa05b4295958f8a8175166cfe | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/fae239293e36f8873c05c9e6ff74e6cf6aa2e9ae | ORPH
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/dbc8d06cdc115246e39c587cc546f914980e1381 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/341655dc7c9c5b4b89bc5e58a632d3ba246125a0 |     
 powerpc64le |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/918765ec3b727574d3658894ccb24a8d140e67ab |     
         arm |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/9004ed3743a0a208c0300fccee4ece29103b2e72 |     
        or1k |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/081401f31cf1fef1e44c478b5130d1f3706c4a97 |     
      mipsel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/6ac71c7a41dd92a5fb924af9da7cedc40e745cfa |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a12ea29039dff48d1c896b48a751d01811dc784a |     
     riscv64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/53058309b2aa4dccc5ed0ca1d3f82f4b09e2015a |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/c2b9ccb332b08c0988417981ca40ccd11115ccd6 |     
      x86_64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/d6c5bf181b4d3aac28cf922b71fb1221dc20eb96 |     
        i686 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/24289921c9e242fc9bc91ebbde01a113dd8f1f1d |     
      mipsel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/3cd0cf7364cd3b4de5ad5f60e69481a8b05ff976 |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/f1ce2593c13dd0c5b1145250c5fd031414feaebb |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/d6901f3d4b8fc77c591620f3781a9333f73b5ac1 |     
     riscv64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/ae0f4c42b7dc756d027c2ed76dbfcad15e9a828f |     
     aarch64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/aac689997952b54850be7c243be5e761df3edb93 |     
  aarch64_be |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/d5da1bcc3fd5eb194a399bc5c03960f7132fbe63 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/4251d374a421bebae2e324ce68b2c961b12cf734 |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/54c4083fddbf148ea48817f67898426e7ec94c6d |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/6cfa5a63985b1d0b9f7a83d06dcccebcdfc550ee |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/9e9a95dc204de4ddc7fc54eab374046b30034217 |     
         arc |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/1cd2fcf300b64b555f67bb80a2226f37657c72c7 |     
     powerpc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/757e4e2a09bad26413f6b47c400e7d9623a3c66a |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/16c34afeb2efd3144f0ca2d70fc5c425cebfa5d9 |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/be47c5e4903af37fd43ed0d68402b66ffe5a544f |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/3d4b4ce8059c3217e82360bbb5549ae4ca6dfce8 |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/35af52433ba85757d8e193355abff38946321f42 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/58008c70efa2f0b2d9fd924080dff03779dab94d |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/391928cd2529a870cdab0278931e0d2a2c302c03 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f500e2414256102fb5e5d66623976cf526c29459 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/8ee04e2da4881a76ec4de3708fdfa3d2f074d711 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       mongodb | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/3bf542f761a9e4f54fe0d8aa6e7913b843846ebf |     
     aarch64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/a2052b2652b1b21baec195cd1cfed38200863299 |     


-- 
http://autobuild.buildroot.net
