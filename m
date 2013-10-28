From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2013 08:09:56 +0100
Subject: [Buildroot] [PATCH 2/2] /dev/ttymxc count is changed to 4 in
 system/device_table_dev.txt since debug uart in imx6 sabreauto board is
 ttymxc3
In-Reply-To: <BLU0-SMTP409B21DB710B158C741EA4F70D0@phx.gbl>
References: <1382720599-16239-1-git-send-email-hussain.abdul@outlook.com>
 <BLU0-SMTP409B21DB710B158C741EA4F70D0@phx.gbl>
Message-ID: <526E0DC4.7060704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/13 19:03, Abdul Hussain wrote:
> Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   system/device_table_dev.txt |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/system/device_table_dev.txt b/system/device_table_dev.txt
> index a93a2c8..9507939 100644
> --- a/system/device_table_dev.txt
> +++ b/system/device_table_dev.txt
> @@ -35,7 +35,7 @@
>   /dev/ttySC	c	666	0	0	204	8	0	1	8
>   /dev/ttyPSC	c	666	0	0	204	148	0	1	4
>   /dev/ttyUL	c	666	0	0	204	187	0	1	4
> -/dev/ttymxc	c	666	0	0	207	16	0	1	3
> +/dev/ttymxc	c	666	0	0	207	16	0	1	4
>
>   # Input stuff
>   /dev/input		d	755	0	0	-	-	-	-	-
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
