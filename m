From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 16 Aug 2011 14:59:57 +0300
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313484062.2127.13.camel@sven>
References: <1313137798.1017.5.camel@sven> <87ty9kh4sh.fsf@macbook.be.48ers.dk>
 <1313484062.2127.13.camel@sven>
Message-ID: <CALR4fELxZAaArCZ9c7SyJzOusP4V6ZBDEtcDhna1yUFFQH7E1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 16, 2011 at 11:40 AM, Sven Neumann <s.neumann@raumfeld.com>wrote:

>
> Do you have a suggestion on how to use udev with a kernel that does not
> yet have this option? We are stuck with 2.6.31 on one of our platforms
> and I haven't been able to get udev working with recent buildroot on
> this platform.
>
>
This init.d file woks for me on 2.6.32. I am using tmpfs for mounting udev.

Note that for udev 173 you will also need  a patch to compile with older
toolchains (look for in in the ML or the bugzilla).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110816/371d7630/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: S10udev
Type: application/octet-stream
Size: 1788 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110816/371d7630/attachment.obj>
