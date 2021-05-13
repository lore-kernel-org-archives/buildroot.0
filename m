From: Alexander Dahl <post@lespocky.de>
Date: Thu, 13 May 2021 22:47:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: security bump to
 version 0.21.1
In-Reply-To: <eytwv42FO5pGji2PxfnTUbUa0h4V0R3xp_fuGWNQ-Q2cyZ1xZ4Sd205XXExHiyR9Hl5NEafVCjLLGFNU0BP8UQ7hihG_nIgy0TTFEi97OjM=@senzilla.io>
References: <20210512212120.647405-1-fontaine.fabrice@gmail.com>
 <20210513173417.erlj7433mbnchkbk@falbala.internal.home.lespocky.de>
 <CAPi7W801eKBnSXFQGpTuTO8SRYdA6qaWXN-x2OQL8u6JT93nyw@mail.gmail.com>
 <eytwv42FO5pGji2PxfnTUbUa0h4V0R3xp_fuGWNQ-Q2cyZ1xZ4Sd205XXExHiyR9Hl5NEafVCjLLGFNU0BP8UQ7hihG_nIgy0TTFEi97OjM=@senzilla.io>
Message-ID: <20210513204749.bnvfssx2hhdogce4@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Thu, May 13, 2021 at 07:46:23PM +0000, D. Olsson via buildroot wrote:
> Hi Alex, Fabrice, all
> 
> On Thursday, May 13th, 2021 at 6:39 PM, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Dear Alex,
> >
> > Le jeu. 13 mai 2021 ? 19:34, Alexander Dahl post at lespocky.de a ?crit :
> >
> > > Hello buildroot folks,
> > >
> > > On Wed, May 12, 2021 at 11:21:20PM +0200, Fabrice Fontaine wrote:
> > >
> > > > Tag as a security bump as having an up to date bitcoin is important:
> > > > https://patchwork.ozlabs.org/project/buildroot/patch/20200202085526.35742-1-james.hilliard1 at gmail.com
> > > >
> > > > https://github.com/bitcoin/bitcoin/blob/master/doc/release-notes/release-notes-0.21.1.md
> > >
> > > Instead of patching this thing, wouldn't it be better to remove
> > > bitcoin support? After all it's just a ponzi scheme with a humongous
> > > bad environmental impact. The electricity consumption is estimated
> > > for around 180 TWh for 2021 alone, a lot sourced from dirty coal
> > > power, with the potential risk of worsening power grid stability in
> > > some places of the world.
> > >
> > > I don't think it's ethically justifiable to support proof-of-work
> > > stuff like this.
> >
> > I've nothing against dropping this package.
> 
> I understand that Bitcoin is a dividing topic. Everyone have the right
> to their own opinions and can decide for themselves if they want use
> (or not use) a certain package.
> 
> But I don't see a technical reason for why it should be removed.
> The package is important to Bitcoin users of Buildroot.

No, it's not a technical question.  It's an ethical question, a
question about responsibility for future generations.  Does buildroot
want to support this software?  We as software developers are also
responsible for our actions, and if you want to run bitcoin, your
choice.  But I don't see an obligation for the buildroot project to
make that easier or support that.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/fd1a2052/attachment.asc>
