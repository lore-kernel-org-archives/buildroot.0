From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Mar 2018 08:00:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-12
Message-ID: <20180313070016.669A8207E5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   2 |   0 |  25 |
      master | 180 |  47 |   0 | 227 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               asterisk-14.7.6 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/bef2af314d66557500283da48dd58333b64129ba |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/7e9945f46ef9e0f6de7e1c85b0ca1104df6c86f5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 17
                  host-go-1.10 | 10
                    liblo-0.29 | 5 
             bluez5_utils-5.48 | 2 
                  cc-tool-0.26 | 2 
              keepalived-1.4.1 | 2 
                     php-7.2.3 | 2 
                busybox-1.28.1 | 1 
                   exim-4.89.1 | 1 
             libmpdclient-2.14 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                  udftools-2.0 | 1 
              wireshark-2.2.12 | 1 
                   ympd-v1.3.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2826cdf2db1693151535954d58a1036d66a427c1 |     
        m68k |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ef2eb3dd231e4c6297adc2f7307feb5d85acd2f0 |     
         arm |                 busybox-1.28.1 | NOK | http://autobuild.buildroot.net/results/abdfc596ba784d8022bb3ee59be757d78523536d |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2e477615430e0e9c66b6484b7bd7d486a2b32542 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fc7b7a7601e505cae807c7b7b50478b0783ab585 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/054eb702a9b8c66454970333ef45a0afccb7cc80 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b6f391d0eff73f00288394d50159b6b07b70808f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/04c829391d6679fe584d9e35ef010aa8c338544a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2552b55d5d04028e75c90f4ca3acea92d0cba2c9 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/479f2d2e351e2cab1f89f0e07c05103cb5449f08 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e65ce8868490a2c65d3bb7b6531c202179328c0c | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/757d104d2f727fa365fa115215e918f0e9a43784 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c372d242d7f9dee2860adb49595e69ebbb6c3daa | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/06fb9b5942bc079441373e64ca7a63dbd7163177 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/329a86811b58877e2cf9540fc555e215c7260b85 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e7b5fc5270900db6ab52e21d85f38795d0e1c593 | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/3eab104f9dc77646e935dc8d861eb65208664d85 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d47fccb4af7c83c691b17fad534f6784a98c0191 | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2574dcb8fd7fe4b95d79b1af6f0981a57627a018 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/55e9b96fb41bf87bf82c562712d929f4ff3cdbd7 | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b19af632a7f3c6cac143fc8d192955bac7d3b10e | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/55c239404b8475bd2358aaee3d4269a87b636326 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/258e51b9e8ca9ec5939c183484c83a888fa1f9de | ORPH
        mips |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e81a6f8ccede7955c9bba80745d614013a44d50a | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/34525d694e58dd6ba969310b84b525d42e55b34a | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b27258de90ab5449751febaee8f5d952b2117b61 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d0e18415e22406b83df641259432f369096c808f | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f10e57b42aae67e724660c014785dc4df3f20591 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5cd95cd9e92e91d7a543b1bd836e589b0dbf4481 | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/09404d21382a511d4e2cf3a6335b4f99cc95a0e1 | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a97e1a1010b032cd2d797caf4575ce1a6dc03294 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/9e8a0e0dc804bf416636f0f76885164e2092cde8 | ORPH
         sh4 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f5a8126763021fa4675a0a5e1ad23a301d9b81ad | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/5c7a7495f196907316f6b741ae1293b033f5f119 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b2ed9c129fa7f006ecfc8c75744be28cb002899a |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/670dc8be48f470baa4312dc81afbca40ed57e554 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f4b7f576d8ce952f28d8974541d6ed8bdada4bfd | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/c5d052b283bf675e78f908f1ce13004c106e339f | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/af30ab838bd6717dca7cd2c1ce67011c5f854f71 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1afc9bea75fb441510e0de52088cf1e385b26d41 | ORPH
        or1k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/f98f1a987c9f7a97249268eeac616201eab5dcc2 |     
      mipsel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/e1baacb4018fcd0e841da390f91373971c381040 | ORPH
         sh4 |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/0ef1a304535b52f7dcb32311980b7924ac27eabd | ORPH
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/782652193bb6770ae68d509b3a7087667622d627 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/87c3ce9a2bf5c34ed477968fbf978ec728501dde |     
         arm |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/4b5ea341246d635dfb918ff75ded53425ad69156 | ORPH
        i586 |                    ympd-v1.3.0 | NOK | http://autobuild.buildroot.net/results/0b0913e2f74c46cb46514a2cfefcdf9e39589e16 |     


-- 
http://autobuild.buildroot.net
