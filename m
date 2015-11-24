From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-23
Message-ID: <20151124073012.19317101E05@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-23
===============================

        success : 77 
       failures : 28 
       timeouts : 0  
          TOTAL : 105

Classification of failures by reason
====================================

                busybox-1.24.1 | 4 
                    gmp-6.0.0a | 3 
             lttng-tools-2.6.0 | 2 
                openntpd-5.7p4 | 2 
           libfreeimage-3.17.0 | 2 
             util-linux-2.27.1 | 2 
                   jimtcl-0.75 | 1 
                   glog-v0.3.4 | 1 
                   mplayer-1.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
         qt5connectivity-5.5.0 | 1 
                  autossh-1.4e | 1 
               arptables-0.0.4 | 1 
                libgsasl-1.8.0 | 1 
                   systemd-227 | 1 
       openpgm-release-5-2-122 | 1 
                   msmtp-1.6.2 | 1 

Detail of failures
===================

      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/716e81f49f8894b7248f394919c8f22efb908277/
       nios2 |                   autossh-1.4e | NOK | http://autobuild.buildroot.net/results/fcede62abe47e5c6b674ddc6691506dc97cc5a42/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/3c547fac82919bc303f7eead2c340ac57a44eec7/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/2337448d4acf560584b582a66d6e0ee6493d8b14/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/ff8e5877b778babf8373930c3595c98434d6fca8/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/eeba99bdb4001ce7aa5d749c4ea93d763fcf5293/
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/820dbf441ecb3a91b1b936bd0bf39ed83148c69a/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/db0babfa7319a9148640758e0632167037343e12/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/d0686b3e7b8884f93034d4ea4b79fa8590ffa221/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/e41bdf620e101ef294fcadbddc4ba324ca2d44b9/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/a898d0284acb5bb1fef015f5b2575d1bab48b6d6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9274bc28c540938ae9563d6afb8e79bb82ab03cc/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/0fe2d7384f1b4d162fdfde4b1ba4dad1fe5bcdae/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0cb2f0c69301c7a85a354c435da245cd904533fb/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/52c2967015aa79843db05e901a1563447a4029b2/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/df75c6ee9bb7c2b4c7ca3c46922116623cc71c49/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/b78cf56568e600273235dfa2e52044a02d517bfd/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d55798e30b40ea717a742a8621b57bf21ba394a8/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d6030fe8fd6cedb2b2a7b8b4296f072d6301fa1e/
         arm |                    msmtp-1.6.2 | NOK | http://autobuild.buildroot.net/results/e82eced45fc9628dfe404caa56d1e7401c2b522c/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/9013241676f08c96b1c09caee634029a265b07b0/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/9da6bdec21e93c1d1cfff045531b22edf9baf4c3/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b2dc2914d55f71b3817fdc03afe922ba1d21df28/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/e0609db8ce1e3a3411f34c0716ced2e2da9940fe/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/c0517f5a1365bf80291e480c273767b0ada5e74b/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/dd7b7f5cb6fdd29d0d3010a66440e6e5af0535ae/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/8c8e2e6bce4c15c0538fab659316d118cab6197b/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/3fe1219694778333ee863f6752e829a711f74c3e/


-- 
http://autobuild.buildroot.net
