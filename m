From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:29:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: fix license
In-Reply-To: <20210128065631.3720247-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Jan 2021 07:56:31 +0100")
References: <20210128065631.3720247-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8h8xi16.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit a7b51ed3013c919b293deb95299e33363fb9df70 forgot to update hash of
 > COPYING which now contains LGPL-2.1+

 > Here is an extract of
 > https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/0a8882b1a1f5234f7de2177e41f9cb584b6d61f8:

 > "The vast majority of GdkPixbuf is released under the terms of the GNU
 > Lesser General Public License, version 2.1 or later.

 > The following files are released under the terms of the GNU Library
 > General Public License, version 2 or later:
 > [...]
 > The aggregate license of the GdkPixbuf project is the Lesser GPL v2.1 or
 > later."

 > Fixes:
 >  - http://autobuild.buildroot.org/results/292306061216471c258a89e61b54c0d05c757321

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
