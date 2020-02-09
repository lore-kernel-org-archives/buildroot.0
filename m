From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 9 Feb 2020 22:07:03 +0100
Subject: [Buildroot] [PATCH v2 2/2] docs/manual: describe the new
 <pkg>_IGNORE_CVES variable
In-Reply-To: <20200208215752.13628-3-titouan.christophe@railnova.eu>
References: <20200208215752.13628-1-titouan.christophe@railnova.eu>
 <20200208215752.13628-3-titouan.christophe@railnova.eu>
Message-ID: <CAAXf6LW2d+KstN15G4BobsL3NUpxVaYyhqZp5Nh0okMFMKf=uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Titouan, Thomas,

El s?b., 8 feb. 2020 a las 22:58, Titouan Christophe
(<titouan.christophe@railnova.eu>) escribi?:
>
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  docs/manual/adding-packages-generic.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index baa052e31c..9a77923a92 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -488,6 +488,20 @@ not and can not work as people would expect it should:
>    locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`,
>    `/usr/lib/modules`, and `/usr/share`, which are automatically excluded.
>
> +* +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells
> +  Buildroot CVE tracking tools which CVEs should be ignored for this
> +  package. This is typically used when the CVE is fixed by a patch in
> +  the package, or when the CVE for some reason does not affect the
> +  Buildroot package. A Makefile comment must always preceed the

'preceed' is incorrect and should be 'precede'.

Best regards,
Thomas
