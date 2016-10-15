From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 19:36:11 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
	from the legal-info
In-Reply-To: <18b75237-c88f-586e-347c-d1c1a1d15cd5@mind.be> (Arnout
 Vandecappelle's message of "Sat, 15 Oct 2016 19:22:26 +0200")
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
 <878ttpbq72.fsf@dell.be.48ers.dk> <20161015153246.GG3668@free.fr>
 <ce7a11dc-d228-5724-9821-5ef47eb670dc@lucaceresoli.net>
 <18b75237-c88f-586e-347c-d1c1a1d15cd5@mind.be>
Message-ID: <87d1j1a510.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,
 >> 
 >> * FOO_GEN_LEGAL_INFO = NO: save nothing
 >> * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list only
 >> * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list + save source

The last is presumably FOO_REDISTRIBUTE = YES.

 >  I hate that we have all these combinations. That was actually my first thought
 > when I saw this patch: oh no, yet another variation point. But I don't see a way
 > to simplify it. So OK.

yeah, me too. I also cannot think of a simpler approach if we want to do
it.

I don't think it is really a big deal to list the virtual packages in
the legal info, and people doing funky stuff in br2-external can also
post process their legal info data to remove unwanted stuff if needed.

But OK, it doesn't add a lot of complexity, so if others think it is
worthwhile, I'm OK with it as well.

-- 
Venlig hilsen,
Peter Korsgaard 
