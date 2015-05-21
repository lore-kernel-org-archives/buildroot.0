From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-20
Message-ID: <20150521063016.28D56100E54@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-20
===============================

        success : 289
       failures : 11 
       timeouts : 6  
          TOTAL : 306

Classification of failures by reason
====================================

       host-erlang-rebar-2.5.1 | 6 
            lttng-libust-2.6.0 | 1 
                   tinc-1.0.24 | 1 
                   ncurses-5.9 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                    qemu-2.3.0 | 1 
                 libssh2-1.5.0 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                  newt-0.52.18 | 1 
rpi-userland-8f542a1647e6f8... | 1 
             gdk-pixbuf-2.30.8 | 1 
                  weston-1.7.0 | 1 

Detail of failures
===================

      x86_64 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/aaa7519c65069039845c75483dd1147bae9bd50c/
      x86_64 |              gdk-pixbuf-2.30.8 | NOK | http://autobuild.buildroot.net/results/76b550da06fe547716f089e46d96a1406043268a/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/3771dde39762179adad2a8fb6a6c0a6f1d6bb75b/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/73d491670cb29ab68cb8552b4b9bd82d31571e62/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/6fa3af465bdb33590b10a5ae932f5d3963725923/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/4665a8128af43e01e17be44dbe1239ed813ff1a0/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/89d162a0d548d1b20385059159fc80eaf120f06c/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/c2077912d1fc792151392766fb7cc0b94f027e48/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/fa7d2617d480ffc154fdaaba4020f7c424a804a9/
        i686 |             lttng-libust-2.6.0 | NOK | http://autobuild.buildroot.net/results/cac7015c3be7e34dbeaa6accb59aebebe68eb6d2/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/64d8ccf6ad0aa2e50c909a6230529be4ecf340aa/
         arc |                   newt-0.52.18 | NOK | http://autobuild.buildroot.net/results/a400e1fe7291d3bd3171ad04ce5fd7ba235d39af/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/29e55ed66fddfe1baa0e98901cbb0d288314f674/
      x86_64 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/dfccb2ab1cc831390a80816393cdf44e3b46f9d3/
         arm | rpi-userland-8f542a1647e6f8... | NOK | http://autobuild.buildroot.net/results/ba82769109f205123834627bbf782bd1811ea43e/
      xtensa |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/7d791ea3a3d1415a90333cd0bcdf14ca0b58a6c8/
        sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/f433ec176ec85cdf3a7be5fa5552c92c37183e5b/


-- 
http://autobuild.buildroot.net
