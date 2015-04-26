From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sun, 26 Apr 2015 14:34:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/ccache: add wrapper for
	internal toolchain
In-Reply-To: <20150426142444.51f5b4d6@free-electrons.com>
References: <1430040062-46308-1-git-send-email-kaszak@gmail.com>
 <1430040062-46308-2-git-send-email-kaszak@gmail.com>
 <20150426113742.182fa26b@free-electrons.com>
 <CABbD_XCocg8xyZHE5rxAA3FUH5p2eGaFiKdaJhoaXhdFVingug@mail.gmail.com>
 <20150426142444.51f5b4d6@free-electrons.com>
Message-ID: <CABbD_XAvt57EFAVEeUghPG1HtpHOyxw1naYcq+PorTU5KO1qsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

No problem, but it would indeed be nice to have a solution that covers
> both cases.


Strongly agree.


> Indeed. But maybe the existing external toolchain wrapper can be used.
> We probably don't want to have a shell wrapper call a C wrapper
> calling the compiler.
>

I'll look into it!

Until then, I'll just resend the version bump with a more extensive commit
message, as Baruch suggested.

Regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150426/29b6bc2c/attachment.html>
