From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed, 09 Apr 2008 07:02:46 +0000
Subject: [Buildroot] [PATCH] NCURSES: Added config support for
	copying	ncurses 'extra' libraries to the target
In-Reply-To: <1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207724566.6817.307.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Some package use ncurses libpanel/libform/libmenu, this config allows to selectively
> copy them to the target filesystem at the same time at the main library is installed.
> ---
>  package/ncurses/Config.in  |   22 ++++++++++++++++++++++
>  package/ncurses/ncurses.mk |    9 +++++++++
>  2 files changed, 31 insertions(+), 0 deletions(-)
<snip>

Can you attach patches please, makes it a little easier for us to
apply. :)

Also, please submit patches applied against latest SVN.

I've cleaned up the above patch against latest SVN, will test and
commit.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080409/6cad36ba/attachment.pgp 
