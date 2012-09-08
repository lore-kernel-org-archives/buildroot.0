From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 7 Sep 2012 22:01:23 -0400
Subject: [Buildroot] problem with sudo patch file name
Message-ID: <CANxTyt5k19J-iyEXg4FZfmtNZVJL+qnCKYUo9PSeGf=D5C6NJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I recently started to update our project to buildroot-2012.08.  When I went
to check into source control, I got an error from this file:


package/sudo/sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch

The problem is the colon (":") in the file name.  I think the problem is
that our source control system is on a Windows server

Would there be interest in a patch that renames this file to remove the
colon?  We could change the colon to an underscore or dash, but I see that
the upstream commit number is in a comment at the top of the patch, so I
don't know that naming the file after the upstream commit number is
actually helpful.  Maybe "sudo-1.8.5p2-backport-cross-compile-fix.patch"
would be better?

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120907/6a819d40/attachment.html>
