From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jan 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-25
Message-ID: <20140126073010.2DE901014EA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-25
===============================

        success : 75 
       failures : 61 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

                   gtest-1.7.0 | 13
               tcpreplay-4.0.0 | 12
                   open2300-12 | 5 
            vorbis-tools-1.4.0 | 4 
            libvncserver-0.9.9 | 3 
                elfutils-0.155 | 2 
                 cairo-1.12.10 | 2 
                     php-5.5.7 | 1 
                aiccu-20070115 | 1 
                  thrift-0.9.1 | 1 
           imagemagick-6.8.8-2 | 1 
         qt5connectivity-5.2.0 | 1 
host-gcc-final-b93bb009e021... | 1 
                 fio-fio-2.1.4 | 1 
              xmlstarlet-1.5.0 | 1 
                 libhid-0.2.16 | 1 
                 libxml2-2.9.1 | 1 
               alsa-lib-1.0.26 | 1 
                 host-gdb-6.6a | 1 
                     vlc-2.1.2 | 1 
         openpowerlink-V1.08.4 | 1 
                    fltk-1.3.2 | 1 
                      icu-51.2 | 1 
             alsa-utils-1.0.26 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
                 qt5base-5.2.0 | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a83ec02e9ac50ed4914f339d9f627bb798d296c2/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ef28ed1fd8247f1a839b18e5eaa7327d47cd4dbb/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/a867ed9204a02a7ea7e8d8d12a1a1c673982aa1d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0fcf399ee8919e3d6c49e1a2012da6f9c155e710/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/52065ec14de88dfb610d729db05e4bb178fb4070/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/7de3f7d029d107932a18fa46e01fa8b90999188a/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0456c2495569fbd0a421f4063954156c7d7fa5dc/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/299b6d2717ed334574e877d70be51e59521dcd87/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/b99f553d997077e11faec0bf93d40044f07f931e/
     avr32 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/2684097d24ea4182850706783aa37aa584bb378a/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/85d647d9f98a082ee9b058e5bb3acb257cf97584/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/8369bde927074b566f3cbce1cc58618ba5d9e5a7/
    xtensa |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/e03f7cbd47dd14bea6cad7a327271877c88cb419/
      mips |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/7076b104dc05221073bebd4ea32e15a38bd363d0/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/6e7f9e5ce097c45f450395a9539a258a3ad0adc6/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/05d4bd38df70c2b39562ed7ff545a97d3e3ce05e/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/ea57ef1fc6eb84c6f767c6e4aaf9428181863d5b/
      mips |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/b8efeab3a0a935a52f55f1f3395aa259e76e8606/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/177b050300ef680a861c3702a994afe028e6ff56/
     avr32 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/0ce80f05f2f344471570c99cb218c6138a48e51c/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/c24290270e8d17866d2e86114cc7882b75edc524/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/b36d925c8c7858984fd88331dc2974741ad56be5/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/e77d22f927fabb4f0a8cba6495280b8710ad10c0/
      bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/b5343e536a41539e149d45944e5e6daae028c024/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d0a4b478b98dc09891dba8453e4d1d1baa13b60a/
      bfin |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/06f6dce0105e35f2948ff0f42ec2e76bfa1eb082/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/ce465ec271fc6b43ed32ccfc6062e4355c10ae61/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c1686013aa73ca939aca5f576b6745edeab242eb/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/52f20953d3c2c0222b41dbdeee59e768429f3910/
      sh4a |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/2c009d383e06a5d28940cbbfcbd115d370837616/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/dc3d46612299ad5e036d20444a67688ae95bae32/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/728612983b5f9058902894f9750a5d7fc287222d/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/079b86c7acc231403928aa3484ce391e76fab809/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/5af984483f96f051d57403219cddef4ac50d5778/
      i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/0db49153c8ef3fcea0ab3f957b624b4f298793ab/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/b6b4b9365cac0c4bfd75c01ee8a43eb5c4526412/
    mipsel |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/41f4ae9778f5a20eb81682b29973f959ff1e7244/
    x86_64 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/2756f33d66521d079417f8da5aa0be8c5029f6a1/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/c804598a8dedd63902ece528c5c936de6883a321/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/ce7a8eacc5a2a0492051da421706975cbcb059c3/
      i686 |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/02efa5d89ffec0fb2c79c9e6ca38f75f8fbf9c7a/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/689b2a99fd000d87052b24d23563d8513eb9cfb2/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/3b28bf23b34803ef09e38c664a1e5647fd5e9323/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4bf891b4ebd82ca1c6e33c958b34817c2fab0e9b/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c7c193c200e619cda0974db40ac65df5db6552a5/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/a1542bbab0337b387629c574ac50cfe19cf320ec/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/fb2795d548f55734044d9809e0e0b0f485213a01/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4345987934794d07dba9180ffd78b236dba0df36/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/20941066a44cf50f96fb709891e828d434ec5dd2/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4a8ea3dd1709e1dd66cf5886df79a488339416ad/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/8454592dea0a3384e34e878f7aa6de918c44427d/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/25b8d0787ea9ae9fca538ae02791a0bf281382ca/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/47d8c498b4024c7d716b26dcf0afad7925934d2b/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/881ff319635b6a637a3ee6a75932d9aebad75f1a/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/e331ce781cf741bc3d21e94877fe6bdc6098a7d4/
   powerpc |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/9fb049b7765feb38021308d2b96d770c06578f50/
      sh4a |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/3cb869963d5694db9066ca02a52702ef43fc4759/
      mips |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/327ba706bea937a13d318886e020bc93ff0f7fd8/
   powerpc |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/5361517e1abf1685a23276c97b5f4acc4f81c589/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/e846bdf35ee0c46efd8fe989ef65670a07a84afb/
       arm |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/46513ae23848a9d079763a1a3e9cd1c461067967/


-- 
http://autobuild.buildroot.net
