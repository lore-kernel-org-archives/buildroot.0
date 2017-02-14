From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 11:20:54 +0100
Subject: [Buildroot] [PATCH] bctoolbox: fix typos and logic error
In-Reply-To: <20170214090132.GA5012@waldemar-brodkorb.de>
References: <20170214090132.GA5012@waldemar-brodkorb.de>
Message-ID: <20170214112054.3e092c84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for looking into this build issue and fixing it. Just one
comment below.

On Tue, 14 Feb 2017 10:01:32 +0100, Waldemar Brodkorb wrote:

> diff --git a/package/bctoolbox/0001-fix-typo.patch b/package/bctoolbox/0001-fix-typo.patch
> new file mode 100644
> index 0000000..b94daee
> --- /dev/null
> +++ b/package/bctoolbox/0001-fix-typo.patch
> @@ -0,0 +1,18 @@
> +Fix a typo in the variable name. Only check path for a single library name.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 

When the upstream project uses Git, I really, really prefer when the
patches are Git formatted. This way, they can easily be git am'ed by
other people who need to create/rework patches for the same package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
