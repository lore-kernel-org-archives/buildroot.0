From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 18:06:05 +0200
Subject: [Buildroot] [UNSURE]Re: [v4 1/2] luainterpreter: create virtual
 package
In-Reply-To: <CAB0FRsuV60bJ0i789DqKoGnxtofbZMrjx76XAbxRL7AJ2-gqDA@mail.gmail.com>
References: <1376469325-3707-1-git-send-email-francois.perrad@gadz.org>
 <CA+-urNQZVaNvLwNUA_X6N7Ft2N0U1Yo6h+L__vNtHJfOZVPUSA@mail.gmail.com>
 <20130930225408.4ea0f858@skate>
 <CAB0FRssEyA+HqrMGw4B-sEswJY7YAMqw0Jh+L6gpyE0TVCyB6A@mail.gmail.com>
 <20131001093122.48b1c5f4@skate>
 <CAB0FRsspaq_BTykGrOPP=iyTxpm9Wu46wMvWgRHNDzSpj-XCkA@mail.gmail.com>
 <20131001141017.422ee8ab@skate>
 <CAB0FRsuV60bJ0i789DqKoGnxtofbZMrjx76XAbxRL7AJ2-gqDA@mail.gmail.com>
Message-ID: <20131001180605.00478686@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Tue, 1 Oct 2013 17:59:25 +0200, Fran?ois Perrad wrote:

> >> So, I think Lua 5.1.x and 5.2.x can be handled by the same package
> >> with a choice (like gcc, binutils)
> >
> > Ok. But then Lua packages that are not yet compatible with 5.2.x will
> > have to be marked "depends on !BR2_PACKAGE_LUA_5_2". Is this what you
> > had in mind?
> 
> Yes.

Sounds good to me, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
