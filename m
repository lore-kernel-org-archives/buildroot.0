From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:48:17 +0200
Subject: [Buildroot] [PATCH] zeromq: fix sparc32 compile
In-Reply-To: <20160603031645.GA28308@waldemar-brodkorb.de>
References: <20160603031645.GA28308@waldemar-brodkorb.de>
Message-ID: <20160603094817.37fdbf6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 05:16:45 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/zeromq/0003-fix-sparc-compile.patch b/package/zeromq/0003-fix-sparc-compile.patch
> new file mode 100644
> index 0000000..e4f1881
> --- /dev/null
> +++ b/package/zeromq/0003-fix-sparc-compile.patch
> @@ -0,0 +1,18 @@
> +Fix sparcv8 compile
> +Suggested upstream:
> +https://github.com/zeromq/libzmq/issues/2021
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

For projects hosted on Git upstream, please generate a Git formatted
patch. Also, the title should be on its own line, separated from the
rest of the description by an empty line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
