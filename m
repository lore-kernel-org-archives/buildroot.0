From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-10
Message-ID: <20131111073024.89D8452C665@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-10
===============================

        success : 83 
       failures : 37 
       timeouts : 0  
          TOTAL : 120

Classification of failures by reason
====================================

                 qt5base-5.1.1 | 4 
               alsa-lib-1.0.26 | 2 
               libglib2-2.36.3 | 2 
                    zlib-1.2.8 | 2 
                  iozone-3_414 | 2 
                 libnspr-4.9.6 | 2 
                   mdadm-3.2.6 | 1 
                 ffmpeg-0.8.15 | 1 
                  poco-1.4.6p1 | 1 
                  bustle-0.4.2 | 1 
          libmicrohttpd-0.9.31 | 1 
        gst1-plugins-bad-1.2.0 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                  boost-1.54.0 | 1 
             uclibc-0.9.33-arc | 1 
                     apr-1.4.8 | 1 
                log4cxx-0.10.0 | 1 
             util-linux-2.23.2 | 1 
                  aespipe-2.4c | 1 
                     popt-1.16 | 1 
           binutils-2.23.2-arc | 1 
                      icu-51.2 | 1 
                      qt-4.8.5 | 1 
          host-protobuf-c-0.15 | 1 
                 webkit-1.11.5 | 1 
              vim-699f8d8f096d | 1 
                 binutils-2.21 | 1 
                 binutils-2.22 | 1 
                     m4-1.4.17 | 1 

Detail of failures
===================

      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/fcbd8337628dcf150d8acec9b62f57d35725df3f/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/dd155d75332594d5a4c972381b4610289be2ecd2/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e7a38ea60075fb9f6aaa0e8734ecb5ed225a9096/
      mips |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/ae9d4fa8ebc06b98841662544e321ab9d2720eda/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/0b443547eb5027437289ff527918b0e3f5d93ee9/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/4f6f05293c61906b169ddfcd9a239cc9393b626e/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/62f3bcf3a2b2336b699cb4828094e3f31aca5db8/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/bfcf4d1090fafad024425887c5f6e0a85f7cad14/
   powerpc |                   bustle-0.4.2 | NOK | http://autobuild.buildroot.net/results/265985c3f4573e7cfccd7f9e2cd3d1808c1b613f/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/a97bce5e1655457a754ad686038c1b1bf1a5cbf1/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/6846e1e7c065e0f49c86ad64ffee3f8554f49a24/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cdc3e1f8977bd8e826434c415faa5aadd4788ab5/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ef387d82ca422b7bfee9b324e918de343ae4ece0/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/e21526c0c18733310d3fb322d79d5fff3a71af51/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/2246668a7115629f603eb14cf5b7ad3dcc1639fb/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/883b70808e6ac949ebf673f0a08d16ee149428bd/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c7f1775da06a34f714620458b287b1433c4d1bc2/
     avr32 |           libmicrohttpd-0.9.31 | NOK | http://autobuild.buildroot.net/results/dbdc86321c6c85703dd9aed3f974843203124d92/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/82a235882ff0d1668057aaa01de797d92c43c46c/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/05fc1dc4606de9f314bed5451460a6921a66babb/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/7b73901d9e8b5098cd96b54d292bb3ffffb3fe37/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/1873968ce75c23ea0166eacc8e41210c5479bf85/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/4c3856b131146899d25e8590427c9cc1aeb1b431/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/520124925a802899223f930e9702b6d7271cbb06/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/a651a8295e2e6b2060715d9798a6bcba17e59f9e/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/0a9e636d65ddc82eeb9307d82adca272f132ca4a/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/775497e0c6b17944c2392932b39f0ffb3b4d1ac3/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/ec990785d3dc2d575b5021d350d0daf96a4f6f48/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/aa39dcf8075c1267b697f6cf04c6cac70caeb1ba/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b1e1dd88d6be686e90443bd259b73584965fa493/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/455dde4a7814f50f0981de656304960a4592d85d/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/db4fb4ce017fa4d3bd08cd48eec71582d15658fc/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c58c5d388c81ec6fb80cb589ccea8ded61fa4b2c/
    x86_64 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/4fd73ce741ef71b907ceeed16aa332dff836fc03/
    x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0b0f60df178592db2733a6cf21d104210220c983/
      mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/31f98d9b42c293d75afc34bd9e9d19965e824bd8/
      mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/d4ed04240b1ba10de620faf8200ce4f76f8fb74a/


-- 
http://autobuild.buildroot.net
