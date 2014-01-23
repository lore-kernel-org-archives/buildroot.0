From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-22
Message-ID: <20140123073009.3554C101285@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-22
===============================

        success : 97 
       failures : 47 
       timeouts : 0  
          TOTAL : 144

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 12
                     php-5.5.7 | 4 
Makefile.legacy:12: *** "Yo... | 4 
mmc-utils-11f2ceabc4ad3f0dd... | 3 
                 cairo-1.12.10 | 2 
make: *** No rule to make t... | 2 
                   open2300-12 | 2 
       gst1-plugins-base-1.2.2 | 1 
                 libxml2-2.9.1 | 1 
                 pixman-0.30.0 | 1 
                  libogg-1.3.0 | 1 
                     vlc-2.1.2 | 1 
               alsa-lib-1.0.26 | 1 
                      qt-4.8.5 | 1 
                aiccu-20070115 | 1 
                 mplayer-1.1.1 | 1 
                      icu-51.2 | 1 
                minidlna-1.1.1 | 1 
        ltp-testsuite-20130904 | 1 
                       kmod-16 | 1 
              e2fsprogs-1.42.9 | 1 
             gstreamer-0.10.36 | 1 
         matchbox-keyboard-0.1 | 1 
                libsecret-0.15 | 1 
         host-elf2flt-20130904 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/4b034243d085fdae29d497e3833524091abccafe/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/289251464d4d3afaffa53db152e3ed8992f97587/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/565596f50c5ce83c07896fb87a815906436094b7/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/91667ffcf56448ac2db5a76a579bf7b6ebe67546/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/e870f50658f39202d042c2cf5550f8d6eeafc69e/
   aarch64 |        gst1-plugins-base-1.2.2 | NOK | http://autobuild.buildroot.net/results/b3e54af257fb69cc3a213192737b5b305061344f/
microblaze |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/9ec2df9cd6889c513ea5962fbd0b8452b7a98910/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/ee736e28ce6c83fbfa539b0e58ce267744fa4313/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/792bc5a804208428d6310d04fcd385d53baff07e/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/a973314abb3981a0dab999e614f0b50279ed6a0c/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/d02f609fdc7f624d8caccc937e4828cfb3b08bc6/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/651433f7833c7e26202e285e2e653f546b5d2619/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/edf1db452c138952a8fd1428815c37202b54fe15/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/f3a7d051b091d17ffd2bed79517b3d41afa049d8/
      sh4a | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/ebbf842613ae828eda688387b5f8ddfd7e20b19d/
    x86_64 | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/6feca842eb6f82cfe54ff41cf74bdcfce7c3868e/
      i686 | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/6e8a6c26e1ada4021a525591eb8dd92c70c288a9/
       arm | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/4f2c45f755d84361b406fecf7e4345e93bc57591/
   powerpc | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/09b1d24e75027f50d4c11e9013859e5e4a14e8f6/
      mips | Makefile.legacy:12: *** "Yo... | NOK | http://autobuild.buildroot.net/results/a15ac9e608703da3c2dbc4327edf72b7e17284a5/
      i686 |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/9fc25eb1ffb98c53bbad750033f77561dd1145de/
       arm |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/787891933a3063f34e3c83f098cd98c694e5e5c6/
  mips64el | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/ef5ec380282b46bdfb9ab71fc9d108c95e51ed66/
  mips64el | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/457c25e7ef711683d8cc5922204a5705fae17f77/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/27cb017529bfe82fbd47b3b3d27599ebd443e435/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/765cf618101ed7d11252d4ea628480135182640b/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8cf35e0200fe1b2d2b663b9b689b4ef1a6c82803/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/c93c305733f185b4abe40b50340ad62d772c63f1/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/41c1f987fe456a29d1593b8b38319562bfb8b001/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/4730e340b434835635786b09737ab042a1213325/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/28534d0bc6d04e7ef9ffc9c667917293baf47cfc/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/c0df5f18de6fd0588d3c73c461a1a5c56af962bd/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/84ead07d089c751003ff208dda20f1398d41b103/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/728db4ce00ca9c22c507fcf1d2ecfb633fc3febc/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f2f3ba5675f6138c6927847e470fce65091dc816/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2d759df00343ed8d9306a4d0c4617d9436c4566b/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e628e85b6c16211f2745debd6bf1cb62f82ddc69/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c4f14f45e22aac00104ee761bdc9277b436c9ecf/
    xtensa |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/63b403f80a8b219a6b5194e7f6da09024b1ac87e/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/ec426e94727ac255b41839bd536107253dc09ea6/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/d1905c2e248dff0e40f9d1d56ea28604fd908797/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/06d32430b1f22500f9c86c5c5e5145ebc45300d4/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4e8dabb7d1bc21232207abcf3c7d988440959633/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/19bd39d1de210cfaf3d3528e504a81805248b2fc/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/01788833ed23686afbb12f27c64ea6e673709430/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/b51db4bc3e5da05fb67b37042fefb7200596f569/
   aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/15454f3caf131f0601b4d3c01c55ef76a1d062c2/


-- 
http://autobuild.buildroot.net
