From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Jul 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-20
Message-ID: <20180721060011.78ECC20943@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   2 |   1 |  13 |
   2018.05.x |  15 |   2 |   0 |  17 |
      master | 127 |  32 |   0 | 159 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     host-mono | 1 
      qt5serialport-legal-info | 1 
     wireless-regdb-2017.03.07 | 1 


Detail of failures
------------------

         arm |                      host-mono | TIM | http://autobuild.buildroot.net/results/56ac27082239cc5ca3fa64b03011065df85dcf08 |     
         sh4 |       qt5serialport-legal-info | NOK | http://autobuild.buildroot.net/results/d1a7a97ba4d95276d34234757ef51c2b25373104 |     
    mips64el |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/d876f910ce769cbd35a9550404f9b0c625e4dba8 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

     wireless-regdb-2017.03.07 | 2 


Detail of failures
------------------

     powerpc |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/dbfccfebd406b3661784ab08591d654d2fdc245f |     
         arm |      wireless-regdb-2017.03.07 | NOK | http://autobuild.buildroot.net/results/c8857cff58a242e5ac581e40dc67ba2029aca222 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 8 
            perl-net-ssh2-0.69 | 5 
          openpowerlink-V2.7.0 | 4 
                  boost-1.67.0 | 2 
                    brltty-5.5 | 2 
                   libnss-3.38 | 2 
               aircrack-ng-1.3 | 1 
                   erlang-21.0 | 1 
                    links-2.14 | 1 
linuxptp-303b08cbf55096aba5... | 1 
              python-pyqt5-5.7 | 1 
                  samba4-4.8.3 | 1 
              wireshark-2.2.15 | 1 
                 wiringpi-2.46 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/a14c14f288ab27e8d45023470feefcbcea69a1f0 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1c263b63c127c8397f59e550aa745fbf41e8d8c5 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a91d1a8c26eed1727b56ba70bc81f661c5605303 |     
       nios2 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1a410c2a07808e7d222fca1114c6bd313dd5b8ce |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/220e4c02d2ce380e9217f45379c15dca77c629aa |     
         arm |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/285ef07d8e0614dd90a1e4dd3ee28b116990dc0f |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0e967db025ce39f9122f519f0383e26bd724179a |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/507452a8eeb1ec71c05cbb2fc9fcbea3702f6c1d |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/623ba25dcfd7c14b61871d0884afe3830c3e91ff |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4f8ee9afa356ef4b8dffa3dd6f1bc624d59b9ede |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c5afc62b3b7ed7069b30808c936e1c068cff0791 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3b770c0dbca88aebab1f2e5662aa03d4b3e4bd2a |     
   powerpc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ddfad73160ce2e795926e5de93ab4130bf3c0b99 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/05a73e8adc410116583d09d9bfc1798a0555cb0f |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/55198b157bf34ced6ececdbd5863c24aeda5af95 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/e92a36624eb97143b811990e53f10e63b3f723f5 |     
         arm |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/68d9ffb73ef1c382462377e2c484102e3cd4cded | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/112c26da7bb1fd8551a3e9742e9c2d469a5d1881 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/96f1c3a7fa12b92fd9989a3ce1a67461eea60708 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/cccaa692f1e00ea6027f89bfaaef5f159fdfe659 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/e92ab6371500ae8de272808e8e775b9d87d74709 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/8b62c0347b889b103608146223cafa3ba75e551c |     
     powerpc |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/cd43525762ba8bd1bf8d8334a9bfb1049f0431c5 |     
         arm |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/255c1cf0e077a4fd715c39799bd2045c480bd951 |     
      x86_64 |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/43d940e80ea4f858506dd1f7398a5c7a098d10b1 |     
        or1k |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/232e31c2a217864a65e104b3474782f18955c039 |     
      xtensa |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/a8e7f2ef61f84bf1af7309b2cae1d5562dc1aab7 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/90e5ed7c59e0a2029f2c7cbf8a53900bc18c0cb3 |     
      x86_64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/2c5d5b18cc3ed1ee3cdb5cff0d14391213f39aa1 |     
      xtensa |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/f2a9ff73d1bf4b462b7a141fb7e40a375420d320 | ORPH
        or1k |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/e9d7765b406e952a8908090b8461430514d59c81 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/54a3be14c13445c81abe8719f17b050a1cc13acc |     


-- 
http://autobuild.buildroot.net
