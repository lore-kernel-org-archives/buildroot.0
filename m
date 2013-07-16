From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jul 2013 10:55:51 +0200
Subject: [Buildroot] [RFC 3/3] opengl: add sunxi-mali as possible
 egl/gles provider
In-Reply-To: <1373778632-16531-4-git-send-email-spenser@gillilanding.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
 <1373778632-16531-4-git-send-email-spenser@gillilanding.com>
Message-ID: <20130716105551.0bc2214b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sun, 14 Jul 2013 00:10:32 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/opengl/libegl/libegl.mk   | 4 ++++
>  package/opengl/libgles/libgles.mk | 4 ++++
>  2 files changed, 8 insertions(+)

This one obviously looks good. Just rebase on top of master now that
ti-gfx has been merged, in order to avoid merge conflicts.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
