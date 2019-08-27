From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Aug 2019 23:15:59 +0200
Subject: [Buildroot] [PATCH] package/strace: fix build with v5.2 kernel
 headers
In-Reply-To: <8b26b1e1fe517cdb7e414a47c7b5d6733ea4d638.1566895620.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 27 Aug 2019 11:47:00 +0300")
References: <8b26b1e1fe517cdb7e414a47c7b5d6733ea4d638.1566895620.git.baruch@tkos.co.il>
Message-ID: <87y2zeia28.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch with a workaround to incompatible change in kernel
 > headers.

 > Regenerate the v4l2_pix_fmts.h header which is pre-generated from
 > v4l2_pix_fmts.in in the strace tarball.

 > Fixes:
 > http://autobuild.buildroot.net/results/5494c9e21e623a9b7d87e06d86ed5e95d696c21a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I was about to apply this to master until I noticed that the patch
didn't apply to the version we have in master and the autobuilder issue
was for next - So applied to next instead, thanks.

-- 
Bye, Peter Korsgaard
