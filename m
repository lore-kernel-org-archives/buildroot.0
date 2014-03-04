From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Tue, 4 Mar 2014 15:30:44 -0300
Subject: [Buildroot] [PATCH 4/4] mysql: host-mysql depends on host-zlib
In-Reply-To: <20140304185227.46062c52@skate>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
 <1393944603-3104-4-git-send-email-kuyurix@gmail.com>
 <20140304185227.46062c52@skate>
Message-ID: <CA+kK6WtYwDh0Tvt=U9Ke5bsRSnF0X69oOd9Hh4N=6wMSrs6AHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all.

Hum, why? I have built the mysql server successfully without this
> patch. Can you give some details about why this is needed?
>

I downloaded a fresh "git buildroot" and I've only selected MySQL client
and  MySQL server.

When it was compiling "host-mysql", could not find "libzlt.la" library.

So I've added host-zlib and that issue completely gone.

Regards,
Marcelo.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140304/cba326e5/attachment.html>
