From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 28 Aug 2008 13:37:01 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
In-Reply-To: <20080828105639.73E743C7AB@busybox.net>
References: <20080828105639.73E743C7AB@busybox.net>
Message-ID: <20080828113701.GB4725@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 28, 2008 at 03:56:39AM -0700, laird at uclibc.org wrote:
>Author: laird
>Date: 2008-08-28 03:56:38 -0700 (Thu, 28 Aug 2008)
>New Revision: 23274
>
>Log:
>libxml2: Post process xml2-config file to actually work and bump version
>
>Version bumped to 2.6.31
>(2.6.32 has .rej files so patch target fails - upstream need to be informed).

Yes, please inform upstream. But such packaging issues are no excuse to
exclude that particular release.
I'm pretty sure that there is at least one other package that is also
shipped with .rej (which were apparently resolved properly) where we rm
-f $(FOO_DIR)/the/inappropriately_packaged.rej

Please consider doing the same for libxml2.
TIA,
