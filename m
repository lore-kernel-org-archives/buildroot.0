From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Feb 2014 17:00:39 +0100
Subject: [Buildroot] [PATCH 3/3] infra: replace BUILDROOT_CONFIG with
	BR2_CONFIG.
In-Reply-To: <1391527132-20103-3-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 4 Feb 2014 16:18:52 +0100")
References: <1391527132-20103-1-git-send-email-arnout@mind.be>
 <1391527132-20103-3-git-send-email-arnout@mind.be>
Message-ID: <87y51k1djs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > To make the naming consistent (all user-visible options should be
 > prefixed with BR2_).

 > An entry is added to Makefile.legacy to warn users who have set
 > BUILDROOT_CONFIG but not BR2_CONFIG.

 > Still export BUILDROOT_CONFIG but pointing to some phony value, to
 > make sure that scripts that still use it fail in a predictable way.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
