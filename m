From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-16
Message-ID: <20130517063004.5C9B352C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-16
===============================

        success : 79 
       failures : 47 
       timeouts : 3  
          TOTAL : 129

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 6 
                  iozone-3_414 | 3 
                    acl-2.2.51 | 3 
                  gnutls-3.1.9 | 3 
                 pixman-0.28.2 | 3 
               sconeserver-211 | 2 
                elfutils-0.155 | 2 
media-ctl-ac40b79f002a2315f... | 2 
               qt5webkit-5.0.2 | 2 
                      qt-4.8.4 | 2 
         host-gutenprint-5.2.9 | 1 
                  ne10-88c18f0 | 1 
                  lvm2-2.02.79 | 1 
                  readline-6.2 | 1 
             libfreefare-0.3.4 | 1 
                libtirpc-0.2.2 | 1 
            inotify-tools-3.14 | 1 
(cd /home/test/test/3/outpu... | 1 
                     m4-1.4.16 | 1 
                cifs-utils-6.0 | 1 
                 libnspr-4.9.2 | 1 
                bellagio-0.9.3 | 1 
      CXX    WebCore/page/libw | 1 
               aircrack-ng-1.1 | 1 
/bin/sed -i -e 's%^EGLFS_PL... | 1 
               audiofile-0.3.6 | 1 
                 binutils-2.21 | 1 
                   expat-2.1.0 | 1 
                  xerces-3.1.1 | 1 
                poppler-0.22.3 | 1 
           xlib_libXdmcp-1.1.1 | 1 
           imagemagick-6.7.8-8 | 1 

Detail of failures
===================

       arm |       CXX    WebCore/page/libw | TIM | http://autobuild.buildroot.net/results/3c17a8ee7981940f8384e738046658178f5bef1e/
       arm | (cd /home/test/test/3/outpu... | TIM | http://autobuild.buildroot.net/results/2ad7d8bb9968ed20c94895cf72d7e47f674c08a8/
   powerpc | /bin/sed -i -e 's%^EGLFS_PL... | TIM | http://autobuild.buildroot.net/results/a4267c4acdfcde7762796d557981b4ee0252af66/
    x86_64 |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/c45da8b6988401d33bca602cd2a2cafb8350c591/
       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/fe966158ed176b7546cd856d7cbc87f404b00c81/
       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/f179ddd9414fe6a6312724f4beeeb732ae97a461/
       arc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/0c0a4c2a0efa53a0dbfc7ed47a62d7efe5e7addc/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f9271b59f5915f7b5a35084cc0517eedacaf7ea6/
       arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/a4b7e19f4eee1de8d8722c2ade673fcb816a811e/
       sh4 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fa2a694347d9d4f121fd8f6eb23dd980b3f88192/
microblaze |                 cifs-utils-6.0 | NOK | http://autobuild.buildroot.net/results/17f3de71056732cc2cea8833feb13987b582a4cc/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/07d04c1ed4186c2b372a9447b02b05eebeb47e8a/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/487f1d5e38fe312b34d5b1ab21bdb07536b42d71/
       arm |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/d69b03fa48998b7cdfaf9e34167b4737e2f8e159/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/ad085764cd66beef562b424d02d1d8e4ffcd8f31/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/d915975ec007b83464da23fec015666ab0070f0a/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/6b1079ec115ab407c1f3334b6d4dcbdd7f1df20c/
       sh4 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/7697111bcde9b7a78fe3d9f37ca742972c6218d4/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/47101425c836189bdbc733f84fc23b7f109d31c6/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/1ea5a84549f03df86fce9dc1f14627c1beab9283/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/53c01e72acb04c6f4979b840e173adea5eb50482/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9243403e11dc5c1ba8c835e1f6868f9af4b0de19/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/86dd589411b1bfa3324eca786250edabce98e6c9/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/4b5f4abd69bbbf1e432a962fa5c34bf28e700cb1/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/6c3bbc145d68700c633bc83ed522d2901276e58b/
microblaze |             inotify-tools-3.14 | NOK | http://autobuild.buildroot.net/results/edb36d6c3d9b2f95be912a061d6b2a9d56e77472/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/6d0cef132ecbe76346b8b48ee298a751e6593640/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/1d8b7ff0c0b3b1ea75dee3c999a29feffa4e54e9/
microblaze |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/a9521d411d58e91c8419b24486ca32e4d9965c18/
       arc |              libfreefare-0.3.4 | NOK | http://autobuild.buildroot.net/results/26047ea2c0f897f6d1407195d5b2a00e85f22bf3/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/e52491ebefbac4f5938fbbf82a068d0345ea03c9/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/1f9a4edb0e51a130d3c3e62b6513a200aaf55724/
    xtensa |                   lvm2-2.02.79 | NOK | http://autobuild.buildroot.net/results/c797fc45c0726e03d7526380300bdb5b33e0d4f6/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/869e3d97c3cc3df24319f6571215927a82876ae8/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/94a77fc6b108a20b6dc6e983187014e61d442f30/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/c49dffbe9bf9cff52fa6bc12d9173dcada2f6b18/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/b2167ffe4a081467ec91bd33ab27be44cc3d1cb7/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/c6794acb34d1df6f97d2d384e2c2b27705c07d1d/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/4b6f6733b160644491b9cfdf03cc67f99966c144/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/fed2a772e0ab7d0470384b4a0482aa009c6f03b6/
   powerpc |                 poppler-0.22.3 | NOK | http://autobuild.buildroot.net/results/c4dcd0f22e6726b981a5f028f42d931d2c8004e4/
       arm |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/42920286e883a6c67057773a2eac5f949ba0d307/
    mipsel |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/52e1b1bbef6cc2209551c4084ac9b24dcc7f540d/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/2cfb2d4d9057cbd04dd472e962387e9fbe5fa401/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/f28f7deeec7030d1cb6163fd6264ddf5690fcfd3/
      mips |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/8d8030831f0584af357bec41ae98e1de49a69a68/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/be46bf53ee82db0df9378eaba29ae50e5d077f3f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/7753fbd84f3872c2e8e146669b8390b80ef062cf/
    x86_64 |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/738de63196507d7b8d01a13c5acaa3ba701cd065/
microblaze |            xlib_libXdmcp-1.1.1 | NOK | http://autobuild.buildroot.net/results/b2db78d8daf2f32fdbce14c504be1fab13ca2ba6/


-- 
http://autobuild.buildroot.net
