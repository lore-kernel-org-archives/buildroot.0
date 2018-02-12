From: David Corrigan <piense@gmail.com>
Date: Mon, 12 Feb 2018 13:13:10 -0600
Subject: [Buildroot] PI Board login prompt
Message-ID: <CAA4dnqUoW0b=buUfEfPDFr6OAOdpLgDyp14RY6-eN8EOV8dk3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey gang,

Just started using 11.2 and noticed that the Pi board config doesn't
respect the "Run a getty prompt" option in the menuconfig. Looks like
board/raspberrypi/post-build could use a check for that menu item. Not
entirely sure how to go about adding it in but if someone could put that in
future versions it'd be nice.

Thanks,
David Corrigan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180212/e862fcd6/attachment.html>
