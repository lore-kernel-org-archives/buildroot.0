From: Vincenzo Maffione <v.maffione@gmail.com>
Date: Wed, 2 Aug 2017 16:23:29 -0700
Subject: [Buildroot] recursive variable issue
Message-ID: <CA+_eA9gXZENa+fLvM3y8kzY+d41gLhiWzKyDU=R0v1aKRBSbuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
  I get this

$ make
package/skeleton-common/skeleton-common.mk:83: *** Recursive variable
`SKELETON_COMMON_BIN_SH' references itself (eventually).  Stop.
make: *** [_all] Error 2

after commit 26085bbbd50083e87b8540fa043d712ce8e85f61 (today).
Any clues?

Thanks,
  Vincenzo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170802/6fcb4efe/attachment.html>
