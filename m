From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Oct 2010 23:14:20 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: do not require
	full path
In-Reply-To: <20101016204702.67E958D282@busybox.osuosl.org> (Mike Frysinger's
	message of "Sat, 16 Oct 2010 16:46:44 -0400")
References: <20101016204702.67E958D282@busybox.osuosl.org>
Message-ID: <871v7pet77.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> commit: http://git.buildroot.net/buildroot/commit/?id=d2f7323f78e449cf195df73e334fa39440127a9e
 Mike> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 Mike> If the toolchain can be found via $PATH, then requiring the full path to
 Mike> it is unnecessary.

Thanks, but please don't commit to the buildroot tree directly. We use a
setup like the kernel, so send patches/pull requests like everyone else.

-- 
Bye, Peter Korsgaard
