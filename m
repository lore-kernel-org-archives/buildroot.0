From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 19 Sep 2010 11:53:05 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <4C95DD81.2090105@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 19.09.2010 10:23, schrieb Marcus Osdoba:
> the client has an excellent webinterface
> and seems to be ideal for headless systems,
> the statedirectory is stored in /var/transmission which links to tmp,
> the user should provide a writable config direcory
>
> Based on work by: Kelvin Cheung<keguang.zhang@gmail.com>
>
> Signed-off-by: Marcus Osdoba<marcus.osdoba@googlemail.com>
> ---
> [...]
Hi Marek and Kelvin,

Are you able to test the new patch for your targets and send some 
(hopefully) positive test results in reply to this patch on the 
mailinglist. Maybe this would fasten the inclusion into upcoming release 
2010.11.

Regards,
Marcus
