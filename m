From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Apr 2017 08:28:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-08
Message-ID: <20170409062821.F33722084C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-08
================================

      successes : 209
       failures : 29 
       timeouts : 1  
          TOTAL : 239

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 7 
                 mplayer-1.3.0 | 3 
                  arp-scan-1.9 | 2 
                busybox-1.26.2 | 2 
                 efibootmgr-14 | 2 
                     qwt-6.1.3 | 2 
           uboot-tools-2017.03 | 2 
             bluez5_utils-5.44 | 1 
                  cppcms-1.0.5 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libepoxy-1.4.1 | 1 
                libmpeg2-0.5.1 | 1 
          libpthread-stubs-0.4 | 1 
make[3]: *** [all-recursive... | 1 
                      qt-4.8.7 | 1 
                  samba4-4.5.7 | 1 
                    sdl2-2.0.5 | 1 


Detail of failures
===================

       sparc |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/2f2299f4de1879901475385ead4214994e27e0de |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/1fb88e5db902323dc97e73cbd9c78f2b6d71d909 |     
   powerpc64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/ba30d20fc10a4d538a560d75e2a81e7121328dbc |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/cc55f6946e75bc272c8e794fd8888c3329a7bda8 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/fb005adb65f2e86478d40a557695d609dc903970 | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/bed47acd32e89a8998dbe43b7411179fbc1f3e69 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/ef50687928f8c0a814342b024862a6c5f6cbf2fd |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/e3a50fda5ba9990dc9936040fcb1ef96b0c7ec74 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/613e2af87e114f7a8beee38086858f65104cf564 |     
      x86_64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/ced4fffff7c57b5df560966f28b795c3201b5198 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b90bbc62e6edd506333289972972b20e31f2003b | ORPH
       sparc |           libpthread-stubs-0.4 | NOK | http://autobuild.buildroot.net/results/8c48a761300c948283e8c1ac8bad13d6df272d96 | ORPH
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/63badea0003bf255710745fe7520cdb075f427f6 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7aab99679651c78666981ef6016137a4e1b84445 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/dbe7a89729cff945a3263231d5a1b63411c32e45 |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/08ed316677f519c8005928366aea89570527a033 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/87c4a82bffc4b4843fa5f0926842e0e664572f6a | ORPH
      x86_64 |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/1961f681ea3392836384b516b77e222847483ddf | ORPH
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/c9f5297c3ccb33d5c0bcd858a5db3d4377d66454 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/2cdb7c4a118df00f6a5c4be45bde554a80512fb6 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/f9a9ab9125ddbd582c413b2de199edb1e971dc68 |     
        mips |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ee3eb1dc91c85f9e8c3d99861838b3c3d2b63be7 | ORPH
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/784a3724da1e7d1302a88ea4b932c8b49817b8a8 | ORPH
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/0f3456e45f8f5b9269e009d26f6e740e908dff67 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/d38a6fa831176ac7164a8e5801057a5b57b3b937 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/5f55fcf4516d107a423186085105ba05b8a86399 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/a27010ef2508ba1afa47b4e9e022b80beafbc4f9 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f303fd5801dc547ac60b3810ed84d0f8bde11eae |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/fbd7841f9d26cfa74706baaa722278b496c3ea11 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/316efd2a77702f186b0d5e8289dc8a9ae6e501be |     

-- 
http://autobuild.buildroot.net
