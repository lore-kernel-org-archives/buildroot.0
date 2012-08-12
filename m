From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2012 17:55:19 +0200
Subject: [Buildroot] [PATCH 14/20] portmap: mention that rpcbind is the
	project that superseds portmap
In-Reply-To: <aae61f5152331e0d8e63c01ddca703e00cde1382.1344706801.git.thomas.petazzoni@free-electrons.com>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <aae61f5152331e0d8e63c01ddca703e00cde1382.1344706801.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201208121755.19505.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Saturday 11 August 2012 19:40:46 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/portmap/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/portmap/Config.in b/package/portmap/Config.in
> index f017cb6..8d25e3a 100644
> --- a/package/portmap/Config.in
> +++ b/package/portmap/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_PORTMAP
>  	help
>  	  The standard portmapper for RPC services.
>  
> +	  Note that portmap is being deprecated in favour of rpcbind.

Wouldn't it be better to add (thus answering your question from 00/20):
  depends on BR2_DEPRECATED

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
