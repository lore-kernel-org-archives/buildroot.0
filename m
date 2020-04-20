From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Apr 2020 21:03:46 +0200
Subject: [Buildroot] [PATCH] packages/exim: enable parallel make
References: <20200420163645.17803-1-luca@lucaceresoli.net>
Message-ID: <i981ngx5pj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 20 Apr 2020 18:36:45 +0200 schrieb Luca Ceresoli:

> Parallel make used to be broken in exim, as reported in its docs. Now
> that line has disappeared from the docs, and parallel make is actually
> working.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(build-tested with -j9 and this defconfig
 BR2_PACKAGE_DOVECOT=y
 BR2_PACKAGE_EXIM=y
 BR2_PACKAGE_CLAMAV=y)
