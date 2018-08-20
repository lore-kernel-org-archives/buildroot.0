From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:10:30 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/alljoyn: use builtin crypto
In-Reply-To: <20180818233202.29140-1-bernd.kuhls@t-online.de>
References: <20180818233202.29140-1-bernd.kuhls@t-online.de>
Message-ID: <20180820231030.230caf04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 01:32:02 +0200, Bernd Kuhls wrote:
> Support for OpenSSL 1.1 is broken, use builtin crypto for now like
> Debian does:
> 
> https://salsa.debian.org/debian-iot-team/alljoyn/alljoyn-core-1504/commit/09d9f916ecb3e0256c5b24ef46af28cdceb4ed1b#8756c63497c8dc39f7773438edf53b220c773f67_27_26
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/alljoyn/Config.in  | 1 -
>  package/alljoyn/alljoyn.mk | 6 ++----
>  2 files changed, 2 insertions(+), 5 deletions(-)

Hum, OK, but please revert to non-bundled once Alljoyn is fixed to
build with OpenSSL 1.1.x.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
