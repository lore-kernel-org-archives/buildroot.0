From: Benjamin Delagoutte <benjamin.delagoutte@gmail.com>
Date: Wed, 15 Nov 2006 09:18:13 +0100
Subject: [Buildroot] Are skel.tar.gz and target_skeleton folder
	duplicates ?
In-Reply-To: <20061115065626.GA7600@codepoet.org>
References: <30f88efd0611130654w598ff5daj8015e3548e2f7b7d@mail.gmail.com>
	<20061115065626.GA7600@codepoet.org>
Message-ID: <30f88efd0611150018i543b8588paa0fb9f59e7c2ac5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for having cleared things.

2006/11/15, Erik Andersen <andersen@codepoet.org>:
>
> On Mon Nov 13, 2006 at 03:54:22PM +0100, Benjamin Delagoutte wrote:
> > Eventually I don't really understand why Buildroot makes use of
> > two different prebuilt trees. Do someone mind explaining me the
> > goals of this weird strategy ?
>
> We used to use CVS as our revision control system.  CVS refused
> to store and restore empty directories and symlinks.  As a result
> we ended up using a tarball for these items rather than a simple
> directory full of stuff.  But using a tarball proved to be a real
> pain, since using a tarball to store files which tend to be
> modified (such as the stuff under /etc for example) is unwieldly
> at best.  So I created the current hybrid approach.
>
> Subversion is a much more sane revision control system, so I
> think we can probably consolidate things now.
>
>         <sound of hacking in the distance>
>
> Fixed.  Thanks for bringing this up.
>
> -Erik
>
> --
> Erik B. Andersen             http://codepoet-consulting.com/
> --This message was written using 73% post-consumer electrons--
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061115/efed4cf6/attachment.html 
