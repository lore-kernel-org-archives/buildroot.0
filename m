From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Sep 2016 20:57:46 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <20160901175221.GA5841@free.fr> (Yann E. MORIN's message of "Thu, 
 1 Sep 2016 19:52:21 +0200")
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160901175221.GA5841@free.fr>
Message-ID: <87k2evwiqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Why do we _HAVE_ to continue to support it?

 > I was going to prepare a patchset to remove the list of packages from
 > the manual, when I stumbled on *one* reason parts of it is interesting
 > to have in the manual: the list of virtual packages, their symboles and
 > their providers.

 > I think this is worth having in the manual, if at least for packagers of
 > new packages that would need or provide such a virtual package.

Perhaps.

 > However, I think the normal and deperacted packages should be removed,
 > and our script made much simpler (if at all possible).

 > So, what's the idea:
 >   - remove all packages (easy)
 >   - keep as-is  (even easier)
 >   - only keep virtual packages (not easy at all)

Personally I would go for 1, but if 3 is doable without too much work /
complexity (and you feel up for it), then that is also OK with me.

-- 
Venlig hilsen,
Peter Korsgaard 
