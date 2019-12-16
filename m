From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 16 Dec 2019 10:35:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-12-15
In-Reply-To: <20191216071727.A4D8285E60@fraxinus.osuosl.org>
References: <20191216071727.A4D8285E60@fraxinus.osuosl.org>
Message-ID: <20191216103514.GB262389@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 07:17:17 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> [...]
>
>     arm      |      xdg-dbus-proxy-0.1.2      | NOK | http://autobuild.buildroot.net/results/817c5893652fb12ded187d86d6003d3e81f3f695 |     

This is the same as a failure from yesterday [1] due to TEMP_FAILURE_RETRY
not being present in Musl, and has been already fixed [2].

Cheers,
?Adri?n

---
[1] http://autobuild.buildroot.net/results/075660f70d984fe18f10ee4674b0e6caa91bfaca
[2] https://patchwork.ozlabs.org/patch/1209996/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191216/bed5f771/attachment.asc>
