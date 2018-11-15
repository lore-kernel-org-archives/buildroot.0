From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-14
Message-ID: <20181115070028.760D7207BB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   1 |   0 |  24 |
   2018.08.x |  26 |   1 |   0 |  27 |
      master | 208 |  10 |   0 | 218 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              lua-curl-0.3.7-1 | 1 


Detail of failures
------------------

    mips64el |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/6815f67a8cc4ff39149b45ca9127652e5749f9e9 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.1 | 1 


Detail of failures
------------------

        i686 |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/2d7acfa37b23312bdcb69ca968f4f83ebec627a0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libv4l-1.16.1 | 2 
               valgrind-3.14.0 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
                libmpeg2-0.5.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                    xen-4.10.2 | 1 


Detail of failures
------------------

     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/75a5c2b6a34a7df4c8f8cd61226e67ca52b2c81f | ORPH
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/bdf619535e05940ba26ee85f49d106941381b039 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/987a15d8d0bc6b134cadf0414bacb56f96d9baf0 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2f19822f2255ffdc05706adebe1f3a449a2c995e | ORPH
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/3a9881ca6810bab7262fa65ee5755ab451ef4524 |     
    mips64el |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/9057c7d51a3b461a34f5d7d32e68fa5739a4a641 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/158438debb0ce313b012b871e199bed42ba38294 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/64e1d56c0fc7230c10d9a6301025968408a029d2 | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/cc37f7bb5a604544b5e47db308d017f219c50f99 | ORPH
     aarch64 |                     xen-4.10.2 | NOK | http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6 |     


-- 
http://autobuild.buildroot.net
