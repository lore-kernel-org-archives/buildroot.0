From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jan 2014 22:37:08 +0100
Subject: [Buildroot] [PATCH] libusb: do not depend on host-udev for host
	variant
In-Reply-To: <1391031187-3897-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 29 Jan 2014 22:33:07 +0100")
References: <1391031187-3897-1-git-send-email-arnout@mind.be>
Message-ID: <871tzqv5a3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Commit 25926af5 disabled udev support for the host variant, but forgot to
 > remove it from the (implicit) host dependencies.

 > Also reordered things to keep the HOST_* definitions together.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
