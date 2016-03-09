From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 13:00:41 +0100
Subject: [Buildroot] [PATCH 1/2] configs/altera_socdk_defconfig: use
	http access for u-boot/linux git repos
In-Reply-To: <1457524712-2697-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Wed, 9 Mar 2016 12:58:31 +0100")
References: <1457524712-2697-1-git-send-email-peter@korsgaard.com>
Message-ID: <87vb4v274m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/114650743

 > git:// access to git.rocketboards.org has been failing for a while, and
 > git:// is sometimes not allowed through corporate firewalls, so change to
 > git-over-http instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

FYI, I've also copied the tarballs to sources.buildroot.org now, so the
defconfigs should no longer break if git.rocketboards.org is down.

-- 
Venlig hilsen,
Peter Korsgaard 
