From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Oct 2012 21:10:55 +0200
Subject: [Buildroot] [PATCH 06/47] package/celt051: new package
In-Reply-To: <1351113973-17237-7-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-7-git-send-email-yann.morin.1998@free.fr>
Message-ID: <508C31BF.20806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Package should be called celt, not celt051

On 24/10/12 23:25, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Reviewed-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
[snip]
> diff --git a/package/multimedia/celt051/celt.mk b/package/multimedia/celt051/celt.mk
> new file mode 100644
> index 0000000..9baaa82
> --- /dev/null
> +++ b/package/multimedia/celt051/celt.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# celt051
> +#
> +#############################################################
> +
> +# Although version newer than 0.5.1.3 exists, we're
> +# stuck with 0.5.1.3 for use by Spice (coming later)

  How come spice requires a specific version of celt?

> +CELT051_VERSION         = 0.5.1.3
> +CELT051_SOURCE          = celt-$(CELT051_VERSION).tar.gz

  If it's called celt, this is the default so can be left out.


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
