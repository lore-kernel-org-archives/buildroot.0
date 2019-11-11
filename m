From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:50:30 +0100
Subject: [Buildroot] [PATCH 2/3] package/python-huepy: new package
In-Reply-To: <20191110222655.21977-2-aussedat.louis@gmail.com>
References: <20191110222655.21977-1-aussedat.louis@gmail.com>
 <20191110222655.21977-2-aussedat.louis@gmail.com>
Message-ID: <20191111165030.596aaebb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Nov 2019 23:26:54 +0100
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-huepy/Config.in         |  6 ++++++
>  package/python-huepy/python-huepy.hash |  4 ++++
>  package/python-huepy/python-huepy.mk   | 13 +++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/python-huepy/Config.in
>  create mode 100644 package/python-huepy/python-huepy.hash
>  create mode 100644 package/python-huepy/python-huepy.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fc332affa5..68328b30b3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1394,6 +1394,7 @@ N:	Louis Aussedat <aussedat.louis@gmail.com>
>  F:	board/friendlyarm/nanopi-neo-plus2/
>  F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
>  F:  package/python-dnspython/
> +F:  package/python-huepy/

Indentation was also not correct here. Applied to next after fixing
this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
