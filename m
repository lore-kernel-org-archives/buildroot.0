From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:55:21 +0200
Subject: [Buildroot] [PATCH] perl: add upstream security fix for
 CVE-2018-12015
In-Reply-To: <20180612152130.32491-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 12 Jun 2018 17:21:30 +0200")
References: <20180612152130.32491-1-peter@korsgaard.com>
Message-ID: <874li1o1au.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-12015 - In Perl through 5.26.2, the Archive::Tar module
 > allows remote attackers to bypass a directory-traversal protection
 > mechanism, and overwrite arbitrary files, via an archive file containing a
 > symlink and a regular file with the same name.

 > Patch from
 > https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5
 > with path rewritten to match perl tarball.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
