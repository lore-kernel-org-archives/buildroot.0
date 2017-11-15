From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 15 Nov 2017 13:48:01 +0100
Subject: [Buildroot] [PATCH 1/2] package/feh: Fix build issue with some
 older cross-compilers
In-Reply-To: <20171115124111.e6rdg5i6hxg3uorh@sapphire.tkos.co.il>
References: <20171115115155.4830-1-petr.vorel@gmail.com>
 <20171115124111.e6rdg5i6hxg3uorh@sapphire.tkos.co.il>
Message-ID: <20171115124801.rtttv64tqyddnrsp@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> Hi Petr,

> How did you overcome the build issue you had?
Build on another machine with Debian. I'll write about it in the original thread (and CC
you and.

> On Wed, Nov 15, 2017 at 12:51:54PM +0100, Petr Vorel wrote:
> > by adding -std=gnu11 to CFLAGS.

> > Also: build in parallel, use TARGET_CONFIGURE_OPTS and cleanup
> > FEH_INSTALL_TARGET_CMDS.

> This should be a separate patch, I think.
I don't like squashing things in one commit either, but this looked obvious to me. OK,
I'll split it.


Kind regards,
Petr
