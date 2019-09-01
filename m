From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Sep 2019 12:09:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: fix build with
 gawk 5.0
References: <20190901100733.26379-1-bernd.kuhls@t-online.de>
Message-ID: <g0is3gx8it.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 01 Sep 2019 12:07:33 +0200 schrieb Bernd Kuhls:

> Fixes:
> http://autobuild.buildroot.net/results/e81/
e815bed0e7b3d9cbf50ebf605666a50e7032e5a1/

Hi,

this patch assums that the build machine received an update for gawk in 
the last 24 hours:
http://autobuild.buildroot.net/?reason=libgpg-error-1.36

Regards, Bernd
