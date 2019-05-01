From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 22:21:35 +0200
Subject: [Buildroot] [PATCH] package/go: bump version to 1.12.4
In-Reply-To: <20190429214417.29701-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 Apr 2019 23:44:17 +0200")
References: <20190429214417.29701-1-peter@korsgaard.com>
Message-ID: <878svqexio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a number of issues discovered since 1.12.1.  From the release notes:
 > go1.12.2 (released 2019/04/05) includes fixes to the compiler, the go
 > command, the runtime, and the doc, net, net/http/httputil, and os packages.
 > See the Go 1.12.2 milestone on our issue tracker for details.

 > go1.12.3 (released 2019/04/08) was accidentally released without its
 > intended fix.  It is identical to go1.12.2, except for its version number.
 > The intended fix is in go1.12.4.

 > go1.12.4 (released 2019/04/11) fixes an issue where using the prebuilt
 > binary releases on older versions of GNU/Linux led to failures when linking
 > programs that used cgo.  Only Linux users who hit this issue need to update.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For 2019.02.x I have instead bumped the version to 1.11.9.

-- 
Bye, Peter Korsgaard
