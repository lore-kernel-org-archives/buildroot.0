From: Atle Nissestad <atle@nissestad.no>
Date: Fri, 8 Feb 2008 10:07:30 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
In-Reply-To: <20080207105901.5A0FB12C65B@busybox.net>
References: <20080207105901.5A0FB12C65B@busybox.net>
Message-ID: <200802081007.30537.atle@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 7. February 2008 11:59:01 vanokuten at uclibc.org wrote:
> Author: vanokuten
> Date: 2008-02-07 02:59:00 -0800 (Thu, 07 Feb 2008)
> New Revision: 20953
>
> Log:
> updated gdb support for nios2, thanks Atle
>
> Modified:
>    trunk/buildroot/toolchain/gdb/Config.in
>
>
> Changeset:
> Modified: trunk/buildroot/toolchain/gdb/Config.in

Seems you missed the important part of my patch, the actual nios2 gdb 6.6 
arch-support (/buildroot/toolchain/gdb/6.6/700-nios2-6.6.patch).
Forgot to 'svn add' perhaps ..?

- Atle
