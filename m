From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-16
Message-ID: <20140417063009.B2279100D24@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-16
===============================

        success : 53 
       failures : 44 
       timeouts : 0  
          TOTAL : 97 

Classification of failures by reason
====================================

                     mtd-1.5.1 | 8 
              jquery-ui-1.10.4 | 7 
           host-nodejs-0.10.12 | 4 
                  python-2.7.6 | 2 
                  zeromq-4.0.1 | 2 
           xapp_xdriinfo-1.0.4 | 2 
               libsigsegv-2.10 | 1 
                 wayland-1.4.0 | 1 
                  snmppp-3.3.4 | 1 
               alsa-lib-1.0.26 | 1 
             lttng-tools-2.4.0 | 1 
            lttng-libust-2.4.0 | 1 
                     monit-5.7 | 1 
make: *** [core-dependencie... | 1 
                     nmap-6.40 | 1 
                    fbgrab-1.2 | 1 
                  xerces-3.1.1 | 1 
                  cppcms-1.0.4 | 1 
                 mplayer-1.1.1 | 1 
                 webkit-1.11.5 | 1 
                 mesa3d-10.0.4 | 1 
                 libnspr-4.9.6 | 1 
                      qt-4.8.5 | 1 
             dosfstools-3.0.26 | 1 
                 qt5base-5.2.1 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/656192072f08e6e45a24a87b568be5a5f7e3210b/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/db87c4861cff78ffd8019f224748c908eec9a826/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/c360300cc3212eadcf29f864bb3b92270978355c/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/2d88c936f76d979d0efc7956b4c5d960667ac3a5/
    x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/493daca4d73298df683c73c833f16782d92f3d8d/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/f6b80ae32acf7f89bb1c12999679ff1be9733d44/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/eb60fb989c252c2f7ddac9cd4d778e001e77228e/
    x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/8d46ca8ed5d1a00622393477e2a5aaaa4af742f4/
   powerpc |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/a0937887e3a395ac6b8d32ac71d3e7c62244d40b/
      i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/da377d7c8e5210bf221c09178dfe8fe3ca59c813/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/4a3e6093f1c0a54c653d8e3ed3bc8781739e2cf0/
     avr32 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/dfeff1eb7464afce359adcf38a7a611062562bb4/
      mips |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/5a7832ed8e62b1c0859e2a2a3d3ae77c0e2fa917/
microblazeel |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/17e075d388dcb69458fd7595f1cd95d518ceb41d/
      i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/ab4ace43dccadf51119f20396c10e3362259fb2a/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0b81ee67ea52ce6078abec1f2339aaf5f6e983d7/
microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/dd583e1c11bba814cd0f124eeeffeca5657a0aa9/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a88e2af7cd1ece12213da52c8dd687f8d6813299/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/09fbf27931715b1d19765401aa0834188602349f/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/a7bd26d799ab7293afce03a1df56f107338b65b0/
     avr32 |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/88d1f04450f0866ec3a357950f26b2cd77015790/
      bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/0f3654e8d5b0bb83caa99d1c607c1c968ca9439f/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/7b3c89fcd496c0bc80063f63ecd58c827e8077ea/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/3892840e3a38847c295d615acb65cb1dfd65d079/
       arm |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/45aa2aedf223a7fb987f49da4ea7a22531e057b9/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/fedbdc7eba51d789fe5a2da13eb6a37bce71cd33/
   powerpc |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/9424e93e6fe61fa5a124b00b283d7f628da7e8da/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/d52aa6d02887f922e66c670de7589814211b6bed/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/5db18c162c53c93460c4d58599804dad069fc2ec/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/d54d3255d765e0bbb5a472829ff08cbb5e35169a/
      i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/e5e582942755c1038ed1faedc398422f7c244e25/
   powerpc |                      nmap-6.40 | NOK | http://autobuild.buildroot.net/results/40269fd96a3b62fa187e9b26e5ab4ce4e7711f95/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/1b32d9dfa41c6435ff8a7c27bfe8ab4a6576faa4/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/0a070674d3f8bdb547cbea6c86068f2d0a2ed235/
    xtensa |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/a54f3707781dc193292eda7d1723fce6487d6980/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/e3b26ee314880fdb50bb774a0539bfba04d9fbcf/
   powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/d7cd279e8e0145c2cd0d8611512af83be6379e72/
      bfin |                  wayland-1.4.0 | NOK | http://autobuild.buildroot.net/results/3cdb49166c07fe04c8c76a82e5b3072746937d21/
      sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b46334b877119e66a8ccfe23179ec222cdc2274a/
       arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/f7af081048ad967ed4a76afd8c527395f7b0c2dc/
       arm |            xapp_xdriinfo-1.0.4 | NOK | http://autobuild.buildroot.net/results/90a8226a8a2978eb13d02645cb9e3d95d9b95757/
    xtensa |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/8a8a0f8cca293ce1f383421ba8b1223b4266e3bc/
       arm |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/80a53ca3a299327e6646e7aea24a008c2214e190/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/e6dcf7b21fc7f066a62e9ec85d8e6b89e9687f5b/


-- 
http://autobuild.buildroot.net
