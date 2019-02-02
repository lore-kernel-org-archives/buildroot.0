From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:47:22 +0100
Subject: [Buildroot] [PATCH v2 6/6] Update DEVELOPERS.
In-Reply-To: <20190131121526.11816-7-lpdev@cordier.org>
References: <20190131121526.11816-1-lpdev@cordier.org>
 <20190131121526.11816-7-lpdev@cordier.org>
Message-ID: <20190202154722.13d68a6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis-Paul,

Thanks for working on this topic. A few minor/silly comments below.

On Thu, 31 Jan 2019 13:15:26 +0100
Louis-Paul Cordier <lpdev@cordier.org> wrote:

> Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
> ---
>  DEVELOPERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c1950bb0f4..dfe7bd67c0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1262,6 +1262,11 @@ F:	package/ti-sgx-demos/
>  F:	package/ti-sgx-km/
>  F:	package/ti-sgx-um/
>  
> +N:  Louis-Paul Cordier <lpdev@cordier.org>
> +F:  package/intel-gmmlib
> +F:  package/intel-mediadriver
> +F:  package/intel-mediasdk

Indentation is not correct, please follow the indentation style used in
the rest of the file.

Also, the update to the DEVELOPERS file should be done within the
patches adding the packages. So the patch adding intel-gmmlib should
update the DEVELOPERS file for intel-gmmlib, and so on for
intel-mediadriver and intel-mediasdk.

Final nit: don't put a final dot in commit titles.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
