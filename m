From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:18:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libcamera: link with atomic when needed
In-Reply-To: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
References: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
Message-ID: <20190915221830.162023bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Sep 2019 18:53:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Kieran Bingham):
>  - Use an upstreamable solution

Applied to master, thanks. Could you send the patch upstream, after
taking into account the comments from Kieran ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
