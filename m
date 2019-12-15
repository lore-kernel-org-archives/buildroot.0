From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Dec 2019 20:46:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-12-14
In-Reply-To: <20191215071825.1CD502034B@silver.osuosl.org>
References: <20191215071825.1CD502034B@silver.osuosl.org>
Message-ID: <20191215204605.GB218613@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

On Sun, 15 Dec 2019 07:18:18 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Detail of failures
> ------------------
>
> [...]
>
>    x86_64    |      xdg-dbus-proxy-0.1.2      | NOK | http://autobuild.buildroot.net/results/075660f70d984fe18f10ee4674b0e6caa91bfaca |     

This is due to the TEMP_FAILURE_RETRY not being available in Musl. Fix
submitted here: https://patchwork.ozlabs.org/patch/1209996/

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191215/2d173549/attachment.asc>
