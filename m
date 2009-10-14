From: Francisco Gonzalez <gzmorell@gmail.com>
Date: Wed, 14 Oct 2009 12:12:41 +0200
Subject: [Buildroot] Makedevs
In-Reply-To: <1255512895.3894.10.camel@coalu.atr>
References: <fffd86390910140228u2bc5ee26nc4982ccbb34b1405@mail.gmail.com>
	<1255512895.3894.10.camel@coalu.atr>
Message-ID: <fffd86390910140312q7f4deedbwab0b6b296acdb4cd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/10/14 Lionel Landwerlin <lionel.landwerlin@openwide.fr>

> Le mercredi 14 octobre 2009 ? 11:28 +0200, Francisco Gonzalez a ?crit :
> > During the process of building an ARM target which I test with NFS
> > mount, I have noticed that
> > in the "rooot/dev" there is only normal files.
> > I have built the nodes using mknod. But I have noticed the
> > "/makedevs-host/makedevs" application.
> > Should it run during a normal "make"? or we must run it as root after
> > a "make"?
> >
> >
> > regards,
> > Francisco
>
> Did you generate a .tar[.gz] image with buildroot ? Often people forgot
> to uncompress the tar archive using sudo or as root. Only root can
> create device nodes.
>
>
> --
> Lionel Landwerlin <lionel.landwerlin@openwide.fr>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Thanks, that was the missing point.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091014/ebeedad0/attachment.htm>
