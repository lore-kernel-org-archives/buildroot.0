From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:33:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/libgpg-error: bump to version
 1.33
In-Reply-To: <a310feb727c90725d66a7506af583445a3eb3ec2.1547570248.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Jan 2019 18:37:26 +0200")
References: <a310feb727c90725d66a7506af583445a3eb3ec2.1547570248.git.baruch@tkos.co.il>
Message-ID: <8736ptr77x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The syscfg header name is now based on the target triplet, with the
 > vendor part set to "unknown". The symlink approach no longer works since
 > we use "buildroot" for the vendor part. Override the target host
 > configure parameter to match the build system expectation.

 > The x86 header vendor part has been renamed to "unknown" as well.
 > Account for that in BR2_PACKAGE_LIBGPG_ERROR_SYSCFG.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
