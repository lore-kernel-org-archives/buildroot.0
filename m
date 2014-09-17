From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Sep 2014 21:56:06 +0200
Subject: [Buildroot] [PATCH 01/11] busybox: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140917195606.GB4056@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-17 11:19 -0300, Gustavo Zacarias spake thusly:
> And rename 0006-lzop-add-overflow-check.patch to the proper convention.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  ...overflow-check.patch => busybox-0006-lzop-add-overflow-check.patch} | 0
>  package/busybox/busybox.hash                                           | 3 +++
>  2 files changed, 3 insertions(+)
>  rename package/busybox/{0006-lzop-add-overflow-check.patch => busybox-0006-lzop-add-overflow-check.patch} (100%)
>  create mode 100644 package/busybox/busybox.hash
> 
> diff --git a/package/busybox/0006-lzop-add-overflow-check.patch b/package/busybox/busybox-0006-lzop-add-overflow-check.patch
> similarity index 100%
> rename from package/busybox/0006-lzop-add-overflow-check.patch
> rename to package/busybox/busybox-0006-lzop-add-overflow-check.patch
> diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
> new file mode 100644
> index 0000000..428ce0a
> --- /dev/null
> +++ b/package/busybox/busybox.hash
> @@ -0,0 +1,3 @@
> +# From http://busybox.net/downloads/busybox-1.22.1.tar.bz2.sign
> +md5	337d1a15ab1cb1d4ed423168b1eb7d7e	busybox-1.22.1.tar.bz2
> +sha1	d6e96fefb6f0fb8079f27468b9bf22d8dd96108e	busybox-1.22.1.tar.bz2
> -- 
> 1.8.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140917/fc9d8da1/attachment.asc>
