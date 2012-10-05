From: =?ISO-8859-1?Q?Christian_M=F6ller?= <christian.moeller.75@googlemail.com>
Date: Fri, 5 Oct 2012 16:12:56 +0200
Subject: [Buildroot] Autorun
In-Reply-To: <1349445386.31306.YahooMailNeo@web164604.mail.gq1.yahoo.com>
References: <1349445386.31306.YahooMailNeo@web164604.mail.gq1.yahoo.com>
Message-ID: <CAA8O6f48iHnAU_ya_6AqeBOufXuUeaK3u+tMpsM4txt=_y7RjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
in my case, there is a xinitrc under usr/lib/X11/xinit.
There you can put your commands.
Regards
Christian


2012/10/5 Zoran Djordjevic <djdjdjole@yahoo.com>

> Hello
>
> Maybe question is not for this forum, although I am using Buildroot for
> building root file system (ARM). What I need is info how to automatically
> start GUI app. with starting Linux, built this way ?
> I tried putting command (xinit --/usr/bin/Xfbdev ....) at the end of
> inittab, but
> then it starts X, without reading .xinitrc file (where is my GUI app
> noted) so
> only xterm was started (as it is default for X).
>
> Regards
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121005/0013e861/attachment-0001.html>
