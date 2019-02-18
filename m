From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:50:15 +0100
Subject: [Buildroot] [PATCH 1/1] python-cython: bump to version 0.29.5
In-Reply-To: <20190218212953.21179-1-joseph.kogut@gmail.com>
References: <20190218212953.21179-1-joseph.kogut@gmail.com>
Message-ID: <20190218225015.7a10cb2b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Feb 2019 13:29:53 -0800
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Updated license file checksums after a minor change to URLs.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---

This patch doesn't apply to the next branch:

buildroot (next)$ git pwam 1044341
Applying patch #1044341 using "git am -s"
Description: [1/1] python-cython: bump to version 0.29.5
Applying: python-cython: bump to version 0.29.5
error: patch failed: package/python-cython/python-cython.hash:1
error: package/python-cython/python-cython.hash: patch does not apply
error: patch failed: package/python-cython/python-cython.mk:4
error: package/python-cython/python-cython.mk: patch does not apply
Patch failed at 0001 python-cython: bump to version 0.29.5
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
