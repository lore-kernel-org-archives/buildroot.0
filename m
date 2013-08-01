From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 18:00:36 +0200
Subject: [Buildroot] [PATCHv2] linux: Fix uImage with appended DTs
 generation
In-Reply-To: <1370611303-5054-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1370611303-5054-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20130801180036.79e8cee1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Ripard,

On Fri,  7 Jun 2013 15:21:43 +0200, Maxime Ripard wrote:
> Fixes bug #5516 - appended device tree blobs on uImage fails
> 
> Before version 3.7 of the kernel, building the zImage and then the
> uImage will rewrite the zImage in the process, removing the device tree
> we just appended.
> 
> Use mkimage to append the device tree to the uImage and rebuild the
> headers directly.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  linux/linux.mk | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
