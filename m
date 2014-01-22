From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-21
Message-ID: <20140122073008.228A8101007@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-21
===============================

        success : 86 
       failures : 38 
       timeouts : 3  
          TOTAL : 127

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 10
                       unknown | 3 
            libvncserver-0.9.9 | 3 
                aiccu-20070115 | 2 
                      icu-51.2 | 2 
                 mplayer-1.1.1 | 2 
                     vlc-2.1.2 | 2 
                     php-5.5.7 | 2 
                  libv4l-0.8.9 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
                  bustle-0.4.3 | 1 
            live555-2014.01.11 | 1 
         host-elf2flt-20130904 | 1 
                 qt5base-5.2.0 | 1 
                directfb-1.6.3 | 1 
make: *** No rule to make t... | 1 
                elfutils-0.155 | 1 
                 cairo-1.12.10 | 1 
             iputils-s20121011 | 1 
                     lua-5.1.5 | 1 
                 dmalloc-5.4.3 | 1 
  toolchain-external-undefined | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/7c4109961173f42bc6e2336f2a16b70f33eb2b02/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e95e1becba9ddb17732739bb2f01ee43971a63cd/
       arm |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/37e349b0432533d18a16f6b58aa178798112c1d6/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d5e8de13d64096276799e76a1df111adc397673d/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/19bd39798675b27ce439b569327656d3a029bf99/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2556cdd9c22943c6d52405fafc45561760468546/
       arm |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/17bc4f336619fde643f359bf71162c7ca1626a89/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/978134c3a15eb00eecc243cb1b8ca82b215ef354/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/53ca771e88cada4af68065dd132a47447274d051/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e009fed22c6c49c6ecb905a324f4a51212dea4ae/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/928ba675c5aaa54bf9c53ece7ee8a1e20acd5955/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/882e30e14286125dbf549df0cdc301049f325510/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/94c0d246dc619a67aae38b9e80f59aaa55b62f97/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/fc860cb6ee62d2a9939680656bcd7d38af0eef9d/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/e40d670931d8ad6887151c5e4e8838b7953a53eb/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/2d8c1c414f3c1f986f653d424883e7b63fa2485a/
     avr32 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/7c1a1847c5d8ce1d97ef077f26289153660848e8/
      bfin |                      lua-5.1.5 | NOK | http://autobuild.buildroot.net/results/b4146bf821d59f694546f6e3a341394cc8fa43ce/
   powerpc | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/7e85b79612a46df2eee0278703f54d872da72ed5/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ea499ba36974e42f7bdd69214805ca264ad5f8b7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5db5e543a5c8badce376aede5c6462534368c136/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/1d979de414e57dd9ee63b8ad64c6c796ad6e154a/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/bf610991780ae76963cfa2d73f3ae358338cbf34/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/9397f6ab30aefe3730c816ad5ce9338b6f69f170/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/1aff31c8ce02801fbb9bcf7375f458776d1c4e72/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/6ef864900cf3346959c6e04d744232f7519532a8/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/a29397177bd7db3c74dd345e5a524322df3ef5d0/
   aarch64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/be4ec1af270d7a8056ba98526e93328832a88a07/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/432e23c3775c8f87465d2d8e0b709bbccb05a995/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/933d1283e75f0bcd49d94fd1506aac2c94a57460/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/389469b6023ada55e99d7c51c0647624a80ec58d/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/70e069f547d8db012029de73a101c5af2d05cb16/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/120ccdadd6192c53d4fec5b8fe21cd86f7045b28/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e858214e8a5bcaca689b589753dae271c3d397bf/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4749c1089d1cb42460518ddb55e0fabb8cbae5f5/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/b2a3b6ba6219d438d74db1d48e9cb57e9c09d5dc/
   aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/7bbf33afeaa930010bc9cda6124792784a768b86/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/8ed3337879f5ebb7568f406a5bb97d45501efdba/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/64cc25c7e4a1dffbdb2883ed7a608b87650eb0f9/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a94f390fd1e943aba40e496c4d4993e5e1e4b544/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/15d35a75cfd73babe6a34b5a7d30e3f963155cb5/


-- 
http://autobuild.buildroot.net
