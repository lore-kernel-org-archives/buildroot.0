From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sun, 14 Sep 2014 19:58:51 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <87k3576vle.fsf@dell.be.48ers.dk>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
 <87k3576vle.fsf@dell.be.48ers.dk>
Message-ID: <CABbD_XB1Xb4+aJ_TbZYGt-Szt2JThQEdWAdbpOp9fdkaY4brsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


> Have you tested this against mainline buildroot? Compilation fails as
> libglib2 also defines a g_info macro like openvmtools does since 2.40.
>
>
I tested it multiple times, the compile never failed for me because of this
bug (own toolchain, all 3 libc options tested).
I even tried it today after reading your mail, I removed the 3rd patch from
the package directory, and it compiles nicely w/ libglib2-2.40.0 w/ all
three libc possibilities.
I guess this only occurs when compiling with options that are disabled in
our build (maybe X11 support or libICU)?
Thanks for the heads up, I'll be looking out for that one.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140914/054472c3/attachment.html>
