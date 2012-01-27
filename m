From: inblueswithu <inblueswithu@hotmail.com>
Date: Fri, 27 Jan 2012 21:04:37 +0530
Subject: [Buildroot] Bug 3877 - Patch not working
In-Reply-To: <87wr8dji1h.fsf@macbook.be.48ers.dk>
References: <BLU0-SMTP12114F40C37660CBB539A15D28E0@phx.gbl>
 <BLU0-SMTP1654BA5FF86775DFCB3429FD28E0@phx.gbl>
 <87wr8dji1h.fsf@macbook.be.48ers.dk>
Message-ID: <BLU0-SMTP11894E10861A68A1582828ED28E0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>   inblueswithu>  Hi,
>
>   inblueswithu>  I 've got "undefined reference to `accept4'" this error
>   inblueswithu>  while using buildroot.  When I googled, I got this patch:
>   inblueswithu>  https://bugs.uclibc.org/attachment.cgi?id=
>   inblueswithu>  3415&action=edit
>
> uClibc will only add an accept4() function if your kernel headers expose
> sys_accept4, which for ARM was only added in 2.6.36.
>
> Make sure your kernel headers (and runtime kernel) is atleast 2.6.36.
Thank You for your reply. This might be the problem, I'm working on this 
right now.

    Peter Korsgaard <jacmet@uclibc.org> a ?crit :

    According to his .config file, the kernel headers used were 2.6.35, so
    I guess you found the right spot.

Thank you for that quick reference & suggestion

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120127/29965166/attachment-0001.html>
