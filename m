From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 May 2013 23:33:21 +0200
Subject: [Buildroot] [PATCH] Makefile: make skeleton rsync options
	consistent
In-Reply-To: <1367464526-3028-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Wed, 1 May 2013 23:15:26 -0400")
References: <1367464526-3028-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87ehdpysm6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Initially, a "cp" was used for the one-time target skeleton
 Danomi> installation, and an "rsync" was used for the every-time overlay
 Danomi> skeleton installations.  Then, the target skeleton install was
 Danomi> changed to also use rsync (1cd3f992fb3659aacbb0cdd3ed64347a37569891).
 Danomi> Now there are two rsyncs, but with different filter specs, which
 Danomi> seems odd.

 Danomi> This patch adds --excludes to both invocations of rsync to make them
 Danomi> consistent, and removes the -u option from the initial target skeleton
 Danomi> installation.

 Danomi> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
