From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Jul 2017 18:07:10 +0200
Subject: [Buildroot] [PATCH v4,1/1] boinc: new package
References: <1499281026-4745-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <eifs3exd09.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 05 Jul 2017 20:57:06 +0200 schrieb Fabrice Fontaine:

> +BOINC_DEPENDENCIES = host-pkgconf libcurl openssl

Hi Fabrice,

one more thing: boinc has an optional dependency for freetype:
https://github.com/BOINC/boinc/blob/master/configure.ac#L497
which is currently not handled by your package.

Regards, Bernd
