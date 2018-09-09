From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:41:56 +0200
Subject: [Buildroot] [PATCH/next 2/7] package/ibrcommon: add openssl 1.1
 compatibility
In-Reply-To: <20180825091702.28471-3-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
 <20180825091702.28471-3-bernd.kuhls@t-online.de>
Message-ID: <20180909154156.5329bcfe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 11:16:57 +0200, Bernd Kuhls wrote:
> Added license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-added-openssl-1.1-compatibility-264.patch | 357 ++++++++++++++++++
>  package/ibrcommon/ibrcommon.hash              |   2 +
>  2 files changed, 359 insertions(+)
>  create mode 100644 package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch

Applied after dropping the change on the license file hashes, it should
be done separately. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
