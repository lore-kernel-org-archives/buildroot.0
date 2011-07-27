From: Avishay Orpaz <avishorp@gmail.com>
Date: Thu, 28 Jul 2011 00:30:22 +0300
Subject: [Buildroot] Getting Kconfig menu right
Message-ID: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
I'm trying to add python-fuse to buildroot. I have the makefile working, but
there is only one little problem left. I would like the option for
python-fuse to show up as a sub-item of libfuse, only when libfuse is
checked. It should be similar, for example, to lua - when selected, some
relevant sub-options appear as sub-items in the xconfig menu. I looked very
closely on the lua Config.in, but found nothing that tells Kconfig to show
all the options as a sub-items.
How can I do this?

Thanks,
Avishay
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110728/637ad47e/attachment.html>
