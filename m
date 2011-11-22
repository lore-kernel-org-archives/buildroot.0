From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Tue, 22 Nov 2011 14:51:53 -0600
Subject: [Buildroot] equivalent of a 'make modules'
Message-ID: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I am working with another program that builds itself against the kernel.  I
am using BuildRoot for making the kernel and filesystem.  It is believed
that the next step would be to do something like a "make modules" command so
that the kernel and filesystem can be rebuilt with this other program's
information in it.

 

In Buildroot, where I normally do the 'make' command, I tried 'make modules'
and got this message:

 

"No rule to make target 'modules'. Stop."

 

Is there an equivalent?

 

Thanks.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111122/44bd57ee/attachment.html>
