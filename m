From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 20 Nov 2006 18:01:43 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061120154423.GG3065@priv.blacknet.de>
References: <20061120154423.GG3065@priv.blacknet.de>
Message-ID: <20061120180143.456f1bd0.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Dear list,
> 
> this patch adds a simple cpio target, to be used with an initramfs
> 
> Index: target/Config.in
> ===================================================================
> --- target/Config.in    (revision 16570)
> +++ target/Config.in    (working copy)
> @@ -8,6 +8,7 @@
>  source "target/jffs2/Config.in"

Hi,

In my application, as I also use cpio on the target, then I added a cpio
package that provide target and host cpio.
I use it to update the initramfs and have a simple dynamic RIM system w/o
use of cramfs/unionfs.

If this could be useful, I will make a patch.

Philippe
