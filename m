From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Tue, 4 Mar 2014 17:03:05 -0300
Subject: [Buildroot] [PATCH 4/4] mysql: host-mysql depends on host-zlib
In-Reply-To: <CA+kK6WtYwDh0Tvt=U9Ke5bsRSnF0X69oOd9Hh4N=6wMSrs6AHA@mail.gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
 <1393944603-3104-4-git-send-email-kuyurix@gmail.com>
 <20140304185227.46062c52@skate>
 <CA+kK6WtYwDh0Tvt=U9Ke5bsRSnF0X69oOd9Hh4N=6wMSrs6AHA@mail.gmail.com>
Message-ID: <CA+kK6WseNEiMeEyAUsW7ajZXdNyKdF8w98OkuhEpDEpQHsiniQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


> I downloaded a fresh "git buildroot" and I've only selected MySQL client
> and  MySQL server.
>
> When it was compiling "host-mysql", could not find "libzlt.la" library.
>
> So I've added host-zlib and that issue completely gone.
>


More details about host-zlib dependency....

I'm using a Debian distro and if remove "zlib1g-dev" package. I got the
following error message without host-zlib.

libtool: link: cannot find the library `../zlib/libzlt.la' or unhandled
argument `../zlib/libzlt.la'

Therefore, zlib1g-dev makes the difference.

Regards,
Marcelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140304/72838d63/attachment.html>
