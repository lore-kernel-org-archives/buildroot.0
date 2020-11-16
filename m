From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Nov 2020 22:17:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to
 version2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
 <20201008215931.0a4056cd@windsurf.hq.k.grp>
 <ca30d14c-6182-f97b-56c5-e206ed2839e2@gmail.com>
 <87ff0258-3abf-c8a5-e33c-234adeb2fe39@gmail.com>
Message-ID: <4s6b8hxo7q.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 15 Nov 2020 15:49:28 +0100 schrieb Romain Naour:

> But currently most glibc toolchains in the wild still use a glibc <
> 2.32.

Hi Romain,

with the exception of arc:
https://git.buildroot.net/buildroot/tree/package/glibc/glibc.mk#n17

causing build errors:
http://autobuild.buildroot.net/?reason=lmbench-3.0-a9

Regards, Bernd
