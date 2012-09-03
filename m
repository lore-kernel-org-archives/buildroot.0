From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 04 Sep 2012 00:39:13 +0300
Subject: [Buildroot] Is there an include statement in buildroot ?
Message-ID: <50452381.5040804@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone

My package .mk file is getting quite large now and I would like to break
it to more easily
sizeable and logical chunks.

Is there a way to include other .mk files in main .mk file ?

Like something like this:

package/newpackage/A.mk
package/newpackage/C.mk
package/newpackage/D.mk
etc....
package/newpackage/newpackage.mk

And newpackage.mk would have:

include "A.mk"
include "B.mk"
include "C.mk"

etc....


Stefan
