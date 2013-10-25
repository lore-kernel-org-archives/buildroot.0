From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Oct 2013 09:28:22 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-video-geode: only build on i386
In-Reply-To: <1382655055-3520-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 25 Oct 2013 00:50:55 +0200")
References: <1382655055-3520-1-git-send-email-arnout@mind.be>
Message-ID: <87y55h6c89.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > This package builds with -m32. In buildroot, we don't have multilib
 > support so only the 64-bit libraries are available, which can't be
 > linked against these 32-bit object files.

 > I've tested this with the Sourcery and buildroot toolchains - neither
 > works.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
