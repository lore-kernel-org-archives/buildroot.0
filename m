From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 21:43:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.72.0
In-Reply-To: <20191215101902.3488595-1-fontaine.fabrice@gmail.com>
References: <20191215101902.3488595-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226214320.0335a75b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 11:19:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/boost.hash | 4 ++--
>  package/boost/boost.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I think this Boost update has broken libtorrent-rasterbar:

  http://autobuild.buildroot.net/?reason=libtorrent-rasterbar-1.2.2

Could you have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
