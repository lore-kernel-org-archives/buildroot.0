From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Nov 2017 14:54:39 +0200
Subject: [Buildroot] [PATCH 1/2] package/feh: Fix build issue with some
 older cross-compilers
In-Reply-To: <20171115124801.rtttv64tqyddnrsp@dell5510>
References: <20171115115155.4830-1-petr.vorel@gmail.com>
 <20171115124111.e6rdg5i6hxg3uorh@sapphire.tkos.co.il>
 <20171115124801.rtttv64tqyddnrsp@dell5510>
Message-ID: <20171115125439.nyzaqd234orgm2kv@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr,

On Wed, Nov 15, 2017 at 01:48:01PM +0100, Petr Vorel wrote:
> Hi Baruch,
> > How did you overcome the build issue you had?
> Build on another machine with Debian. I'll write about it in the original thread (and CC
> you and.
> 
> > On Wed, Nov 15, 2017 at 12:51:54PM +0100, Petr Vorel wrote:
> > > by adding -std=gnu11 to CFLAGS.
> 
> > > Also: build in parallel, use TARGET_CONFIGURE_OPTS and cleanup
> > > FEH_INSTALL_TARGET_CMDS.
> 
> > This should be a separate patch, I think.
> I don't like squashing things in one commit either, but this looked obvious to me. OK,
> I'll split it.

Apart from keeping separate changes in separate patches, I think we'd like to 
have the fix in master, but the cleanup in next.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
