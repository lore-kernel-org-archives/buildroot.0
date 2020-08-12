From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: security bump to
 version 2.36.12
In-Reply-To: <20200811101213.2117766-1-fontaine.fabrice@gmail.com>
References: <20200811101213.2117766-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812164506.20ca9971@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 12:12:13 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> - Fix CVE-2017-6312: Integer overflow in io-ico.c in gdk-pixbuf allows
>   context-dependent attackers to cause a denial of service (segmentation
>   fault and application crash) via a crafted image entry offset in an
>   ICO file, which triggers an out-of-bounds read, related to compiler
>   optimizations.
> - Fix CVE-2017-6313: Integer underflow in the load_resources function in
>   io-icns.c in gdk-pixbuf allows context-dependent attackers to cause a
>   denial of service (out-of-bounds read and program crash) via a crafted
>   image entry size in an ICO file.
> - Fix CVE-2017-6314: The make_available_at_least function in io-tiff.c
>   in gdk-pixbuf allows context-dependent attackers to cause a denial of
>   service (infinite loop) via a large TIFF file.
> 
> Also update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.hash | 6 +++---
>  package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
