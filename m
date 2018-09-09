From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:52:05 +0200
Subject: [Buildroot] [PATCH/next 4/7] package/liboauth: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <20180825091702.28471-5-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
 <20180825091702.28471-5-bernd.kuhls@t-online.de>
Message-ID: <20180909155205.0d31eb72@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 11:16:59 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/liboauth/0001-openssl-1.1.0.patch | 154 ++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>  create mode 100644 package/liboauth/0001-openssl-1.1.0.patch

Applied to master after reformatting the patch to be Git-formatted.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
