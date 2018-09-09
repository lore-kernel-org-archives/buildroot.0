From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:36:07 +0200
Subject: [Buildroot] [PATCH/next 1/7] package/ecryptfs-utils: Fix build
 with OpenSSL 1.1.x
In-Reply-To: <20180825091702.28471-2-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
 <20180825091702.28471-2-bernd.kuhls@t-online.de>
Message-ID: <20180909153607.2fcb204f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 11:16:56 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ecryptfs-utils/0002-openssl110.patch | 173 +++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 package/ecryptfs-utils/0002-openssl110.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
