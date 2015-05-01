From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 May 2015 22:51:40 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: remove non-existent
	mips-sf musl toolchains
In-Reply-To: <1430497183-23847-2-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 1 May 2015 18:19:43 +0200")
References: <1430497183-23847-1-git-send-email-arnout@mind.be>
 <1430497183-23847-2-git-send-email-arnout@mind.be>
Message-ID: <87egn0uilf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Since 1.1.6, the mips softfloat toolchains are merged into the mips
 > toolchain using multilib. Our external toolchain infrastructure copies
 > the correct version to the target depending on the BR2_SOFT_FLOAT
 > option.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
