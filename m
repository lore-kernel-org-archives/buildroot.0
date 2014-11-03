From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2014 08:33:36 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
In-Reply-To: <20141102223855.CCFA5B2F3F@busybox.osuosl.org>
References: <20141102223855.CCFA5B2F3F@busybox.osuosl.org>
Message-ID: <20141103083336.7b4da4c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 2 Nov 2014 23:27:01 +0100, Peter Korsgaard wrote:

> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index a96df1e..b211878 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_GDB
>  	# target, we don't allow building a separate gdbserver. The
>  	# one from the external toolchain should be used.
>  	select BR2_PACKAGE_GDB_SERVER if \
> -	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
> +		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)

Is this really the rule that we want for Config.in file? I do prefer to
align with the previous line rather than enforcing the use of a fixed
number of tabs. But I guess it's a matter of taste.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
