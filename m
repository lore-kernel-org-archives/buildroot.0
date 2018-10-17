From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-16
Message-ID: <20181017060020.7AE2E208B5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   2 |   0 |  25 |
   2018.08.x |  21 |   0 |   0 |  21 |
      master | 167 |  26 |   0 | 193 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/b2da1009965de7c2f8c42d4001c526e89450f182 |     
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ab80a44bc450b7a905dfe4aa22c257e470eb4ef8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-3.0.4 | 6 
mjpg-streamer-f387bb44e6c08... | 4 
                   luvi-v2.8.0 | 2 
               boa-0.94.14rc21 | 1 
                  cc-tool-0.26 | 1 
      docker-containerd-v1.1.3 | 1 
               domoticz-4.9700 | 1 
                 minizip-2.5.3 | 1 
package/qt5/qt5x11extras/qt... | 1 
                poppler-0.59.0 | 1 
               python-py-1.7.0 | 1 
                   qemu-2.12.1 | 1 
                qt5base-5.11.2 | 1 
                 qt5base-5.6.3 | 1 
              traceroute-2.1.0 | 1 
           uboot-tools-2018.07 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/95404c4dd028248a3906bc8e39a0a54b757130c0 | ORPH
      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/40e9d3ad7090778e2e3cadddde81ac838e1b37fc |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/7a71a32dc7764ed68a1a6154f577ddc9657f7eeb |     
     powerpc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/d3932fad8378111bd6f9d68a32ad1ee8e6cc67d2 |     
        i686 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/e199bec884f6d8d144b4c37d54bdfa419c5a67b1 |     
     powerpc |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/b7b9fa668285f1470fecddf6d6ad185786df7cb5 |     
         arm |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/e34f44d507c215027710de57fbc6bd1db6ff6dba |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/c096058aef0315af3f1484bff6d8297416f6eeb8 |     
         arm | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/ef19ef0f08c8debf6077c2c2089a7f15ed5fb30e |     
         arm | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/46e882b6a63877fb201c89c7ebaa695e0df2872c |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/2d8c191c59b92a59f74b215afa23d2b1170349be |     
    mips64el | package/qt5/qt5x11extras/qt... | NOK | http://autobuild.buildroot.net/results/238bb74f23d7a11516eac088da3188d463abac5a |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/de1411a8979e6798e1b5e5cde23fb186d75542cb |     
        i686 |                python-py-1.7.0 | NOK | http://autobuild.buildroot.net/results/cde7ea2fc256ff9f1f6b8d887b26543b998d7186 |     
   powerpc64 |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/e72d66f1208cec391bfc70f23c0b3d26f6331978 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/9db2d5fc5182dd03a0ddd21e13da23a5f259ebcd |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/82b0e7002711048a94cb80c80c4a19ae3ce2eec6 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/dde63672e1de1d4ba036331ab127ccc8ff044444 |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/b37951e9c652ddb9792230a717c928db64fd621f |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/6877dd204dd69f6248879fddaf28417a3e043c55 |     
      x86_64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/ad26d7c1699d78c8b0fe59fe258aa2346778a6b6 |     
     sparc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/da7855a511ab3b1e5fedcb727d5b21e80dbf11e4 |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/e759526c59ba1fe87358d47e92aac50245dca847 |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/d7d363d0b0c8b19c4f4319aae4f7810c003d3ed0 |     
  aarch64_be |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/f2486ccc3d1da8fd01c29fd5e9f2371ef112ebc2 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/4a7f8a7a888830f12739ddeb235657843609060e |     


-- 
http://autobuild.buildroot.net
