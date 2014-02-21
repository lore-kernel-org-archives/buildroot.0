From: pl <pl@artisanlogiciel.net>
Date: Fri, 21 Feb 2014 19:04:08 +0100
Subject: [Buildroot] dhclient and udhcpc
In-Reply-To: <CALD51P-1-C-0n3rxHMT9maM3JX8fYgpXT3HYT2pwcjtR2GH3fg@mail.gmail.com>
References: <CALD51P-1-C-0n3rxHMT9maM3JX8fYgpXT3HYT2pwcjtR2GH3fg@mail.gmail.com>
Message-ID: <53079518.5090004@artisanlogiciel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/02/2014 18:52, Lijun QIN wrote:
> With buildroot-2011.05, "udhcpc  eth0" gets dynamic IP, but dhclient 
> eth0 can not get anything.
>
>  [root@(none) dhcp]# ifconfig  -a
> eth0   Link encap:Ethernet  HWaddr 00:25:B3:08:20:2C
>           BROADCAST MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:532
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>           Interrupt:8
>
> after dhclient eth0
>   eth0  Link encap:Ethernet  HWaddr 00:25:B3:08:20:2C
>           BROADCAST MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:532
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>           Interrupt:8
>
> Any idea ?
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I am just a newbie on buildroot, but i think your description is too 
short, and your version of buildroot seems old.
How did you get buildroot and how did your configure it ?
What is the target ? Is there more traces ( ex in /var/log/messages ) ?

Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140221/8a36e813/attachment.html>
