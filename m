From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 27 Aug 2008 14:29:14 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gtkperf
In-Reply-To: <20080827122109.F24AB3C808@busybox.net>
References: <20080827122109.F24AB3C808@busybox.net>
Message-ID: <20080827122914.GC30508@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 27, 2008 at 05:21:09AM -0700, laird at uclibc.org wrote:
>Author: laird
>Date: 2008-08-27 05:21:09 -0700 (Wed, 27 Aug 2008)
>New Revision: 23241

>+GTKPERF_AUTORECONF = NO

No is the default, so please remove this. Autoreconf should not be
needed at all unless you desparately need to fix an utterly broken
package that cannot be fixed upstream to DTRT in the first place.
For a long time, buildroot worked without having any of automake or
autoconf installed, which i consider a feature.

cheers,
