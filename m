From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 10 Mar 2008 22:55:41 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is><008b01c88027$780e44a0$040514ac@atmel.com><4D6547F3-9672-4606-90EA-88630B3565E9@valka.is><20080307235344.GA6144@cloud.net.au><87zlt7bmdg.fsf@macbook.be.48ers.dk><042e01c882d4$d82aa450$f1c4af0a@atmel.com><87skyy2yav.fsf@macbook.be.48ers.dk><007a01c882ec$717efea0$080514ac@atmel.com><87pru21f8a.fsf@macbook.be.48ers.dk><00aa01c882f4$1cfd90f0$080514ac@atmel.com><871w6i1d1w.fsf@macbook.be.48ers.dk>
	<87wsoaz2h6.fsf@macbook.be.48ers.dk>
Message-ID: <01a401c882fb$ca574be0$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>> Come on, just add -r to your grep. You already need to search
> >>> package/, toolchain/ and target/ anyway. That doesn't sound like a
> >>> real issue.
> 
> Ulf> I am talking about sed and awk which will be more difficult.
> 
> Peter> Then just do a find ..|xargs on those or use **/*.mk (if you use a
> Peter> proper shell).
> 

Yes, I can try to become an expert in shell programming, but
that is not on my top 100 list of things to do.

> >>> Bernard several times asked you to fork and do the atmel stuff in a
> >>> seperate branch. I still don't think that's a good idea considering
> >>> the limited amount of BR development ressources we have.
> 
> Ulf> He complained about things breaking, but this is bound to
> Ulf> happen.  He seemed to complain a lot on me, when patches in
> Ulf> reality came from others.  I know *his* patches caused me about
> Ulf> 3-4 weeks of extra work.
> 
> Peter> Well, it's very hard to be absolutely sure you don't break anything
> Peter> when you change something in a system like BR simply because of the
> Peter> number of config combinations you would need to test.
> 

Yes, however sometimes others can see that a patch has potential problems
in certain areas, and if pointed out I think that the submitter should do some extra testing.

> Peter> That ofcause doesn't mean we shouldn't be careful, just that random
> Peter> breakage is to be expected.
> 
> Peter> I've been playing a bit around with buildbot (http://buildbot.net) -
> Peter> And that looks quite nice.


> 
> Peter> -- 
> Peter> Bye, Peter Korsgaard
> 


Best Regards
Ulf Samuelsson
