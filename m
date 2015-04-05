From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 23:02:08 +0200
Subject: [Buildroot] [PATCH v2 1/2] i2c-tools: add hash file
In-Reply-To: <1428263326-10320-1-git-send-email-ryanbarnett3@gmail.com>
References: <1428263326-10320-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150405210208.GG4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2015-04-05 14:48 -0500, Ryan Barnett spake thusly:
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/i2c-tools/i2c-tools.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/i2c-tools/i2c-tools.hash
> 
> diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
> new file mode 100644
> index 0000000..a6c376f
> --- /dev/null
> +++ b/package/i2c-tools/i2c-tools.hash
> @@ -0,0 +1,2 @@
> +# locally computed hash
> +sha256	14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700  i2c-tools-3.1.1.tar.bz2

Manually verified the hash

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150405/b0292970/attachment.asc>
