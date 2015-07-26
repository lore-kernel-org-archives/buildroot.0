From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 20:59:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <20150726193803.GB17029@tarshish>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726193803.GB17029@tarshish>
Message-ID: <CA+BsyQ6yfCRKAHpMq2Y68N9DSKrD3z20jBzfWgmSdqnTjXEk4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> > --- a/package/exfat-utils/Config.in
> > +++ b/package/exfat-utils/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_EXFAT_UTILS
> >       bool "exfat-utils"
> > +     select BR2_PACKAGE_LIBFUSE
> >       depends on BR2_USE_WCHAR
>
> Please propagate BR2_PACKAGE_LIBFUSE dependencies.
>

Baruch,

Sorry .. can you define "propagate" ?

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/eece92aa/attachment.html>
