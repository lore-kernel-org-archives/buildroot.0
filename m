From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 24 Nov 2010 16:47:46 -0500
Subject: [Buildroot] [PATCH v2] linux: strip installed modules
In-Reply-To: <87aaky4d5y.fsf@macbook.be.48ers.dk>
References: <87oc9nad27.fsf@macbook.be.48ers.dk>
	<201011241620.45723.vapier@gentoo.org>
	<87aaky4d5y.fsf@macbook.be.48ers.dk>
Message-ID: <201011241647.47356.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, November 24, 2010 16:36:25 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  >> Committed with a small change to not use binutils strip specific
>  >> options (we support sstrip as well).
> 
>  Mike> so STRIP_STRIP_UNNEEDED should have those flags added to it for
>  Mike> the binutils case ... i'll send a patch to fix that.  otherwise
>  Mike> we're leaving a crap in the target fs that only takes up space.
> 
> STRIPCMD already has --remove-section=.comment --remove-section=.note,
> what else are you missing?

i hadnt noticed that.  guess you can ignore my new patch too.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101124/5a233ead/attachment.pgp>
