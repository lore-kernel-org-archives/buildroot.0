From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 22:47:37 -0500
Subject: [Buildroot] [PATCH v3] autotools: add with/without and
	enable/disable helpers
In-Reply-To: <1290220679-11330-1-git-send-email-vapier@gentoo.org>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
	<1290220679-11330-1-git-send-email-vapier@gentoo.org>
Message-ID: <201011192247.37621.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, November 19, 2010 21:37:59 Mike Frysinger wrote:
> v3
> 	- absorb the "PACKAGE_" part of config options too

looking some more, this isnt a good idea.  it would prevent using common 
options like BR2_INET_IPV6 to expand into ipv6 configure options.  so ignore 
the v3 patch.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/668e0b98/attachment.pgp>
