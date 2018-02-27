From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 08:00:41 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-26
Message-ID: <20180227070041.6FA3F20883@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-26
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 116 |  18 |   0 | 134 |
   2017.11.x |  14 |   0 |   0 |  14 |
        next |  35 |  15 |   0 |  50 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 5 
               host-efl-1.20.6 | 2 
              host-erlang-20.0 | 2 
tvheadend-e06ffd87beff16103... | 2 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
           host-mono-5.4.0.201 | 1 
                   pcre2-10.30 | 1 
                 rings-1.3.0-1 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/88cbcb36dd2e1edd93295fb28463650bd9f0bb1d |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/44b5cbc515035902fd1e058eb1ebc1f89131388b |     
        i686 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/0022ee4e56ede063051addeb35905ef671f7b237 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/a3c34338de29c09f003e707c5ac9e73112e2f83e |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/748c8861bd174fffbe9a29a18c46dcb53d9c6253 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/cf06bac7fce3f52e6b3c33432637e854eb1204ff |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/ad9fc1f8a598d2c1ee7e6f8884f897f7b8bbb657 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/1f6a45df5cb80e3fd94d57163bd28a0014a02bf4 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d85096780ec22e379447cab72629514c444f53de | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/35cbed8927bb10500ecf2816aa728ea240a0be21 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/ef040cc45bb2789ead82a8c445db3376e36b5ac7 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c16a198ad1ee8df16864b748d17609611ac416e6 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/0e13eeb2d786379b9f4f5137d92a665dcccf4a9a | ORPH
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/5f4ccd0d0da75141a32f6808324c1446d01ae766 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/62bad324e29aba0c7be2b58cbe0f0628fb31e86c |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/9879b984ee401803cfb041a81ad0471af18a4df6 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/b9ee5588bd0176546d2e709871b750da0cdbe02d |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/85475885a95f23f3dbc88e5b162108a458233bc4 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              keepalived-1.4.1 | 4 
                  boost-1.66.0 | 2 
                     php-7.2.2 | 2 
                   exim-4.89.1 | 1 
                    htop-2.1.0 | 1 
                iptables-1.6.2 | 1 
                    liblo-0.29 | 1 
               lightning-2.1.0 | 1 
                nftables-0.8.1 | 1 
open-plc-utils-1be781d1ea81... | 1 


Detail of failures
------------------

        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/c2c11bcf080c9b2beeef133a3e06f7ba1bc0864e |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/0a272a4d44aef90ce8b141514e774e19125f2bac |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/16f1223482a8f4640fddd21c9211d123b8c426ce |     
        i586 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e1c6ba9c83daef8ec972062fa67733fee445edbe | ORPH
         arc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/79aab3bc1ad02bd7a04120439ada3eb83787136b | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/32c0762c8ba34256175184bcbae926cd99768aab |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b3cba4446f852ee0470434d6da005933a45db3b6 |     
     powerpc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f545001b4ffe8ab6cf2771b549523649e9ffd9f5 |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/6b08960281fbe34932eea33221e27bf71ad80bea |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/ab99d29bb02a641195a9bb6b38ca56fbecf385ba | ORPH
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/ea5b0425643bc893f2fe48a4f73b39e78902dda5 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/9af64da8e7bb7d086c129e34977ca5755895b0a8 | ORPH
         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/771050260b3f47f20e0a76829829bbfd41d793ab |     
        bfin |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/17ebaea925be9b6a24ee09404347699f495ec248 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e6a6a54359a14676e4e57f9a1b7180551de0ee5f | ORPH


-- 
http://autobuild.buildroot.net
