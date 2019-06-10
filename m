From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Jun 2019 06:00:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-09
Message-ID: <20190610060100.20A598578C@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   1 |   0 |  19 |
   2019.05.x |  13 |   2 |   0 |  15 |
      master | 181 |  35 |   4 | 220 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-cargo-0.26.0 | 1 
                  weston-6.0.0 | 1 


Detail of failures
------------------

     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/017854ca4cce8c0e4f7b41b407e44cb91e8b09a0 |     
         arm |                   weston-6.0.0 | NOK | http://autobuild.buildroot.net/results/210c2759900f15ea0030d088f6f45cd8bb199b29 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

libwebsock-3c1615eeadb0b582... | 19
             iputils-s20190515 | 4 
                   cups-2.2.10 | 2 
                    host-clang | 2 
    host-mender-artifact-3.0.0 | 2 
/home/buildroot/autobuild/i... | 1 
                    efl-1.22.2 | 1 
                   gpsd-3.18.1 | 1 
             host-cargo-0.26.0 | 1 
                host-libsodium | 1 
libcamera-ab0188fc8bbb6f397... | 1 
                    ncmpc-0.34 | 1 
             openjdk-jdk-12+33 | 1 
                         snort | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

     riscv32 | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/52117d382cd3c36d3ff0fcab9977b5043eb75977 |     
     riscv32 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/8cf9e7613ff2d0de55a372f3481a7c1ec7d0fde5 |     
     riscv64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/840e4876666ceab55eb43c30e1e8970720699dd9 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/1f2dc17ee59346ed1e47b0bcb77c57cb70abfc9d |     
        i686 |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666 | ORPH
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/a5129a0500e3cc83e846b72d6e99abe547f3bacd |     
         arm |                     host-clang | TIM | http://autobuild.buildroot.net/results/cc4c3877bfc1d612d74364ab31713e350fe88e59 |     
     aarch64 |                     host-clang | TIM | http://autobuild.buildroot.net/results/6da051e95db59a040664fa99c3f15e6c039d3e17 |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/f58e6718ee601989d9036681937372b67564871a |     
      x86_64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/171fd55be5eb37c8f594bbaf1ee603e1fa19ad15 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/6c320bc2b9733a761af7cffbab265b6f01b29f05 |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/025ade1df46e2c9af2edcb38be693a13c8021f2b |     
      x86_64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/5bb4dc971c40fa610666c0d60840baacb5cbbec6 |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/51cc06cdc744bce7a2f81ec67e4034ddce1e9ff6 |     
      x86_64 | libcamera-ab0188fc8bbb6f397... | NOK | http://autobuild.buildroot.net/results/a477fe1617c59f595515361a5718fac3d24231a8 |     
    mips64el | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/31972c3909c07b0333d21902373f30ee42f69ca1 |     
     powerpc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3dca09a4cfc1d31a0476ab54348b60c3bd669410 |     
        or1k | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/37bdf1095bdcfc8814260b65d9aa5b1e7ddd0f3f |     
    mips64el | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/d46c8d0a78f341a6e81857a4c9455dbceaf4db34 |     
      xtensa | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/dac66f3421e46c349de041562105879f6f5f8a06 |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/739c880eb1d40de980b2ab1fef810e6bbc41dcd4 |     
         sh4 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/49f1c487140ce685f8a84d414f6edc9a916adba9 |     
     powerpc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/f5492f93ba41f0590ec944b7918c237d6e281aec |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/d56fda063e6c72f613f9370e6d138f5e68cab3d2 |     
     aarch64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/0d173c75f2786457a0ea0e9f0e669cb15fef49e9 |     
      mipsel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/ef66a2a16a3a8ec7905212bede8a462a7570227b |     
     riscv64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/2fac2c5ee0aefb4b51d4c03f8b1f79a28a6956f5 |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/510f385745d9fbd0e4a891d203e5f475b23fe273 |     
     aarch64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/afb0dd4d36c602602ebea45b5df6ce3b8dbd665e |     
microblazeel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/e55580e1d6972181d26787bc5b6e9ee2fb1ed91a |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3f060bf085c4387a89e9e412ed36957c23b66b2f |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3ff1157d4333e5cf600c07aec6ec51d12f8edb94 |     
      xtensa | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/606188f724c01bb21e77c64e5fc91d4ec584a854 |     
    mips64el | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/ca5b1b3311cc7cff654d54da0379814ecda0f33b |     
        i586 |                     ncmpc-0.34 | NOK | http://autobuild.buildroot.net/results/0ab0a42fd4c5c9fd5891f3b84287bd788f763ba4 |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/84c26abfe6af48643042f77ce3440d7895cc19fe |     
microblazeel |                          snort | TIM | http://autobuild.buildroot.net/results/0bd0dfd217a7eabbdc3985f41ffa578c624996a9 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/1c8805f123e47617dab115efb7ae3cf15a11c22e |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/f9a78f85a7957029d7b6709bd0386f8964a5a769 |     


-- 
http://autobuild.buildroot.net
