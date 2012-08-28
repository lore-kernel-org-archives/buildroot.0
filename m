From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 19:39:37 +0200
Subject: [Buildroot] [PATCH 05/20] libtirpc: new package
In-Reply-To: <43fd6bbd813c17a10caad354c09b94bd42558170.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <43fd6bbd813c17a10caad354c09b94bd42558170.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <503D0259.7020904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/11/12 19:40, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
[snip]
> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> new file mode 100644
> index 0000000..ed56b88
> --- /dev/null
> +++ b/package/libtirpc/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LIBTIRPC
> +	bool "libtirpc"
> +	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	help
> +	  Libtirpc is a port of Suns Transport-Independent RPC library
                                 ^^^^Sun's

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
