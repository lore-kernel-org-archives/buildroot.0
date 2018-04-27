From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 22:48:37 +0200
Subject: [Buildroot] [PATCH 1/1] python-subprocess32: new package
In-Reply-To: <20180427071614.24506-1-asafka7@gmail.com>
References: <20180427071614.24506-1-asafka7@gmail.com>
Message-ID: <20180427224837.3bf6d9c9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Fri, 27 Apr 2018 10:16:14 +0300, Asaf Kahlon wrote:
> A backport of the Python 3 subprocess module for use on Python 2.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Why did you resend the patch ? You didn't increase the version number,
and didn't provide a changelog.

If all you did is add the Reviewed-by: from Yegor, then it is totally
unneeded: patchwork automatically accumulates the
Acked-by/Tested-by/Reviewed-by tags.

In any case, if you send a new version of a patch, please add a version
number (git format-patch -vX, where X is the version number) and
provide a changelog below the "---" sign, right after the Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
