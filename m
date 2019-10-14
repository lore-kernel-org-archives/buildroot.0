From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:14:10 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/clamav: fix clamsubmit linking
In-Reply-To: <20191014210514.2176-1-fontaine.fabrice@gmail.com>
References: <20191014210514.2176-1-fontaine.fabrice@gmail.com>
Message-ID: <20191014231410.5e5f1a9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 23:05:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As suggested by Arnout in review of
> https://patchwork.ozlabs.org/patch/1175732/, set OBJC to $(TARGET_CC)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/49973b2283c65de5155deaf633cd6569a37af375
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Drop non upstreamable patch and set OBJC

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
