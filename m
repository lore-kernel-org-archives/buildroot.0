From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Date: Fri, 16 Dec 2016 09:28:11 +0100
Subject: [Buildroot] mtd-utils 2.0.0-rc2
Message-ID: <c7590022-cf5a-f785-6a39-1a76a3054bda@sigma-star.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

a new version of mtd-utils is about to be released which, among other things,
includes tons of fixes, cleanups and replaces the old, broken Makefile with
an autotools based buildsystem.

Due to the many changes, especially regarding the build system we bumped the
major version number, did an RC1 release last week and an RC2 release with
fixes this week. Assuming all goes well, the final release will be next week.


Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.0-rc2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.0-rc2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.0.0-rc2


I am writing this as both announce mails failed to reach the buildroot community
(RC1 had a dead address and got bounced. I tried sending RC2 to the list but it
was rejected as I wasn't registered yet).

There has been little feedback on the new autotools based build system so far, so
it would be great if someone could give it try on the release candidate and give
us some feedback _now_, so we don't ship a final version that fails to build on
some obscure setup or target I didn't think of.


Regards,

David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161216/b3a5bbf6/attachment.asc>
