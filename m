From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 5 Mar 2014 11:29:28 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140305112729.47a9a631@skate>
References: <20140305073008.3DAFE101B04@stock.ovh.net>
 <20140305112729.47a9a631@skate>
Message-ID: <CAM+bi4t8Toj7ERf3DR=854xhwAS7-Ubtrr2xTGsfKjk5kRoZHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-03-05 11:27 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> >       sh4a |              libxmlrpc-1.25.26 | NOK |
> http://autobuild.buildroot.net/results/996fc95b302fb6dfc7cd9a468fd395226a36c6c4/
>
> Not sure:
>
> /home/test/test/1/output/host/usr/bin/sh-linux-gnu-gcc  -shared
> -Wl,-soname,libxmlrpc_xmltok.so.3  xmltok.osh xmlrole.osh  -o
> libxmlrpc_xmltok.so.3.25
> xmltok.osh: file not recognized: File truncated
> collect2: error: ld returned 1 exit status
>


That comes from the recently applied patch I sent.

I'll look at it, it's a bit strange.


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140305/61807564/attachment.html>
