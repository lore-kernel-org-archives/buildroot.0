From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Jun 2015 07:52:54 +0000 (UTC)
Subject: [Buildroot] [Bug 8036] alsa-lib headers problem that prevents to
 compile alsa dependent projects
In-Reply-To: <bug-8036-163@https.bugs.busybox.net/>
References: <bug-8036-163@https.bugs.busybox.net/>
Message-ID: <20150605075254.8FC298011D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8036

--- Comment #9 from Juan <jrmcorreo-linux@yahoo.es> 2015-06-05 07:52:54 UTC ---
Hi Thomas,

Yesterday I've made a rebuild with success after a "make clean". First I built
alsa-lib and alsa-utils, then openjdk with success too (but with an
installation error after compiling that I'll try to solve shortly in time).

I attach the right buildrooot and kernel configs here. When the installation
problem of openjdk could be solved, and the binaries tested, if possible in two
different ARM SoC (ARM920t and Cortex A7), I'll send/post the patches and
makefile to the contrib address/URL.

Thank you for your help

Juan

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
