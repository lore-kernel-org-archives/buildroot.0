From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:29:41 +0100
Subject: [Buildroot] [PATCH 28/33] imlib2: add license info
In-Reply-To: <1353543503-8952-29-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-29-git-send-email-s.martin49@gmail.com>
Message-ID: <50B12E35.7080901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/imlib2/imlib2.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
> index 3c6c473..52d80df 100644
> --- a/package/imlib2/imlib2.mk
> +++ b/package/imlib2/imlib2.mk
> @@ -6,6 +6,9 @@
>   IMLIB2_VERSION = 1.4.5
>   IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
>   IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
> +IMLIB2_LICENSE = as-is
> +IMLIB2_LICENSE_FILES = COPYING

  I think we'll have to call this 'imlib2 license'.  'as-is' is too meaningless
if you ask me.  The license resembles MIT a bit, but the requirement of public
acknowledgement diverges too much to still call it MIT-like.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
