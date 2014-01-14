From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Jan 2014 15:59:41 +0100
Subject: [Buildroot] [PATCH v3 1/2] ffmpeg: bump to version 1.2.4
In-Reply-To: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
References: <BLU0-SMTP2638CE0203ADFD44E6B8961D9CB0@phx.gbl>
Message-ID: <CAHXCMM+SfJ0j1vUTyHv7c2VbL9F1BimMcZD7YcfqXbOPmasssA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,


2014/1/2 Bernd Kuhls <berndkuhls@hotmail.com>

> Compile tested the following packages which depend on ffmpeg:
>
> freerdp
> mpd
> gstreamer
>
Have you tried gst-ffmpeg?
It seems this bump triggers some build failures:
http://autobuild.buildroot.net/results/3cd/3cd2a39bba732a625117aa2941923c200ec55f51/build-end.log

Reverting back to version 0.8.15 fixes the build.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140114/d19bacef/attachment.html>
