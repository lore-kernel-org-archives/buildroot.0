From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 22 Sep 2010 22:26:15 +0200
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
	<4C95DD81.2090105@googlemail.com>
	<AANLkTi=D9f0qz=DsgeX-hwZPwxvSsp-nncS+r0BiqP0y@mail.gmail.com>
Message-ID: <4C9A6667.90603@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 21.09.2010 04:00, schrieb Kelvin Cheung:
> Hi Marcus,
>
> I have tried the patch.
> It works fine.
>
> 2010/9/19 Marcus Osdoba <marcus.osdoba@googlemail.com 
> <mailto:marcus.osdoba@googlemail.com>>
>
>      Am 19.09.2010 10:23, schrieb Marcus Osdoba:
>
>         the client has an excellent webinterface
>         and seems to be ideal for headless systems,
>         the statedirectory is stored in /var/transmission which links
>         to tmp,
>         the user should provide a writable config direcory
>
>         Based on work by: Kelvin Cheung<keguang.zhang@gmail.com
>         <mailto:keguang.zhang@gmail.com>>
>
>         Signed-off-by: Marcus Osdoba<marcus.osdoba@googlemail.com
>         <mailto:marcus.osdoba@googlemail.com>>
>         ---
>         [...]
>
>     Hi Marek and Kelvin,
>
>     Are you able to test the new patch for your targets and send some
>     (hopefully) positive test results in reply to this patch on the
>     mailinglist. Maybe this would fasten the inclusion into upcoming
>     release 2010.11.
>
>     Regards,
>     Marcus
>
>
> -- 
> Best Regards!
> Kelvin
>
Hi Thomas and Peter,

Is a positive test sufficient for you to have a closer look at it?

Just for the protocol, transmission build breaks with activated 
config-cache. If I use it, I have to remove 
outbut/build/transmission-2.04 and run make flush;make.

I followed the cache discussion on the mailinglist and I know that this 
feature has been marked experimental (which is my preferred solution, 
too). But I still use it anyway to speed up the development cycle.

Regards,
Marcus

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100922/e9dcdd98/attachment.html>
