From: Bernhard Weirich <weirich@riedel.net>
Date: Tue, 31 Mar 2009 12:00:32 +0200
Subject: [Buildroot] how to add user to rootfs?
Message-ID: <1238493632.14498.11.camel@hactar.vie.riedel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have added a new user to /etc/shadow and /etc/passwd but how do I tell
genext2 that the directory /home/user does not belong to root?
There is some magic going on that /home/default is owned by "default" in
the resulting rootfs but I have not understood how it works.
Can anyone help me on this?

Thx,
Bernhard Weirich
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090331/12359a33/attachment.htm>
