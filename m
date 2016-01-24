From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 16:46:18 +0100
Subject: [Buildroot] [PATCH] libnspr: fix link error with musl toolchains
References: <1452037716-22701-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <a78fncxsj2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 05 Jan 2016 21:48:36 -0200 schrieb Sergio Prado:

> +Patch backported from Alpine Linux commit
> +a162da839db0d3f8be94a5c1ad2e2e54e691c38a.
> +
> +Signed-off-by: Sergio Prado
> <sergio.prado@e-labworks.com>
> +---
> + nspr/pr/src/misc/prnetdb.c | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)

Hi,

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested only using http://autobuild.buildroot.net/
results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/defconfig )

Regards, Bernd
