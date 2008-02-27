From: Rex Ashbaugh <rexa@xeratech.com>
Date: Wed, 27 Feb 2008 08:52:03 -0700
Subject: [Buildroot] Problem with iperf
In-Reply-To: <220361.72868.qm@web23403.mail.ird.yahoo.com>
References: <220361.72868.qm@web23403.mail.ird.yahoo.com>
Message-ID: <6311fe0b0802270752y787dbc92v640d690d43b51a24@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NWFPE is the floating point emulator.

00000002 is a floating point divide-by-zero.

try another version of iperf maybe?
report this problem to the iperf maintainer?
-Rex


On 2/27/08, Nicola Salvemini <nicolasalvemini@yahoo.it> wrote:
>
> Hi all,
>
> I have a ARM arm926t (it's a little-endian) target platform and I use
> buildroot to cross-compile applications.
> I include iperf in the package selection for the target and the build
> phase go to the end without problems, but when I try to use iperf on the
> target, I take an exception:
>
> NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
> NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
> NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
>
> Could you please give me an idea to resolve the problem?
> Thanks in advance,
>
>
> Nicola.
>
>
>
>
>
>       ___________________________________
> L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail:
> http://it.docs.yahoo.com/nowyoucan.html
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080227/b090f3e5/attachment.htm 
