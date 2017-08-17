From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 08:31:01 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-16
Message-ID: <20170817063101.6427820F69@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-16
================================

      successes : 152
       failures : 10 
       timeouts : 0  
          TOTAL : 162

Classification of failures by reason
====================================

                openocd-0.10.0 | 2 
                           all | 1 
                libressl-2.5.5 | 1 
                librsync-0.9.7 | 1 
libzip_la-zip_file_strerror.lo | 1 
          mediastreamer-2.14.0 | 1 
                    mpv-0.25.0 | 1 
                    norm-1.5r6 | 1 
                      qt-4.8.7 | 1 


Detail of failures
===================

    mips64el |                            all | NOK | http://autobuild.buildroot.net/results/5456fcae10f69de592807e1860e80484cc895d81 |     
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/8c839a6771ff9b1351854aa8c0062ea9dd2efcec |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/4a1931565674442c6117b2b202a002dd0ec12a4b | ORPH
         arm | libzip_la-zip_file_strerror.lo | NOK | http://autobuild.buildroot.net/results/34e8ac60c09f1c3da9ca80d76d347fc434e38846 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/293c8af2ff39ae1b5e535ceafa583ded334e22eb | ORPH
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/12e6471b8efece773084ea7844805c82a51c69e8 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/6ef5294d8f887a6251f85cf731e71191f4854c58 |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/002f0792a6b47748e742655446f0e98858e7f146 | ORPH
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/cd3f5b7329f45c2b75ed319caef3c6aa0e94ee2e | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fc7300ad40ac50f9e4ab1d3f604e825fe7af9185 | ORPH

-- 
http://autobuild.buildroot.net
