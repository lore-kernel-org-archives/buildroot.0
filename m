From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 18:34:09 +0100
Subject: [Buildroot] [PATCH 5/7] bison: bump to version 3.0.3
In-Reply-To: <1421332222-15098-5-git-send-email-gustavo@zacarias.com.ar>
References: <1421332222-15098-1-git-send-email-gustavo@zacarias.com.ar>
 <1421332222-15098-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150118173409.GA16593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gustavo, All,

On 2015-01-15 11:30 -0300, Gustavo Zacarias spake thusly:
> Also add hash file and remove patch since it's no longer necessary.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Manually downloaded, and hash manualy checked to be OK.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> diff --git a/package/bison/bison.hash b/package/bison/bison.hash
> new file mode 100644
> index 0000000..dd10086
> --- /dev/null
> +++ b/package/bison/bison.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature
> +sha256	5940efbdd6b5d80e55ec16a01d2322e2892da21863391049b9b692570649177c	bison-3.0.3.tar.xz

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150118/68fe6116/attachment.asc>
