From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:47:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-imx: allow to
 build with Waf on Python3
In-Reply-To: <20200204215357.26259-1-titouan.christophe@railnova.eu>
References: <20200204215357.26259-1-titouan.christophe@railnova.eu>
Message-ID: <20200205164707.1fd67b0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 22:53:57 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This makes gst1-imx use the Waf package ditributed in Buildroot,
> instead of its own one, as the latter does not support Python3.
> 
> Also backport a patch from upstream that tweaks the wscript,
> such as to make it run on Waf >=2.0.12
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  .../gst1-imx/0001-waf-update-to-2-0-12.patch  | 28 +++++++++++++++++++
>  package/gstreamer1/gst1-imx/gst1-imx.mk       |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 package/gstreamer1/gst1-imx/0001-waf-update-to-2-0-12.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
