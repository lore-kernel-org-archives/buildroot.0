From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 10 Mar 2008 20:40:38 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is><008b01c88027$780e44a0$040514ac@atmel.com><4D6547F3-9672-4606-90EA-88630B3565E9@valka.is><20080307235344.GA6144@cloud.net.au><87zlt7bmdg.fsf@macbook.be.48ers.dk><042e01c882d4$d82aa450$f1c4af0a@atmel.com>
	<87skyy2yav.fsf@macbook.be.48ers.dk>
Message-ID: <007a01c882ec$717efea0$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Ulf> It is not OK, to introduce this without discussing it on the
> Ulf> list though.  Luckily, we have a method to resolve a controversy
> Ulf> and that is to let Eric decide.  I think we should give him
> Ulf> maybe a week, and only if no reply the patches should be
> Ulf> reverted.  (With possible resubmit, if Eric comes back later
> Ulf> with ACK)
> 
> Ulf, you have added plenty of controversal stuff without discussing
> it on the list. 

I started off by giving a description to Eric what I wanted to do in the beginning
and this was acked by him. There has been protest against several things
which he acked.


> I really don't see a simple cleanup like this being a big issue.
> 

> And no - with all respect, considering Eric's lack of involvement the
> last few years - I don't see that as being a solution. Most likely he
> isn't reading this thread at all.
> 

Then we do not have any way to resolve differences.
How do you plan to resolve this - by suggesting your way is the only way?

> Do you have any TECHNICAL objections to the patch? If not, I would
> suggest we keep it.
> 

Yes, it is harder to process the information in each directory using scripts.
That is enough for me.

> Ulf> An alternative way of handling the problem is to have TWO trees.
> 
> That seems to me to complicate matters rather than solving any
> problems.

This will provide both the current structure and the structure people want to move to.
If you think it is over complex, I am happy if the current patches are reverted.

> 
> -- 
> Bye, Peter Korsgaard
>

Best Regards
Ulf Samuelsson 
