From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 23 Sep 2007 13:14:47 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
In-Reply-To: <20070923095316.924F330074@busybox.net>
References: <20070923095316.924F330074@busybox.net>
Message-ID: <20070923111447.GD20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 23, 2007 at 02:53:16AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-23 02:53:12 -0700 (Sun, 23 Sep 2007)
>New Revision: 19956
>
>Log:
>Build readline as shared lib
>
>Modified:
>   trunk/buildroot/package/readline/readline.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/readline/readline.mk
>===================================================================
>--- trunk/buildroot/package/readline/readline.mk	2007-09-23 09:52:03 UTC (rev 19955)
>+++ trunk/buildroot/package/readline/readline.mk	2007-09-23 09:53:12 UTC (rev 19956)
>@@ -42,6 +42,7 @@
> 		--sysconfdir=/etc \
> 		--datadir=/usr/share \
> 		--localstatedir=/var \
>+		--with-shared \

The commonly used term is --enable-shared
