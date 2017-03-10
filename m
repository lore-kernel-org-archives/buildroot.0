From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Mar 2017 14:22:51 +0100
Subject: [Buildroot] [PATCH 3/3] gitlab-ci: add gcc-multilib to the
	docker image
In-Reply-To: <ababc3f3-7361-5c87-627b-3c94047664b6@mind.be> (Arnout
 Vandecappelle's message of "Fri, 10 Mar 2017 13:37:11 +0100")
References: <20170310123558.22033-1-arnout@mind.be>
 <20170310123558.22033-3-arnout@mind.be>
 <ababc3f3-7361-5c87-627b-3c94047664b6@mind.be>
Message-ID: <87a88t9sgk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 10-03-17 13:35, Arnout Vandecappelle (Essensium/Mind) wrote:
 >> This is needed for defconfigs that use sylinux.
 >  D'oh!                                   ^^^^^^^syslinux, obviously.

Committed after fixing that typo, thanks.

-- 
Bye, Peter Korsgaard
