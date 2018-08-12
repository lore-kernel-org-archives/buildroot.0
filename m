From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 19:48:51 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/gcc: fix build of
 gcc-7.3.0 with glibc-2.28
In-Reply-To: <20180812172909.21450-2-bernd.kuhls@t-online.de>
References: <20180812172909.21450-1-bernd.kuhls@t-online.de>
 <20180812172909.21450-2-bernd.kuhls@t-online.de>
Message-ID: <20180812194851.37f58885@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sun, 12 Aug 2018 19:29:09 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...4-libsanitizer-Use-pre-computed-size.patch | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 package/gcc/7.3.0/0004-libsanitizer-Use-pre-computed-size.patch

What about the older gcc versions we support ?

4.9.4
5.5.0
6.4.0
or1k-musl-5.4.0-20170218

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
