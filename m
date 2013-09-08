From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:51:14 +0200
Subject: [Buildroot] [PATCH v2 1/7] libdrm: bump and add experimental
 ARM framebuffer support
In-Reply-To: <1378441521-10050-2-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130908185114.3cc3269e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu,  5 Sep 2013 23:25:15 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/libdrm/Config.in | 68 ++++++++++++++++++++++++++++++++++++++++--------
>  package/libdrm/libdrm.mk | 53 ++++++++++++++++++++++++++++++-------
>  2 files changed, 100 insertions(+), 21 deletions(-)

I continue to believe your commit logs could be a little bit more
verbose, but other than that:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Also, the xlib_libpthread-stubs package could probably be moved outside
of the BR2_PACKAGE_XORG7 condition, but this can be done later on.

Finally, a question that remains is on what platforms did you test
this? I.e which DRM driver did you enable to get Mesa3D providing the
relevant libraries needed to run the glmark2 benchmark on your boards?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
