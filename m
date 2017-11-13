From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 21:25:15 +0100
Subject: [Buildroot] [PATCH 1/4 v3] package/freerdp: drop dependency on
 host-pkgconf
In-Reply-To: <67b488af759e72096a4cf414c5fa06344561c677.1510474387.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 12 Nov 2017 09:13:23 +0100")
References: <cover.1510474387.git.yann.morin.1998@free.fr>
 <67b488af759e72096a4cf414c5fa06344561c677.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <87y3na3p04.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we only depend on host-pkgconf for gstreamer-0.x
 > However, we also need it at least for gstreamer-1.x and waylabnd, too.

 > But since FreeRDP is a cmake package, host-pkgconf is always pulled in
 > as a dependency by the cmake-package infrastructure.

 > So, drop the gstreamer-conditional host-pkgconf dependency.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > ---
 > Changes v1 -> v2:
 >   - drop host-pkgconf, as it is inherited via the infra  (Samuel)

Committed, thanks.

-- 
Bye, Peter Korsgaard
