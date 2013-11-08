From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 08:20:13 +0100
Subject: [Buildroot] [PATCH] uclibc-snapshot: enable option
 UCLIBC_HAS_OBSTACK
In-Reply-To: <527c2507.a60d440a.1787.ffff99f7@mx.google.com>
References: <527c2507.a60d440a.1787.ffff99f7@mx.google.com>
Message-ID: <20131108082013.7b01f41b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Zankel,

On Thu, 7 Nov 2013 14:22:12 -0800, Chris Zankel wrote:
> Prior to uClibc commit f143f920694c, uClibc used to always include the
> gnu obstack extension, which is used and required by many tools, such
> as binutils.
> 
> Because of the change mentioned above, obstack is now optional, and
> got disabled per default, so enable it in the uClibc snapshot
> configuration file.
> 
> Signed-off-by: Chris Zankel <chris@zankel.net>
> ---
>  package/uclibc/uClibc-snapshot.config | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
