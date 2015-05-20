From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:23:50 +0200
Subject: [Buildroot] [PATCH] package/freerdp: fix build with gstreamer
 support
In-Reply-To: <1432074933-4039-1-git-send-email-s.martin49@gmail.com>
References: <1432074933-4039-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150520232350.1ee0bfb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 20 May 2015 00:35:33 +0200, Samuel Martin wrote:
> FreeRDP with gstreamer support enabled needs gstreamer and gst-plugins-base
> with gstapp.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/937/9373d4238bc3f027e571581bd3531018c4faed91/
>   http://autobuild.buildroot.org/results/f77/f77a2c9eea7973b54a22e12ab33ee8964adaddfd/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/freerdp/Config.in  | 2 ++
>  package/freerdp/freerdp.mk | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
