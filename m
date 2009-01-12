From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 12 Jan 2009 09:42:31 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
References: <20090112000650.6225C76736@busybox.osuosl.org>
	<87bpudjaxl.fsf@macbook.be.48ers.dk>
Message-ID: <3E6BC440132F4E6AAB290D7AFA898029@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
> ulf> Author: ulf
> ulf> Date: 2009-01-12 00:06:49 +0000 (Mon, 12 Jan 2009)
> ulf> New Revision: 24777
> 
> ulf> Log:
> ulf> Sudo source package IS at DEBIAN, but with a different name
> 
> Ok, so this reverts your revert and we're now back to my 24763
> version?
> 

No, your patch breaks the build, because the filename has changed
from the original name.

Best Regards
Ulf Samuelsson


> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
