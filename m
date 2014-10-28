From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 23:28:12 +0100
Subject: [Buildroot] [PATCH 2/3] binutils: bump the default target
 version of binutils
In-Reply-To: <1414534758-7545-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414534758-7545-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5450187C.5010900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/14 23:19, Thomas Petazzoni wrote:
> When binutils for the host is not built (which is the case when an
> external toolchain is used), the version of binutils used is 2.21,
> which is quite old. Since we have bumped to 2.22 as the default
> version for the host binutils, let's do the same for the target
> binutils.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/binutils/binutils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index ab9f167..b8dab5d 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -12,7 +12,7 @@ ifeq ($(BR2_avr32),y)
>  # avr32 uses a special version
>  BINUTILS_VERSION = 2.18-avr32-1.0.1
>  else
> -BINUTILS_VERSION = 2.21
> +BINUTILS_VERSION = 2.22
>  endif
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
