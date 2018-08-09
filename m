From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Aug 2018 23:18:51 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mono: remove target
 mips architecture"
In-Reply-To: <20180809221533.42090817@windsurf> (Thomas Petazzoni's message of
 "Thu, 9 Aug 2018 22:15:33 +0200")
References: <1533817887-8771-1-git-send-email-angelo@amarulasolutions.com>
 <1533817887-8771-2-git-send-email-angelo@amarulasolutions.com>
 <20180809221533.42090817@windsurf>
Message-ID: <87zhxvdyro.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Thu,  9 Aug 2018 14:31:27 +0200, Angelo Compagnucci wrote:
 >> This reverts commit 0f96073561badde3c7abdf338abca7d00dba56dd cause the
 >> newly released mono version (5.14.0.177) fixed the bug upstream.
 >> 
 >> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

 > I can't apply this one right now, because disabling Mono on MIPS was
 > done on master after 2018.08-rc1 was tagged, and the next branch is
 > based on 2018.08-rc1.

 > I'm not sure if Peter prefers:

 >  - that we wait until 2018.08 is released to merge back next into
 >    master before applying this patch

 >  - that we cherry-pick just
 >    0f96073561badde3c7abdf338abca7d00dba56dd from master to next and
 >    then apply your patch to next

 >  - that we merge master into next right now and apply your patch

 > Peter ?

 > I don't like option (1) because it leaves a patch waiting in patchwork.

I guess option 2 should be fine and not really cause any issues when
merging next into master, right?

-- 
Bye, Peter Korsgaard
