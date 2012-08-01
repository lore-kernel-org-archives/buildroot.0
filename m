From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Aug 2012 20:10:23 +0200
Subject: [Buildroot] [PATCH 2/3] mxml: add license information
In-Reply-To: <9e9f83eae727c218f9ee7cfc2a7d86772a12a308.1343796460.git.baruch@tkos.co.il>
References: <5d40aa0e8f5d5dc6b863bf1a0af427a377e75989.1343796460.git.baruch@tkos.co.il>
 <9e9f83eae727c218f9ee7cfc2a7d86772a12a308.1343796460.git.baruch@tkos.co.il>
Message-ID: <20120801201023.05c53086@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  1 Aug 2012 07:48:58 +0300,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> +MXML_LICENSE = LGPLv2+
> +MXML_LICENSE_FILES = COPYING

I haven't applied this one, because the situation is a bit more
complicated here. mxml is released under LGPLv2+ + some special
exceptions. See the COPYING file:

                           Mini-XML License
                          September 18, 2010


The Mini-XML library and included programs are provided under the
terms of the GNU Library General Public License version 2 (LGPL2)
with the following exceptions:

  1. Static linking of applications to the Mini-XML library
does not constitute a derivative work and does not require
the author to provide source code for the application, use
the shared Mini-XML libraries, or link their applications
against a user-supplied version of Mini-XML.

If you link the application to a modified version of
Mini-XML, then the changes to Mini-XML must be provided
under the terms of the LGPL2 in sections 1, 2, and 4.

  2. You do not have to provide a copy of the Mini-XML license
with programs that are linked to the Mini-XML library, nor
do you have to identify the Mini-XML license in your
program or documentation as required by section 6 of the
LGPL2.


^L                GNU LIBRARY GENERAL PUBLIC LICENSE
                         Version 2, June 1991

[... rest of the LGPLv2 text ...]

I am not sure how to encode this into the _LICENSE field. Luca?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
