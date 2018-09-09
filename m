From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:57:21 +0200
Subject: [Buildroot] [PATCH/next 5/7] package/libtorrent: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <20180825091702.28471-6-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
 <20180825091702.28471-6-bernd.kuhls@t-online.de>
Message-ID: <20180909155721.4da0773a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 11:17:00 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libtorrent/0002-openssl110.patch | 109 +++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/libtorrent/0002-openssl110.patch

Applied to master, thanks. Please use "git format-patch" to generate
patches, and keep the file name proposed by git format-patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
