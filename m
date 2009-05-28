From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 May 2009 15:05:16 +0200
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <20090528125849.GA23420@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 28 May 2009 22\:58\:49 +1000")
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272131h4aac2dceh86b7b8636031dc7d@mail.gmail.com>
	<87ws8176y8.fsf@macbook.be.48ers.dk>
	<20090528125849.GA23420@cloud.net.au>
Message-ID: <87iqjl74z7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> Seems like we'll have to make ubifsroot as broken for the 2009.05
 >> release :/

 Hamish> Oh, I fixed this in my tree at work I'm pretty sure, but
 Hamish> obviously forgot to send in a patch. mkfs.ubifs is included
 Hamish> in mtd-utils now, but you have to use the git version (it's
 Hamish> not in an mtd-utils release).

Ok, that's a pity. The 1.2.0 release (that we don't even have in BR)
is getting a bit old in the tooth (~1 year).

 Hamish> I haven't kept up with official buildroot lately, especially
 Hamish> since the switch to git. I'll see if I can send a patch to
 Hamish> the mailing list tomorrow.. I can't get to my code right now.

Thanks - Any specific problems with git?

-- 
Bye, Peter Korsgaard
