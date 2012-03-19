From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 19 Mar 2012 11:10:55 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
In-Reply-To: <20120319105120.7dcafd10@skate>
References: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
 <20120319105120.7dcafd10@skate>
Message-ID: <CAM+bi4tyqL-zYyb7AC7kRPgGvedUoHok=Vkn-xdHJuZbs-PyGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/3/19 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Thanks for this package!
>

No, thanks all of you!


> If it doesn't use the autotools, then you should use the GENTARGETS
> infrastructure rather than the AUTOTARGETS one.
>


I see, but then essentially I would have to copy, paste and reformat the
original Makefile into vnstat.mk Isn't that a bit redundant?

AUTOTARGETS expects to find all, install, clean, uninstall targets after
configuration. If I make it skip the configuration step, wouldn't that be
easier, rather than having to redo most of the original Makefile?

Regards,

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120319/45a59dbf/attachment.html>
