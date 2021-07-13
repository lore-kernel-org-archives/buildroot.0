From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Jul 2021 20:39:52 +0300
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.8.2
In-Reply-To: <20210713135305.1196063-1-francois.perrad@gadz.org>
References: <20210713135305.1196063-1-francois.perrad@gadz.org>
Message-ID: <87v95et8nr.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Jul 13 2021, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/harfbuzz/harfbuzz.hash | 4 ++--
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index ad81b34fd..774b3104a 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300  harfbuzz-2.8.1.tar.xz
> -sha256  beb3f017ceb41387667f78237a7cecf84defa0ed257c505894663d6a9f13211b  COPYING
> +sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7  harfbuzz-2.8.2.tar.xz
> +sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING

Why is the COPYING hash change?

baruch

> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 60cc8b724..f327a95eb 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HARFBUZZ_VERSION = 2.8.1
> +HARFBUZZ_VERSION = 2.8.2
>  HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>  HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>  HARFBUZZ_LICENSE = MIT, ISC (ucdn library)


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
