From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:59:04 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libblockdev: fs needs libmount
In-Reply-To: <20201015184714.1347814-1-fontaine.fabrice@gmail.com>
References: <20201015184714.1347814-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015225904.548c8d30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 20:47:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1f83436a84046da753a2ebf2aac7c0f0cc188fe0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Replace mount by libmount

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
