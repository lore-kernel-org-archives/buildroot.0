From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 08:27:43 +0200
Subject: [Buildroot] [PATCH] busybox: bump version to 1.28.2
In-Reply-To: <20180329162251.30655-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 29 Mar 2018 18:22:51 +0200")
References: <20180329162251.30655-1-peter@korsgaard.com>
Message-ID: <871sg284dc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Drop 0003-tar-unzip-postpone-creation-of-symlinks-with-suspici.patch now upstream.
 > From the release notes:

 > Bug fix release.  1.28.2 has fixes for tcpsvd (fixed fallout from
 > opt_complementary removal), udhcpd (do not ignore SIGTERM), tar and unzip
 > (reverted to previous, more permissive symlink handling), ssl_client (fixed
 > option parsing).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
