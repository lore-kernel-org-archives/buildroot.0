From: Frank Bergmann <bergmann@rosho.de>
Date: Fri, 13 Sep 2013 14:54:19 +0200
Subject: [Buildroot] running gtk programs fail
Message-ID: <52330AFB.1050204@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I'm trying to use the gtk toolkit and running into trouble.
If I start a small test program
(https://developer.gnome.org/gtk-tutorial/stable/c39.html#SEC-HELLOWORLD)
the window appears but no button. Also I'm unable to close the
window. Starting /usr/bin/gtk-demo fail too, nothing happens
(no window). I use xorg (modular) and fluxbox, blackbox and
enlightenment  work properly.

Did I miss something or is libgtk broken ?

Thanks,
Frank.
