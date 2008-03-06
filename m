From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 7 Mar 2008 10:47:46 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
In-Reply-To: <20080306175611.EB4541201CA@busybox.net>
References: <20080306175611.EB4541201CA@busybox.net>
Message-ID: <20080306234746.GC26530@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 06, 2008 at 09:56:11AM -0800, ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-06 09:56:10 -0800 (Thu, 06 Mar 2008)
> New Revision: 21184
> 
> Log:
> makefile cleanup for bzip2
> 
> Modified:
>    trunk/buildroot/package/bzip2/bzip2.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/bzip2/bzip2.mk
> ===================================================================
> --- trunk/buildroot/package/bzip2/bzip2.mk	2008-03-06 17:55:51 UTC (rev 21183)
> +++ trunk/buildroot/package/bzip2/bzip2.mk	2008-03-06 17:56:10 UTC (rev 21184)
> @@ -29,7 +29,7 @@
>  	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile-libbz2_so
>  	touch $@
>  
> -$(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
> +$(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked

Why move libbz2 from /lib to /usr/lib?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
