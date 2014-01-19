From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jan 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-18
Message-ID: <20140119073010.9F438100B89@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-18
===============================

        success : 82 
       failures : 36 
       timeouts : 3  
          TOTAL : 121

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 7 
                       unknown | 3 
                       kmod-16 | 2 
            live555-2014.01.11 | 2 
                 cairo-1.12.10 | 2 
                   ncftp-3.2.5 | 2 
                    fltk-1.3.2 | 2 
                 pixman-0.30.0 | 2 
                  libogg-1.3.0 | 2 
                 tcpdump-4.5.1 | 1 
                 libraw-0.13.4 | 1 
make: *** No rule to make t... | 1 
                  samba-3.6.22 | 1 
              lm-sensors-3.3.4 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
                oprofile-0.9.8 | 1 
             util-linux-2.23.2 | 1 
             alsa-utils-1.0.26 | 1 
                     vlc-2.1.2 | 1 
                 msgpack-0.5.4 | 1 
                 libxml2-2.9.1 | 1 
                  avahi-0.6.31 | 1 
        ltp-testsuite-20130904 | 1 
             iputils-s20121011 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/6c8095a61adf7638ab78b91dceb84401e0bf369f/
    mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e580cf00a91fe0bff0bd7ab3fbac4c850fa82afe/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e9fc14f397e822143ffd625e38e1877c3296d7d1/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/95a8b6ad45a0b7b095e5462230d7c4b59be5e2a0/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/23c1b8c9aae9a02cd49a1850320608bedbc16082/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/32c109bcf7adc8715a47fcf16ee16dd3b3d71fc4/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/87c7b709aca57f60d6a3484824f4890c2cf74e11/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/b38ccad7aa6f90407b1015a00ad354b37438abfa/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/07525c315eae65229ddf8c7f2eaec75d7cc1db1d/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/c1bec1f628323b8458132b451179ceb5ede562e1/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/925d834f695701a10e999390c82967cff122058f/
      mips |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/33d6af5dc3760ffa8a2c8a1b1ed1ac3b1e23ac1d/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/28a978c08605ad2ade5deb04caee33dd3c91d578/
       arm |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/9c8b3c566591108b3cd7a9681225d61cab48b67c/
       arm |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/b34f8916965904afac3d4c065dc1cbcc2a6cc9d4/
       arm |               lm-sensors-3.3.4 | NOK | http://autobuild.buildroot.net/results/060d897c49aefcbd053966219636687e695f57c2/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/323f1e1c09019375732cab0a31056da32465b624/
       arm | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/b6efe177b86e5a7c319ddc779bfa26c05d8b1e68/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/4788905a4255f072452103b31039c6c01ae7a960/
       arc |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/e7fc9631b0ac14ea6a882f717d5aa495cd95e5fe/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/ab1ed10c1dd20c20b6bc91be51260697af4b1b0e/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/56384f7949ee6b8c4926e634a00f547ccca7e034/
       arc |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/e24038629640612b74716bdde8e46c3eab120835/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/ffe52e8b8177686a8343546f528911d05cccf528/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/3d6f23d442acc1beeb741420fb1eea3375ebd95d/
     nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/0a521e0cb04f6e7ba279c55b72a240acf135f951/
   powerpc |                  tcpdump-4.5.1 | NOK | http://autobuild.buildroot.net/results/272c7b57a6ebd86e0e500c36fd67e59d4655858f/
   aarch64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/9a10c4ba477a7b057b473fc15b4fd34492bd8bfa/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/72d336daf92c90ea2a7b6b18de53bca20c16f24d/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/959d65227ec494453b76991cf1528b58e8047a25/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/77484eb846b8022ec33bc6f5d9924c7ea923e673/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/b6f0fb0a88cdc7d939270eafeff795b28046f770/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/da4e8df8b1121cbbebad74e13b70c60c6fd37f37/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/cd033dea134fc9930daf34d8b95f3bdfe5856016/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/9822691bb76fa2219ea0e15f675aef5a5793fb19/
   aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/bcb40a53063ed4bcbceb1a8a615c74501d461be0/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/198b192a76c317cc51bea93127a806b42af2f496/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/1a38982a3ae7e1f317cfdfeb69be44fe85ce0e3c/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/4a02e1a9785ff4008114956997d4c9da89386d5e/


-- 
http://autobuild.buildroot.net
