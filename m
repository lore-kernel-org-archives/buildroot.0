From: Beren Scott <berenscott@gmail.com>
Date: Tue, 17 Jul 2012 21:51:49 +1000
Subject: [Buildroot] Buildroot + udev
Message-ID: <CAK9Ae0OU+XtBVn1JEatDfSjRx-BFQ81U7=R4ZkCdrOHih45s1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build a buildroot setup with udev based on the current git.
What I was wondering, is if someone might be able to post maybe the steps
involved with this, as I seem to be having a lot of issue with it.

What seems to be mucking up, is the hard drives. I don't seem to be getting
any.

I have a short sysinit script which basically goes:

for i in /dev/[hs]d[a-h]
do
hdparm -I $i | grep "1000\*1000"
done

Basically to display the hard drive sizes, and I'm not getting hard drives.

Thanks for your time.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120717/f537793a/attachment.html>
