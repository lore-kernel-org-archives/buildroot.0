From: Petar Koretic <petar.koretic@qaap.io>
Date: Mon, 31 Jul 2017 10:28:58 +0200
Subject: [Buildroot] Qt 5.9.1 QML arm crash | QTBUG-61522
Message-ID: <CAKdiq5_FDrJNp8OXw3pQ5cByeBZXzg4WQ_qH3nk+HhrcpZEZfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

So I've tested Qt 5.9.1 from the master branch with Raspberry Pi 3 stock
build using glibc.
Unfortunately it is hit by a big QML bug that results in a crash when doing
a simple thing as

var x = {}

This is reported and will be fixed in 5.9.2
https://bugreports.qt.io/browse/QTBUG-61522.

I have tested the patch with buildroot and it does work correctly after that.
Would you be interested now in adding the patch until 5.9.2 is
released or will you be waiting for 5.9.2?

I don't see this over at https://bugs.busybox.net. Should I open it
there instead?

Best regards,
Petar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170731/86a437fc/attachment.html>
