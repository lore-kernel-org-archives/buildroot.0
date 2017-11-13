From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:30:08 +0100
Subject: [Buildroot] [PATCH 4/4 v3] package/freerdp: fix build of
 wayland client
In-Reply-To: <fda5340f59b762950ec832ecae9d7893c495a277.1510474387.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 12 Nov 2017 09:13:26 +0100")
References: <cover.1510474387.git.yann.morin.1998@free.fr>
 <fda5340f59b762950ec832ecae9d7893c495a277.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <87lgj953cf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, FreeRDP uses pkg-config to find whether wayland is available.
 > When it is, it gets the CFLAGS and LDFLAGS and so on from pkg-config,
 > which is OK.

 > But I also gets the path to the wayland scanner from pkg-config. And
 > this points to the target one, when we really need the host one.

 > So we force-feed the correct path as a configure option.

 > Furthermore, wayland support needs libxkbcommon, so add this missing
 > dependency as well.

 > Fixes:
 >     http://autobuild.buildroot.org/results/bdfe233ade36a56d0f65ef3c3d1698fca548beed/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
