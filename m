From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 23:12:09 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/abootimg: add host build
In-Reply-To: <20201119090854.48955-3-mikeframpo@gmail.com>
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-3-mikeframpo@gmail.com>
Message-ID: <20201119231209.68de18bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Nov 2020 22:08:53 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> Enabling package host build for abootimg so that boot images can be
> created for boards which boot from this format.
> 
> Signed-off-by: Mike Frampton <mikeframpo@gmail.com>
> ---
>  package/Config.in.host          |  1 +
>  package/abootimg/Config.in.host |  8 ++++++++
>  package/abootimg/abootimg.mk    | 10 ++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 package/abootimg/Config.in.host

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
