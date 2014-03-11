From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 11 Mar 2014 09:33:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-10
In-Reply-To: <20140311073009.B8EB7100EA7@stock.ovh.net>
References: <20140311073009.B8EB7100EA7@stock.ovh.net>
Message-ID: <CAM+bi4t7XJKmqnZYKYmNGGH7736xJRtPzF9+v=+cjY8VTng0Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas


2014-03-11 8:30 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

>        arm |              libxmlrpc-1.25.26 | NOK |
> http://autobuild.buildroot.net/results/81ea576d219aaee2bf1a2a5e2d23f0b66a7be6e8/
>


In file included from thread_pthread.c:12:0:
srcdir/lib/util/include/pthreadx.h:33:23: fatal error: pthread.h: No
such file or directory
compilation terminated.


I will be sending soon a patch which makes libxmlrpc depend on
BR2_TOOLCHAIN_HAS_THREADS and will also try to identify some other flags
that may be needed.

Regards


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140311/df6a9322/attachment.html>
