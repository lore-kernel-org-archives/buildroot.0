From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:25:17 +0100
Subject: [Buildroot] [PATCH] package/kodi: share the download dir with
 helper programs
In-Reply-To: <20191113204412.27018-1-yann.morin.1998@free.fr>
References: <20191113204412.27018-1-yann.morin.1998@free.fr>
Message-ID: <20191115222517.2bdb5f9d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Nov 2019 21:44:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The two helper programs TesturePackager and JsonSchemaBuilder are built
> out of the same source tree as Kodi, so to avoid downloading the same
> archive three times, let's them share the same download directory.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 1 +
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
