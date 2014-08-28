From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Aug 2014 09:39:25 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/uclibc-ng: add support for
 uClibc-ng
In-Reply-To: <53FE6512.9050600@mind.be>
References: <20140811113124.GA19506@waldemar-brodkorb.de>
 <53FE6512.9050600@mind.be>
Message-ID: <20140828093925.6bbffb1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 28 Aug 2014 01:09:06 +0200, Arnout Vandecappelle wrote:

>  What a surprising lack of reaction on this patch! I'd have expected people to
> welcome this very much...

Yes, sorry for the lack of reaction. I definitely welcome this very
much!

>  However, I'll start with immediately burning it to the ground :-) I think the
> situation of uClibc-ng is very similar to eglibc: it's essentially the same
> package, just a different version of it. So, instead of creating a whole new
> copy, I think it's easier to maintain if it is one more uclibc version in
> package/uclibc/Config.in.

I definitely agree. For now, uclibc-ng build system and process is
essentially the same as the one of uclibc, so I'd prefer to see it
being handled by package/uclibc/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
