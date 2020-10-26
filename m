From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2020 22:23:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 18.9-Leia
In-Reply-To: <20201026220517.7a82f9f8@windsurf.home>
References: <20201025114959.561657-1-bernd.kuhls@t-online.de>
 <20201026220517.7a82f9f8@windsurf.home>
Message-ID: <20201026212352.GF2805@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-10-26 22:05 +0100, Thomas Petazzoni spake thusly:
> On Sun, 25 Oct 2020 12:49:59 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
> >  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
> >  package/kodi/kodi.hash                                   | 2 +-
> >  package/kodi/kodi.mk                                     | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks. Do you know why we have separate
> kodi-texturepacker/kodi-jsconschemabuilder packages instead of having a
> host-kodi package that would just build those two tools out of the Kodi
> code base ?

I guess there is a bit of "historical reasons" behind it.

However, there is a good technical reason: our package infrastructure
can only build in one FOO_SUBDIR per pacakge, but here we have two:

  - tools/depends/native/JsonSchemaBuilder/
  - tools/depends/native/TexturePacker/

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
