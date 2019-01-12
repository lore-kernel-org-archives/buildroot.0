From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 15:48:38 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsquish: add license file hash
In-Reply-To: <20190112121024.27896-1-romain.naour@gmail.com>
References: <20190112121024.27896-1-romain.naour@gmail.com>
Message-ID: <20190112154838.39416c68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 13:10:23 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsquish/libsquish.hash | 2 ++
>  1 file changed, 2 insertions(+)

I've applied both patches. I've added a third patch that re-enables
libsquish for BR2_STATIC_LIBS=y configuration, since the
ENABLE_SHARED=0 flag allows to disable building/installing the shared
library.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
