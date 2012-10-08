From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 08 Oct 2012 19:55:28 +0300
Subject: [Buildroot] u-boot compiling
In-Reply-To: <1349713787.63802.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1349713787.63802.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <50730580.9020508@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know nothing about u-boot because I use grub for booting my x86 machines
and this is just a wild guess but maybe you could try standard "quiet"
kernel parameter
to place somewhere during boot process.

That's is, if u-boot allows passing kernel paremeters  like grub does ?

http://www.mjmwired.net/kernel/Documentation/kernel-parameters.txt

quiet		[KNL] Disable most log messages



Best regards
Stefan

8.10.2012 19:29, Zoran Djordjevic kirjoitti:
> I want to achieve booting linux on my ARM board without messages
> displaying on console. AFAIK, I must have u-boot version compiled
> with that possiblity (CONFIG_SILENT_CONSOLE). My u-boot binary
> version (on my board CD) seems not to be of that kind, because when I
> set "silent" environment variable, nothing happens.
> So, I am interested if I can compile u-boot alone, by 
> using Buildroot ie. without building kernel and root file system ?
> Also, what amount of boot time shortage can I expect when supressing
> console messages ?
>  
> Regards
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/8b736dc1/attachment.html>
