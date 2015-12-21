From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Mon, 21 Dec 2015 10:55:43 -0300
Subject: [Buildroot] QT5 and EGL display
Message-ID: <CAFMv-cxijKErcPy=ZptgjfXskpnUS8LZMW2KSgkeV8novFGB3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Maybe this is not a pure buildroot question, but I couldn't find any help.

I'm using buildroot 2015.11 to cross-compile for an Atmel board.
I enabled QT5, and then mesa3d to enable Qt widgets.

But when I tried to run a simple QT application, I got the following
message:

#./App
Could not open egl display
Aborted
#

Any tips or suggestions?
Best regards,
Leonardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151221/7dcbea8b/attachment.html>
