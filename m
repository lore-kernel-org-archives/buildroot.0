From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 22:34:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/libfuse: bump version to 2.9.9
In-Reply-To: <20190402205602.1823-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Apr 2019 22:56:02 +0200")
References: <20190402205602.1823-1-peter@korsgaard.com>
 <20190402205602.1823-2-peter@korsgaard.com>
Message-ID: <8736mwp4wy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Contains a number of fixes for issues discovered post-2.9.8.  From the
 > release notes:

 > - Fixed readdir bug when non-zero offsets are given to filler and the
 >   filesystem client, after reading a whole directory, re-reads it from a
 >   non-zero offset e.g.  by calling seekdir followed by readdir.

 > https://github.com/libfuse/libfuse/releases/tag/fuse-2.9.9

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
