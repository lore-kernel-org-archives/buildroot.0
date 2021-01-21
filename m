From: manu f <e.fiancette@gmail.com>
Date: Thu, 21 Jan 2021 18:02:39 +0100
Subject: [Buildroot] : How to add a path to environment variable ?
In-Reply-To: <20210121174729.31850f5c@windsurf.home>
References: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
 <20210121174729.31850f5c@windsurf.home>
Message-ID: <CAGshWo2KMW3VvWSGeOvqqhvi3z-Onn_hdyA-4Yjb=YEKdUDuTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your suggestion!
in the last buildroot version, nodejs is deprecated!
So I use my own compiled version of nodejs.

about etc/profile.d , I was just working on it, so its confirm this is the
good way.
But I was thinking there was a way to add natively the path ac buildroot
compilation time. sorry I am newby.

Regards


Le jeu. 21 janv. 2021 ? 17:47, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a ?crit :

> On Thu, 21 Jan 2021 16:32:56 +0100
> manu f <e.fiancette@gmail.com> wrote:
>
> > I create an overlay to install nodejs in usr/local/lib/nodejs
>
> Why don't you use the nodejs package that Buildroot has ?
>
> > and I need to add to the target environment varriable the path to the bin
> > contain directory.
> > How to do that ?
>
> Add an extra file in /etc/profile.d/ to expand the PATH as needed. You
> can use a root filesystem overlay to achieve this.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210121/c0968578/attachment.html>
