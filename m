From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 18:50:40 +0200
Subject: [Buildroot] [PATCH 13/30] package/matchbox: fix option prompts
In-Reply-To: <553971A3.7040808@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <627b2a8dc8d8772672b79e7bd2f3d36eb401dca1.1429725549.git.yann.morin.1998@free.fr>
 <553971A3.7040808@mind.be>
Message-ID: <20150424165040.GA4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-24 00:26 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
> > Use the package names instead of some fancy human-readable strings. ;-)
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/matchbox/Config.in                   | 2 +-
> >  package/matchbox/matchbox-common/Config.in   | 4 ++--
> >  package/matchbox/matchbox-desktop/Config.in  | 2 +-
> >  package/matchbox/matchbox-keyboard/Config.in | 2 +-
> >  package/matchbox/matchbox-panel/Config.in    | 2 +-
> >  5 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
> > index 7d06bb2..e58aaf2 100644
> > --- a/package/matchbox/Config.in
> > +++ b/package/matchbox/Config.in
> > @@ -1,5 +1,5 @@
> >  config BR2_PACKAGE_MATCHBOX
> > -	bool "MatchBox Window Manager"
> > +	bool "matchbox"
> 
>  Not so sure about this one... The upstream name is matchbox-window-manager, and
> it is useful information that it's a window manager. OTOH that's already in the
> comment right above it.

Well, even though I agree on principle:
  - "matchbox-window-manager" is a bit long
  - as you said, it's in the "Window Manager" section
  - the global stuff is named "matchbox", and I suppose users would
    expect to see just "matchbox"

>  So in the end I'm OK either way.

I can see if naming that package accordingly to the upstream name, and
if it proves to cumbersome, I'll just let it as it is now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
