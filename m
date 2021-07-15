From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 23:18:08 +0200
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.8.2
In-Reply-To: <20210713135305.1196063-1-francois.perrad@gadz.org>
References: <20210713135305.1196063-1-francois.perrad@gadz.org>
Message-ID: <20210715231808.77b032ef@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 13 Jul 2021 15:53:05 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/harfbuzz/harfbuzz.hash | 4 ++--
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

As Baruch pointed out, your commit log did not explain why the COPYING
hash was changed, so I checked why, improved the commit log, and
applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
