From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 09:08:41 +0100
Subject: [Buildroot] [PATCH 5/5] mesa3d: bumped to 8.0.5
In-Reply-To: <1356745553-15362-6-git-send-email-stefan.froberg@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356745553-15362-6-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20121229090841.7ce4aeaf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 29 Dec 2012 03:45:53 +0200, Stefan Fr?berg wrote:
> uClibc does not have execinfo.h
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  package/x11r7/mesa3d/mesa3d-execinfo.patch |   21 +++++++++++++++++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
>  create mode 100644 package/x11r7/mesa3d/mesa3d-execinfo.patch
> 
> diff --git a/package/x11r7/mesa3d/mesa3d-execinfo.patch b/package/x11r7/mesa3d/mesa3d-execinfo.patch
> new file mode 100644
> index 0000000..8baba63
> --- /dev/null
> +++ b/package/x11r7/mesa3d/mesa3d-execinfo.patch
> @@ -0,0 +1,21 @@

Missing patch description.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
