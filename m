From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 2 Dec 2015 18:53:56 -0500
Subject: [Buildroot] [psa] shutting down svn web services
Message-ID: <20151202235356.GI23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i'm not sure how many people care since it seems to have been broken for a
while, but i'm officially turning off svn access via the webserver, as well
as the viewvcs instance.  i'm leaving open the raw rsync and svn access as
both are trivial to maintain and rely on other services we want to keep.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/7b5f4aac/attachment-0001.asc>
