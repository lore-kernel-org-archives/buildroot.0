From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Mar 2018 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-05
Message-ID: <20180306070011.40DAE20722@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-05
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 150 |  12 |   0 | 162 |
   2017.11.x |  15 |   2 |   0 |  17 |
        next |  39 |  15 |   0 |  54 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 2 
                     php-7.2.3 | 2 
                  cc-tool-0.26 | 1 
                    htop-2.1.0 | 1 
                iptables-1.6.2 | 1 
              keepalived-1.4.1 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-17.3.6 | 1 
               qt5webkit-5.9.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2117de369f73a885317f8145f35c81666ab2705f |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ca0d6c9ee60a867a49487b7f286486786aaf74da |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c7f28bd03a051f90bff1decff919b42ff5e8a1ef |     
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2f7d98ebb6a86a8c736f09858b548f7c3a90e65d | ORPH
       sparc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/94e7d648fd4884d80b17670d2ffb0b4bd6265a2c | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/8ed24903e1c9b7025785a0b179d7f5a0a190e52b |     
microblazeel |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/decf7812ce35f80ce08a86894a4deb372e3d73d9 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/0e1a8dc02b1f982c1ddf7d4979eff770d7f59cb1 |     
        m68k |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/4e5a8da40678b7797342ed5716b42f84495ad9a5 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/18fd2df026c8b893ba0e2ea089dda7cac27def1c | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/9026d0fa29d97166ee353e7725fe50f56cc4d5f2 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/33d401c0e9591dc92e14176e79a1b1d805adcfd4 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 
                   pcre2-10.30 | 1 


Detail of failures
------------------

         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ba1eb3b0c83ccf870adaf501ad405c46cc9fb070 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/d01135c6038113055bd9830f4d67eac1208ab407 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              keepalived-1.4.1 | 4 
                     php-7.2.2 | 2 
                  udftools-2.0 | 2 
                  cc-tool-0.26 | 1 
                iptables-1.6.2 | 1 
         libcpprestsdk-v2.10.1 | 1 
               lightning-2.1.0 | 1 
                nftables-0.8.1 | 1 
             qt5location-5.6.3 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c225b461bc2249fa1e8eff4bcd2309ef3ec777d5 |     
     sparc64 |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/68dce91171a689e521985763d6dcabd47a5df66f | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f3e9fa3414ee3519b9e307f6185e3580b2eea15d |     
      xtensa |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f2b6dd1ce5202722bb03db095c02b630f510e85f |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4c64bd97833161f957b4f69044e6ba2f762502a3 |     
         arm |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/56eb3dbf7b9bcc199ed6afa370be555706f21242 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/14330ca04a8f8c37524018e21ce675ce171bad3f |     
      x86_64 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/586f3f65ce84fdc0c8584d0e36345cae107a73fa |     
     powerpc |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/79278943933225a86dc7a1aab25d2e1f76d1b062 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/177680bcbbc5f642e7c46ad26e56ec854ae015db | ORPH
        bfin |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8c81d5b284ccddbac28422fc8930c485e9eac00f | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/669b3962f291d62dc22d18091c8dafd1726fe810 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b8329b52ad05070162931ad56b4df05ec3dea446 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/6a4190f36ee92d4cda6a776985815354aee30608 |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/2cd5110e969931b533fd8af1f878eae27da3f863 |     


-- 
http://autobuild.buildroot.net
