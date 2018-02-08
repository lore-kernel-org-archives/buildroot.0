From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:46:39 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version 0.5.0
In-Reply-To: <20180206193505.6189-1-fontaine.fabrice@gmail.com>
References: <20180206193505.6189-1-fontaine.fabrice@gmail.com>
Message-ID: <20180208224639.5bcc3ffc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 20:35:05 +0100, Fabrice Fontaine wrote:
> This version added support for shared or static library building
> through BUILD_STATIC and BUILD_SHARED variables so set them depending
> on BR2_xxx_LIBS variables
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tinycbor/tinycbor.hash |  2 +-
>  package/tinycbor/tinycbor.mk   | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
