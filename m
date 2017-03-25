From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 25 Mar 2017 20:29:24 +1300
Subject: [Buildroot] [PATCH] tcpreplay: bump version to 4.2.1
In-Reply-To: <20170324120014.62843-1-Vincent.Riera@imgtec.com>
References: <20170324120014.62843-1-Vincent.Riera@imgtec.com>
Message-ID: <CAFOYHZCJjgCmmaxvd5Ye-tEJUsko3kVLWeZUcwHZ-XM+J-YP5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 25, 2017 at 1:00 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/tcpreplay/tcpreplay.hash | 2 +-
>  package/tcpreplay/tcpreplay.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
> index bc75d88..802d650 100644
> --- a/package/tcpreplay/tcpreplay.hash
> +++ b/package/tcpreplay/tcpreplay.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256 924f80cd1958a4c4447f0a6a54e8d3af7aebd3674aa4ef9973f69b43b1675221        tcpreplay-4.2.0.tar.gz
> +sha256 224b519e561d969b4bdb0e700c2283e036620e3cb5895d5aab2a7e4f27d21a79  tcpreplay-4.2.1.tar.gz
> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
> index 21784c1..bc572f3 100644
> --- a/package/tcpreplay/tcpreplay.mk
> +++ b/package/tcpreplay/tcpreplay.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -TCPREPLAY_VERSION = 4.2.0
> +TCPREPLAY_VERSION = 4.2.1
>  TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
>  TCPREPLAY_LICENSE = GPLv3
>  TCPREPLAY_LICENSE_FILES = docs/LICENSE

Thanks, I saw the announcement on the tcpreplay list and hadn't got
round to sending a patch.

Acked-by: Chris Packham <judge.packham@gmail.com>

> --
> 2.10.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
