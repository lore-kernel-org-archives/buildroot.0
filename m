From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-19
Message-ID: <20160720063026.114921016CF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-19
===============================

        success : 205
       failures : 83 
       timeouts : 0  
          TOTAL : 288

Classification of failures by reason
====================================

                  cairo-1.14.6 | 4 
               linux-pam-1.2.1 | 4 
                pinentry-0.9.4 | 3 
             bluez_utils-4.101 | 3 
qt5webkit-b889f460280ad98c8... | 3 
                 lvm2-2.02.159 | 3 
               lighttpd-1.4.40 | 3 
openblas-f04af36ad0e85b64f1... | 3 
                  babeld-1.7.1 | 3 
              gnuradio-3.7.9.1 | 2 
                  nginx-1.10.1 | 2 
                    libiio-0.7 | 2 
           libfreeimage-3.17.0 | 2 
libamcodec-6f9b99182f94be14... | 2 
                   cmake-3.5.2 | 2 
      kismet-Kismet-2014-02-R1 | 2 
           uboot-tools-2016.07 | 2 
           libmemcached-1.0.18 | 2 
               libcap-ng-0.7.7 | 2 
                  gamin-0.1.10 | 2 
                blktrace-1.1.0 | 2 
                   ncurses-5.9 | 2 
                    nettle-3.2 | 1 
                     pcre-8.39 | 1 
                     xen-4.6.0 | 1 
                ipmiutil-2.9.7 | 1 
                   bdwgc-7.4.2 | 1 
                acpitool-0.5.1 | 1 
                    cups-2.1.4 | 1 
                    gdb-7.10.1 | 1 
              libarchive-3.2.1 | 1 
                 clapack-3.2.1 | 1 
                   fwup-v0.8.0 | 1 
inotify-tools-1df9af4d6cd0f... | 1 
               openipmi-2.0.21 | 1 
               qt5base-5.6.1-1 | 1 
                  stunnel-5.31 | 1 
                 lvm2-2.02.161 | 1 
             transmission-2.92 | 1 
                   dante-1.4.1 | 1 
                      qt-4.8.7 | 1 
               libdvdnav-5.0.3 | 1 
                openssl-1.0.2h | 1 
                 mplayer-1.3.0 | 1 
                   assimp-v3.2 | 1 
                 opencv-2.4.13 | 1 
           argp-standalone-1.3 | 1 
                   ushare-1.1a | 1 
                openmpi-1.10.2 | 1 
                  multicat-2.1 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/c87017d3c062da5f876106690aeb638850522978/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/ab960441bf74bb59ea46b8528febc55b561580ac/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/8c77469467f965bcc8fda3b523d433faeb1e3848/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/565ffaf8bc13551a44cce20c1ad1a91e7faf1fe1/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/fbd5f67fbbca1d1d4bb29f21a7db19b6159a6360/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/d4cbaae93d79a6cf37c00790e008d4475f249e35/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7b3f853eb3a81dcc545ab586b78b06556c5af751/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d112e99d44bb13d450a62781324e0ea8dabe4948/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9e4589f98c738a0dd622c8365fb3a536adced668/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/400a36a39f7b8c3f043736a9aa4e7c971003ad1b/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/76554c639f63e985f12d78c8a0ec19250d9c4d4b/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ef8bf05d5fef00537d662254b706144b90de995e/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/057682d48aa83a2280b106f95215cdfd26be0f79/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/172bb080c5e50d9fd6b7cdc75408d77e0d31395c/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/a14eab6783540e00852ebcc0b577a0e86282f6ce/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/98686cafba47da101d3ac58147c96581439390c0/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/e7a0b0e4e04df028ea2a7f2795d0725d4a177040/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/9e97fd8da79c9f65ec1ef1007d0a752e970880cf/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/824d67d337794f3eff3c7543af37c1d1c9ed2101/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/6e555c0fce72ccc535b69fe2f74a8f74bebbed24/
      mipsel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/7155f6fa0ef4535608849bfd6ab7ef0b5e4408fc/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d7abe1a774db4f39156f599573c1136fddc084c8/
