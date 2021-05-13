From: D. Olsson <hi@senzilla.io>
Date: Thu, 13 May 2021 19:46:23 +0000
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: security bump to
 version 0.21.1
In-Reply-To: <CAPi7W801eKBnSXFQGpTuTO8SRYdA6qaWXN-x2OQL8u6JT93nyw@mail.gmail.com>
References: <20210512212120.647405-1-fontaine.fabrice@gmail.com>
 <20210513173417.erlj7433mbnchkbk@falbala.internal.home.lespocky.de>
 <CAPi7W801eKBnSXFQGpTuTO8SRYdA6qaWXN-x2OQL8u6JT93nyw@mail.gmail.com>
Message-ID: <eytwv42FO5pGji2PxfnTUbUa0h4V0R3xp_fuGWNQ-Q2cyZ1xZ4Sd205XXExHiyR9Hl5NEafVCjLLGFNU0BP8UQ7hihG_nIgy0TTFEi97OjM=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, Fabrice, all

On Thursday, May 13th, 2021 at 6:39 PM, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Dear Alex,
>
> Le jeu. 13 mai 2021 ? 19:34, Alexander Dahl post at lespocky.de a ?crit :
>
> > Hello buildroot folks,
> >
> > On Wed, May 12, 2021 at 11:21:20PM +0200, Fabrice Fontaine wrote:
> >
> > > Tag as a security bump as having an up to date bitcoin is important:
> > > https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com
> > >
> > > https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.21.1.md
> >
> > Instead of patching this thing, wouldn't it be better to remove
> > bitcoin support? After all it's just a ponzi scheme with a humongous
> > bad environmental impact. The electricity consumption is estimated
> > for around 180 TWh for 2021 alone, a lot sourced from dirty coal
> > power, with the potential risk of worsening power grid stability in
> > some places of the world.
> >
> > I don't think it's ethically justifiable to support proof-of-work
> > stuff like this.
>
> I've nothing against dropping this package.

I understand that Bitcoin is a dividing topic. Everyone have the right
to their own opinions and can decide for themselves if they want use
(or not use) a certain package.

But I don't see a technical reason for why it should be removed.
The package is important to Bitcoin users of Buildroot.


Best regards,

D. Olsson
PGP: 8204A8CD
