From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 23:41:17 +0100
Subject: [Buildroot] [PATCH] glibc: add 2.19 as a supported version
In-Reply-To: <52F936C7.4040300@mind.be>
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be>
Message-ID: <20140210234117.352533a5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 10 Feb 2014 21:29:59 +0100, Arnout Vandecappelle wrote:

>  How useful is it to offer a choice for the libc version?
> 
>  For uClibc it makes a tiny bit of sense because you may have custom
> patches or a custom config, which you don't want to port when going to a
> new buildroot version. But I don't think that's a very good reason to
> begin with.
> 
>  For glibc, however, I really don't see a reason to keep multiple versions.

My plan was to offer no more than two versions: N-1 and N, so that we
can add N, and give it some testing before having all users move
immediately from N-1 to N. This is pretty much what we do with gcc,
binutils and gdb as well. I believe the toolchain components are quite
critical, that's why we're a bit more conservative with these than with
the other components.

Do we have a reason to keep multiple versions for binutils, gcc and
gdb, but not for glibc?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
