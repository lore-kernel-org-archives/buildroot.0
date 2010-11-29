From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 29 Nov 2010 06:18:24 -0500
Subject: [Buildroot] [PATCH] target-finalize: fix libthread_db strip fix
In-Reply-To: <87pqtozho2.fsf@macbook.be.48ers.dk>
References: <1290897792-22134-1-git-send-email-vapier@gentoo.org>
	<201011281725.12551.vapier@gentoo.org>
	<87pqtozho2.fsf@macbook.be.48ers.dk>
Message-ID: <201011290618.25214.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, November 29, 2010 02:57:01 Peter Korsgaard wrote:
> The patch got committed fast because it fixed real problems (E.G. it didn't
> work for any BR configs)

to be clear, there was no change in behavior before and after my first patch 
for people using symlinks to SONAMEs.  the file was always stripped before, 
and it was always stripped after if the SONAME was a symlink.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101129/4d62b065/attachment.pgp>
