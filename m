From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 May 2015 19:21:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/argp-standalone: is useless for
	(e)glibc toolchains
In-Reply-To: <1430562486-23625-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 2 May 2015 12:28:06 +0200")
References: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
 <1430562486-23625-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <87wq0pshjj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > According to Thomas's remark [1], (e)glibc toolchains provide it's
 > own argp.h version.
 > Also, it appears that argp.h from glibc is more up to date should
 > be preferred to argp-standalone one.

 > [1] http://lists.busybox.net/pipermail/buildroot/2015-May/127511.html

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > Note: I didn't add a comment in Config.in to tell that argp-standalone
 >       package is useless for (e)glibc toolchains.

I think it is OK to not display anything as it doesn't make sense on
glibc.

Committed, thanks.

-- 
Bye, Peter Korsgaard
