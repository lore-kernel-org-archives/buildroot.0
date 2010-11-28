From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 28 Nov 2010 12:36:55 -0500
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <87hbf1220t.fsf@macbook.be.48ers.dk>
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<87hbf1220t.fsf@macbook.be.48ers.dk>
Message-ID: <201011281236.56902.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, November 28, 2010 05:09:06 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  Mike> The attempt to fix libthread_db for some targets broke others.  If
> you Mike> want to match more libs, you shouldn't do so by breaking others.
>  The Mike> correct SONAME is libthread_db.so.#.
> 
> Out of interest, what targets got broken, and how are the libthread_db
> files called?

i only care about Blackin targets.  we dont waste space on symlinks and only 
install SONAMEs.

btw, why is your quoting style so screwed up ?
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101128/85d6ff53/attachment.pgp>
