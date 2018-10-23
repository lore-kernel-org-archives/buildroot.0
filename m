From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Oct 2018 19:25:11 +0200
Subject: [Buildroot] [PATCH] PostgreSQL: bump version to 11.0
References: <20181023171555.18043-1-aduskett@gmail.com>
Message-ID: <n424afxool.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 23 Oct 2018 13:15:55 -0400 schrieb Adam Duskett:

> Other changes:
>  - Add --without-llvm to CONF_OPTS as PostgreSQL now comes with an
>  optional
>    JIT.

Hi Adam,

besides --without-llvm the bump was already committed:

https://git.buildroot.net/buildroot/commit/?
id=49b9ec7d1c87c63873806bbe8b494d3b1ca99fe1

Is --without-llvm really necessary?
I could not see any problems without this option.

Regards, Bernd
