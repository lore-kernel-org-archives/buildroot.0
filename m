From: John Voltz <john.voltz@gmail.com>
Date: Tue, 29 Apr 2008 08:29:18 -0400
Subject: [Buildroot] x86 linking
Message-ID: <46a136670804290529s520dbc97if728241104f03d15@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been building for x86 and struggling with a problem that I don't fully
understand. I'm hoping someone here can shed some light on it for me. I've
found that a few libraries are getting relinked against the host libraries,
I'm guessing during the "make install" phase. If I look in the build
directories there are two .so files. One is properly linked, the other ends
in a capital T and is linked against the host, and this is the one that gets
installed to the TARGET_DIR. Is libtool responsible for this, and how can it
be fixed? So far I have found this problem with gtk, glib, pango, xcb, and
openmotif. Anyone have an idea why this happens?

Thanks,
John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080429/6e2fa593/attachment.htm 
