From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 7 Mar 2008 10:59:07 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
In-Reply-To: <20080306182231.7AB031201BB@busybox.net>
References: <20080306182231.7AB031201BB@busybox.net>
Message-ID: <20080306235907.GF26530@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 06, 2008 at 10:22:31AM -0800, ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-06 10:22:31 -0800 (Thu, 06 Mar 2008)
> New Revision: 21222
> 
> Log:
> fixes for readline makefile
> 
> Modified:
>    trunk/buildroot/package/readline/readline.mk

> -READLINE_TARGET_BINARY:=lib/$(READLINE_BINARY)
> -READLINE_TARGET_SHARED_BINARY:=lib/$(READLINE_SHARED_BINARY)
> +READLINE_TARGET_BINARY:=usr/lib/$(READLINE_BINARY)
> +READLINE_TARGET_SHARED_BINARY:=usr/lib/$(READLINE_SHARED_BINARY)

Why, again?

readline is in /lib on my Debian system, fwiw.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
