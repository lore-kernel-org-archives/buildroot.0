From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 07 Jan 2015 14:11:05 +0100
Subject: [Buildroot] host-python build issue
Message-ID: <54AD3069.8090309@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i'm trying to build host-python (pulled in by
mobile-broadband-provider-info), but some of the modules failed to build
(namely ossaudiodev), and even if in this case the built python binary
and modules work properly, the buildroot build process itself fails.
Should this be considered as a bug, or this is the excepted behavior?

Buildroot version: 2014.11 stable
OS: Debian testing, amd64


Please find the relevant part of build log here:
http://pastebin.com/dxytgmFF



Thanks,

-- 
Bests,
Zoltan Gyarmati
IRC freenode: zgyarmati

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150107/566abed4/attachment.asc>
