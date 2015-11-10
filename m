From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 07:17:25 +0100
Subject: [Buildroot] [git commit] Revert "system: Fix warning when
	selecting systemd"
In-Reply-To: <564114AF.4020103@mind.be> (Arnout Vandecappelle's message of
 "Mon, 9 Nov 2015 22:48:31 +0100")
References: <20151109205943.8954F81DE4@busybox.osuosl.org>
 <564114AF.4020103@mind.be>
Message-ID: <87h9kuqsy2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> The BR2_ROOTFS_MERGED_USR symbol is used to activate various workarounds for
 >> a merged /usr by packages, so it should be active even with a custom rootfs
 >> skeleton.

 >  The problem is that with a custom skeleton, we don't know if it is merged /usr
 > or not. If it is not merged, then our workarounds are wrong. But of course, with
 > a custom skeleton, all bets are off...

 >  I guess we should at least mention in a help text somewhere that for systemd
 > the custom skeleton must have merged /usr.

Or verify that it is merged like Yann told me on IRC. A patch doing that
should be on its way.

-- 
Venlig hilsen,
Peter Korsgaard 
