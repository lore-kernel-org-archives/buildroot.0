From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 22 May 2018 07:26:36 +0200
Subject: [Buildroot] [git commit] libmediaart: rename options to have
 proper prefix
In-Reply-To: <20180521212027.3AC6D7FFCC@busybox.osuosl.org>
References: <20180521212027.3AC6D7FFCC@busybox.osuosl.org>
Message-ID: <20180522052635.jby4qrgffdhmt3of@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> commit: https://git.buildroot.net/buildroot/commit/?id=8553b3988717664a7130bcd58f54eb65cdb8c9e0
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> Options should be prefixed by BR2_PACKAGE_LIBMEDIAART and not
> BR2_PACKAGE_MEDIAART, but package was using both prefixes.

> This was found as default symbol was defined as
> BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE (correct prefix), but symbol
> was actually BR2_PACKAGE_MEDIAART_BACKEND_NONE).

> This commit therefore renames the incorrectly named options, and adds
> Config.in.legacy handling. Since the options are part of a choice, the
> legacy handling cannot select the new options, and is only here to
> inform the user.

> Fixes: c443830a57 libmediaart: new package

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> [Thomas: improve commit log, add Config.in.legacy handling]
Thanks a lot for your changes!


Kind regards,
Petr
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy                   | 24 ++++++++++++++++++++++++
>  package/libmediaart/Config.in      |  8 ++++----
>  package/libmediaart/libmediaart.mk |  6 +++---
>  3 files changed, 31 insertions(+), 7 deletions(-)
...


Kind regards,
Petr
