From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 00:27:21 +0100
Subject: [Buildroot] [PATCH v2 2/2] rxvt-unicode: new package
In-Reply-To: <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20130104002721.0a0e5e30@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Thu, 27 Dec 2012 20:45:18 +0200, Stefan Fr?berg wrote:
> This patch will ensure that rxvt-terminfo files will be created.
> Upstream-Status: Pending
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Please merge this patch into the previous patch.

It seems that there a misunderstanding on how patches should be
submitted. If your new package requires a certain number of patches to
build or behave properly, then those patches should be part of the
patch adding the package.

Generally, for simple packages, only one patch to Buildroot is needed.

> ---
>  .../rxvt-unicode/rxvt-unicode-9.15-terminfo.patch  |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
> 
> diff --git a/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
> new file mode 100644
> index 0000000..910ce76
> --- /dev/null
> +++ b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
> @@ -0,0 +1,12 @@

Your patch lacks a description and Signed-off-by line.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
