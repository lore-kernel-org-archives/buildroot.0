From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:39:57 +0200
Subject: [Buildroot] [PATCH/next 3/7] package/ipsec-tools: Fix build
 with OpenSSL 1.1.x
In-Reply-To: <20180825091702.28471-4-bernd.kuhls@t-online.de>
References: <20180825091702.28471-1-bernd.kuhls@t-online.de>
 <20180825091702.28471-4-bernd.kuhls@t-online.de>
Message-ID: <20180910223957.010f82ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 11:16:58 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ipsec-tools/0006-openssl-1.1.patch | 1104 ++++++++++++++++++++
>  1 file changed, 1104 insertions(+)
>  create mode 100644 package/ipsec-tools/0006-openssl-1.1.patch

So, I was a bit uneasy with applying such a large patch that isn't
accepted upstream. But upstream seems to be dead/unresponsive, and
Debian has added the same patch (with very minor differences).

So, I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
