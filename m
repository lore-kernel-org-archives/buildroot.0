From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 04 Jun 2019 17:50:36 +0300
Subject: [Buildroot] [PATCH] package/luv: update hash
In-Reply-To: <20190604142527.30307-1-joerg.krause@embedded.rocks>
References: <20190604142527.30307-1-joerg.krause@embedded.rocks>
Message-ID: <87h895o14z.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Tue, Jun 04 2019, J?rg Krause wrote:

> Upstream removed (using git force-push) and recreated version 1.29.1-1
> and re-uploaded the source tarball. Therefore, the hash has changed and
> needs to be updated.

What about the file at the default backup site?

  http://sources.buildroot.net/luv/luv-1.29.1-1.tar.gz

It's the old file.

baruch

> See:
> https://github.com/luvit/luv/issues/330
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/luv/luv.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/luv/luv.hash b/package/luv/luv.hash
> index 507299f9df..02d61b0f24 100644
> --- a/package/luv/luv.hash
> +++ b/package/luv/luv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 430d5d8ad6b22e3e6284b8cdcfc7cea93e7459039bc12375a8a89bfbd034751c  luv-1.29.1-1.tar.gz
> +sha256 572cf3887f4ca03d2761664aa8a098909b445164d8263015693893902558d4cd  luv-1.29.1-1.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
