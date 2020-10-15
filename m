From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:35:17 +0200
Subject: [Buildroot] [PATCH v2 2/5] package/gstreamer1-editing-services:
 bump version to 1.18.0 and convert to meson
In-Reply-To: <20200924211715.7433-2-ps.report@gmx.net>
References: <20200924211715.7433-1-ps.report@gmx.net>
 <20200924211715.7433-2-ps.report@gmx.net>
Message-ID: <20201015233517.52c05ae2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Sep 2020 23:17:12 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - change home page url to https
> 
> - change download url to https
> 
> - download source renamed from gstreamer-editing-services to
>   gst-editing-services
> 
> - convert to meson build
> 
> - use BR2_PACKAGE_GST1_DEVTOOLS/gst1-devtools instead of legacy
>   BR2_PACKAGE_GST1_VALIDATE/gst1-validate
> 
> - drop examples support
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - use BR2_PACKAGE_GST1_DEVTOOLS/gst1-devtools instead of legacy
>     BR2_PACKAGE_GST1_VALIDATE/gst1-validate (Thomas Petazzoni)
>   - drop examples support
> ---
>  .../gstreamer1-editing-services/Config.in     |  2 +-
>  .../gstreamer1-editing-services.hash          |  8 ++---
>  .../gstreamer1-editing-services.mk            | 36 +++++++++----------
>  3 files changed, 21 insertions(+), 25 deletions(-)

I've now applied patches 2 to 5 in this series. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
