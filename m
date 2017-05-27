From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 15:37:14 +0200
Subject: [Buildroot] [PATCH v2] package/gnutls: disable for static build
References: <20170525163443.5234-1-romain.naour@gmail.com>
Message-ID: <a1covdxale.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 25 May 2017 18:34:43 +0200 schrieb Romain Naour:

> Signed-off-by: Bernd Kuhls
> <bernd.kuhls@t-online.de>
> [Romain: merge our two patches together
>     add some option comment disable static libgnutls.a add sngrep
>     autobuilder reference]
> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Compile-tested using these defconfigs:

ffmpeg: http://autobuild.buildroot.net/results/b00/
b006fe2583485f8c0986056937fded730d4d148b//

taskd: http://autobuild.buildroot.net/
results/3d2/3d2f73d7c4248e2fdf28de147a09cb52e2d26b7b/

sngrep: http://autobuild.buildroot.net/results/f0d/
f0dfad2a040cf3e21d4ba2c1799ac17db57518ff/
