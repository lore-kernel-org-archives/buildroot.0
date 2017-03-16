From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Mar 2017 08:29:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-15
Message-ID: <20170316072914.90D0F207E3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-15
================================

      successes : 139
       failures : 15 
       timeouts : 0  
          TOTAL : 154

Classification of failures by reason
====================================

           uboot-tools-2017.03 | 6 
     docker-engine-v17.03.0-ce | 1 
                    git-2.12.0 | 1 
               libscrypt-v1.21 | 1 
          linux-headers-4.10.3 | 1 
                 mplayer-1.3.0 | 1 
                    qemu-2.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                     xen-4.7.1 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        i586 |      docker-engine-v17.03.0-ce | NOK | http://autobuild.buildroot.net/results/d5656289b64e743989ecde8af5c203601b709aa2
         arm |                     git-2.12.0 | NOK | http://autobuild.buildroot.net/results/94bce9a99a5ce9894a6918774ab75e23d12c1394
        mips |                libscrypt-v1.21 | NOK | http://autobuild.buildroot.net/results/ccfda9ef00b45254a4800ee02533d6485e73322e
microblazeel |           linux-headers-4.10.3 | NOK | http://autobuild.buildroot.net/results/a66328f9dda97c533ae6a5cef4fb6d3d36f24e14
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ab3d60ebde1e738333d3ac23c1193432308ea9ab
      mipsel |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/73887f1a5be253b967ce8023ab1dc57f5157e6df
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/09a5f9a70e011f6493225df8656063f7f585080a
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/b1138179f1430f722ce7379ab9d7e10a129bb305
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/439d6dacfaa7f9244bd15ca04990c12a25ff4777
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/95a101ca89f76c5866068f0142d6cebdde679968
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/1a35858fcbbb9545482b89d99fc7273c6bd14da2
        m68k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/067774168fad67351a31e35ea45a1f999ffeb94c
        m68k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/5d46155aabf569a4b4617d738bf9286e55f29e72
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/70fa1d8fdd350987514163d4187cc5e032cd77a2
         arm |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/e13357c2503336981d6045fe1aca08282f9b129b

-- 
http://autobuild.buildroot.net
