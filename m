From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 19:34:06 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/glib-networking: needs dynamic library
In-Reply-To: <20190801104918.3731-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Aug 2019 12:49:18 +0200")
References: <20190801104918.3731-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9vgvlgx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > glib-networking uses the meson's shared_module function
 > This is a partly revert of commit
 > ed3eef6bb49270de619e5a86a249fdd8724c40cd 'package/glib-networking: bump
 > to version 2.61.1' re-adding the dynamic library dependency due to the
 > meson's build system and not from gnutls

 > Fixes:
 >  - http://autobuild.buildroot.org/results/60037e37e020404485df9814f3f3ad4e3b2abdb3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Seiderer):
 >  - Update commit message
 >  - Update webkitgtk/Config.in

Committed, thanks.

-- 
Bye, Peter Korsgaard
