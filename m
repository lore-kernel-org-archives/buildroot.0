From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Sep 2016 23:51:01 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <7188ad8d-469c-f4f8-9411-46761b05bddf@mind.be> (Arnout
 Vandecappelle's message of "Thu, 1 Sep 2016 23:30:47 +0200")
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160901175221.GA5841@free.fr>
 <87k2evwiqd.fsf@dell.be.48ers.dk>
 <7188ad8d-469c-f4f8-9411-46761b05bddf@mind.be>
Message-ID: <87fupjwapm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > So, what's the idea:
 >> >   - remove all packages (easy)
 >> >   - keep as-is  (even easier)
 >> >   - only keep virtual packages (not easy at all)
 >> 
 >> Personally I would go for 1, but if 3 is doable without too much work /
 >> complexity (and you feel up for it), then that is also OK with me.

 >  Well, option 2 is not the end of the world either. The reason we consider it
 > now is that some complexity (1 line!) has to be added in the manual.mk to
 > continue supporting it. It is starting to violate the KISS principle, but not
 > overly so.

That and the fact that more than half the user manual content is this
list of packages, even though it doesn't have much value.

-- 
Venlig hilsen,
Peter Korsgaard 
