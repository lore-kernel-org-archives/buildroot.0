From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 6 Dec 2010 15:55:19 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <20101206214405.1fe43de1@surf>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<201012061520.47907.vapier@gentoo.org>
	<20101206214405.1fe43de1@surf>
Message-ID: <201012061555.20000.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 06, 2010 15:44:05 Thomas Petazzoni wrote:
> On Mon, 6 Dec 2010 15:20:47 -0500 Mike Frysinger wrote:
> > > > > >       irda-utils: new package for IrDA devices
> > > > > 
> > > > > I know Peter wants a short description + author in each patch. Your
> > > > > patches are fairly obvious, but that's the rule :)
> > > > 
> > > > i dont know what you mean by author.  git already tracks authorship.
> > > 
> > > Peter still wants the patch we have in Buildroot to carry a description
> > > and an author. The author of the patch may not be the person who
> > > imported it into Buildroot.
> > 
> > when using `git am` or `git pull`, it does retain authorship.  i dont see
> > how the changeset would make it into the tree unless people were
> > manually doing `patch && git commit`.
> 
> I'm not talking about the patches you are sending to Buildroot, but the
> patches that are added to packages (i.e patches inside the patches).

oh, i missed that.  i wrote these patches and sent them upstream.  i'll add 
that metadata.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101206/0d78bc53/attachment.pgp>
