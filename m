From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 May 2012 10:43:41 +0200
Subject: [Buildroot] [PATCH] gpsd: Add package version to libgpsmm patch
In-Reply-To: <1333628924-8966-1-git-send-email-markos.chandras@imgtec.com>
References: <1333628924-8966-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20120511104341.33990e92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 5 Apr 2012 13:28:44 +0100,
Markos Chandras <markos.chandras@imgtec.com> a ?crit :

>  package/gpsd/gpsd-2.95-fix-libgpsmm.patch |   23 +++++++++++++++++++++++
>  package/gpsd/gpsd-fix-libgpsmm.patch      |   23 -----------------------

Actually these days, the idea is just the opposite: remove the version
from the patch names. So it's the other patches that should be renamed
<pkg>-<description>.patch instead of
<pkg>-<version>-<description>.patch.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
