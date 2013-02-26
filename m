From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Tue, 26 Feb 2013 18:21:15 +1100
Subject: [Buildroot] [PATCH 1/1] python: fix to ensure libpython is
	stripped
References: <1360729319-28028-1-git-send-email-przemyslaw.wrzos@calyptech.com>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A54@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

> Subject: [PATCH 1/1] python: fix to ensure libpython is stripped
> 
> The python and python3 builds mark libpython as read-only which
prevents
> it from being stripped out correctly for the target.

Is there any updates regarding this patch?

Cheers,
Przemyslaw Wrzos
