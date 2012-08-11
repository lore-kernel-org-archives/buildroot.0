From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 23:11:14 +0200
Subject: [Buildroot] [PATCH] p7zip-light: new package
In-Reply-To: <1344666280-27588-1-git-send-email-net147@gmail.com>
References: <1344666280-27588-1-git-send-email-net147@gmail.com>
Message-ID: <20120811231114.4f1b0f10@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 11 Aug 2012 16:24:40 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  package/Config.in                           |    1 +
>  package/p7zip-light/Config.in               |    7 +
>  package/p7zip-light/p7zip-light-libre.patch | 6540 +++++++++++++++++++++++++++
>  package/p7zip-light/p7zip-light.mk          |   24 +
>  4 files changed, 6572 insertions(+)
>  create mode 100644 package/p7zip-light/Config.in
>  create mode 100644 package/p7zip-light/p7zip-light-libre.patch
>  create mode 100644 package/p7zip-light/p7zip-light.mk

I am not entirely fan of carrying such a huge patch. Can you see if
Debian has a version of p7zip without the non-free RAR code, and if so,
use their tarball instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
