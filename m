From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 18:52:25 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207195924.GH4258@free.fr>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <8737ver8lr.fsf@dell.be.48ers.dk>
 <20151207185234.GH11489@vapier.lan>
 <20151207195709.GA24430@vapier.lan> <20151207195924.GH4258@free.fr>
Message-ID: <20151207235225.GG24430@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 Dec 2015 20:59, Yann E. MORIN wrote:
> On 2015-12-07 14:57 -0500, Mike Frysinger spake thusly:
> > On 07 Dec 2015 13:52, Mike Frysinger wrote:
> > > On 07 Dec 2015 09:00, Peter Korsgaard wrote:
> > > > FYI, there also seems to be an issue with the git.* certificates and
> > > > atleast python on the box, as I get this when pushing:
> > > 
> > > the certs shouldn't be causing issues with `git push` ...
> > > i'll take a look at that
> > 
> > was there a commit bot operating in #buildroot ?  i can't find references
> > to the client that actually connected to freenode.
> 
> Yes, we add a commit bot, but it disapeared a while ago.
> 
> I tried to follow the explanations to launmch it again, but it did not
> work (and I'm no longer sudoer, so I could not dedicate mor etime on it).
> 
> It would be nice if you could re-launch it, yes! ;-)

should be restored.  lemme know if you see any other issues.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/1b263203/attachment.asc>
