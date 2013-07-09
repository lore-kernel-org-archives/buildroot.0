From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-08
Message-ID: <20130709063005.179D952C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-08
===============================

        success : 84 
       failures : 60 
       timeouts : 0  
          TOTAL : 144

Classification of failures by reason
====================================

                classpath-0.98 | 6 
                pciutils-3.2.0 | 6 
                 libffi-3.0.13 | 3 
make: *** [aespipe-legal-in... | 2 
          host-protobuf-c-0.15 | 2 
                      qt-4.8.5 | 2 
               binutils-2.21.1 | 2 
                 rt-tests-0.83 | 2 
                directfb-1.6.3 | 1 
               alsa-lib-1.0.26 | 1 
make: *** [readline-legal-i... | 1 
                     m4-1.4.16 | 1 
                      icu-51.2 | 1 
make: *** [gnupg-legal-info... | 1 
     xlib_libpthread-stubs-0.3 | 1 
             uclibc-0.9.33-arc | 1 
make: *** [xproto_kbproto-l... | 1 
               libcap-ng-0.6.6 | 1 
                  stunnel-4.55 | 1 
           imagemagick-6.8.6-2 | 1 
                      gpsd-3.9 | 1 
make: *** [gptfdisk-legal-i... | 1 
make: *** [ipset-legal-info... | 1 
                  prboom-2.5.0 | 1 
                 binutils-2.21 | 1 
                  libxcb-1.8.1 | 1 
                       kmod-14 | 1 
               libsigsegv-2.10 | 1 
               ruby-1.9.3-p429 | 1 
make: *** [boost-legal-info... | 1 
                 netsnmp-5.7.2 | 1 
                  udisks-1.0.4 | 1 
            host-libxml2-2.9.1 | 1 
make: *** [lockfile-progs-l... | 1 
              host-elf2flt-cvs | 1 
               w_scan-20130331 | 1 
make: *** [gd-legal-info] E... | 1 
               audiofile-0.3.6 | 1 
               qt5webkit-5.0.2 | 1 
make: *** [yajl-legal-info]... | 1 
make: *** [spice-protocol-l... | 1 
                   mplayer-1.1 | 1 
make: *** [ebtables-legal-i... | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/715c430ca04b00d538eb9ac851f3a6a2eb7994c1/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/488c41e033697a822f135ad2c30f16a0ae98b810/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5ab7123e868fbeca991a72623b46ea014500cdd4/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/87a9a54579b65f9f8acd73742b3c1d820398721f/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/7e08d2ec1f3220412cdfe87352ee2e7a52613a35/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/f1f0ba6556391247d64135a77b89571ec439bfe1/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/0898fb61fc32256f8404877db7399d7672a16a0c/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/16bc5ca4fe8f1ad828952183ba32709f25e4e3ea/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/fef5b62cce96c2893f4433afaa345b13495cd7f2/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/057fda5d05e5eac2f0e07551a2d919701ce41a94/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/0bb5f342f0f344f4a6122052904a7eaf28ed5cc3/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b7e92c6bdadc1d6280aa2a069ac40f10e0ab09b1/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/c31750a143570c2bb4b2c179d5e83d22d2c0d9be/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/bb7b2c0bb23e0ab6e148a1e690b2c0827135ff55/
       arm |             host-libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/762c3f59d0eefacadfe82c46919fbbaea46705c3/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/fcf4016be8a973d917ecec75f7b2823859334a16/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f9d84939c88b2061e52039d37ec2089fc583bd13/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/9b6fed3a50106fd9a74fd1656bb7cdfbbcc87269/
microblaze |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/afb6ec8547f192587ba5543a26d8451deb530672/
      i686 |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/6b51503ddcc5af574d915256740dbae9d7e03057/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/2ea09199d46904b29847a10f085384183f77adc9/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0d74a4d54c0670c2ffbd48a295bef5901f4dfad7/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f70d186c512e7e9fb64291641afe3ce17ba14a0c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/09df297e578c2be4ed9e51c275479b22bb353ad7/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9b5d61f7f7eae7c78963a933e4f355cd5c362e1a/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/dec5ec11420d66d1fa4d273976aa749816fbe066/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/9fd18217a6df380ee13d3f5a2b9234d3614fe150/
       arm | make: *** [aespipe-legal-in... | NOK | http://autobuild.buildroot.net/results/81cef0feb32f144eef478aa72113bd5fe07f8791/
       arm | make: *** [aespipe-legal-in... | NOK | http://autobuild.buildroot.net/results/21f1193a430080c61d4246b7974295be6af92225/
    x86_64 | make: *** [boost-legal-info... | NOK | http://autobuild.buildroot.net/results/4e95bd31196d32750091f99016a291d924e0ad03/
    x86_64 | make: *** [ebtables-legal-i... | NOK | http://autobuild.buildroot.net/results/5aa12367d23df40b45d1891ddeada5b1708716ba/
   powerpc | make: *** [gd-legal-info] E... | NOK | http://autobuild.buildroot.net/results/49f1a39a4448d3dedbf236418adab2a92fdf56f6/
       arm | make: *** [gnupg-legal-info... | NOK | http://autobuild.buildroot.net/results/f05a05344fcf09d09b34cfa5e631af07ecdf760c/
       sh4 | make: *** [gptfdisk-legal-i... | NOK | http://autobuild.buildroot.net/results/497aa9cab22ced5d6a2e0b6be19e7a2368a2a8d6/
   powerpc | make: *** [ipset-legal-info... | NOK | http://autobuild.buildroot.net/results/aac898ec4f842477ec8b7189cb4d8eb10e78e154/
   powerpc | make: *** [lockfile-progs-l... | NOK | http://autobuild.buildroot.net/results/9d5104639d72981e8fb8c674ec1c0ed5b071c277/
   powerpc | make: *** [readline-legal-i... | NOK | http://autobuild.buildroot.net/results/447a1da7b46ec6620c460faf0e633abb9c5fb251/
       arm | make: *** [spice-protocol-l... | NOK | http://autobuild.buildroot.net/results/823742e4ea4410b4b83bbf748e7e42d7d9724a61/
       arm | make: *** [xproto_kbproto-l... | NOK | http://autobuild.buildroot.net/results/da9bd1ba56fda146982e20330002f9ed87399265/
   powerpc | make: *** [yajl-legal-info]... | NOK | http://autobuild.buildroot.net/results/025d549a77d8937ae469da2da9dfc532e1212e04/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/f9376f7a7b9b8fe6f2420b318db81683d92e20d0/
   powerpc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/05f32d6ec9540da55696f9d3f494379c21dd2e65/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/f0a7588d57c98a0b56ef12bcfd8cb648719a874b/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/4a2ea68bf122909459034fd73a6d1f258b19a937/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9408c94156620c5f2d6b85f6e13db05f212fd958/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/028bb037f0333d43efeef29a235df97eeb763d4d/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/b732dc193771abd66111d5c2580fcb21ef20b34b/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/03b0c9426d2068a8a82691754822daaad22d7a17/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/4ce87433af67f7aab4965144c6e380eddb73bd3c/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c1099319b1cb1b0c1b40daeb8288aab32f3de09b/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/6202f55729732c205768f9a8fd661fc1cc4bb777/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0bc6f672fb45bf50b27f1ef1e1f8f05b3935069a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/857e6cde0c7073aac999c91fc53ba030c1746368/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/26834ee66b1fd48ea9a697f886aea75afe9ffb0d/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/d22ac1a57ff3a35d4205ea7dd3981355a791f2c8/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/f690f29ba9c4b064f0566aa4d8c407dbe256619b/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/e89836e0b43ace3f154fa62dbafb7adc1de2d093/
      i686 |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/9b59688b1af503f4bb62f580de4a125b9ef20948/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/f3be8ab9aa43761fa0090929c5f4e01fe2d0782e/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/a0d4687ea56d93e16349832de8515988989f7ece/


-- 
http://autobuild.buildroot.net
