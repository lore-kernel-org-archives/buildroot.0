From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Mar 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-02
Message-ID: <20140303073010.B46B51015B7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-02
===============================

        success : 90 
       failures : 27 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

              host-scons-2.3.0 | 3 
  toolchain-external-undefined | 3 
                    parted-3.1 | 3 
                       kmod-16 | 2 
                    crda-1.1.3 | 2 
czmq-b5730c5f8290a611fd3b92... | 2 
                 lvm2-2.02.103 | 2 
                   lftp-4.4.15 | 1 
                    gpm-1.20.7 | 1 
                   systemd-207 | 1 
                libnftnl-1.0.0 | 1 
make: *** [systemd-legal-in... | 1 
                    fbgrab-1.2 | 1 
          sane-backends-1.0.22 | 1 
                     wget-1.15 | 1 
libwebsockets-v1.22-chrome2... | 1 
                     eudev-1.3 | 1 

Detail of failures
===================

    mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a1e53d66d3962fd5431e7601937b071a0a3c2084/
    x86_64 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b363c63b5dda7d55c3bd4c6aedc10666471113ad/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/8f8b479ac11ed35a7b20d94567bb446044dd02d4/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/ba626190b8019a73ecce74b1eb07eed4ec79ae56/
    x86_64 |                      eudev-1.3 | NOK | http://autobuild.buildroot.net/results/3a0238bd1170f2e7d1257e4756553f6e2f4a1268/
    x86_64 |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/9e079632a6c0556c96ec8ed7564286aa84044bf7/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/e99afadca6de92aad8563006fc7219aa32d77a88/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/11e6c8c8d79d56ed43daf52e6d6dc80847709926/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d75722fe096fc1ddbf62a51207b44b3cdbb6fed8/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/09a7de5ef086005b2f003ccd58ee1dae268c26a1/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/9fb1a008e5fa13425ab9fba0d497cf877ef90457/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/97d4c96d6f6cdc1ed4007456f4ab70be9dfa41b5/
      bfin |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/321a6eedd2c79ce45c047cd8ebddb67124da092c/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/568d7fd5a6e6cd8a8e23184d7f977ce812b887fd/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/97e21513dba6aae5b2e2721c9218589dbc75d702/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b780582f8a1f3ac9886d4b23375d8a6a704d25a2/
      i686 |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/a2e39cb626143c2d029ea3687891eab68ca0bde3/
  mips64el | make: *** [systemd-legal-in... | NOK | http://autobuild.buildroot.net/results/e6c4dc22c014e62ce35273945a2a2307315ec3f7/
    x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/dc0592af4930b3631cc82bd0f510ee23466b3723/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/e9a576e2154f56c2f6b0f9ec017f04e085557a52/
       sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/650960214be2b00ca7f028e31a36d74f3917454c/
      bfin |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5efcb8d898df0e798cc19eaf28a670356fc4e049/
microblaze |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/91010b43e63b82e050046b8f10c2c42f31a8a620/
      i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/accfb42f28c4701207df412eb6059a34997b02dd/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e11e28c29808202363961dfca01e9c19f5fb3eaf/
      i686 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0494eff48f4b55fef42f0713668dd2ac83822043/
    xtensa |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/bc20297dad0f0e9b7fa79fe835b9754fbce6dfdf/


-- 
http://autobuild.buildroot.net
