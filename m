From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-27
Message-ID: <20140428063009.6F6151013C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-27
===============================

        success : 83 
       failures : 35 
       timeouts : 0  
          TOTAL : 118

Classification of failures by reason
====================================

filemq-c398c096a427d341e932... | 16
          glibc-2.18-svnr23787 | 4 
                  zeromq-4.0.4 | 3 
             util-linux-2.24.1 | 2 
jack2-ab409a65df95bc261ff72... | 2 
             dosfstools-3.0.26 | 1 
                  radvd-1.10.0 | 1 
                  cppcms-1.0.4 | 1 
                 cdrkit-1.1.11 | 1 
                    gpm-1.20.7 | 1 
               alsa-lib-1.0.26 | 1 
                  sysklogd-1.5 | 1 
                  ffmpeg-1.2.5 | 1 

Detail of failures
===================

      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/88bf6b6b66ba8fcebe9a08416bb973c6b4a210e9/
   powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c1ae6f32eee526764a8708e91d45bf65c60296c0/
      bfin |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/beb916cfa97b56dd221ef01fc5736b310301e564/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/708ce869a3d5cc08fb0a30f87ba88539fa13cca0/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/2858bb1ca1d12955c837da5a8b7d69c587a75646/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/68028795de872ab0da77df484d225d31fc00e237/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/a43d53aa732d799249bb635ac3dbbbd88ecfbc2d/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/dbf1cce981cec192c580244b41bbef264e527620/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/b73d4be918e317bed2e22eb8bd8b5c7a3289a8a0/
   powerpc | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/b069cd10cfb190fbf0a0ed3e388638880372fbf4/
    xtensa | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/c4381576691e7b48114b2c7dc3a5e63ec4102365/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/7c56ca64d35bb7cdc40cc20978fb75953bd6cc4e/
   powerpc | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/df9227615fd971fd038e79a4cef38ec46badd4ee/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/b433bdba970920b68056663e889abbdebe19c2ee/
   powerpc | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/1f82694277ed1c1ba6ff1309dec898198943ba22/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/c884a6179b6c11bc49992c75dce317c3c3598f5a/
   powerpc | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/971e2f88a533cc829516b1cf426f6b1c27d0d82b/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/57c5157cb6fd53c82abf4f33a404c927bd1eb281/
      i686 | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/bbdd8730d778f1dd93957688be0ceabf6d132b9e/
    mipsel | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/1fdff1b4de829c645ff77db7ed44de655510c285/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/cafd5d8f39ce21a4b0334dbc9fcf904b94fb5f59/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/b725ecb7599724f547042a094be82baeb73bc65b/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/7b5da348a481366976b2f23fdc5b403dc716edc5/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/bab66f8d4e0efcd23855581b1245ab8d20cc9085/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/5e673531bacec7527222df1ece0b783acef9c683/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/30b8a01991596f899397218dd983e6c423f0c10e/
       arc | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/3fcb95eedcb8ad401b4e32e66feedb653e4d4acb/
       arc | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/e24cd262eb87913296a40cd967cbe6d03da64258/
     avr32 |                   radvd-1.10.0 | NOK | http://autobuild.buildroot.net/results/4ba2517864a416ce00f53e47c6ec3c6b3775cdb8/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/332ce639857ae6856e0fc6075f3582311c75f3de/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/030d0599d2b0f750fc60693fea96c2b4891f5fd6/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/8d24e80050485e57da4b721a158f6d8ef0fb7f5f/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/813f682a4382dad88bdf5f5c2925d4c2c440c7c2/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/af9203694d1b5270aa861c6192c3c2bd687700ed/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/e4146017ce1c09b23a89817ec5c3dbb8dfcfbfc2/


-- 
http://autobuild.buildroot.net
