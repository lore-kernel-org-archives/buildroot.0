From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 12:03:17 +0200
Subject: [Buildroot] svn commit: trunk/buildroot:
	package/nfs-utils	package/ruby package/t etc...
In-Reply-To: <20070822094425.30FA4A610C@busybox.net>
References: <20070822094425.30FA4A610C@busybox.net>
Message-ID: <20070822100317.GB8174@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 02:44:25AM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-08-22 02:44:25 -0700 (Wed, 22 Aug 2007)
>New Revision: 19638
>
>Log:
>- fix patch regex

just as a sidenote..

There is one single incorrect invocation of patch-kernel.sh's regex left
in target/device/Atmel, in case you want to fix that, too.

HTH,
