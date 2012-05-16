From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 16 May 2012 19:00:18 +0200
Subject: [Buildroot] [PATCH v2 06/11] manual: update working-with.txt
In-Reply-To: <1336905501-9757-7-git-send-email-s.martin49@gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-7-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LVSrt1egUubKg_-HOPwy9JWffSQF2O8AogHnT7+uoLGzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: Samuel MARTIN <s.martin49@gmail.com>
>
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index 717121a..6b486cf 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -29,8 +29,8 @@ by the different packages, so some understanding of the particular
> ?package is needed.
>
> ?For packages relying on Buildroot packages infrastructures (see

I know that you didn't change this here, but I'd change the second
'packages' to singular:
... on Buildroot package infrastructures.

> -xref:add-packages[this section] for details), the following stamp
> -files are relevant:
> +xref:adding-packages[] for details), the following stamp files are
> +relevant:
>
> ?* +output/build/packagename-version/.stamp_configured+. If removed,
> ? Buildroot will trigger the recompilation of the package from the
> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
> index 01f1041..b9d915c 100644
> --- a/docs/manual/working-with.txt
> +++ b/docs/manual/working-with.txt
> @@ -1,6 +1,9 @@
> ?Working with Buildroot
> ?======================
> -[[working-with-br]]
> +
> +This section aims to explain how Buildroot allows you to tune,
> +customize almost everthing... making your configuration fitting your
> +needs.

What is the difference between tune and customize? Later you also use
'tweaking'.
s/everthing/everything/
s/fitting/fit/

But, rephrasing suggestion:
This section explains how you can customize Buildroot to fit your needs.

>
> ?include::make-tips.txt[]
>
> @@ -10,3 +13,10 @@ include::common-usage.txt[]
>
> ?Tweaking Buildroot
> ?------------------
> +
> +Because Buildroot does not yet fit all your requirements, you may be
> +intrested in tweaking it to add:

s/Because/If/
s/intrested/interested/

> +
> +* new packages: refer to the xref:adding-packages[Developer guide]
> +
> +* new board support: refer to the xref:board-support[Developer guide]
> --
> 1.7.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
