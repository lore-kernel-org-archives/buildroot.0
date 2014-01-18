From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 20:50:49 +0100
Subject: [Buildroot] [PATCH 02/10] transmission: add url in Config.in
In-Reply-To: <1390073027-14239-3-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
 <1390073027-14239-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20140118195049.GB23411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-18 20:23 +0100, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/transmission/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> index 8d413c6..596b0ed 100644
> --- a/package/transmission/Config.in
> +++ b/package/transmission/Config.in
> @@ -10,6 +10,8 @@ config BR2_PACKAGE_TRANSMISSION
>  	help
>  	  Transmission is a cross-platform BitTorrent client.
>  
> +	  https://trac.transmissionbt.com/

This link yields an error page:

---8<---
Trac Error

TracError: No Trac environment found@/trac/Transmission
[Errno 24] Too many open files: '/trac/Transmission/VERSION'
---8<---

OTOH, http://www.transmissionbt.com/ works as expected.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
