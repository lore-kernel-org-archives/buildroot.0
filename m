From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 16:41:17 +0100
Subject: [Buildroot] [PATCH v2 08/12] tinyxml: new package
In-Reply-To: <1389831355-19983-9-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-9-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140119154116.GD3387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-01-16 01:15 +0100, Maxime Hadjinlian spake thusly:
> Tiny XML Parser.
[--SNIP--]
> diff --git a/package/tinyxml/Config.in b/package/tinyxml/Config.in
> new file mode 100644
> index 0000000..33d87ca
> --- /dev/null
> +++ b/package/tinyxml/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_TINYXML
> +	bool "tinyxml"
> +	  depends on BR2_INSTALL_LIBSTDCPP

Leading tabs, please.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
