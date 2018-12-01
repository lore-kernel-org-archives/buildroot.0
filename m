From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Dec 2018 08:00:46 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-30
Message-ID: <20181201070046.1EF6120D0D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.08.x |  25 |   0 |   0 |  25 |
      master | 199 |   3 |   0 | 202 |
        next |  20 |  20 |   0 |  40 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 


Detail of failures
------------------

         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/80ef0d8315c7b7e630b3996491cee13c8b8fffe2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
              libostree-2018.9 | 1 
         mono-gtksharp3-2.99.3 | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a2aabacbb97eb6b9610b41b8318385f1164e8bfe |     
        mips |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/6fa333bab75ac5f76ba963115b6e42021db91fd5 |     
      x86_64 |          mono-gtksharp3-2.99.3 | NOK | http://autobuild.buildroot.net/results/24ad3f01fa4b80e6973ac638e87bbcb81d44322f |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             fontconfig-2.13.1 | 3 
               util-linux-2.33 | 3 
                apr-util-1.6.1 | 2 
                civetweb-v1.11 | 2 
               libiscsi-1.18.0 | 2 
                libxslt-1.1.32 | 2 
              tpm2-abrmd-2.0.3 | 2 
                   dante-1.4.1 | 1 
               dvdauthor-0.7.2 | 1 
                  grpc-v1.16.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

     aarch64 |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/d266588599804fd4dd3721071bb131b0c316f5fe |     
    mips64el |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/5f372d2943bee4f3b0f8a6bd3ef2788dba2d1ba0 |     
         arc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/59a6e6792b37873acde7f12c33383c2bb96bc10d |     
    mips64el |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/8c68ec52b3c6f897098fc03a7f81a04f474fa9e8 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/0e79b7db36c719a2ecd9d29543436b2bcc238058 |     
    mips64el |                dvdauthor-0.7.2 | NOK | http://autobuild.buildroot.net/results/9b99d558e8d03155e33a46bde6adf7fdafee964c |     
    mips64el |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/49fa1d2da97be979cbc2cb4f83b40f5c2ad8c764 | ORPH
        m68k |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/07475de20b1c19bfbbc58c64eb893801086be948 | ORPH
         arm |              fontconfig-2.13.1 | NOK | http://autobuild.buildroot.net/results/3c186499cf6d563038870f6e171cef02e23226b4 | ORPH
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ffbbcef4636387eada664864b9b3687964fbcf79 |     
        i686 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/3f2934612502cb61b0a7c2057803ebe3b89987ea |     
       nios2 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/21d8aacff9ce5705229ed5d661d924f15ffb1bcb |     
      x86_64 |                 libxslt-1.1.32 | NOK | http://autobuild.buildroot.net/results/531cb5f89dd9cd4edc0899f9d136b4b49f61de5c |     
microblazeel |                 libxslt-1.1.32 | NOK | http://autobuild.buildroot.net/results/0ba4065a906c88115ff3676c2bd228a186ea5299 |     
        m68k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/1228a5f3bec857d81860c8ec742f5f2f69c5d443 |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ebc5db4a22c19ef822a9fd37c20107dde2af5797 |     
         arc | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/58e06498e4e6466337ab2e1e207cc8af227bc5c5 |     
     riscv64 |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/d1fb9edb63c60d5b7e84c6e39f35ec0e9178a899 |     
    mips64el |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/0d2741e80a32f0495d8d7d23e3a13ba0aafe756a |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/1025981e6c34e2dfbeefbd8783776df7dffb1a41 |     


-- 
http://autobuild.buildroot.net
