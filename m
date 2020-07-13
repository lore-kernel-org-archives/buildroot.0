From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:34:18 +0200
Subject: [Buildroot] [PATCH] package/cdrkit: fix build with GCC 10
In-Reply-To: <20200625005836.2232591-1-urjaman@gmail.com>
References: <20200625005836.2232591-1-urjaman@gmail.com>
Message-ID: <20200713233418.4f232caf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Urja,

Thanks for your contribution!

On Thu, 25 Jun 2020 03:58:36 +0300
Urja Rannikko <urjaman@gmail.com> wrote:

> This patch adds a missing extern on the outfile
> variable in genisoimage.h.
> 
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>
> ---
> Note: I would like to see this applied to the LTS 2020.02
> branch too, since it fixes building host-cdrkit for ISO9660
> generation with a host GCC 10.
> 
>  .../cdrkit/0003-genisoimage-outfile-extern.patch    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 package/cdrkit/0003-genisoimage-outfile-extern.patch
> 
> diff --git a/package/cdrkit/0003-genisoimage-outfile-extern.patch b/package/cdrkit/0003-genisoimage-outfile-extern.patch
> new file mode 100644
> index 0000000000..5a9f0363c9
> --- /dev/null
> +++ b/package/cdrkit/0003-genisoimage-outfile-extern.patch
> @@ -0,0 +1,13 @@
> +diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
> +index bbedfb0..82c859b 100644
> +--- a/genisoimage/genisoimage.h
> ++++ b/genisoimage/genisoimage.h

Thanks a lot for your patch! However, we need the cdrkit patch to have
a proper commit title, commit description and Signed-off-by.

See
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
for more details.

Could you adjust your patch accordingly ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
