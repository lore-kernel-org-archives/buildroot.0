From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 15 Jan 2011 20:20:12 -0500
Subject: [Buildroot] [PATCH 4/7] portmap: add nommu support
In-Reply-To: <87tyhfyyhw.fsf@macbook.be.48ers.dk>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<201101111250.24179.vapier@gentoo.org>
	<87tyhfyyhw.fsf@macbook.be.48ers.dk>
Message-ID: <201101152020.13104.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, January 11, 2011 15:30:19 Peter Korsgaard wrote:
>  >> Why not simply rename it like the recent issue with getline -> get_line
>  >> in kconfig?
> 
>  Mike> because perror is a standard, not a gnuism like getline
> 
> Yes, but why is there a perror() implementation in portmapper in the
> first place? It seems like they want
> something-looking-like-perror-but-using-syslog, rather than the real
> perror?

perhaps, but upstream finally got back to me and merged all my patches (the 
same ones i proposed here).
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110115/e8959d5a/attachment.asc>
