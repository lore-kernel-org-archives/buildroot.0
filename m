From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Mar 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-04
Message-ID: <20180305070015.C1E332071B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-04
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 197 |  14 |   0 | 211 |
   2017.11.x |  28 |   1 |   0 |  29 |
        next |  51 |  23 |   0 |  74 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.3 | 4 
                 mesa3d-17.3.6 | 2 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
           cups-filters-1.17.9 | 1 
         libcpprestsdk-v2.10.1 | 1 
              lynx-2.8.9dev.16 | 1 
                 mplayer-1.3.0 | 1 
                      qt-4.8.7 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/baeaef6375d001b9ddd12d0cfef40c41a8c71b4a |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7b37327d6c5cfb851a8cf510dd7aa7b36e298505 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/16d330a18178b82d31688ad725589ca58596a311 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/dfcae2610656798c0a29d5ee8fa541b91b89d2ff |     
     powerpc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/3329896e974c6db445e86fc90cc226459d8677e7 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/250f9508edc604b34e3e7eec1414f7af06d75020 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/30ed034b2d983e86e50b3b9ed3fd4c5b9483fc7e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5942fcad1df462910ce818b51f5dfb2f21ca5634 |     
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/ffe1cfe0d775d7612edf7a305bafce6cd206ce64 | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/8f92b1808dc69069e9cdc4aefc5eb91d8c8789ff | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/6f938a9f4a42e530e39c210b2954073027e31bc4 | ORPH
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/f8dc4dc4cf457688ac4f7c356b1e81be73595f63 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/85003c2483c42a1f78ab150076f0308de0e0f919 | ORPH
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d5648a677fb0339ed875a714e9af6c5fa72d8e5b |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/80bdce5cee0d977048d25c1cf3009f1c4961e9e4 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 4 
                     php-7.2.2 | 3 
                    htop-2.1.0 | 2 
              keepalived-1.4.1 | 2 
                nftables-0.8.1 | 2 
                      qt-4.8.7 | 2 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
                  host-go-1.10 | 1 
                iptables-1.6.2 | 1 
               lightning-2.1.0 | 1 
                 mplayer-1.3.0 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/438f25b00fab6c0f035e4db8f166fd2e1b1742ef |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5671804a0263eb286bc45b300225a6f19d6c9d8d |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4e5c3cae9af66f65df4bb3ac8ee264ae7f405595 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/608a37806524577b2656edfd24c107fe7ea9f5b2 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e95654420721023c916dd8a81d976552dbad2400 |     
        i686 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/379c6e5c337f9133e9c141d1e7b18f958e9c8852 |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/a928336dbcf32e2d48946de47382aeeac190cf2f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8012527edfaebbc44eb16df4af5e367209398c8d | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/0f936b53b73e07252ce30f5c8244724411a9b300 | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/15e1bd455cb7035798b2d716143db02e61560f63 | ORPH
microblazeel |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/30c415139bfd62ab1d6d9d95ef8967d97dc46163 | ORPH
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7e039c49ac675e0e1669f58671a59ab85aa45b9b |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/0a1d8ac006e8cb05425b6494be79a90fbba346bb |     
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/4b7dfcf47793f5d49f1583fdcd785d8552e1d0a0 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2f0e4fb6a2202e5034a941fd6d4595d1377808e9 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/421faf573c7f5478fb5152d7b4db30f12b428a14 | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/c08f44a9971cbdd83387015db0dd3d3eb6de9aaa | ORPH
        i686 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/2a5c663e883145a42a345749bcd6287184a671ff | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4c03201da551b905a4aad4ff592bf1b29529b443 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e58c59964de51cf119504e9cd3399408ab655915 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2dbf7f6ffee8354db1c9587a5abbe7fc44775924 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b3935c0dee99eff4f90d795fb7ee6bdc1e291fc7 | ORPH
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/5d847480196f5abe6418751e070274944fa41a41 |     


-- 
http://autobuild.buildroot.net
