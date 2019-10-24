From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 11:05:40 +0200
Subject: [Buildroot] [PATCH] package/numactl: fix URL in help text
In-Reply-To: <20191022224802.4975-1-unixmania@gmail.com>
References: <20191022224802.4975-1-unixmania@gmail.com>
Message-ID: <760a6af6-5468-cb48-5e27-69eb336b4b54@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/10/2019 00:48, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> SGI is gone (RIP). Use the github project as landing page.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/numactl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/numactl/Config.in b/package/numactl/Config.in
> index 95057d3c33..8ea07bb856 100644
> --- a/package/numactl/Config.in
> +++ b/package/numactl/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_NUMACTL
>  	  and memory nodes. It does this by supplying a NUMA memory
>  	  policy to the operating system before running your program.
>  
> -	  http://oss.sgi.com/projects/libnuma/
> +	  https://github.com/numactl/numactl
> 
