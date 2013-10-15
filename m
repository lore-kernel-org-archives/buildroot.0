From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Oct 2013 21:53:39 +0200
Subject: [Buildroot] [PATCH 1/1] nuttcp: add license information
In-Reply-To: <1381820374-21537-1-git-send-email-phil@zankapfel.net>
References: <1381820374-21537-1-git-send-email-phil@zankapfel.net>
Message-ID: <525D9D43.2050205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/13 08:59, Phil Eichinger wrote:
>
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>   package/nuttcp/nuttcp.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
> index 406219d..8a99ce3 100644
> --- a/package/nuttcp/nuttcp.mk
> +++ b/package/nuttcp/nuttcp.mk
> @@ -7,6 +7,8 @@
>   NUTTCP_VERSION = 6.1.2
>   NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
>   NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
> +NUTTCP_LICENSE = GPLv2
> +NUTTCP_LICENSE_FILES = LICENSE
>
>   define NUTTCP_BUILD_CMDS
>   	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
