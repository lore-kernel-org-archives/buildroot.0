From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 13 Feb 2012 00:07:53 +0100
Subject: [Buildroot] [PATCH] Adding Microblaze support to Buildroot
Message-ID: <CAM+bi4sKSQ80WXdZscOThUX=t18C+vMWspKWB82NWNx49gsFWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am also interested on Microblaze support, hence I rescued the old patch
from the archives, merged it against latest git revision and published on
github.com/agamez/buildroot

I attach the new patch, should apply cleanly to latest version on git.

Even though Stephan Hoffmann work is pretty good, I think the path of the
new files should be modified from board/relinux/avnet_LX9MicroBoard/ to
board/avnet/LX9MicroBoard/

I didn't want to do that myself out of respect for the real author of the
patch, since this is merely a repost.

Regards,

?lvaro G?mez Machado
