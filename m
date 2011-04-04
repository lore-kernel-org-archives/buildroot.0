From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Mon, 04 Apr 2011 22:22:44 +0100
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <871v1iz4rw.fsf@macbook.be.48ers.dk>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk>
Message-ID: <1301952165.27248.2.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-04-04 at 12:31 +0200, Peter Korsgaard wrote:
> The problem is a null pointer access in tgetent. It seems to load the
> terminfo file ok, but something goes wrong.

https://bugs.busybox.net/show_bug.cgi?id=2845

we shoun't build curses with --with-termlib=tinfo 

I have made a draft of a patch 
https://bugs.busybox.net/show_bug.cgi?id=2845#c8

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110404/2cf4f18c/attachment.bin>
