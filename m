From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Jul 2017 17:56:04 +0200
Subject: [Buildroot] [PATCH v4,1/1] boinc: new package
References: <1499281026-4745-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <ktes3exd09.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Am Wed, 05 Jul 2017 20:57:06 +0200 schrieb Fabrice Fontaine:

> +BOINC_PATCH += \
> +	https://github.com/BOINC/boinc/
commit/25c2f1839753a2695c62cc4d4edb7e88345af8cb.patch \
> +	https://github.com/BOINC/boinc/commit/
bf807980c1b217c0f20668a664806d8727df3239.patch

please add the patches as files to packages/boinc/, patches from 
github.com
are not stable over time, the hashes can change.

Regards, Bernd
