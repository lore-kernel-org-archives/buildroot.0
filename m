From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-14
Message-ID: <20130515063004.93D2852C166@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-14
===============================

        success : 83 
       failures : 34 
       timeouts : 3  
          TOTAL : 120

Classification of failures by reason
====================================

                libtirpc-0.2.2 | 4 
                 pixman-0.28.2 | 3 
               sconeserver-211 | 3 
               libglib2-2.30.3 | 3 
                  zeromq-3.2.3 | 2 
               alsa-lib-1.0.26 | 1 
                    crda-1.1.3 | 1 
                  iozone-3_414 | 1 
                  fan-ctrl-1.3 | 1 
   ./CXX -c xplc-cxx/strtouuid | 1 
              matchbox-lib-1.9 | 1 
                directfb-1.6.3 | 1 
                  gnutls-3.1.9 | 1 
         host-gutenprint-5.2.9 | 1 
      gst-plugins-good-0.10.31 | 1 
(cd /home/test/test/1/outpu... | 1 
              ti-utils-06dbdb2 | 1 
                  ne10-88c18f0 | 1 
                mongrel2-1.8.0 | 1 
/home/test/test/2/output/ho... | 1 
                      qt-4.8.4 | 1 
               wvstreams-4.6.1 | 1 
                   mplayer-1.1 | 1 
                 cairo-1.12.10 | 1 
           imagemagick-6.7.8-8 | 1 
                    urg-0.8.18 | 1 
media-ctl-ac40b79f002a2315f... | 1 

Detail of failures
===================

       sh4 | (cd /home/test/test/1/outpu... | TIM | http://autobuild.buildroot.net/results/66b4f30e47a719a5b67f043357e4e6c037058ece/
       arm |    ./CXX -c xplc-cxx/strtouuid | TIM | http://autobuild.buildroot.net/results/803cbb2c5e83495e890a6cbec302a8be695564bc/
       arm | /home/test/test/2/output/ho... | TIM | http://autobuild.buildroot.net/results/514e2b7aae39e7b22444f4a41dc478b1e5337a23/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4803a6c0b1f1ce409aa3bb3e9cb4a3d4e24dcfc1/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/68553af65b78a290ffeba90a2623f142266669b4/
       arc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b5ba8a3a5cda2aab70fdc990c74413a1bd22c647/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/507ccd74e0722f6a13c73b23bdc78d6281c3cfa6/
      bfin |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/333b6caa6b8a9a04495d82d02b2c0fb7755667ed/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/3815adfaa7b49a5c1e10641736911be10d95a6a0/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/8e1588ea2796439e67805b75b0423a080326bb39/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/dbc8d60d98a36f7586a705d8ea62ed0a1131de67/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/46e09cad53655fa1458f07c6761fcf1e2a621798/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/5bf5750a98430d8adf9814a6385650e4ed7e9fc6/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/cf842351e8f2c147d9ab06135040b5c2cf912b9b/
       arm |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/3d3f4f0044a4b58ce3d0a3449a5f012d953d59bb/
       arm |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/0b2cdd9606797f37e7efd821f75c9d57993c5dfa/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e3cd3549a604051967218ac4e87e5ad9dd82bf97/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e7076a27fd2452dac51ab1eb43e8b2630bc92866/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/59251cac792bfab5ae9fb654c07f04f729237d44/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/2086c533f84f7c073e1175fad45dc561faca5aad/
   powerpc |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/77cb4d0a851ebb9e0bd02e69811f4879ae88a9eb/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/53e1c5c46251b9156eced16423d059eae489b72d/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/688d017729977d5084052d9f268a1250949b8c4f/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/99dd3f24de7e2c847987c5f77b67eb1431e69e01/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/507fc515d1f1a6e9dfac9eec3145b79353036baf/
microblaze |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/285d508749018ad4cd16d1606bec06fbe8ff3cdb/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/5a0f5391d8504655df07f7f48f5133f4846dfe52/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/1ba5d82da89868da57fd2dee1fb6d2e880b2f288/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/b64c9f98236001f9b2cf53a8b99af8d319999e64/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/8b2ddf95e30a9c8fb7441a3b0cd7af57bd301dce/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/19dc07f4fb2a08a52417aa71efcef6b20df8f802/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/fcbab2cefe1c4108810b3d9e22c4c832671610af/
   powerpc |               ti-utils-06dbdb2 | NOK | http://autobuild.buildroot.net/results/6ddc7565a094b2bab25865138372605adc2e15fe/
   aarch64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/6af5c0f822429f303f96cee0e9fb664d29b6ecc9/
    mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2ed6f0e43a7f71832a1c07a87790caad53b56dc4/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/6781eb11738133ef892c61138d899ca9a8ad5990/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/8a44664561bbdda713bc6f45961ed73d12a498d0/


-- 
http://autobuild.buildroot.net
