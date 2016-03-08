From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:13:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/owfs: Install owfs in staging
 directory
In-Reply-To: <B68AA701312B47E08D135DD8EDFAA4E6@ROLANDAMD64>
References: <B68AA701312B47E08D135DD8EDFAA4E6@ROLANDAMD64>
Message-ID: <20160308211352.6a484fea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Roland Franke,

Thanks for the patch. However, it didn't apply properly, because you
should use 'git send-email' instead of "Microsoft Windows Live Mail" to
send your patches. When applying your patch, here is what happens:

Applying patch #594313 using 'git am -s -3'
Description: [1/1] package/owfs: Install owfs in staging directory
Applying: package/owfs: Install owfs in staging directory
fatal: corrupt patch at line 10
error: could not build fake ancestor
Patch failed at 0001 package/owfs: Install owfs in staging directory
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

On Tue, 8 Mar 2016 20:53:48 +0100, Roland Franke wrote:
> Install package in staging directory, so that this package can be linked 
> together with other packages (By me with collectd and the onewire plugin)
> 
> Signed-off-by: Roland Franke <fli4l@franke-prem.de>

This " at " should have been "@" in the Signed-off-by line.

That being said, I fixed up those issues locally and applied the patch.

Please submit your collectd/onewire changes to make use of owfs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
