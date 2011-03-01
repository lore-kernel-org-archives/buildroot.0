From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 1 Mar 2011 21:06:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] linux.mk: depend on actual kernel
 image instead of stamp file
In-Reply-To: <20110301172355.2c535403@surf>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
	<1297986294-23446-2-git-send-email-bjorn.forsman@gmail.com>
	<20110301172355.2c535403@surf>
Message-ID: <AANLkTikAti1SbW1d7Zf_NiUhGUpn8-cDoVgO-dnn6PAU@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I forgot to say thank you for your feedback in my previous mail. So,
thank you for your feedback :-)

Also, I have an idea for a patch that provide almost the same
functionality as this one -- without removing stamp files (in the
patch): If output/images/ needs to be created, remove all stamp files
from packages that install into output/images/.

It is basically the same method as patch 1 in this series. What do you think?

Right now I'm not sure which method I like best, but I figured I
should post it anyway.

Best regards,
Bj?rn Forsman
