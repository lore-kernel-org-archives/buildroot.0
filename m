From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Feb 2014 23:17:00 +0100
Subject: [Buildroot] [PATCH 2/2] nut: disable parallel builds
In-Reply-To: <1392326275-25992-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Thu, 13 Feb 2014 22:17:55 +0100")
References: <1392326275-25992-1-git-send-email-romain.naour@openwide.fr>
 <1392326275-25992-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <87iosiodyb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > The build system has a race condition causing build failure,
 > so ensure make -j1 is used.

 > Fixes:
 > http://autobuild.buildroot.net/results/0dd/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/build-end.log

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
