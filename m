From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Mar 2008 21:44:21 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
In-Reply-To: <007a01c882ec$717efea0$080514ac@atmel.com> (Ulf Samuelsson's
	message of "Mon\, 10 Mar 2008 20\:40\:38 +0100")
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
	<008b01c88027$780e44a0$040514ac@atmel.com>
	<4D6547F3-9672-4606-90EA-88630B3565E9@valka.is>
	<20080307235344.GA6144@cloud.net.au>
	<87zlt7bmdg.fsf@macbook.be.48ers.dk>
	<042e01c882d4$d82aa450$f1c4af0a@atmel.com>
	<87skyy2yav.fsf@macbook.be.48ers.dk>
	<007a01c882ec$717efea0$080514ac@atmel.com>
Message-ID: <87pru21f8a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Ulf, you have added plenty of controversal stuff without discussing
 >> it on the list. 

 Ulf> I started off by giving a description to Eric what I wanted to
 Ulf> do in the beginning and this was acked by him. There has been
 Ulf> protest against several things which he acked.

And that's basically why we lost Bernard.

 >> I really don't see a simple cleanup like this being a big issue.
 >> 

 >> And no - with all respect, considering Eric's lack of involvement the
 >> last few years - I don't see that as being a solution. Most likely he
 >> isn't reading this thread at all.
 >> 

 Ulf> Then we do not have any way to resolve differences.
 Ulf> How do you plan to resolve this - by suggesting your way is the only way?

Simply by looking at the technical pro/cons. If the patch doesn't
cause any regressions, someone is ready to support it and it helps
cleaning stuff up it can go in for me. You have certainly added stuff
I don't need / use, but so what - As long as it doesn't interfere too
much with how I'm using BR it's fine by me.

John certainly seems to be serious about his work.

I think that's basically the only way to do it with a project without
a benevolent dictator.

 >> Do you have any TECHNICAL objections to the patch? If not, I would
 >> suggest we keep it.
 >> 

 Ulf> Yes, it is harder to process the information in each directory
 Ulf> using scripts.  That is enough for me.

Come on, just add -r to your grep. You already need to search
package/, toolchain/ and target/ anyway. That doesn't sound like a
real issue.

 Ulf> An alternative way of handling the problem is to have TWO trees.
 >> 
 >> That seems to me to complicate matters rather than solving any
 >> problems.

 Ulf> This will provide both the current structure and the structure
 Ulf> people want to move to.  If you think it is over complex, I am
 Ulf> happy if the current patches are reverted.

Bernard several times asked you to fork and do the atmel stuff in a
seperate branch. I still don't think that's a good idea considering
the limited amount of BR development ressources we have.

Let's stop coloring the bike shed and move on to bigger stuff.

-- 
Bye, Peter Korsgaard
