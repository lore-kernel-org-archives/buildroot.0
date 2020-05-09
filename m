From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:44:45 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wayland: bump to version
 1.18.0
In-Reply-To: <20200504081341.35841-1-james.hilliard1@gmail.com>
References: <20200504081341.35841-1-james.hilliard1@gmail.com>
Message-ID: <20200509224445.681f72c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 02:13:41 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebase/update disable tests patch.
> 
> Replace autotools build system with meson as autotools is deprecated
> and will be removed.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - remove pkg-config path setting that is no longer needed
> Changes v2 -> v3:
>   - don't use $(WAYLAND_CONF_OPTS) for HOST_WAYLAND_CONF_OPTS
> ---
>  ...01-build-add-option-to-disable-tests.patch | 104 ++++++++++++++++++
>  ...onfigure-add-option-to-disable-tests.patch |  73 ------------
>  package/wayland/wayland.hash                  |  12 +-
>  package/wayland/wayland.mk                    |  14 +--
>  4 files changed, 115 insertions(+), 88 deletions(-)
>  create mode 100644 package/wayland/0001-build-add-option-to-disable-tests.patch
>  delete mode 100644 package/wayland/0001-configure-add-option-to-disable-tests.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
