From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 25 Oct 2011 11:20:16 +0200
Subject: [Buildroot] [PATCH 2 of 3 resend] busybox: rename
	busybox-update to busybox-update-config
In-Reply-To: <c83b93f562e2811c201d.1318604217@localhost6.localdomain6>
References: <patchbomb.1318604215@localhost6.localdomain6>
 <c83b93f562e2811c201d.1318604217@localhost6.localdomain6>
Message-ID: <CAAXf6LU3yEg327aQyPZ0cvK0=EHK42QJQQ==ypWpPnCwG5wtoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2011 at 4:56 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> The original name busybox-update is confusing as it only updates a
> configuration file.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
> ?package/busybox/busybox.mk | ?2 +-
> ?1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -184,5 +184,5 @@
> ? ? ? ?rm -f $(BUSYBOX_DIR)/.stamp_built
> ? ? ? ?rm -f $(BUSYBOX_DIR)/.stamp_target_installed
>
> -busybox-update:
> +busybox-update-config:
> ? ? ? ?cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
>

bump
