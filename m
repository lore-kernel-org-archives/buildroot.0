From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-23
Message-ID: <20150824063015.450041012DA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-23
===============================

        success : 245
       failures : 42 
       timeouts : 0  
          TOTAL : 287

Classification of failures by reason
====================================

               linux-pam-1.1.8 | 4 
                  mono-4.0.2.5 | 3 
                 mesa3d-10.6.3 | 2 
               iptables-1.4.21 | 2 
    xserver_xorg-server-1.17.2 | 2 
                busybox-1.23.2 | 2 
                minidlna-1.1.4 | 2 
           libpciaccess-0.13.4 | 1 
                 libssh2-1.5.0 | 1 
              drbd-utils-8.9.1 | 1 
                oprofile-1.0.0 | 1 
             webkitgtk24-2.4.9 | 1 
                    ustr-1.0.4 | 1 
                mongrel2-1.9.2 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  udisks-1.0.4 | 1 
           libfreeimage-3.17.0 | 1 
               libcap-ng-0.7.4 | 1 
              cryptsetup-1.6.7 | 1 
apitrace-c181b7fbf4b1c39124... | 1 
             lttng-tools-2.6.0 | 1 
                   bdwgc-7.4.2 | 1 
                 mplayer-1.1.1 | 1 
                directfb-1.6.3 | 1 
         qt5connectivity-5.5.0 | 1 
                  cppcms-1.0.4 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                  dhcpdump-1.8 | 1 
                libmbim-1.12.2 | 1 
                  opencv-3.0.0 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
                 iperf3-3.0.10 | 1 

Detail of failures
===================

    mips64el | apitrace-c181b7fbf4b1c39124... | NOK | http://autobuild.buildroot.net/results/22a73b4ba0adcc874ecc153917ae6edcfd4d37af/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/2b3665b4b6984a69c7d4cc8646c9356af9226a7b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fb79f20041efabedca6a75c3d8be8178e644e7c4/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/387cb0ca57b128b7c34040d1a87ece67709b266d/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/ba69e8f8e7a3a3b94ea1d20cbc8af0e910fbadb6/
         arm |               cryptsetup-1.6.7 | NOK | http://autobuild.buildroot.net/results/73300596adedd239d0e2789f4320a33dda529079/
      x86_64 |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/43214b5f7d9e5881fbeba7203ee7fcfc6386a492/
       sparc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2d411d672ce59de528e08c71205b5a3fc54f0da3/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/4f8bc4fedd9d52d61dc8ca61bd3a3a185006b8c6/
      x86_64 |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/25435df4c58d9f71e875e26efb2591547c2c15cc/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/ae57e2aacf72242b5865b5274abc845f695d4820/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/dd294c76dc9bd9374b158e0051776a10f13c0df7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/beb870f5159a976a83bbf0064b2253867d5ab337/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4b04514c014cd27ac4f735cd8a37b9a7354c9574/
         arm |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/795875fdb0f86b8f667b83a6327c5aacd75da6de/
         arm |            libpciaccess-0.13.4 | NOK | http://autobuild.buildroot.net/results/f5a516cf6c25af89000019b6789d5a003099cdff/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/1251a065e944ec52e32660a240c327af3591f254/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/421637595bf1fa272dc35c2f8935674abefa90dd/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/bef53a3a2e65713810eb32ae32bb30356f907eb2/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/017d3eccbc1893cc0dccfef14b19904bb6a5bffe/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/fb0cd3c50fe31e2df57e6c0f340da89860a7bd08/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d03c24297d2f60de49f38716b3e25ffd1613beb7/
         sh4 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/5ba706f081c39d47cec8eb6804cd0fd4726d149f/
         arm |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/8d11800bde988e15674a47c8e9f14d5c655df78b/
      x86_64 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/e3cd69caa105c5f9bb974cf61a072df9c4f98b9b/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/fe623acce834518d7cb157df5f4679fe9efd5732/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/ac252036f1c93f7f0f57264b43c6c56c6c07ce14/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/b6f05aa744e12ae46806040172ce38ac45d883dc/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c1120f7fe3a837d7ebb96420ffe6dedc893c0200/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/4d7674e396964e8be76e7c693d97ab06e937640b/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/592c0930e8cc0225dae42a4a94fbce06f17005a3/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/300f7c30d2facb7d8b69877bc6735c398776a5cb/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/ad7d1f79b50cce91c8bc94e453af51c29eb62b73/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e7a7d7f68ec3e6c35abad945643f08cc9b01134b/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/ae61713d0b94f77266dab7781e403cdaf9a15884/
      xtensa | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/8c2408f6d1a9f3334d37810f1cecf2ffa32356b5/
         arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/76e94c2226a429f819bd98d78fd890d968a40c21/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/72cacb83bcee9f7221617d08d22674bc969820e9/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/5c69ea5a7e6bb5c578206064b34d82877410b8e6/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/da2ec2759e236a5e497719289584616683c0fea9/
    mips64el |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/dfb369b1692a0a1b1d9ce87be159b8f0ced73cfe/
         arc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/c8780194cff72dc19aad30a31fc98f303a557bda/


-- 
http://autobuild.buildroot.net
