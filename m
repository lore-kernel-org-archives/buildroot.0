From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 08:00:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-28
Message-ID: <20181129070028.0EFA720741@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
   2018.08.x |  19 |   0 |   0 |  19 |
      master | 200 |   7 |   0 | 207 |
        next |  24 |  11 |   0 |  35 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               valgrind-3.14.0 | 2 
               domoticz-4.9700 | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.9 | 1 
             qt5location-5.6.3 | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/8e82501a7b49da628ec026132ffca44c0c813040 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0cfb9881f994ecfa9f817218d86df8a8d81a8afe | ORPH
   powerpc64 |               libostree-2018.9 | NOK | http://autobuild.buildroot.net/results/4c909a85e23572fd97b5ea1df62a28ca27408897 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/91d6c0df47d12d5eedf4a2413d23bf98e8506326 |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/f0253d1ed11021d3e5914a5161360de3ef3d1641 | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/87354de3d8ec079792f07b6840ca708dc13e5cf6 | ORPH
     sparc64 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/1a21415f93b0e4ee4ae041b9b42ab4ae28f70437 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    php-7.2.12 | 2 
                 setools-4.1.1 | 2 
               asterisk-14.7.8 | 1 
                civetweb-v1.11 | 1 
                  linuxptp-2.0 | 1 
                     nut-2.7.4 | 1 
               pulseview-0.4.1 | 1 
                  quagga-1.1.1 | 1 
                   strace-4.23 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.8 | NOK | http://autobuild.buildroot.net/results/11449ab92ea2843c2f287cc7e0997d16f047af72 |     
         arc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/7a189f49c5a8b6f7b3d4c57cda5982adc65dbc19 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/4f53c0b6f3395f4d1ec0aa58f9df36c8145b1066 |     
      xtensa |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/eea704463c3f14dbb9bd7f8aa23d4b61c25987f4 |     
      xtensa |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/ddf03b43691df42a7a74bda629694b33b52fee44 | ORPH
   powerpc64 |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/5d22ee40a7e08164c2fcb17ec116d7b413fdecd3 | ORPH
microblazeel |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/41437e1fe427ccc55e9e5d7a8d114b8665df0a5d |     
      xtensa |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/06dbe57ab70c532c07a56208d2e8268d9822148e | ORPH
    mips64el |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/9b35ecb0edd751f17b7acdf0514b5ce0b6adf48e |     
     powerpc |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/dd646e6f96259430926b921e20f1dd736ac35dc1 |     
         arm |                    strace-4.23 | NOK | http://autobuild.buildroot.net/results/c8569d7be065561df505c74bbe841165b0b0763f |     


-- 
http://autobuild.buildroot.net
