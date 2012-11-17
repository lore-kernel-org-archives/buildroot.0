From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 09:22:02 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
	on target
In-Reply-To: <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 10 Nov 2012 23:36:02 +0100")
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87d2zcwset.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As discussed during the ELCE 2012 Buildroot Developers Meeting, we no
 Thomas> longer want to support the possibility of building a toolchain for the
 Thomas> target. None of the core developers have any use for this, it has been
 Thomas> known to be broken or cause problems for a long time without anyone
 Thomas> providing fixes for it.

 Thomas> In addition to this, Buildroot is inherently a cross-compilation tool,
 Thomas> so the usage of a native toolchain on the target is not really
 Thomas> useful. Many newcomers are tempted to use this possibility even though
 Thomas> it is clearly not the intended usage of Buildroot.

Committed, thanks.

-- 
Bye, Peter Korsgaard
