From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:14:38 +0200
Subject: [Buildroot] [PATCH v2 04/17] uclibc: add patches to simplify
 Thumb handling
In-Reply-To: <56ED743C.9070500@mind.be>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ED743C.9070500@mind.be>
Message-ID: <20160330001438.5b545763@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 16:46:04 +0100, Arnout Vandecappelle wrote:

> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

>   Upstream status? Knowing Waldemar's lightning reflexes, we will probably just 
> bump the uClibc version rather than having these patches in Buildroot :-)

I've submitted upstream 10 days ago. Got a bit of feedback from Rich
Felker, but I replied to it and I don't think the feedback calls for a
new iteration. No feedback from Waldemar so far.

Note that the version sent upstream is in one single patch, as that's
what Waldemar requested on IRC. I'm going to apply my patch to
Buildroot with the separate patches, and I'll rework that later on
when/if the patch gets accepted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
