From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 19 Jun 2008 10:38:21 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20080618154649.BB6FB3C6C1@busybox.net>
References: <20080618154649.BB6FB3C6C1@busybox.net>
Message-ID: <20080619003821.GB18139@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 08:46:49AM -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-06-18 08:46:48 -0700 (Wed, 18 Jun 2008)
> New Revision: 22430
> 
> Log:
> toolchain/gcc: use $(@D)

Umm that's not very descriptive :) What does $(@D) do and why is it
preferable to the previous value?

> -	$(CONFIG_UPDATE) $(GCC_DIR)
> +	$(CONFIG_UPDATE) $(@D)
>  	touch $@

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
