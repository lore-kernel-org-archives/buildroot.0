From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Aug 2019 14:26:14 +0200
Subject: [Buildroot] [PATCH] package/luaossl: bump to version 20190731
In-Reply-To: <20190820082542.14610-1-m.niestroj@grinn-global.com>
References: <20190820082542.14610-1-m.niestroj@grinn-global.com>
Message-ID: <20190820142614.7dad1d74@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Tue, 20 Aug 2019 10:25:42 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/luaossl/luaossl.hash | 4 ++--
>  package/luaossl/luaossl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

We're already at version 20190731 in the next branch. When sending
version bumps, if we're after -rc1, make sure to check the "next"
branch, as this is where we merge version bumps and other changes that
are not important/critical for the upcoming release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
