From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 2 May 2021 19:24:15 +1200
Subject: [Buildroot] [PATCH] package/micropython: bump version to 1.15
In-Reply-To: <20210502055754.26829-1-ecmaxp@ecmaxp.pe.kr>
References: <20210502055754.26829-1-ecmaxp@ecmaxp.pe.kr>
Message-ID: <CAFOYHZBzz+r-TL8sPxJF9ojeKdWY0XhS1=unBgnoPBfqEkhs0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2 May 2021, 5:58 PM EcmaXp, <ecmaxp@ecmaxp.pe.kr> wrote:

> https://github.com/micropython/micropython/releases/tag/v1.15


I see in the release notes that some ports have moved to cmake. Looks like
they haven't done so for the unix port (yet) probably worth noting this in
the commit message otherwise someone might try to use the cmake-package
helper (I almost suggested it after skimming the release notes).

Signed-off-by: EcmaXp <ecmaxp@ecmaxp.pe.kr>
>

Not sure if it's an official policy but I believe real names are preferred.

---
>  package/micropython/micropython.hash | 2 +-
>  package/micropython/micropython.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/micropython/micropython.hash
> b/package/micropython/micropython.hash
> index fe47ee09c4..56c000f5f8 100644
> --- a/package/micropython/micropython.hash
> +++ b/package/micropython/micropython.hash
> @@ -1,3 +1,3 @@
>  #locally computed
> -sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7
> micropython-1.14.tar.gz
> +sha256  852bac39b00bc374ee2ac19198574be17e3b9f47cdf3e2088bebb7e8490aa626
> micropython-1.15.tar.gz
>  sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085
> LICENSE
> diff --git a/package/micropython/micropython.mk b/package/micropython/
> micropython.mk
> index fa28da9be3..b346bb0ffb 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -MICROPYTHON_VERSION = 1.14
> +MICROPYTHON_VERSION = 1.15
>  MICROPYTHON_SITE = $(call
> github,micropython,micropython,v$(MICROPYTHON_VERSION))
>  MICROPYTHON_LICENSE = MIT
>  MICROPYTHON_LICENSE_FILES = LICENSE
> --
> 2.25.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210502/3f7e69f0/attachment.html>
