From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 20 Sep 2013 11:33:24 +0300
Subject: [Buildroot] [PATCH v2 1/6] qt5: bump to 5.1.1
In-Reply-To: <CA+csPL5cbqKLM86HtZ3YtMXfjWZwxmHLBAmx+b1m=3GR4gW46A@mail.gmail.com>
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
 <1379655795-22429-2-git-send-email-fatih.asici@gmail.com>
 <CA+csPL5cbqKLM86HtZ3YtMXfjWZwxmHLBAmx+b1m=3GR4gW46A@mail.gmail.com>
Message-ID: <1379666004.20818.3.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2013-09-20 at 09:20 +0200, Espen Frimann Koren wrote:
> Thank you for taking care of this.
> 
> Unfortunately doesn't it work yet. The configuration part is OK.
> 
> After a long while it is going to compile the file
> eglconvenience/qeglconvenience.cpp, and then it complains about not
> finding X11/Xlib.h. This is because the symbol EGL_API_FB must be
> defined. I saw some discussion about this and that you have filed a
> bug to Qt. It is a Qt-problem you think?
> 
Did you apply this patch[1]?

[1] http://patchwork.ozlabs.org/patch/275885/
