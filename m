From: Paul Jones <paul@pauljones.id.au>
Date: Sat, 4 Sep 2010 11:25:15 +1000
Subject: [Buildroot] About Git through SSH
In-Reply-To: <20100903170323.3b5a8e6f@surf>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org><201009030730.57559.minimod@morethan.org><20100903150459.059d682a@surf><201009030937.31967.minimod@morethan.org>
	<20100903170323.3b5a8e6f@surf>
Message-ID: <000c01cb4bd0$088c14f0$19a43ed0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Saturday, 4 September 2010 1:03 AM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] About Git through SSH
> 
> >
> > Might cut down on the end-user puzzlement of: "Why doesn't this work
> > for me?"
> >
> > Note: I think the change happened at v1.6 but I haven't checked to be
> > certain.
> 
> In Buildroot, I think only publicly-available Git trees will be used as
the source
> URL for packages, and such trees usually use the git:// or http:// schemes
> rather than ssh://, which is usually used for a private, read-write access
to a
> repo.

Well I'm already using buildroot with a private git tree, but I don't use
ssh.

By the way, why does the source get converted to a tar.gz after the git tree
is cloned? It's quite annoying because to rebuild the package you have to
delete the tar.gz file as well as the build directory to force downloading
of the latest source.


Paul.
