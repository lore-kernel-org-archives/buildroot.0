From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Oct 2015 09:46:44 +0200
Subject: [Buildroot] [PATCH 1/1] liblockfile: bump to version 1.0.9-6
In-Reply-To: <1445640088-11832-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Fri, 23 Oct 2015 18:41:28 -0400")
References: <1445640088-11832-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87r3kkiu8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 > ---
 >  package/liblockfile/liblockfile.hash | 6 +++---
 >  package/liblockfile/liblockfile.mk   | 8 ++++----
 >  2 files changed, 7 insertions(+), 7 deletions(-)

 > diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
 > index 7f7ee7f..dbcc19e 100644
 > --- a/package/liblockfile/liblockfile.hash
 > +++ b/package/liblockfile/liblockfile.hash
 > @@ -1,3 +1,3 @@
 > -# From
 > http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile/liblockfile_1.08-4.dsc
 > -sha256	d63293d5091d7fdc0259563694e4d68771310dbc4e70e188e6b68e7a776405cb	liblockfile_1.08.orig.tar.gz
 > -sha256
 > e1343c37b83722abdaa1b5d98e1696748ca134ad36752b8affebebd51ef78468
 > liblockfile_1.08-4.debian.tar.bz2
 > +# From http://http.debian.net/debian/pool/main/libl/liblockfile/liblockfile_1.09-6.dsc
 > +sha256	16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f	liblockfile_1.09.orig.tar.gz
 > +sha256
 > d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f
 > liblockfile_1.09-6.debian.tar.bz2
 > diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
 > index 4f7a67e..b578022 100644
 > --- a/package/liblockfile/liblockfile.mk
 > +++ b/package/liblockfile/liblockfile.mk
 > @@ -4,13 +4,13 @@
 >  #
 >  ################################################################################
 
 > -LIBLOCKFILE_VERSION = 1.08
 > +LIBLOCKFILE_VERSION = 1.09
 >  LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 > -LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile
 > -LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 > +LIBLOCKFILE_SITE = http://http.debian.net/debian/pool/main/libl/liblockfile

Will that URL stay valid? We normally use the snapshot.debian.org URLs
the normal mirrors remove the tarballs once they move to a new version.

Other than that the patch looks good.

-- 
Bye, Peter Korsgaard
