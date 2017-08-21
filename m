From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 21 Aug 2017 07:32:27 +0200
Subject: [Buildroot] [PATCH] transmission: fix build without gtk and
	NLS	disabled
References: <dff988c0638beda054e9b28be05fbdbe0140ccf9.1503289636.git.baruch@tkos.co.il>
Message-ID: <bs7q6exliu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 21 Aug 2017 07:27:16 +0300 schrieb Baruch Siach:

> The transmission configure script uses with/without instead of
> enable/disable to control GTK support. So gtk support was never really
> disabled. That broke the build when transmission happened to build after
> libgtk3 with NLS disabled.

Hi Baruch,

a patch like yours is already available:
http://patchwork.ozlabs.org/patch/786301/

Regards, Bernd
