From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:27:53 +0200
Subject: [Buildroot] [PATCH v2 1/1] encfs: new package
In-Reply-To: <20180905133038.ap35penf4lvuklly@sapphire.tkos.co.il>
References: <1535957893-20219-1-git-send-email-yairba@tkos.co.il>
 <20180905133038.ap35penf4lvuklly@sapphire.tkos.co.il>
Message-ID: <20180906212753.698be95c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Wed, 5 Sep 2018 16:30:38 +0300, Baruch Siach wrote:

> If tinyxml2 is indeed a mandatory dependency you should add it as an optional 
> dependency, so that the Buildroot tinyxml2 package is used when 
> BR2_PACKAGE_TINYXML2 is enabled. Otherwise, the bundled library is used, and 
> you should add its license (zlib) to ENCFS_LICENSE.

No, I think we really prefer to always use the external library when
possible, and avoid bundled libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
