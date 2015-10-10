From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 11:47:03 +0200
Subject: [Buildroot] [PATCH v2 2/4] media-ctl: remove package
In-Reply-To: <1444255010-6341-2-git-send-email-ps.report@gmx.net>
References: <1444255010-6341-1-git-send-email-ps.report@gmx.net>
 <1444255010-6341-2-git-send-email-ps.report@gmx.net>
Message-ID: <20151010114703.7434dd95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  7 Oct 2015 23:56:48 +0200, Peter Seiderer wrote:
> Package media-ctl is out-dated, source (and developement) have been moved
> to v4l-utils since June 2014. Up-to-date version is available in
> the libv4l package (BR2_PACKAGE_LIBV4L/BR2_PACKAGE_LIBV4L_UTILS).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - fix legacy entry: select BR2_LEGACY, BR2_PACKAGE_LIBV4L and
>     BR2_PACKAGE_LIBV4L_UTILS (suggested by Arnout Vandecappelle)
> ---
>  Config.in.legacy                                   |  10 +
>  package/Config.in                                  |   1 -
>  ...ers-for-compatibility-with-old-toolchains.patch | 303 ---------------------
>  package/media-ctl/Config.in                        |   9 -
>  package/media-ctl/media-ctl.mk                     |  17 --
>  5 files changed, 10 insertions(+), 330 deletions(-)
>  delete mode 100644 package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
>  delete mode 100644 package/media-ctl/Config.in
>  delete mode 100644 package/media-ctl/media-ctl.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
