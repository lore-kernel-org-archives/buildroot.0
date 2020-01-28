From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2020 23:26:02 +0100
Subject: [Buildroot] [PATCH] package/opkg: bump version to 0.4.2
In-Reply-To: <wtsHeWbrD_SXpln9FkH0NuAJUwaB2S-yRU2MFAoNKFS1CkjKah_6ZnXZj0TlSmHWN_tTfylU6FCOz3XrAs89VS-r80orW3-C757Hu0fZ59w=@protonmail.com>
 (MAX's message of "Tue, 28 Jan 2020 19:00:48 +0000")
References: <wtsHeWbrD_SXpln9FkH0NuAJUwaB2S-yRU2MFAoNKFS1CkjKah_6ZnXZj0TlSmHWN_tTfylU6FCOz3XrAs89VS-r80orW3-C757Hu0fZ59w=@protonmail.com>
Message-ID: <87k15b6ww5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "MAX" == MAX  <phobie@protonmail.com> writes:


 > Signed-off-by: Max Berger <phobie@protonmail.com>
 > ---
 > package/opkg/opkg.hash | 2 +-
 > package/opkg/opkg.mk   | 2 +-
 > 2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
 > index 69eebde2d3..b1ead67a11 100644
 > --- a/package/opkg/opkg.hash
 > +++ b/package/opkg/opkg.hash
 > @@ -1,4 +1,4 @@
 > # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
 > -sha256 45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75890fdd31250a43  opkg-0.4.1.tar.gz
 > +sha256 86887852c43457edfff9d8b6d9520f3f1cdd55f25eb600a6eb31e1c4e151e106  opkg-0.4.2.tar.gz
 > # Locally calculated
 > sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 > diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
 > index 8155ed381f..e25e51b9e6 100644

Your mailer seems to have eaten all the leading spaces, corrupting the
patch. Fixed that up manually and committed, but please consider fixing
your mailer for future patches. Also please use your full name in From
so I don't need to fix that up manually.


 > --- a/package/opkg/opkg.mk
 > +++ b/package/opkg/opkg.mk
 > @@ -4,7 +4,7 @@
 > #
 > ################################################################################

 > -OPKG_VERSION = 0.4.1
 > +OPKG_VERSION = 0.4.2
 > OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
 > OPKG_DEPENDENCIES = host-pkgconf libarchive
 > OPKG_LICENSE = GPL-2.0+
 > --
 > 2.13.6
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
