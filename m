From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 22:38:16 +0200
Subject: [Buildroot] [PATCH 01/54] gvfs: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 15:55:07 -0300")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uokwwqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/gvfs/gvfs.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
 > index dbf234e..58707aa 100644
 > --- a/package/gvfs/gvfs.mk
 > +++ b/package/gvfs/gvfs.mk
 > @@ -10,6 +10,8 @@ GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 >  GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 >  GVFS_INSTALL_STAGING = YES
 >  GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
 > +GVFS_LICENSE = LGPLv2+
 > +GVFS_LICENSE = COPYING

The last line should be _LICENSE_FILES. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
