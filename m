From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 14:25:41 +0100
Subject: [Buildroot] [PATCH] netstat-nat: add license information
In-Reply-To: <1390050005.16621.1.camel@phoenix>
References: <1390050005.16621.1.camel@phoenix>
Message-ID: <20140118132541.GB3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Axel, All,

On 2014-01-18 21:00 +0800, Axel Lin spake thusly:
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  package/netstat-nat/netstat-nat.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
> index d94c6f0..a936086 100644
> --- a/package/netstat-nat/netstat-nat.mk
> +++ b/package/netstat-nat/netstat-nat.mk
> @@ -6,5 +6,7 @@
>  
>  NETSTAT_NAT_VERSION = 1.4.10
>  NETSTAT_NAT_SITE = http://tweegy.nl/download
> +NETSTAT_NAT_LICENSE = GPL

This should be GPLv2+

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
