From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Jun 2015 00:09:54 +0200
Subject: [Buildroot] [PATCH 2/3] mc: update hash file
In-Reply-To: <1433799967-7694-2-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1433799967-7694-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1433799967-7694-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <557612B2.3010300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 23:46, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/mc/mc.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mc/mc.hash b/package/mc/mc.hash
> index 588bbaa..7ae1c3b 100644
> --- a/package/mc/mc.hash
> +++ b/package/mc/mc.hash
> @@ -1,2 +1,2 @@
>  # Hash from http://ftp.midnight-commander.org/mc-4.8.14.sha256:
> -sha256  61fd0fd2280c3d09d7e0aec8ab001fc89dad8e4fd9941f386414667b55152ec5  mc-4.8.14.tar.bz2
> +sha256  6b1f74efbdf394bfab084f4d2ea2e72173de5f12cd42be2533ca2c3b72edb8e6  mc-4.8.14.tar.xz
> 

 This should be squashed with the preceding patch.

 Otherwise:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
