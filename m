From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 18 Jun 2008 11:22:06 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
In-Reply-To: <20080618084529.3973AF8007@busybox.net>
References: <20080618084529.3973AF8007@busybox.net>
Message-ID: <20080618092206.GE32192@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 01:45:28AM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2008-06-18 01:45:23 -0700 (Wed, 18 Jun 2008)
>New Revision: 22407
>
>Log:
>proftp: bump version and fix compilation on 2.6.24+
>
>Based on patch by Thiago A. Corr?\234a.
>
>
>Added:
>   trunk/buildroot/package/proftpd/proftpd-1.3.1-bcopy.patch

this sounds like it should work without patching by just configuring
properly. Also these patches are usually named "susv3.*legacy" for
consistency.

>   trunk/buildroot/package/proftpd/proftpd-1.3.1-fix-kernel-header-capability-version.patch

That one would make me nervous if i would use proftpd but there
is vsftpd anyway and luckily i don't do neither.
