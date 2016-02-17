From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 22:10:22 +0100
Subject: [Buildroot] [PATCH 1/1] icu: fix build-time segfault by
	backporting upstream fix
In-Reply-To: <1455725382-32751-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 (Zoltan Gyarmati's message of "Wed, 17 Feb 2016 17:09:42 +0100")
References: <1455725382-32751-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <87oabfxcu9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

 > The icu bug http://bugs.icu-project.org/trac/ticket/11959 also
 > hit me, but oddly enough only when running build build server via
 > Jenkins. This patch adds the upstream fix for the mentioned bug, so the
 > patch most likely can be removed at the next version bump.

 > Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
