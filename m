From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 08:00:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-14
Message-ID: <20171115070039.B855E20671@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   5 |   2 |   0 |   7 |
      master | 116 |  29 |   0 | 145 |
        next |  21 |   4 |   0 |  25 |

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2017.07 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
------------------

       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/f9514ce384f48910b14ba59d1bd902572ebaadd2 |     
         arm |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/bd52302bf6654da6ec73a1cda53b865986635b76 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           oracle-mysql-5.1.73 | 4 
host-google-breakpad-7515ab... | 3 
                    php-7.1.11 | 3 
                   attr-2.4.47 | 2 
                  fwup-v0.15.4 | 2 
                   mp4v2-2.0.0 | 2 
            python-pyqt-4.11.3 | 2 
                       unknown | 2 
           argp-standalone-1.3 | 1 
                      feh-2.21 | 1 
google-breakpad-7515ab13768... | 1 
                     gpsd-3.16 | 1 
       kompexsqlite-v1.10.12-1 | 1 
             lttng-tools-2.9.5 | 1 
pdbg-77158819158d1d7053a737... | 1 
                      qt-4.8.7 | 1 
         xlib_libxkbfile-1.0.9 | 1 


Detail of failures
------------------

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2685a195752e51b2579da2a743e6dd8a0911dbd2 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/07f802cad86a23c9f283a75d21a66b9957d3b275 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/9a2021d087464f903e262aa062cebc78fe6b3e4c |     
        i686 |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/94527fcd70fa85298c366537013c939534beead0 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/7ce062eaa769598447ddaed156a70c5d40edb922 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/79f2ebed6d4fb2616afda44acb802d427af6c065 |     
     aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/228a30cccafd7dc89e308d7ca7a596449c2ae457 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/8421243ea42841549a09b5ee8c94194a9000494b | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/d9e0a2479c91de24ce07cf372912460760b0c9cc |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/87dfcaa7dbe7b8b5b686e08eb1540eee69000145 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/bdad55a7adb3f5ccd1e2ac7cf6d75cb389f68596 |     
         arc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/db85168da662f5cfa086b2bfb426005f9cb86020 | ORPH
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/b2670e6d1928649aefa7fbc748858e6036585f01 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/fc0f51f3ee1364f55248e8fe713995bc07f877c6 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8058914866f99ea9611d47be2d8a796b431510b1 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a1085bf549950c95af1038e25136fc07455babc4 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/97251de81d9b85de9b80b87a388a6bcb8f3de6f7 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/c0c5e63cc63bc438b338fe148099106818e3c109 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/047fc5bb512cbf6078888b786c59103c8397bb98 | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/d555cb9a8abdc495efbe578548cb3462d8c29a4e |     
      xtensa |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/3638da591ab1445f7b600b49feafd9d98e938d31 | ORPH
     powerpc |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/45d467976f39fe925f4737d991be12379ff138c3 | ORPH
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/e86ed6d4edc812492e6ab8dc04a25c90559885bc | ORPH
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2c52e1bfe7315460e6de6f8c6da087b56a40aec3 |     
     sparc64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/b0d3ee4f87df6b6eb2297753b9a2138f290bd8e5 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/374f107ce7a0973a55e2296a2d35492620951c18 | ORPH
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/fff1e216f666c487a18b6885417a1d67d53bc6e5 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/a0f2f2754aaac3cc1c8bffa673ccf7c23ed7aad4 |     
      xtensa |          xlib_libxkbfile-1.0.9 | NOK | http://autobuild.buildroot.net/results/458e729bf34e270b020b06f9721904e2482d7719 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
        host-xapp_bdftopcf-1.1 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                pinentry-1.0.0 | 1 


Detail of failures
------------------

microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/708f11809b2cafc2a3375dc515803c87b376ed4d |     
      x86_64 |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/28dcf6b6ecbe5969a716246bc1c35bf38397f52b |     
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/3e914b141c5f0a4ec24a102b26f1222cb4d438cc |     
      x86_64 |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/8fd656de06e6efad4dded6c26f958762d93ae7bd |     


-- 
http://autobuild.buildroot.net
