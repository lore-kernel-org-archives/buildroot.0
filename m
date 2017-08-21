From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:36:06 +0200
Subject: [Buildroot] [PATCH 1/1] libepoxy: bump to version 1.4.3
In-Reply-To: <20170814172320.16984-1-aperez@igalia.com>
References: <20170814172320.16984-1-aperez@igalia.com>
Message-ID: <20170821233606.1bd17668@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 20:23:20 +0300, Adrian Perez de Castro wrote:
> Among other small fixes, the new version fixes crashes when running in
> X11 without GLX (i.e. using EGL). Additionally, the changes from patch
> "0002-Make-EGL-support-optional.patch" were committed upstream, and the
> file can be dropped.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  .../libepoxy/0002-Make-EGL-support-optional.patch  | 200 ---------------------
>  package/libepoxy/libepoxy.hash                     |   4 +-
>  package/libepoxy/libepoxy.mk                       |   4 +-
>  3 files changed, 3 insertions(+), 205 deletions(-)
>  delete mode 100644 package/libepoxy/0002-Make-EGL-support-optional.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
