From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-24
Message-ID: <20171125070006.6B6C6213E2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  13 |   0 |   0 |  13 |
      master | 220 |  17 |   0 | 237 |
        next |  46 |  15 |   0 |  61 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-google-breakpad-7515ab... | 2 
                 mesa3d-17.2.4 | 2 
                  boost-1.65.1 | 1 
                     gpsd-3.16 | 1 
        ltp-testsuite-20170929 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.5 | 1 
                    php-7.1.11 | 1 
                poppler-0.59.0 | 1 
           python-numpy-1.13.3 | 1 
qextserialport-ada321a9ee46... | 1 
          shairport-sync-3.1.4 | 1 
                    tekui-1.12 | 1 
                       unknown | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/cbcdf50935190016dfe35a98947d74f7425d7131 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f9631354d05195e05a34f7ffca9677fa83b33273 | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/c7c04483508f9e4d629efa54571afeb1feaa5f73 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/98b2e66a5eb68e4a1e5b80d507ea991203d91d5f |     
         arc |         ltp-testsuite-20170929 | NOK | http://autobuild.buildroot.net/results/03a8add12354237432289e96022f6c3893ff6013 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/7716d3978041a1c8d0cf3473f0e8b74c48ca3c3c |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/8a0e970b8adb6770ff9b1d18c4544654d511aadf |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/a05f42a47e4a65641cced1ec30fa65f7d7920f7c |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/07823c811de018cd79c7fc539c2a104aa569474f |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/73a95ad8d5c12ca3c11fc75778ea8c144d5f6d76 | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/5828f71026381ee5c8b73a66b516f85d98ac2eaf |     
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/540dd590a02a30487551913ccebffa225ad28aaf |     
     aarch64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/9488431b891609252a020285efd196ed5d5c7d72 |     
     powerpc |           shairport-sync-3.1.4 | NOK | http://autobuild.buildroot.net/results/abd6025bb85622723a9e4124024d35b78c20b315 |     
      xtensa |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/580593e79bc4ecdea1dc71d16607e5c88f87403c |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/3455a76d300ad86c2b77c5a762eefd7012706a2d |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/c6903067a3df944628e640086d28274274b305d3 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

     python-cheroot-legal-info | 3 
         python-mwclient-0.8.6 | 3 
pdbg-77158819158d1d7053a737... | 2 
              alsa-lib-1.1.4.1 | 1 
                    chrony-3.2 | 1 
                      feh-2.21 | 1 
                 ibrdtnd-1.0.1 | 1 
                 mesa3d-17.2.5 | 1 
                    php-7.1.11 | 1 
              wireshark-2.2.10 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/6358d4c45466f6112eb6b989fc62e600cc006c54 |     
      x86_64 |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/fd677429cf1ee551b4ba566e0b275ebf0cd14e74 |     
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/c8959560c6336a956d6f2ae3fa65edac68eb7771 |     
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/70faf8a504be16769f148d14fd726b258d561f44 | ORPH
     powerpc |                  mesa3d-17.2.5 | NOK | http://autobuild.buildroot.net/results/c4d6bff76a8f51df8a7c3140f7f7a80def98b793 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/439914bca0a9a572f1dd80ed1784cec76fa930d3 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/83f744280d7c66916b12771c27beb0327fdbd06d |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/34c3fbdbeaf95e3ec4c61d9af51b956c7cef1449 | ORPH
        m68k |      python-cheroot-legal-info | NOK | http://autobuild.buildroot.net/results/94dee5b01e0f7693d4e6e05074e7d93e92236e2c |     
    mips64el |      python-cheroot-legal-info | NOK | http://autobuild.buildroot.net/results/09feb0eeebe05890d6e37533b413ec794785e669 |     
         arm |      python-cheroot-legal-info | NOK | http://autobuild.buildroot.net/results/dd51e1bee7d6df1c871b088159f14f9fff4e1ac2 |     
        i686 |          python-mwclient-0.8.6 | NOK | http://autobuild.buildroot.net/results/7a4a4aecbe6dd315062bafe97b291645d3d6ced1 |     
     sparc64 |          python-mwclient-0.8.6 | NOK | http://autobuild.buildroot.net/results/79ef04d2e8c91231028e23f4bb35df685efa55ca |     
         arm |          python-mwclient-0.8.6 | NOK | http://autobuild.buildroot.net/results/09c0e590448f1fc069d1d00564c202d2b009d59a |     
      mipsel |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/0cde39f8d8744868130ba662446589b53e838fdd | ORPH


-- 
http://autobuild.buildroot.net
