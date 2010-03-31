From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 17:18:24 +0300
Subject: [Buildroot] init segfaults when compiled with glibc
In-Reply-To: <4BB2794A.3030400@free.fr>
References: <4BB20A06.1090407@browserseal.com> <4BB2794A.3030400@free.fr>
Message-ID: <j2i478c82f01003310718gbaf125f7t382a3dd8ac5b3823@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 31, 2010 at 1:20 AM, Eric BENARD <ebenard@free.fr> wrote:

> Le 30/03/2010 16:26, Sasha Sirotkin a ?crit :
>
>  As I already mentioned, it works fine with uClibc, so it is definitely
>> not a CPU instructions issue. At any rate, my CPU is AT91, i.e. armvte
>> instruction set.
>>
>>  AT91RM9200 is armv4
>
You are right, nevertheless the isssue, i.e. init sudden death is not
related to the instruction set - as I already mentioned, it works just fine
with uClibc. The problem appears only when I use external glibc based
toolchain.


>
> Eric
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/689a90b7/attachment.htm>
