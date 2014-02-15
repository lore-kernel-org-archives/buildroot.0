From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Feb 2014 17:05:57 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: needs mmu
In-Reply-To: <1392479531-22613-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 15 Feb 2014 16:52:11 +0100")
References: <1392479531-22613-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87d2iojr8a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d2f/d2f673b71f771ab5a6435805e39338fd023f04c8/build-end.log

 > The complete log file says:
 > libMagickCore-6.Q16.so: undefined reference to `_fork'

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
