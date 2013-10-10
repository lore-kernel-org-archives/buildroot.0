From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 23:01:30 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-input-evdev: enable compile
 without udev dependency.
In-Reply-To: <1381435927-7090-1-git-send-email-ps.report@gmx.net>
References: <1381435927-7090-1-git-send-email-ps.report@gmx.net>
Message-ID: <20131010230130.052a22a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 10 Oct 2013 22:12:07 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/x11r7/xdriver_xf86-input-evdev/Config.in   |  4 --
>  ...01-Enable-compile-wihtout-udev-dependency.patch | 58 ++++++++++++++++++++++
>  .../xdriver_xf86-input-evdev.mk                    | 10 +++-
>  3 files changed, 67 insertions(+), 5 deletions(-)
>  create mode 100644 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev-0001-Enable-compile-wihtout-udev-dependency.patch

Thanks. Have you submitted this patch upstream? This is more-and-less a
feature patch, and in Buildroot, we don't like too much carrying
feature patches if we don't believe they will be merged upstream.

Of course, if it has been submitted upstream and received what seems
like a positive feedback, it's perfectly fine to take it in Buildroot
until upstream makes a new release.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
