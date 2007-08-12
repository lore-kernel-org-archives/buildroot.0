From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 12 Aug 2007 02:21:06 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/asterisk
 package/aumix package/a etc...
In-Reply-To: <20070811222657.30C61A613D@busybox.net>
References: <20070811222657.30C61A613D@busybox.net>
Message-ID: <0708120159130.10468@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for applying that patch.

On Sat, 11 Aug 2007, ulf at uclibc.org wrote:

> Author: ulf
> Date: 2007-08-11 15:26:56 -0700 (Sat, 11 Aug 2007)
> New Revision: 19444
>
> Log:
> Use STAGING_DIR/usr/lib instead of STAGING_DIR/lib
...
> Modified: trunk/buildroot/package/hal/hal.mk
> ===================================================================
> --- trunk/buildroot/package/hal/hal.mk	2007-08-11 22:09:09 UTC (rev 19443)
> +++ trunk/buildroot/package/hal/hal.mk	2007-08-11 22:26:56 UTC (rev 19444)
...
> +	# remove _everything_ in $(TARGET_DIR)/usr/include?
>  	rm -rf $(TARGET_DIR)/usr/include

As you see the note here above, I'm not so sure removing _everything_ in
$(TARGET_DIR)/usr/include is TRT to do, or is it?

toolchain/uClibc/uclibc.mk wipes out $(TARGET_DIR)/usr/include too.  Is
that the intended behaviour?


Cheers,

-- 
Cristian
