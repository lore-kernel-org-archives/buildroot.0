From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:53:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 18.9-Leia
In-Reply-To: <20201025114959.561657-1-bernd.kuhls@t-online.de>
References: <20201025114959.561657-1-bernd.kuhls@t-online.de>
Message-ID: <20201025155338.15e629dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 12:49:59 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-

You are changing the version of those packages, without updating their
hash files. This doesn't seem right.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