microblazeel |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/887df97196d7777efbf18a7bee91aa45c1a98700/
microblazeel |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f05fd993422923dc3a7beed2511a6b16cd69c5f3/
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/89830398aecd25dace69df11c4c46b7f1b563134/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/147b819e615def53d55356e740990058d4913c69/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/70475e8888dd1f48002cf4ee307775364672aac9/
         arm | inotify-tools-1df9af4d6cd0f... | NOK | http://autobuild.buildroot.net/results/601b6cbc41b204997f94a373bf7b3b420b4921d5/
        i586 |                 ipmiutil-2.9.7 | NOK | http://autobuild.buildroot.net/results/de85cad38044f1ece216a8de46d6b8433c0abd67/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/d6c9118d83311928dc5c61f3b8c31639c3e10cd8/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/bf6c6a042787099ccd13863961e3b5b7771e3678/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/bbcd6499d54daaf167c5100879a9ee2178492f7b/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/b7653c299a60a67b360c98d59d6707ab468ce6f1/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/37624b240bde636443a18197ed5930ce43a047ff/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/515828389d59a756bcf5b6c95caf7c3046c82e7c/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/b00fcc7346decccede064ca94f33da957a6cbd88/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/7ca57d386b39c9592e3d73c82aafe5cde8224979/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/a7125b7b3885e9269ba212f5ae1879246422934c/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/54df6c16bd9d7b47f1d0f06bcaa917e004809103/
        m68k |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/eebcce7f7d98b4c106fff234c03afe65f421dbdb/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/a66d245e463cb1180bb02d8d85b9051e02abed45/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/60c81002f1a6f7ed7a81c130096d9ae12bf13b92/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/29f8cbd27240ec5bfc4b18adf2d86b15c1c4f004/
        sh4a |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/ba6e821b808b15ea33a884205dd35a5c32dd3bda/
        i686 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/16adaf23d4f2707926e2e8005e2f203e73cf74be/
        sh4a |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/4c91ba582700c7ebb3130d176b5cf7e7fe5fe864/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2324cfcbf03f2af6a638e677e84d7a9e75f70e48/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e5a6cc73c11e5c1d9e440fc13717974630a9cc99/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/0cea17b77ae4040c82e3bd63534e724b9e80328d/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/76473dca8adba925b96877dc32a1d665cd32402b/
microblazeel |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/96d35a6c1a1f6a63358d8342a21227fc90d28b9f/
microblazeel |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/06ba7fbc859f8adae7e188c2f5b8d17dafad7b44/
microblazeel |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/65ef928da0f1b6fc5643309f6b6bd13b60374486/
microblazeel |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/e3e23d6dc4c18f43aa7436f72e7ca24c74f21568/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/22810654f35dec103fd5bd66dbb37a87950d2358/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/3479fd38e33e1362b71ecc2c8592942d66472ff1/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/4e55a823d89ed6f68f300963ca81dc9339b03191/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d7cb7751e47d924540103a3a3ecfc28a609f1d3d/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/938ac3df083c632b86046e0c4ccb052d04c96177/
      mipsel |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/64b57d0b98bfa9ea633befda90f6cbaa5d050302/
         arm |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/897e7502b0919be607b4acff485951cb954b9f74/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/13de2f922f09892692daf6f4425a7e592cdc2f56/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2d7b96c6aca3d7d39e74aa74f13be929bdc737a5/
      x86_64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/812bcb0356171dd81aacc87432ad37108178c00a/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/9bbf1385fab88d98cdf46de759b546af50917432/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/4648a9916e2b082fe34dbeacee66f7e5ba13ba6e/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/dc0993c24c51da60d3789be071ea307b3ad29f83/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/70319710480208f404a0f67b41ab71f4b44a9a3b/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/deba9dcb862c649a846da613209a2ab825228667/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/146fe0dd24f19cd01ceb76f1c2252c5f639ecf76/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/93a50561f207f8b9df7323c14a90fd6964b1ce10/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/658990ce19e351ec2d651b1aeb28a1b2659a0e54/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dc53dd2b8d24cdaf89c10237a87b7cc13537ee06/
        i686 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/e66d09e98af118b8def421d5bc5b3f8cd276486a/
      x86_64 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/f6c290665e41b12f69f0ad9bc44113ac5c3c5620/
        i686 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/323ba220fae70d94c81bab9a348be844e90ace91/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/617ff52ff9660efc6c26893b0c8be68570655562/
        i586 |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/7d7c9eef04fb672f48c6db0bd29ae8e97684812d/
      mipsel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/c831966c3a8d1ed68d986b030bee82dc5b2d6a86/
      x86_64 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/8e85481441b68dd8e3734b16c90e9c34d9cfd689/
       sparc |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/1987f296b6fb03b46507d63927b2180bb7d6cb9c/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/20edd7e2f36756aa4523f756a8237437656c8735/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/2d043bb7c59fb57cc9a45e32a1e7def1054c6d2d/


-- 
http://autobuild.buildroot.net
