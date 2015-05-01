From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 May 2015 22:46:05 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-external: add hashes for musl
	toolchains
In-Reply-To: <1430497183-23847-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 1 May 2015 18:19:42 +0200")
References: <1430497183-23847-1-git-send-email-arnout@mind.be>
Message-ID: <87ioccuiuq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Add hashes for all musl toolchains, including the ones that we
 > currently don't support (arm hf, sh4, x86_64-x32).

Committed, thanks.

Why don't we support those toolchains?

-- 
Bye, Peter Korsgaard
