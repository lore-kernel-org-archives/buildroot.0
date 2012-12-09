From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2012 19:05:56 +0100
Subject: [Buildroot] [PATCH 20/51] package/libbsd: new package
In-Reply-To: <1355070924-8009-21-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-21-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201212091905.56242.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On Sunday 09 December 2012 Yann E. MORIN wrote:
> diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
> new file mode 100644
> index 0000000..d1f9e46
> --- /dev/null
> +++ b/package/libbsd/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LIBBSD_AVAILABLE
> +	def_bool y

As has already been pointed out on IRC, these _AVAILABLE symbols should
not exist. Affected packages: libbsd, libedit2, qemu.

I've already removed them locally, but will wait a bit for more review
before I post a new version of this series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
