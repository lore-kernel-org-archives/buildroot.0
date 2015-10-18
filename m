From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 09:20:18 +0200
Subject: [Buildroot] [PATCH v1 1/1] gmediarender: new package
In-Reply-To: <201510180049.t9I0nD00004594@ms-omx03.plus.so-net.ne.jp>
References: <201510170058.t9H0w49H006744@ms-omx02.plus.so-net.ne.jp>
 <201510180049.t9I0nD00004594@ms-omx03.plus.so-net.ne.jp>
Message-ID: <20151018092018.103b67cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hiroshi,

On Sun, 18 Oct 2015 09:49:13 +0900, Hiroshi Kawashima wrote:

> Thank you for your review and comment.

Thanks for your feedback.

> 1) This project is old and last update is 2007, so it still depsnds on
>    gstreamer 0.10.x.

Then is it really useful to package this in Buildroot? I'm a bit
worried about adding packages that rely only on GStreamer 0.10.
GStreamer 0.10 is deprecated, and we should rather start thinking of
removing it from Buildroot rather than adding more packages that depend
on it.

Maybe you should consider some other application than gmediarender for
your project ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
