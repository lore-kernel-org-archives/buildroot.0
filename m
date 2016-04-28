From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Apr 2016 19:05:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-mga:
 disable DRI support when not available
References: <1447004673-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <20160419214702.GH3505@free.fr>
Message-ID: <9fs9vcx3pr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 19 Apr 2016 23:47:02 +0200 schrieb Yann E. MORIN:

> Is this patch still applicable?

Hi Yann,

yes, the bug still occurs:

http://autobuild.buildroot.net/
results/8ae/8aec759b0e485b2c90e2a26d60c7776c2684c44a//

and is still fixed by my patch.

Regards, Bernd
