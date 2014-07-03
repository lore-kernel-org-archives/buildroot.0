From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Jul 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-02
Message-ID: <20140703063012.4FA97101718@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-02
===============================

        success : 94 
       failures : 18 
       timeouts : 1  
          TOTAL : 113

Classification of failures by reason
====================================

                    sdl-1.2.15 | 4 
                    fltk-1.3.2 | 3 
make: *** [core-dependencie... | 2 
                 webkit-1.11.5 | 1 
                   systemd-213 | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
                oprofile-0.9.9 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
          google-breakpad-1320 | 1 
          perl-net-ssleay-1.64 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                    parted-3.1 | 1 
                   lcdapi-v0.4 | 1 

Detail of failures
===================

    xtensa |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/a6562012192a96c565e4b844d9804d8abaef1fa8/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/0d0955b5b5875835481342ff765a4b056bfb553c/
      mips |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/7919fbe45826182bd04309517b43eb71de93ec0f/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/e0acfc8c289cfe2513f06193ba74e71ebfc377ba/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c8953fc46028e574cd343174ba57a66514621c69/
      bfin |                    lcdapi-v0.4 | NOK | http://autobuild.buildroot.net/results/7491be18636f33828cc7e5d44a2978f46ca5eaff/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/228690645b8cce2c33e23380b3681695122eab98/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/4d861f2979b7a432c410b4adf492825fe85047b6/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/ec8a4814575eaf86d233514b97d7a8cb7babdbb4/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/d4f51796170a17c2c4d411aae2d704885c742a6b/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/135867ef85535863e3647cc5fb82accb6f77612c/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/cd76ffd6f4752ade5eab2623aafd7701c214e8bb/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/f5c36837dbc92bee25833e5665844cd84e53d305/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/5fd6e9c5c39f2989e54f8e99c29b0944746f2321/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/1b4c04c3be8c393631c2d98b05f534cfaee95e84/
      i686 | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/ff98c0881aa229aa54b7ec78d36118aa231fdf1b/
       arm |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/5b03174318d8a6dc3112053ff141b70a90869c20/
      i686 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/b5464098d892e611aec5880811ddecec25b8b26c/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/a526e98cab473910178682ef37f74462aa5b4b0f/


-- 
http://autobuild.buildroot.net
