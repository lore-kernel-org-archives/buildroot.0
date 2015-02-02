From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 22:49:06 +0100
Subject: [Buildroot] [RFC 1/4] legal-info: remove FOO_MANIFEST_TARBALL
	and FOO_MANIFEST_SITE defaults
In-Reply-To: <1420199015-16907-2-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 2 Jan 2015 12:43:32 +0100")
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <87egq8gf1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > When FOO_SOURCE is non-empty, FOO_MANIFEST_TARBALL is always set.
 > When FOO_SOURCE is empty, FOO_MANIFEST_TARBALL is not set, but also
 > never used, due to the if below which defuses the whole legal-info
 > processing for packages that have FOO_SOURCE explicitly set to an
 > empty string.

 > So get rid of the default assignment to "not saved".

 > Do it for FOO_MANIFEST_SITE as well: it is pointless to have
 > FOO_MANIFEST_SITE with an empty FOO_SOURCE in a package. A quick
 > grep session in the sources confirmed this assumption is indeed
 > true for the current code.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
