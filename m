From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:15:12 +0200
Subject: [Buildroot] [PATCH v2] package/wayland-utils: new package
In-Reply-To: <20200731221347.32389-1-ps.report@gmx.net>
References: <20200731221347.32389-1-ps.report@gmx.net>
Message-ID: <20200829141512.40cf3350@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 00:13:47 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> From [1] (for details see [2]):
> 
> This is first release of wayland-utils which only contains (for now)
> wayland-info, a utility for displaying information about the Wayland
> protocols supported by a Wayland compositor.
> 
> wayland-info is basically a standalone version of weston-info as found
> in weston repository.
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041520.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>  - remove explict wayland dependencies (dynamic, threads)
>  - update project url
>  - add DEVELOPERS entry
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/wayland-utils/Config.in          |  7 +++++++
>  package/wayland-utils/wayland-utils.hash |  6 ++++++
>  package/wayland-utils/wayland-utils.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/wayland-utils/Config.in
>  create mode 100644 package/wayland-utils/wayland-utils.hash
>  create mode 100644 package/wayland-utils/wayland-utils.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
