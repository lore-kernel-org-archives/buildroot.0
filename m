From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 15:29:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: fix glibc build
 errors
In-Reply-To: <20200817192712.32481-1-vfazio@xes-inc.com>
References: <20200817192712.32481-1-vfazio@xes-inc.com>
Message-ID: <20200818152909.2029354a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

Thanks for having looked into this issue!

On Mon, 17 Aug 2020 14:27:12 -0500
Vincent Fazio <vfazio@xes-inc.com> wrote:

> diff --git a/package/ibm-sw-tpm2/0002-Add-required-defines.patch b/package/ibm-sw-tpm2/0002-Add-required-defines.patch
> new file mode 100644
> index 0000000000..c9e2f19bd2
> --- /dev/null
> +++ b/package/ibm-sw-tpm2/0002-Add-required-defines.patch

All patches must have a proper Git commit message, with a description
and Signed-off-by line.

However, in this case, I think this shouldn't be a separate 0002 patch:
the patch 0001 that makes use of LONG_BIT should be adjusted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
