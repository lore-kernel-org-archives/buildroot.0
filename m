From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 15 Jul 2016 17:17:40 -0600
Subject: [Buildroot] [PATCH 3/3] sdl2_ttf: new package
In-Reply-To: <20160715164111.5606b6b7@free-electrons.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
 <1468335185-19378-3-git-send-email-peter.macleod.thompson@gmail.com>
 <20160715164111.5606b6b7@free-electrons.com>
Message-ID: <CAGrGpJCiiq9fGM=53W=6oZn4nyJZMOe6ZnQaTxMojfpY9QfMpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On behalf of all us SDL2 users, thanks for taking the time to look at, and
repair,  my 3 submitted patches.  Your work is appreciated by many!!!

Peter


On Fri, Jul 15, 2016 at 8:41 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 12 Jul 2016 08:53:05 -0600, Peter Thompson wrote:
> > sdl2_ttf created from sdl_ttf with some minor changes
> >
> > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> > ---
> >  package/Config.in              |  1 +
> >  package/sdl2_ttf/Config.in     |  9 +++++++++
> >  package/sdl2_ttf/sdl2_ttf.hash |  2 ++
> >  package/sdl2_ttf/sdl2_ttf.mk   | 20 ++++++++++++++++++++
> >  4 files changed, 32 insertions(+)
> >  create mode 100644 package/sdl2_ttf/Config.in
> >  create mode 100644 package/sdl2_ttf/sdl2_ttf.hash
> >  create mode 100644 package/sdl2_ttf/sdl2_ttf.mk
>
> Applied after doing the following changes:
>
>     [Thomas:
>      - point <pkg>_LICENSE_FILES to a file that actually exists
>      - add host-pkgconf to the dependencies
>      - remove unneeded CONF_OPTS options
>      - pass FREETYPE_CONFIG in the environment to point to freetype-config]
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160715/dbd95a69/attachment.html>
