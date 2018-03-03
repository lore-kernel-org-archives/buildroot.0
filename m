From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Mar 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-02
Message-ID: <20180303070007.5CB4D20881@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-02
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 123 |   5 |   0 | 128 |
   2017.11.x |  14 |   1 |   0 |  15 |
        next |  32 |  12 |   0 |  44 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 3 
                  ffmpeg-3.4.2 | 1 
              mosquitto-1.4.15 | 1 


Detail of failures
------------------

       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/7c1ebf5bd9aeb176b3612d22eaee86b0247a28a8 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/35b24bfc26db917e09f8ab2ce2387dbd95220f6a |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/4f63b78fa04ff911319d4970ce02b091f350a19f |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/4c77c15eaa2e44d0854cf24ab872e7b2ef83ebd6 |     
    mips64el |               mosquitto-1.4.15 | NOK | http://autobuild.buildroot.net/results/d693f3e3f1c73ccf54ac7076623e436355a9d901 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

           host-mono-5.4.0.201 | 1 


Detail of failures
------------------

         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/ba42743d7e17c78c72733bd56da1cdf0d71d152c |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
              host-erlang-20.0 | 1 
                    htop-2.1.0 | 1 
                iptables-1.6.2 | 1 
                    liblo-0.29 | 1 
               lightning-2.1.0 | 1 
                     php-7.2.2 | 1 
           python-numpy-1.13.3 | 1 
                    sdl2-2.0.7 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/a549b62fbf03474ffd8586869637d083de275091 |     
 powerpc64le |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/0db48acdf4d7f4a54d326a0c5325c908a401e288 |     
        i586 |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/c233ade479d6124ed7b382f2aa9859fe509d7bca | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/25e214b520b95c23d8f8f2293b08f2732c2eed95 |     
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/301139591f8cd03de896eb8567a4ecccb2b9098e | ORPH
         arc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/d6b711e3f4cfa68f8c863370cf95f1ca0c5d380f | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b556166cf2023c4275f9c8510320d75ae088589d | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/f5435797f2b09035e889384fa9a6d3e535255914 |     
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/72ee2a468eef0abafe57eeb56e4fe2dc2a28aedd | ORPH
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/5d29b996c61cc5b04bba6d9e8ad896b451e19b63 |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/7635ee0d439405c68e8e0a89075bba0b64281446 |     
    mips64el |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/61c814565907be724f865772ff38d0660246745a | ORPH


-- 
http://autobuild.buildroot.net
