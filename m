From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 10 Mar 2008 22:17:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:  package
References: <20080310152243.544A212C5F4@busybox.net><877iga5yy6.fsf@macbook.be.48ers.dk><007c01c882ec$733d2960$080514ac@atmel.com>
	<87wsoa1fpk.fsf@macbook.be.48ers.dk>
Message-ID: <00ab01c882f4$1dd68bd0$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
> Ulf> What happens if you want *some*   ".a" files in the target.
> Ulf> Didn't see the patch, just occured to me when I read this email.
> 
> Is that a realistic situation? E.G. we also only have a global switch
> for man and info pages.

Yes we are not perfect.

> 
> To me a global switch is nicer than all the per-package options we
> have now (and right now, certainly not all packages have dev support).
> 
> -- 
> Bye, Peter Korsgaard

I might be wrong, since I didn't look at the patch, but it looks
to me that the patch will clean out the directory if unset.

If the switch is there, then the files should be copied to th target directory.
If the switch was never there, then there should not be any such files in the target directory.
If the switch was there and is unset then I think the directory should be cleaned out
with an explicit command.




Best Regards
Ulf Samuelsson
