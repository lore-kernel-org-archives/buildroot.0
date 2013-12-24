From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-23
Message-ID: <20131224073009.58151100F70@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-23
===============================

        success : 74 
       failures : 48 
       timeouts : 1  
          TOTAL : 123

Classification of failures by reason
====================================

             util-linux-2.23.2 | 10
make: *** [python-pycrypto-... | 6 
                    ola-0.8.32 | 6 
              python-pyasn-1.2 | 3 
            python-crc16-0.1.1 | 3 
                     m4-1.4.17 | 2 
                 webkit-1.11.5 | 2 
                  libpng-1.6.8 | 1 
                elfutils-0.155 | 1 
(cd /home/test/test/3/outpu... | 1 
           python-pycrypto-2.6 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
               alsa-lib-1.0.26 | 1 
          imagemagick-6.8.7-10 | 1 
        gst1-plugins-bad-1.2.1 | 1 
                      icu-51.2 | 1 
                  iozone-3_414 | 1 
            qt5jsbackend-5.2.0 | 1 
                  libogg-1.3.0 | 1 
         host-elf2flt-20130904 | 1 
               madplay-0.15.2b | 1 
                  python-2.7.3 | 1 
                      udev-182 | 1 
              gstreamer1-1.2.1 | 1 

Detail of failures
===================

      mips | (cd /home/test/test/3/outpu... | TIM | http://autobuild.buildroot.net/results/1517a63bb0098cc9f80103971c04b5059dcb888f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3c6c64d9f641d41c5f0dc008f31fd0e5b83b8523/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/6163e23b88d7c052a8c776a8fd274debfb16bd7e/
      i686 |         gst1-plugins-bad-1.2.1 | NOK | http://autobuild.buildroot.net/results/0eea69725fe0d42714f9f6bc8667b28a1bdab3d8/
microblaze |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/185a16ab20d9ad7f34202009210d91b220e4d392/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/ba9d7acd6350af6004b31bbedc9db88db4f92cc1/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f908e193f097af0becd25292887a2fb1da452620/
       arc |           imagemagick-6.8.7-10 | NOK | http://autobuild.buildroot.net/results/0fa4fa4559cde1d6d56bd9286ff196b9d6e20422/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/f5212ec63747e60f6f471360fdaac46eae0acfce/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/2c782772a1c3596cf9294d5d44d7f2ebf763203c/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/815637285e6a48d0c8ba704a13f64c564d4c04ea/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/d785c825e4f010709105b0cc3b978af27c72da85/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/cabe5289e782a6dc266f2880a18ca97873c14d0d/
       arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/d1d5698d35bc8f882317c549934de02dc49c4799/
   powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/c6ed5a9d0732263d3fdd464770a6bf602602c169/
    mipsel | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/14d8468d4e547b0975c4abbd7458325a1c4d24e3/
   aarch64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/1baade69413055a4df80a511352f70903e1b033f/
      mips | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/2dcd3dea32e1c761d7f2ade17bc085b33316a4e5/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/3e0c346a1cda21f8e866632cc282f05680129f84/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/86b4faa0cf1a8f0a3f6dfc2fb816432c876988ef/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c1b9230e99ccf7b377c6884ab42785c80a784888/
       sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/b9f48df570b15fc6c1911af7dade3dfb892efe10/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/a2308726b2d29e536ea88cd87ba3d150ceba8650/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/cf8687aa894c011fdf4e4247025d0a7f8d33a102/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/24bb9a23fece88d91073011da1cebb5dd76ff395/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/ee22617e0b845c0152b5d265d452bf77d8c74e55/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/76d89d6cd480fa96700e78c6b8ffeb8cee66e1d2/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/6254df4cfbcf091537e4e7b4d078d00811659a5b/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/b6ff71bbc54c5d88291e7d2142ac7b4965d1b213/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/19dfc9bbd228bef56d69a8fbc05407d1c42a2666/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/f5ba8c60a5eb02902259e951f40d3bfc5d000d50/
      i686 |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/315d395a6afceb39e734940bca0c7c2b2ec7ac2a/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/8726bcc19ba72733107f16a43166f5b9554ac7ef/
       arm |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/fc957978cef7df3560604c08ede372c717732d6d/
      i686 |             qt5jsbackend-5.2.0 | NOK | http://autobuild.buildroot.net/results/6db5377c4a7a95f9b659cd789eeeb6ffb0f4d9ba/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/a098380497f97d5daf279ec8d086d4df1cb5d7d0/
      bfin |                       udev-182 | NOK | http://autobuild.buildroot.net/results/1a250939c209e2fa2f3a562c1d8c4408027195bd/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ca6f973a296502984dbca270fefeaa86588393c9/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/31284d7cafaea0e5ceb5d05f16832941c8c1ca30/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7158c91ffb45a1cc43e5c11c6b1cfdc7c96fff84/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f48a5248be0454878623a37e395bc811dc9439d5/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/88dd97b524dc626e44e3eae0804a74a743de54f8/
      i686 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2090afd09c425ac89294f884ce4c3f031beaecb1/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/95e8abdd3b1fc30edeebf46c7534e067c43ae59c/
      sh4a |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d1b88052d96500e1ffa96ab5d26e1f151f083b34/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bbddfb641be3b46a3b6915d6fb8bb3954fad65e2/
  mips64el |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0e5e2a9c344c0d20dba2533277997ed08572beb5/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6e5e5194d7933e55e639de4fd6300cbc837f36a1/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/e3acc849371bb362c67e5f04217588bc967585e9/


-- 
http://autobuild.buildroot.net
