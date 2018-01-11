From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jan 2018 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-10
Message-ID: <20180111070006.9614020864@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-10
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 199 |  14 |   4 | 217 |
   2017.11.x |  20 |   2 |   0 |  22 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libostree-2017.15 | 3 
                    php-7.1.13 | 3 
                       unknown | 3 
                  boost-1.65.1 | 1 
               host-efl-1.20.6 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
         linux-headers-4.14.12 | 1 
make[2]: *** [test/CMakeFil... | 1 
                poppler-0.59.0 | 1 
          qt5xmlpatterns-5.9.3 | 1 
                  samba4-4.7.4 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/05552a7a84e2880c0da139ccf34d3f9cd60a2ffa |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/876a94d5400e52f503fc9ea057e94857568b42ea |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/48ca4b452c4c04d217f62c704a2fd281e60cf52e |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/78a259c110be1efe419f51f5f9b17de3ed492513 |     
   powerpc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/ed9527196367ba21459cf30366be163326fdad3a |     
   powerpc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/79124e5a48adeeac702e944da804cb7232cfe4fa |     
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/f8c709f5d950875d6e8a48b0c795c97238663369 |     
         arc |          linux-headers-4.14.12 | NOK | http://autobuild.buildroot.net/results/38282c3ba0783baff626db87e10fb91f8cffb123 | ORPH
         arm | make[2]: *** [test/CMakeFil... | TIM | http://autobuild.buildroot.net/results/854eae9857a96d437158ab510f5fef2658925e30 |     
    mips64el |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/46c6039e6ffe42c4ef25ec289133ee09c0da0ae1 | ORPH
microblazeel |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/cf4bc9af645b6cafd880a170a48cefe2bb9d2cde | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/2ddee93dc033849a4f79ae824ecafbfb433e86ac | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/2de74f912e66af0cf810c01aecf23ca32b31ba62 |     
        i586 |           qt5xmlpatterns-5.9.3 | NOK | http://autobuild.buildroot.net/results/fb7d04a50d8d3e00ed782ba2a0827a993d7c57c9 |     
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/8471728ec9f73bfd6b46681f2904af4b48cbdc98 | ORPH
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/8722c580b353f7e48fe694645613845b4b009215 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/251acb297cf058a0388ae0dda90d3c20cd8ab2f1 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/b11639ad94c8a29de19e80e11df001a7fd1fb9b0 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 
                 mesa3d-17.2.4 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/b7e2412e4ff988f7673a699c2b459619993c5d4e |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/28f1129079f905c781329a4809482fc6b35e5006 |     


-- 
http://autobuild.buildroot.net
