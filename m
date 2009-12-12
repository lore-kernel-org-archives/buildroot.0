From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 12 Dec 2009 13:30:37 +0100
Subject: [Buildroot] [PATCH 4/6] package: Added libdvdread package
 (dependency of gst-plugins-bad)
In-Reply-To: <87ljh8tybd.fsf@macbook.be.48ers.dk>
References: <1260487878-21126-1-git-send-email-llandwerlin@gmail.com>
	<1260487878-21126-5-git-send-email-llandwerlin@gmail.com>
	<1260584626.9059.19.camel@coalu.atr>
	<87ljh8tybd.fsf@macbook.be.48ers.dk>
Message-ID: <1260621037.9059.25.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 12 d?cembre 2009 ? 09:02 +0100, Peter Korsgaard a ?crit :
> >>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:
> 
>  Lionel> This one was broken too...
> 
> It was? It built ok here. From what I can see, the only difference
> between what I committed and this (besides the upstream URL) is that you
> now turned off the libtool patching - Why?
> 

There 3 versions of the patch :

- the first one, you had committed and which works, even if the libtool
patch is probably useless.
- the second, which is broken because the autoreconf & libtool was
removed.
- the third, which only use autoreconf and which works.

I said the second was broken, but you probably haven't tested it,
because you already committed the first.

Thx a lot for your patience.

-- 
Lionel Landwerlin
