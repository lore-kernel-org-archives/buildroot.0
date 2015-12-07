From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Dec 2015 14:57:09 -0500
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207185234.GH11489@vapier.lan>
References: <20151202073542.GY23754@vapier.lan> <20151206214229.GE4023@free.fr>
 <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
 <8737ver8lr.fsf@dell.be.48ers.dk>
 <20151207185234.GH11489@vapier.lan>
Message-ID: <20151207195709.GA24430@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07 Dec 2015 13:52, Mike Frysinger wrote:
> On 07 Dec 2015 09:00, Peter Korsgaard wrote:
> > FYI, there also seems to be an issue with the git.* certificates and
> > atleast python on the box, as I get this when pushing:
> 
> the certs shouldn't be causing issues with `git push` ...
> i'll take a look at that

was there a commit bot operating in #buildroot ?  i can't find references
to the client that actually connected to freenode.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151207/9c3caea2/attachment.asc>
