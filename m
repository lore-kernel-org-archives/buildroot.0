From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:47:41 +0100
Subject: [Buildroot] [PATCH] package/proftpd: security bump to version
 1.3.6c
In-Reply-To: <20200227135457.13710-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 27 Feb 2020 14:54:56 +0100")
References: <20200227135457.13710-1-peter@korsgaard.com>
Message-ID: <87wo7mvq6q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-9273: In ProFTPD 1.3.7, it is possible to corrupt the memory pool
 >   by interrupting the data transfer channel.  This triggers a use-after-free
 >   in alloc_pool in pool.c, and possible remote code execution.

 > And additionally, fixes a number of other issues.  For details, see the
 > release notes:

 > https://github.com/proftpd/proftpd/blob/1.3.6/RELEASE_NOTES

 > This also bumps the bundled libcap, so
 > 0001-fix-kernel-header-capability-version.patch can be dropped.

 > While we are at it, adjust the white space in the .hash function to match
 > the new agreements.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
