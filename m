From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 28 Feb 2013 08:45:14 +0100
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
Message-ID: <512F0B0A.4050403@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bhupal!

Am 28.02.2013 06:53, schrieb Bhupal Singh:
> Hi All,
>
> I was trying to update webkit 1.10.2 in the latest buildroot which was
> released on feb 2013, for a cross-compilation toolchain. But seems
> that the latest buildroot has webkit1.2.7 which seems to be very old.
>
> While building webkit1.10.2 with target as DirectFB, The build fails
> due to the other packages which are not compatible with the
> webkit1.10.2 and lot of issues which I really could not figure out.
I also tried this some time before, but there were some other packages
that had to be updated. I am not sure if GTK3 is needed, which isn't
supported yet. So I had to give up because I was running out of time.
> If some one can tell me why does latest buildroot has such an old
> webkit1.2.7 version, Or is it that the current stable webkit1.10.2 is
> not feasible with the latest buildroot.
I am sure this is simply due to the fact that nobody had time to do it
or needed a newer version.
> Since I am new to this platform, I have very little understanding on
> buildroot,Please help.
Quite sure that you would get help here on the list if you decide to
bump webkit's version.

When I'm back in my office I'll review my recent work and give you some
more details.

Kind regards

Stephan
>
> Thanks in advance.
>
>
