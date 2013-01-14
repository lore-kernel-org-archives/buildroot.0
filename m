From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 10:59:43 +0100
Subject: [Buildroot] [PATCH 1/1 V2] cairo : bump version to 1.12.8
In-Reply-To: <1358097082-24212-1-git-send-email-sagaert.johan@skynet.be>
References: <1358097082-24212-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130114105943.13b56b82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 13 Jan 2013 18:11:22 +0100, Sagaert Johan wrote:
> 
> Patch v2 : The patch for 1.10.2 is no longer needed with cairo version 1.12.8.
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/cairo/cairo-1.10.2-directfb.patch | 36 -------------------------------
>  package/cairo/cairo.mk                    |  6 ++----
>  2 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/cairo/cairo-1.10.2-directfb.patch

This apparently breaks the build in certain configurations:

 http://autobuild.buildroot.org/results/0824b98044bba4c8d75195b8ec59582199a5a3d7/build-end.log
 http://autobuild.buildroot.org/results/7b21c60d7ba1a8df8910d104e21d4545cb37a4c6/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
