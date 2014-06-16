From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jun 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-15
Message-ID: <20140616063013.D3655100F70@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-15
===============================

        success : 104
       failures : 23 
       timeouts : 9  
          TOTAL : 136

Classification of failures by reason
====================================

             lttng-tools-2.4.1 | 3 
  toolchain-external-undefined | 3 
                    sdl-1.2.15 | 3 
                  boost-1.55.0 | 2 
                oprofile-0.9.9 | 2 
                 cairo-1.12.10 | 2 
                  snmppp-3.3.4 | 2 
make: *** [install-shlibs] ... | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                  libtasn1-3.6 | 1 
                busybox-1.22.1 | 1 
                 libssh2-1.4.3 | 1 
                 cdrkit-1.1.11 | 1 
               libglib2-2.38.2 | 1 
                cegui06-0.6.2b | 1 
               polarssl-1.2.10 | 1 
          host-libglib2-2.38.2 | 1 
                       unknown | 1 
   400K .......... ..p11-ki... | 1 
                      gd-2.1.0 | 1 
                python-nfc-212 | 1 
                   lcdapi-v0.4 | 1 

Detail of failures
===================

    x86_64 |    400K .......... ..p11-ki... | TIM | http://autobuild.buildroot.net/results/324e6d3145ab1f09d986810ad44fe78a09a6ad49/
    x86_64 |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/820996fdb3568862067d9bc46e5790f8221fdb76/
      mips |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/0cc1a00e617dfea6ce4cc6c1f488311e113a869e/
       arm |                 busybox-1.22.1 | TIM | http://autobuild.buildroot.net/results/8016553c0078877ff3f3476603d0ebe04cc63327/
       arm |                  cairo-1.12.10 | TIM | http://autobuild.buildroot.net/results/a2dbb959d8fa0138c9f3033a7a2691c27511aa53/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/138395591725bffb91f5684f7c25689062e3b5c3/
    mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/dd76bc9e1cebc8487803cbd4eb2830517ebd8eb0/
       arm |                 cegui06-0.6.2b | TIM | http://autobuild.buildroot.net/results/36829fa223d71921e8c8192425fab155de0fdbf9/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/b51ff5a2282badb90e1f91788cbbf63c3623ebd2/
      bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/f06a25326e8e6266938e1616ebd67373a0b81116/
   powerpc |           host-libglib2-2.38.2 | TIM | http://autobuild.buildroot.net/results/1f0baed2b7d31b4ff4087fd0228fdbc33828d621/
       arm |                    lcdapi-v0.4 | NOK | http://autobuild.buildroot.net/results/d131d58f3cac59d7cd90d2804a8104a4ea1e65bd/
    x86_64 |                libglib2-2.38.2 | TIM | http://autobuild.buildroot.net/results/f8882599abf81c460d0ce2fa5e7d1f4c704327c7/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/5fb451a690037c6e50e82edb7c12a59f1226484f/
       arm |                   libtasn1-3.6 | TIM | http://autobuild.buildroot.net/results/49d57df8fdcf00b7f8a774f595356bf685ca96bb/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/b03b01a2dd89dd4fd4c7829d5342df8f1e209ce1/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/e8aa688fa6b37ac04251a19c5baba1a1e8bb482f/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/d11708b9935298ca25726dfd385215095727bc2d/
  mips64el | make: *** [install-shlibs] ... | TIM | http://autobuild.buildroot.net/results/e5c2cdfcf5f338a5cc302ec2e09dd058c411cae3/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/279517ff9096bf99ba4315872dd66b6cbb32e828/
     avr32 |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/01f535ac784d449f6b309840c5a980e403ff43e1/
       arm |                polarssl-1.2.10 | NOK | http://autobuild.buildroot.net/results/c886ae05388f8fa4028668296b5c601d1edc10d4/
   powerpc |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/2ff000de23d38a8804b23cdbfafcd32f9263f67e/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/24fb8a1d8f622f3b73c894f25abbf16215404e19/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/0121fd964857423433083a1bb10053ebd13f2327/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b666857df8facc7b14d587b4a1911fb2cf269f7d/
      bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/3b6ce1ebc8e02100001fc57e95b9ca8710b43a39/
      bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/56d3464ea4a7c7359b6c5d5fc0233ec8abc36043/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f6b9eae7f4d5026d1b63ba4b9a90509c0373e292/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/abd1a354de15709731c72de123b04266c4260287/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/609ddbd2614dd067307477c2463b72fcf5956ea1/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/5712427b0f0751628eb942f4ee5d132688df6552/


-- 
http://autobuild.buildroot.net
