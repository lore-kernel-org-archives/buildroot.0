From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:05:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 18.9-Leia
In-Reply-To: <20201025114959.561657-1-bernd.kuhls@t-online.de>
References: <20201025114959.561657-1-bernd.kuhls@t-online.de>
Message-ID: <20201026220517.7a82f9f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 25 Oct 2020 12:49:59 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>  package/kodi/kodi.hash                                   | 2 +-
>  package/kodi/kodi.mk                                     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. Do you know why we have separate
kodi-texturepacker/kodi-jsconschemabuilder packages instead of having a
host-kodi package that would just build those two tools out of the Kodi
code base ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
