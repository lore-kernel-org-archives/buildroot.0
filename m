From: oiermann <oiermann@web.de>
Date: Sun, 28 Mar 2010 12:47:27 +0200
Subject: [Buildroot] Troubles getting /proc mounted, no root rights? (ARM,
 mini2440)
Message-ID: <4BAF33BF.7000007@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

First, i have to say sorry for the first E-Mail with scrubbed HTML :( 
here in plain text:

  I've built an image for my mini2440-board and can't get proc mounted.
If i try to get the list of mounted devices, he tells me:

 >warning: can't open /etc/mtab: No such file or directory

Ok i thought, lets mount proc:

$ mount -t proc proc /proc
or
$ mount -t prc none /proc

But none of both worked:
 >mount: only root can do that

I log in with root and my password, if i try "whoami" and "cd ~ && pwd" 
he tells me "root" and "/root"... I've got the needed rights to write 
for example to /bin...

I've got the daily snapshot of buildroot from yesterday (march, 27th, 2010)

I hope anyone of you can help me.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100328/b15d9158/attachment.htm>
