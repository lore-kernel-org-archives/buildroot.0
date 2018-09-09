From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 9 Sep 2018 13:04:53 +0200
Subject: [Buildroot] [PATCH] lua: remove 5.2.x version
In-Reply-To: <20180908213537.72485d66@windsurf.home>
References: <20180908161118.4493-1-francois.perrad@gadz.org>
 <20180908213537.72485d66@windsurf.home>
Message-ID: <CAB0FRstkE99C=mEK9BBSnQhd4Fqa0Ym1g_LBfteOJGuN1LXqHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-09-08 21:35 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sat,  8 Sep 2018 18:11:18 +0200, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Could you give some justification in the commit log ?
>
> Why remove 5.2 and remove 5.1 ?
>
>
Lua 5.3.5 will be the last one of its serie.
Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
Lua 5.2.4 was released on 2015.
For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
On BR, Lua 5.3 is the default version since 2016.02.

So, the serie which could be removed is the 5.2.x.
We could wait some days for other user feedback.

Note: see discussion when 5.3.x was introduced :
http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html

Fran?ois



> We already said it numerous time: an empty commit log is never good!
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180909/bd4ff594/attachment.html>
