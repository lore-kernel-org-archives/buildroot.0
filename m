From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Apr 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-14
Message-ID: <20150415063018.A48ED101935@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-14
===============================

        success : 206
       failures : 41 
       timeouts : 3  
          TOTAL : 250

Classification of failures by reason
====================================

                     vlc-2.2.0 | 6 
                  dhcpcd-6.7.1 | 3 
                libtirpc-0.2.4 | 3 
                  snmppp-3.3.4 | 2 
       gst-plugins-bad-0.10.23 | 2 
                    qpdf-5.1.2 | 2 
                      qt-4.8.6 | 2 
           aircrack-ng-1.2-rc1 | 2 
              postgresql-9.4.1 | 2 
      host-gdb-arc-2014.12-gdb | 1 
                numactl-2.0.10 | 1 
               gptfdisk-0.8.10 | 1 
                elfutils-0.161 | 1 
                   opkg-v0.2.4 | 1 
         lua-periphery-1.0.4-1 | 1 
                  python-2.7.9 | 1 
                   ncurses-5.9 | 1 
                ipmiutil-2.9.5 | 1 
                host-ola-0.9.4 | 1 
                 libraw-0.13.4 | 1 
                     gdb-7.8.2 | 1 
               alsa-lib-1.0.29 | 1 
                     qwt-6.1.0 | 1 
                     at-3.1.13 | 1 
                 civetweb-v1.5 | 1 
 make: *** [/home/peko/autobui | 1 
                 lcdproc-0.5.7 | 1 
               libecore-1.7.10 | 1 
         network-manager-1.0.0 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/fb3e723dc7f1b706cde39cd8bd337c8175190516/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/2fec5426f883ba84bb72a2ccff0ddfc5f1eb4b77/
         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/472a93868767ea753d0bb87b98cd58c91b8bd059/
         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/da5bb779f3077b079203fcbdb2533dd790963cd4/
         arc |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/c2e314127be74a41bcdb78f04bc51fe2edef0b0f/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/dc12251f206672840347c36f5347fcba86e2c874/
      xtensa |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/a583eea465a7bae8969665c76c695a6b394ce7fd/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/98b5aa1a8fa664e8e977ccb8a49d9906d633c057/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/309a68bc4a16aea4a23d52a6120e59a959790f4c/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/16df1a5df2d3353c917be1ef92dde90650934b24/
      x86_64 |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/1ed8c60932c47a9132239826b30a4a3fab057216/
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a7669a1b9f0c28763abaecdd4e1ef574afcc2ea5/
        i686 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/d8d789235d753d00dac936e2640f0656270a9557/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/cffc0645a8dc1f4b555c69b4dc384209c73a5507/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/cb72b1dd321d8a1aebb6cca8d9e0dc4bc5a062d2/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/3c134f7ab21f74579974c9455c8967ff605b7059/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/976947b5d6d96cef8221e896d50eccf14ddc8271/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/5d8c4dc6eb50db67ae4f9e14b493e719355b33ae/
        bfin |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/04a21ce6fb2dccdb85dc8dfb5a17b62300236c84/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/15c2ea6742206643b5a27ce3a252f0cdcc186350/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/7725383efd28182b59a90c76b30306d895cde2a3/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/2c33b5f8cfead2b655375ad34b81ff42c5e68d40/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/07d1cd0e1e4e9ce552ed92f44b0eab7e9ad9a972/
    mips64el |  make: *** [/home/peko/autobui | TIM | http://autobuild.buildroot.net/results/f3c1edf4eb98b12cb8a433fcf26dadb2215a9a44/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/3ad2148d35c061a23d7cbfc4210dffeb8fe88731/
      mipsel |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/1eef17a793d151eb140d3364fbb8020e53eec10f/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/68d249b4cb19d0831d4061fb93a63f490da76957/
     powerpc |                    opkg-v0.2.4 | TIM | http://autobuild.buildroot.net/results/5e207f79f78a544166849845fc553f2bc7efb656/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/0deef33cbbafe16166f727edffc0f599e3f31b95/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/cc012e7650a805d2e9b7f025d083ab2366ad2640/
      xtensa |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/eaf7fe281f6d8bb1a7cbdd2c20464c865c1caae1/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/0d45504d6b6c72fdb715d08be0b008c9e282b6e7/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/8a42ae47df3925cf64e451bb8f9a482d8767d334/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7d66426588a56a7fe2f42b32cef419a0ef22bc69/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8bc782870ab0497e9c27d85d1f6132a0806ed06f/
         arm |                      qwt-6.1.0 | TIM | http://autobuild.buildroot.net/results/09314f3a15b32759884d5be2c3e9972706c12728/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/538094a33e8eea2b3ba2f1da0938493cc5c1df5d/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/77dc458a96d54acaf2018ce270ea5b6ff14ac43e/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/a4aef7eee0990f2caaa00d673cb07fd9cafcfaaa/
     powerpc |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/a3c3333c776c91e2f37674bef0599f4c93c92fe2/
        i686 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/573dfbaa10c3a237e49be7af9d5e2a599ee073a9/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/190555fb0032336f2c24bebb5f2db4f87257ebed/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/7b9af04879940d31ba129cc241281a52706e7d2e/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/9d614e3b76acfb77404ede28b0b5c462dbb2f9dc/


-- 
http://autobuild.buildroot.net
