From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 07:30:02 +0200
Subject: [Buildroot] [PATCH 04/13] gdbm: new package
In-Reply-To: <1347107325-4163-4-git-send-email-francois.perrad@gadz.org>
References: <1347107325-4163-1-git-send-email-francois.perrad@gadz.org>
 <1347107325-4163-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <50501DDA.9020004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/12 14:28, Francois Perrad wrote:
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
[snip]
> +#############################################################
> +#
> +# gdbm
> +#
> +#############################################################
> +GDBM_VERSION = 1.10
> +GDBM_SITE = ftp://ftp.gnu.org/gnu/gdbm

  This should be

GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm

  After this fix,
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(untested)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
