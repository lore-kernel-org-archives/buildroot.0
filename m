From: Will Newton <will.newton@gmail.com>
Date: Wed, 10 Jun 2009 16:50:53 +0100
Subject: [Buildroot] make problem: complain about ../../src/memory.c
In-Reply-To: <300894.70873.qm@web53505.mail.re2.yahoo.com>
References: <300894.70873.qm@web53505.mail.re2.yahoo.com>
Message-ID: <87a5b0800906100850l122b7ee3y35e1b927f03487df@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 10, 2009 at 4:35 PM, jing han<jing_han_66@yahoo.com> wrote:
>
> Hi All,
>
> I downloaded the latest buildroot release buildroot-2009.05.tar.gz , try to install to my linux Fedora Core 5 system (linux 2.6.15).
>
> I did make configmenu, then I did make, but make broke at:
>
> ../../src/memory.c: In function '__mp_memquery':
> ../../src/memory.c:769: error: lvalue required as left operand of assignment
> make[1]: *** [memory.o] Error 1
>
> Then I browsed buildroot mailing list, and found on July 2007, there was a report about x86 packages
> report this problem and other problems. ?And I encounter this ?problem when I use the ?newest buildroot release.
>
> Can you let me know how to get aroud it? And can you provide me a patch to fix this?

Do you need to build mpatrol? You could try disabling the mpatrol
package, it is only useful for certain kinds of memory debugging.

> I'm looking forward to hearing from you. Thanks a lot.
>
> Best Regards
> jing
>
>
>
> ? ? ?__________________________________________________________________
> The new Internet Explorer? 8 - Faster, safer, easier. ?Optimized for Yahoo! ?Get it Now for Free! at http://downloads.yahoo.com/ca/internetexplorer/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
