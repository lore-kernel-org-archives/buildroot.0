From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 23:11:53 +0100
Subject: [Buildroot] [PATCH] Makefile: release: really drop build/docs
 from release tarball
In-Reply-To: <20190329211935.22375-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Mar 2019 22:19:35 +0100")
References: <20190329211935.22375-1-peter@korsgaard.com>
Message-ID: <87a7hdjpp2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit 15cb98769e4 (release: remove manual build files from release
 > tarballs) tried to remove the temporary files from the manual build from the
 > release tarball, but manual-clean only removes build/docs/manual and leaves
 > build/docs in the tarball.

 > Instead use 'make clean' to completely remove the build directory from the
 > tarball.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
