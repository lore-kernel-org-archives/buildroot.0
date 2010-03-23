From: Muhammed ER <er.muhammed@gmail.com>
Date: Tue, 23 Mar 2010 11:01:24 +0200
Subject: [Buildroot] Qt error.
Message-ID: <f70863321003230201l3573678cx3eaf40954eec82dc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
This is my fist post. If I send e-mail wrong place, remind me.

I need a RootFS which includes, Qt.

For adding Qt, It need c++ library. ok, I opened it.

In "qt.mk" file,
I commet
line 489 #        -nomake examples \
line 490 #        -nomake demos \

So it tries to install /usr which is in MY PC.

I think,
line 485:       -prefix /usr \
and it doesn't write because of permissions.

will be $(TARGET)/usr or something like this.

Thanks,
Muhammed ER.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100323/5a1704f2/attachment.htm>
