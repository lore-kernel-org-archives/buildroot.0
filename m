From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 12 Jul 2016 08:33:49 +0200
Subject: [Buildroot] Config defined package version is always built
In-Reply-To: <20160708183412.1812e2ad@free-electrons.com>
References: <CAM+bi4tV3U-JVJkB3YY1pZY7ce12hzqXLZ7x+ebM=JzUdT7=bg@mail.gmail.com>
 <20160708112941.516fd688@free-electrons.com>
 <CAM+bi4tPaCSYhp4EJ7HfTSxCZ+h=jkPt0hRjSmtKc+9QwsxRbQ@mail.gmail.com>
 <20160708183412.1812e2ad@free-electrons.com>
Message-ID: <CAM+bi4sj9-CGtVt=ORZmNGcmFZqEm8RzA9-cRdhEZ1M3noCs-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh, sorry, it did work! I mistook one package with another,
but I've just tried again and that small change does indeed solve this
issue for me.

Thanks a lot!

2016-07-08 18:34 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Fri, 8 Jul 2016 17:53:56 +0200, Alvaro Gamez wrote:
>
> > Nothing different happened this time, it built the package again.
>
> Weird. Can you create a minimal test case and send us the .mk file so
> that we can reproduce?
>
> Thanks,
>
> Thoams
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160712/d03ae251/attachment.html>
