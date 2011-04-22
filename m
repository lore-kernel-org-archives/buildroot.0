From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Fri, 22 Apr 2011 03:11:15 +0100
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <BANLkTikW4aebOtn_TBzRHQd+7+iYjEWtQQ@mail.gmail.com>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk> <1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk> <1303322103.8512.4.camel@segulix>
	<878vv423zn.fsf@macbook.be.48ers.dk> <1303413743.6641.12.camel@segulix>
	<877hanz56u.fsf@macbook.be.48ers.dk>
	<BANLkTikW4aebOtn_TBzRHQd+7+iYjEWtQQ@mail.gmail.com>
Message-ID: <1303438275.9530.1.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-04-21 at 18:29 -0400, Mike Frysinger wrote: 
> On Thu, Apr 21, 2011 at 5:04 PM, Peter Korsgaard wrote:
> >> Sergio Monteiro Basto writes:
> >>> I haven't tried, but doesn't that just shuffle part of the ncurses
> >>> functions into libtinfo? I don't right away see why that would fix
> >>> anything, but I'll start a build now.
> >>
> >> so, it fix anything ?
> >
> > No, as expected the behaviour is exactly the same.
> 
> ncurses 5.9 is out and seems to be mostly a bugfix release over 5.8
> ... probably worth testing

In this thread Peter was wrote:  

"I've also tested ncurses 5.9 with the same results. with 2011.05
getting
quite near, perhaps the best approach is to revert to ncurses 5.7? "

Best regards,
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110422/d91bb433/attachment.bin>
