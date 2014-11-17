From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 17 Nov 2014 19:39:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: fix build error without
 OpenSSL support
In-Reply-To: <CAHkwnC9Ue-JTijafq76z7oCQ+Rc5GSrdxhgttxZ3UM76iT7qZQ@mail.gmail.com>
References: <1416224516-6065-1-git-send-email-jkrause@posteo.de>
 <CAHkwnC9Ue-JTijafq76z7oCQ+Rc5GSrdxhgttxZ3UM76iT7qZQ@mail.gmail.com>
Message-ID: <1416249582.17477.1.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2014-11-17 at 18:43 +0100, Fabio Porcedda wrote:
> On Mon, Nov 17, 2014 at 12:41 PM, J?rg Krause <jkrause@posteo.de> wrote:
> > Add a patch to fix broken build of nodejs without OpenSSL support.
> >
> > Version 0.10.33 of nodejs introduced a bug which prevents us from building
> > nodejs without OpenSSL support. The bug is reported upstream:
> > https://github.com/joyent/node/issues/8676
> >
> > This bug caused some build errors:
> >   * http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/
> >   * http://autobuild.buildroot.net/results/e1f/e1fb34818ff1167aa008b4011befb9fd14c81293/
> >
> > and more...
> >
> > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> 
> Have you sent this patch upstream?

Not yet, I want to do it after someone else has reviewed and tested the
patch.
