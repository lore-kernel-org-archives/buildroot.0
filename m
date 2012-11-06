From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 06 Nov 2012 09:58:28 +0100 (CET)
Subject: [Buildroot] [PATCH] add new package fxload
In-Reply-To: <5098536C.5060903@mind.be>
Message-ID: <27204261.196.1352192268013.JavaMail.rosen@pcrosen>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>   Here goes...
> 
>   First of all, we prefer the patches to be sent in-line rather than
>   as
> attachment.  That makes it easier to review by just replying to the
> mail.
> git send-email is the easiest way to contribute.
> 

ok, i'll do take two of the patch using git-send-email, but I'm struggling a bit with the smtp server here at work. I'll try to get it to work...


>   Also I'll warn you: it may take a while (months) before your patch
>   is
> accepted even if you make all necessary correction, and we may even
> forget
> to include it in the end.  That's not because we're evil :-) but
> because
> our contribution process is still sub-optimal.  Buildroot has grown
> significantly in number of contributions over the last two years, and
> our maintainer (Peter Korsgaard) is just saturated.  We're still
> experimenting
> with ways to improve the process.
> 

Fair enough, i'm a maintainer for other FOSS projects, so I know how that sort of problem go...

is Peter the only one comitting ? couldn't someone help with simple patches (like updating version of existing packages) 

> 
>   Add a Signed-off-by line for yourself.  This is a short way for you
>   to
> assert that you are entitled to contribute the patch under
> buildroot's
> GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for
> more
> details.

ok, will do .

BTW, your link is dead, a minute of googling and I found 

http://elinux.org/Developer_Certificate_Of_Origin
and
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/SubmittingPatches

which might be the same thing or close enough to point people to the next time my noob question is asked

> 
>   BTW, if you want to add additional comments that aren't supposed to
> go in the git log message (e.g. "this is my first patch, please give
> feedback", add it below the Signed-off-by line, separated by ---.
> Then git-am will remove that part automatically.  If you send an
> updated patch, it's nice if you can write in this comment section
> what
> changed compared to the first one.  So typically you'll see:
> 
> Signed-off-by: ...
> ---
> v2: Incorporated comments from Arnout, except for the foo because
> blah.
> 

I am a bit confused how the text of the message I give to git-send-email mix up with the commit message,

should I just put my personal text after the --- line directly in the commit message (before git-send-email) ?


[snip : comments on the patch itself]

ok, i will do all that for V2

> 
>   Overall, it looks very good, though.  Congratulations!
> 

thanks, V2 will be even better :D
