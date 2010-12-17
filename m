From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 17 Dec 2010 08:35:24 -0500
Subject: [Buildroot] [PATCH 47/55] linux: support a space-separated list
	of patches
In-Reply-To: <871v5ghh35.fsf@macbook.be.48ers.dk>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<201012161722.00016.vapier@gentoo.org>
	<871v5ghh35.fsf@macbook.be.48ers.dk>
Message-ID: <201012170835.26604.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, December 17, 2010 04:41:18 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger writes:
>> also, this patch reminds me of common problem in buildroot.  why do
>> people use `dirname` and `basename` ?  these really should be
>> letting the shell do it like ${f##*/} and ${f%/*}.  or use make's
>> builtins.
> 
> You cannot use make function as it's part of a shell loop

i was making general statements

> but shell
> builtins could be used, sure - Even though shell parameter expansion in
> combination with make escape rules starts to resemble line noise ;)

perhaps, but i'd prefer line noise over excess build forks/execs.  i think 
though it's more a matter of training your eyes to recognize these things.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101217/f1c8a6e4/attachment.pgp>
