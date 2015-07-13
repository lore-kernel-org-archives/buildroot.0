From: =?UTF-8?Q?Aur=C3=A9lien_Chabot?= <aurelien@chabot.fr>
Date: Mon, 13 Jul 2015 20:33:57 +0200
Subject: [Buildroot] [PATCH] gptfdisk: bump version 1.0.0
In-Reply-To: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
References: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
Message-ID: <CAJup9cg-NUSxF_wCA-r7Uh9RQF6E+1ytWc0V1Z6Jf7GiMd56Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2015 at 8:26 PM, Aur?lien Chabot <aurelien@chabot.fr> wrote:

> -+      $(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid
> -lncursesw $(LDLIBS) -o cgdisk
> ++      $(CXX) $(LIB_OBJS) cgdisk.o gptcurses.o $(LDFLAGS) -luuid
> -lncurses $(LDLIBS) -o cgdisk
>

I had to do that to make it build correctly. This seems strange to me, any
idea why ?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150713/7316021f/attachment.html>
