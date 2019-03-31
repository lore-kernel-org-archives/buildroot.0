From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 20:56:12 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: fix licensing
In-Reply-To: <20190331145319.22234-1-yann.morin.1998@free.fr>
References: <20190331145319.22234-1-yann.morin.1998@free.fr>
Message-ID: <20190331205612.518dbb18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 16:53:19 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Fix the license lis: it should be a space-separated list of files, it is
> not a comma-separated list.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/74b/74be940e5757d18452b0eb97b9973c278be20345/
> 
> Add hashes for the license files while at it, and cleanup the hash file
> as well.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gettext-tiny/gettext-tiny.hash | 6 ++++--
>  package/gettext-tiny/gettext-tiny.mk   | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
