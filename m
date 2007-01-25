From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Thu, 25 Jan 2007 14:28:42 +0100
Subject: [Buildroot] __getpgid in glibc but not in uClibc?
In-Reply-To: <1369.63.193.249.101.1169730868.squirrel@webmail.aerende.com>
References: <1369.63.193.249.101.1169730868.squirrel@webmail.aerende.com>
Message-ID: <200701251428.42661.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Can't you use getpid()?

PS.
http://www.novell.com/coolsolutions/feature/15355.html

/ Alexander

On Thursday 25 January 2007 14.14.28 nina.holly at aerende.com wrote:
> I have an application that requires __getpgid.
> This system call appears to be in glibc.
>
> 1.  Is the __getpgid system call in uClibc?
>     If so, can someone tell me how to enable the
>     compilation of __getpgid in uClibc?
>
> 2.  If Q#1's answer is no, is it possible for
>     __getpgid to be added from glibc to uClibc as
>     source code?  Or does __getpgid need to be
>     rewritten for uClibc?  Or can I inline the
>     __getpgid source code in my application's
>     source code?
>
> Thanks for any pointers,
>
> Nina
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
