From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 May 2014 23:04:25 +0200
Subject: [Buildroot] [PATCH] infra: relax the check on
	BR2_TOOLCHAIN_BUILDROOT_VENDOR
In-Reply-To: <536934A4.6010206@mind.be> (Arnout Vandecappelle's message of
 "Tue, 06 May 2014 21:14:44 +0200")
References: <1399393667-15009-1-git-send-email-arnout@mind.be>
 <20140506195920.697ab409@free-electrons.com>
 <536934A4.6010206@mind.be>
Message-ID: <874n12fwkm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> What about using $(noconfig_targets) here, like is done in the main
 >> Makefile?

 >  D'oh, silly me. This patch is not necessary.

 >  I still have http://patchwork.ozlabs.org/patch/316667/ rebased on top of
 > master, and that patch reads .config even for the *config targets.

 >  So I've marked this patch as Not Applicable in patchwork.

Ahh, ok. I wondered why I hadn't hit this issue myself.

-- 
Bye, Peter Korsgaard
