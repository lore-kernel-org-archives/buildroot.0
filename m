From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 19:46:08 +0200
Subject: [Buildroot] [v3 1/4] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <1435660966-11347-1-git-send-email-martin@barkynet.com>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
Message-ID: <20150630174607.GA3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, all,

On 2015-06-30 11:42 +0100, Martin Bark spake thusly:
> The version of the V8 JavaScript engine used by node.js v0.12.5 requires
> at least an ARMv6 architecture with VFPv2.  For this reason v0.10.39
> remains the default for ARMv5 targets, all other targets now default to
> v0.12.5.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[--SNIP--]
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index bc1f15f..816d602 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,2 +1,5 @@
>  # From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
>  sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
> +
> +# From upstream URL: http://nodejs.org/dist/v0.12.5/SHASUMS256.txt
> +sha256	4bc1e25f4c62ac65324d3cf4aa9de2d801cd708757c3567b6ad2ced7df30cdd2  node-v0.12.5.tar.gz

Hash manually checked, OK.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150630/fc550419/attachment.asc>
