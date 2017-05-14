From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 May 2017 15:38:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-stalker: fix
	gcc7	compile
References: <20170513182944.29833-1-bernd.kuhls@t-online.de>
Message-ID: <983mudxmr5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Sat, 13 May 2017 20:29:44 +0200 schrieb Bernd Kuhls:

> +  */
> +
> + #include <thread>
> ++#include <functional>
> +
> + #include "SAPI.h"
> +

please note that all lines of the patch need DOS line endings.

Regards, Bernd
