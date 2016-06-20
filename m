From: Alexander Dahl <post@lespocky.de>
Date: Mon, 20 Jun 2016 15:28:54 +0200
Subject: [Buildroot] [PATCH 001/121] package/at91bootstrap: add hash file
In-Reply-To: <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <6f24274af1b3db00cebca0f0f104be4c@idefix.lespocky.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2016-06-19 13:08, schrieb Yann E. MORIN:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  boot/at91bootstrap/at91bootstrap.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 boot/at91bootstrap/at91bootstrap.hash
> 
> diff --git a/boot/at91bootstrap/at91bootstrap.hash
> b/boot/at91bootstrap/at91bootstrap.hash
> new file mode 100644
> index 0000000..0c4ef5f
> --- /dev/null
> +++ b/boot/at91bootstrap/at91bootstrap.hash
> @@ -0,0 +1,2 @@
> +# localy computed
> +sha256 
> d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5 
> AT91Bootstrap1.16.zip

Acked-by: Alexander Dahl <post@lespocky.de>

---

compared with zip downloaded and stored here long ago by ptxdist ? ;-)


-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
