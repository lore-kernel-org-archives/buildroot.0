From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 14:52:46 +0200
Subject: [Buildroot] [PATCH] strace: unavailable for AArch64 and ARC
In-Reply-To: <1368274699-417-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 11 May 2013 09:18:19 -0300")
References: <1368274699-417-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gj53cgx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> strace isn't available for the AArch64 and ARC architectures.
 Gustavo> The patchset for AArch64 is somewhat big and complicated (needs updates
 Gustavo> to other bits) so it'd probably be better to use a git version of strace
 Gustavo> or wait for a new release.
 Gustavo> http://autobuild.buildroot.net/results/506f4adec348f0b616ad09bddbcbc242e38253b8/

Committed, thanks.

-- 
Bye, Peter Korsgaard
