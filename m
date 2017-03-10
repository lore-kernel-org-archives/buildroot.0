From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 14:22:04 +0100
Subject: [Buildroot] [PATCH 2/3] configs: snps_archs38_vdk: use same
	headers as kernel
In-Reply-To: <20170310123558.22033-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Fri, 10 Mar 2017 13:35:57 +0100")
References: <20170310123558.22033-1-arnout@mind.be>
 <20170310123558.22033-2-arnout@mind.be>
Message-ID: <87efy59shv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Instead of downloading a *different* version of the kernel for the
 > headers as for the headers itself, use the same one.
 > BR2_KERNEL_HEADERS_AS_KERNEL is the default, but we have to set the
 > custom version.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
