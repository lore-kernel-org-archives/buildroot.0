From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2020 22:46:57 +0100
Subject: [Buildroot] [PATCH 2/2] pru-software-support: bump to latest
 version 5.6.0
In-Reply-To: <20200114005842.45810-3-ashcharles@gmail.com>
References: <20200114005842.45810-1-ashcharles@gmail.com>
 <20200114005842.45810-3-ashcharles@gmail.com>
Message-ID: <20200114224657.64dc18c1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jan 2020 19:58:42 -0500
Ash Charles <ashcharles@gmail.com> wrote:

> Update to the latest version of the PRU software support [1]
> 
> [1] https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package

We need your Signed-off-by here as well.

> ---
>  package/pru-software-support/pru-software-support.hash | 2 +-
>  package/pru-software-support/pru-software-support.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
> index f4ce8e466e..f7c2d505a2 100644
> --- a/package/pru-software-support/pru-software-support.hash
> +++ b/package/pru-software-support/pru-software-support.hash
> @@ -1,2 +1,2 @@
>  # Locally-calculated hash
> -sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
> +sha256	d6d1f76ab5a50dbdf1dff834b271f9d3ffa7424e4d9615e00713f3f81ed5787e	pru-software-support-package-v5.6.0.tar.gz

It would be good to have a separate patch adding a hash for the license
file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
