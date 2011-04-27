From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 27 Apr 2011 14:58:27 +0200
Subject: [Buildroot] [PATCH] libnl: bump to version 2.0
In-Reply-To: <87zknbyhso.fsf@macbook.be.48ers.dk>
References: <4DB7D29E.5000101@visionsystems.de>	<87liywylxb.fsf@macbook.be.48ers.dk>
	<4DB8116B.901@visionsystems.de>
	<87zknbyhso.fsf@macbook.be.48ers.dk>
Message-ID: <4DB812F3.3000602@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.04.2011 14:56, schrieb Peter Korsgaard:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>  >> Out of interest, how did you create this patch? It doesn't have the nice
>  >> diffstat overview like git format-patch normally creates.
>
>  Yegor> Just quilt :-) I'm working with various version control systems, so quilt is a versatile tool for me. But the patch could be applied without any problems?
>
> Sure, diffstat is just nice to get a quick overview of what the patch
> does.
>
> I use:
>
> QUILT_REFRESH_ARGS="--diffstat --no-timestamps"
>
> in my ~/.quiltrc
>

O.K. I see thanks for the hint. My

~/.quiltrc

looks like that:
QUILT_REFRESH_ARGS="-p ab --strip-trailing-whitespace"

So I'll extend it.
