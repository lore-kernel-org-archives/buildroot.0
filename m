From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:19:07 +0200
Subject: [Buildroot] [PATCH 1/1] libcdio: bump to version 2.0.0
In-Reply-To: <20180309180551.20323-1-fontaine.fabrice@gmail.com>
References: <20180309180551.20323-1-fontaine.fabrice@gmail.com>
Message-ID: <20180326231907.461f2e9f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Mar 2018 19:05:51 +0100, Fabrice Fontaine wrote:
> Add license hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcdio/libcdio.hash | 5 ++++-
>  package/libcdio/libcdio.mk   | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Bernd: libcdio is a dependency of Kodi. Perhaps you want to check of
this bump of libcdio to version 2.0.0 doesn't break anything for Kodi.
Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
