From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 8 Jul 2016 17:53:56 +0200
Subject: [Buildroot] Config defined package version is always built
In-Reply-To: <20160708112941.516fd688@free-electrons.com>
References: <CAM+bi4tV3U-JVJkB3YY1pZY7ce12hzqXLZ7x+ebM=JzUdT7=bg@mail.gmail.com>
 <20160708112941.516fd688@free-electrons.com>
Message-ID: <CAM+bi4tPaCSYhp4EJ7HfTSxCZ+h=jkPt0hRjSmtKc+9QwsxRbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

2016-07-08 11:29 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Use:
>
> MYPKG_VERSION = $(call qstrip,$(BR2_PACKAGE_MYPKG_VERSION))
>
> to remove the double quotes around the string. This might help in
> solving your problem.
>

Nothing different happened this time, it built the package again.

Thanks,

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160708/41434f0a/attachment.html>
