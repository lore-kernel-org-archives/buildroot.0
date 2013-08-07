From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 07 Aug 2013 12:56:37 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <CAAXf6LVgBpK7DTySYdHTNRnstpQWg8UjQcNRvpSmcLSaSbPXEA@mail.gmail.com>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <52020215.6030609@googlemail.com>
 <CAAXf6LVgBpK7DTySYdHTNRnstpQWg8UjQcNRvpSmcLSaSbPXEA@mail.gmail.com>
Message-ID: <520227E5.30300@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 07.08.2013 10:20, schrieb Thomas De Schampheleire:
> The change Fran?ois is suggesting is for the terminal title window, it
> does not change anything about coloring.

Ah yes, I misunderstand. Sorry.

> The above commands you gave do not change anything in the title bar
> for me, nor in Konsole, nor in gnome-terminal. The second command does
> show the green underlined text in both terminals, but as said the
> title bar is unchanged.

So I take a look at the titel in the console (I didn't before), works
here. I can set the name to what ever I want. Maybe you have unset some
variables or so? But I don't think it's depend on this.

> $ env | grep  "SHELL\|TERM"
> TERM=xterm
> SHELL=/bin/bash
> COLORTERM=gnome-terminal

Regards
Carsten
