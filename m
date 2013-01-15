From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 10:34:03 +0100
Subject: [Buildroot] [PATCH v3] Makefile: rename cross target ->
	toolchain
In-Reply-To: <1358236920-14210-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Tue, 15 Jan 2013 09:02:00 +0100")
References: <1358236920-14210-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87wqven62c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 Fabio> - Use a more descriptive name, the same of the "toolchain" directory.
 Fabio> - Add missing dependencies to be able to successfully use the target
 Fabio>   right after the configuration.
 Fabio> - Move to a better position.
 Fabio> - Documentation it in the help target.
 Fabio> - Use toolchain target in the world target

 Fabio> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 Fabio> Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
 Fabio> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Fabio> Acked-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
