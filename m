From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 11:52:36 +0100
Subject: [Buildroot] [PATCH v3 5/5] dos2unix: update homepage link
In-Reply-To: <0c19e0b47cd31f36c57c50e3f4cfa2cf2666d9e9.1441253454.git.baruch@tkos.co.il>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
 <0c19e0b47cd31f36c57c50e3f4cfa2cf2666d9e9.1441253454.git.baruch@tkos.co.il>
Message-ID: <55E977F4.6040504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 09/03/2015 05:10 AM, Baruch Siach wrote:
> Use the maintainer page that is much more informative than freecode.com.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3:
>    * New patch in this series
> ---
>  package/dos2unix/Config.in      | 2 +-
>  package/dos2unix/Config.in.host | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
> index 782c25cf0e13..ead1a8ffac78 100644
> --- a/package/dos2unix/Config.in
> +++ b/package/dos2unix/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
>  	help
>  	  dos2unix converts text file line endings between CRLF and LF
>  
> -	  http://freshmeat.net/projects/dos2unix
> +	  http://waterlan.home.xs4all.nl/dos2unix.html
> diff --git a/package/dos2unix/Config.in.host b/package/dos2unix/Config.in.host
> index 012d614c0df4..5ec6033a8e32 100644
> --- a/package/dos2unix/Config.in.host
> +++ b/package/dos2unix/Config.in.host
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_DOS2UNIX
>  	help
>  	  dos2unix converts text file line endings between CRLF and LF
>  
> -	  http://freecode.com/projects/dos2unix
> +	  http://waterlan.home.xs4all.nl/dos2unix.html
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.
