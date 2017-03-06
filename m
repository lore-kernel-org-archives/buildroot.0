From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Mar 2017 08:28:44 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-05
Message-ID: <20170306072844.3738B206EB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-05
================================

      successes : 173
       failures : 13 
       timeouts : 0  
          TOTAL : 186

Classification of failures by reason
====================================

                libepoxy-1.4.1 | 3 
                    putty-0.68 | 2 
               polarssl-1.2.19 | 1 
                    qemu-2.8.0 | 1 
                 qt5base-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.5 | 1 
                   slang-2.3.0 | 1 
vpnc-b1243d29e0c00312ead038... | 1 
    xserver_xorg-server-1.19.2 | 1 


Detail of failures
===================

         arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/48c35bac7cf674e2bc55f9bd53b905ad5e212258
        i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/e29a22a2d9c81c87d271c2a6e7d041d36c370adc
        sh4a |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6cc1212728248d5443fe9a367b4aeb3807ce623e
     powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/ab3565f6585e47573bcb62ef5e7250986c90d8e3
         arm |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/3ade64119e327cc810282c1bcd89a8e7d229a73f
         arm |                     putty-0.68 | NOK | http://autobuild.buildroot.net/results/3c26267f46f0653f2d40e03e5e4212e58e7ce177
        i686 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/5a685a307678bbcfd87c6f1bd44b5648b4d397f9
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/29aa34c4e3b10739a13db6d86b3f0691668480e9
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8ac322af1293eb195f2eab80bdfe1b87931948b6
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/2e214d6b2de1008858f4129e8000dd1202302117
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/256ffb34fa890bae23ff39783006e0741e2abc49
         arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/16a7c30f0627c51b171ec71b2e7f24444e38526d
         arm |     xserver_xorg-server-1.19.2 | NOK | http://autobuild.buildroot.net/results/4c24477f96c9eab8cfd8cce38eea630d738e29a5

-- 
http://autobuild.buildroot.net
