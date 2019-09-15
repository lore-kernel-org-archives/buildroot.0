From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:05:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libite: bump version to 2.1.0
In-Reply-To: <20190904180320.31598-1-bernd.kuhls@t-online.de>
References: <20190904180320.31598-1-bernd.kuhls@t-online.de>
Message-ID: <20190915230507.2c8e0778@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 20:03:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added md5 hash provided by upstream.
> Switched _SOURCE to .xz tarball provided by upstream.
> This tarball contains a configure script so we do not need to
> autoreconf anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: removed trailing slash from _SITE (Ryan)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
