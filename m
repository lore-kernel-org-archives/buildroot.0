From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:31:12 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libtasn1: fix build with gcc 4.8
In-Reply-To: <20200424180321.892100-1-fontaine.fabrice@gmail.com>
References: <20200424180321.892100-1-fontaine.fabrice@gmail.com>
Message-ID: <20200427223112.20624821@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Apr 2020 20:03:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0030c903abf6c964806a97067af94a99867a3896
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Set -std=gnu99 instead of patching source code

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
