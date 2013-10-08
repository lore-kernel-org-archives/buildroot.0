From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 21:25:25 +0200
Subject: [Buildroot] [PATCH 3 of 4] ncftp: add license information
In-Reply-To: <0c52e8e64bc16f37df1e.1381226817@argentina>
References: <patchbomb.1381226814@argentina>
 <0c52e8e64bc16f37df1e.1381226817@argentina>
Message-ID: <52545C25.2060307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/13 12:06, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
> ---
>   package/ncftp/ncftp.mk |  2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
> --- a/package/ncftp/ncftp.mk
> +++ b/package/ncftp/ncftp.mk
> @@ -8,6 +8,8 @@ NCFTP_VERSION = 3.2.5
>   NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.bz2
>   NCFTP_SITE = ftp://ftp.ncftp.com/ncftp
>   NCFTP_TARGET_BINS = ncftp
> +NCFTP_LICENSE = Clarified Artistic License
> +NCFTP_LICENSE_FILES = doc/LICENSE.txt
>
>   ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
>   	NCFTP_TARGET_BINS += ncftpget
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
