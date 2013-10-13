From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-12
Message-ID: <20131013063005.46FD052C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-12
===============================

        success : 87 
       failures : 44 
       timeouts : 1  
          TOTAL : 132

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 6 
                  boost-1.54.0 | 3 
                    nano-2.3.2 | 3 
                  nettle-2.7.1 | 2 
                 qt5base-5.0.2 | 2 
              cryptsetup-1.6.2 | 2 
                 binutils-2.21 | 2 
                      qt-4.8.5 | 2 
           host-cmake-2.8.10.2 | 1 
                 netsnmp-5.7.2 | 1 
                     m4-1.4.17 | 1 
               alsa-lib-1.0.26 | 1 
                   cups-1.3.11 | 1 
                      icu-51.2 | 1 
                openssl-1.0.1e | 1 
              e2fsprogs-1.42.8 | 1 
               ruby-1.9.3-p448 | 1 
                   hostapd-2.0 | 1 
                busybox-1.21.1 | 1 
        liblog4c-localtime-1.0 | 1 
                 omniorb-4.1.6 | 1 
                valgrind-3.8.1 | 1 
                 binutils-2.22 | 1 
              gettext-0.18.3.1 | 1 
           imagemagick-6.8.7-0 | 1 
  /usr/bin/install -c setxk... | 1 
               libglib2-2.36.3 | 1 
                 webkit-1.11.5 | 1 
                aiccu-20070115 | 1 
          host-ruby-1.9.3-p448 | 1 
                 cdrkit-1.1.11 | 1 

Detail of failures
===================

    x86_64 |   /usr/bin/install -c setxk... | TIM | http://autobuild.buildroot.net/results/dc6ba4a4206803fe2e25149c45bc40c3198742b6/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/41cde6f3c70391fe98aab44800e1063882dc3b1f/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0dde955ab16a76b75db2d63ee24d293c9a61c81a/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d9ef9402f0dc1d977bf1d98a71f0feb420157df8/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/da37afa70fc170c3c78ffa63edbe048e41ad7c77/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/bf8614dbfd930f0fd1678cf97da8cd125b0502c6/
     avr32 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/3f0b54286cdab65ffba690aec977171e43dd6e8a/
     avr32 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/61f997ae4004664599810ae46e452a349eb1231c/
     avr32 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/3f041bc28655cf3aff7f1404995eee91dd63d8a8/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/e0f2a050f73f3a90bc4fe237e929064d20d4ed84/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/020300b41fab869863c97c79f5199a3becde32c6/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/d1645d8da142765e08e7fad8bafe54d53aa36c8e/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/f945db17d6defb71c5b186ca24d0fabde252d4a7/
  mips64el |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/1509579702cc1ea99248ff939857d67db80fd703/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/b05a08db67797d3eaf52c3b625a7d821721d4ec3/
   powerpc |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/f09dd230079043865576faa76c1ac6116f94b8a5/
   powerpc |            host-cmake-2.8.10.2 | NOK | http://autobuild.buildroot.net/results/dfb7892f2d054300a68090c542096682dc71de1e/
   powerpc |           host-ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/60b37bdc5f83cfd05e96e72c47853a450053e4a9/
       arm |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/1b787dbb386e1041eda536023f5841bba2aeae9b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/518b22d84fdc1f98bb9441580a0af77c05fdf864/
      i686 |            imagemagick-6.8.7-0 | NOK | http://autobuild.buildroot.net/results/39eab8ecd00ecf3a30fbd8ceb2c29f3d1d549e1a/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/aee791fbcc43d3aefcbcd431e0f3265d699f94bc/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/4337e292dec1935c5c054eb4b9485a279183fb7f/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/b7a4560624fbe80d055dfe890faebc1e9328b28c/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/108e152578176b1a7e470a965f6520486c0c59c2/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/8da33bafa9817370b001bd609494eaeb3f4cd0dc/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/f1d87d7709889e0c9a56a2d4e8b6b859419b0c7e/
   powerpc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/211d6578973473437403b8338d45e917b3b7a84c/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a8a0a329ef814cda4a3d8eddbb27dd86eb1a935e/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/482842ee6e8e71c640eec0a0a330945a44d0d807/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/0e5615d3d579401d537be446759664972188b809/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/73786783fca1c9bcaadcdc7ff6a0577ac0fa03f1/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/bb7e90202ab73cc18a7d981d9acd6183dc462d80/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/27402c724484ebfc8f2fcdeb2c38d36e39f8151d/
     avr32 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/16f78d3a3dcca414570203b7a70cb2f8939817b1/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/e596c822e9bc14521d754befb14aaf95fe185295/
      sh4a |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/d43899c1c1b13555c250499971ef4da241651497/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9fb6463389a667e5dbad836c80cd012154a9e78a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/32aa849d28341a33e927499db67e605917c1363e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4b4d0a96ebc6d190f5fa26ee066e0b3da547aa45/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e288e78d02a866b1d1e317cadf8aa58be4a2b3f4/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/560d44a8f2b4a5f69b9b0331d78a0ae5188ca7ad/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/11d09ec93d25f4db6e837ca139ded47deeb2b67f/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/8ff311795ed53c1c9347522b0fd963964c9ded0b/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0d0fcce018e28fd3e10673402d41f23594f985b0/


-- 
http://autobuild.buildroot.net
