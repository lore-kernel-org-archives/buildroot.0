From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:20:36 +0200
Subject: [Buildroot] [PATCH v3 1/3] toolchain: add 4.16.x choice for
 headers
In-Reply-To: <20180408182645.2677-1-bernd.kuhls@t-online.de>
References: <20180408182645.2677-1-bernd.kuhls@t-online.de>
Message-ID: <20180409212036.1ae260ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Apr 2018 20:26:43 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: no changes
> v2: no changes

Thanks, series applied with Luca's Tested-by. I think we should work to
remove AUTORECONF and GETTEXTIZE from host-flex in order to make this
new dependency more reasonable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
