From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Mar 2019 17:55:33 +0100
Subject: [Buildroot] [git commit] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190227090354.1923082A9D@busybox.osuosl.org> (Peter Korsgaard's
 message of "Wed, 27 Feb 2019 10:05:49 +0100")
References: <20190227090354.1923082A9D@busybox.osuosl.org>
Message-ID: <877ecxa1a2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=905e976a6af224b3ed015c46fcea2d717c155f55
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes:
 > http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

 > Add dependency on headers >= 3.11 for O_TMPFILE, used by runc after the
 > fix for CVE-2019-5736 and propagate to the reverse dependencies of runc.

 > Notice that C library support for O_TMPFILE is also needed, which was added
 > in glibc 2.19 and musl 0.9.15.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > [Peter: squash series, extend commit message, mention C library dependency,
 > 	fix indentation]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
