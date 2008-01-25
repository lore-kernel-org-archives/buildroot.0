From: Darik Horn <dajhorn@vanadac.com>
Date: Fri, 25 Jan 2008 10:12:40 -0600
Subject: [Buildroot] Bug reporting process?
In-Reply-To: <1CD05B980C94AC408B37C82BBABAA3E609CEAE6D@mtsexchange.dc.multitech.prv>
References: <1CD05B980C94AC408B37C82BBABAA3E609CEAE6D@mtsexchange.dc.multitech.prv>
Message-ID: <479A0A78.6030703@vanadac.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 > I am still seeing the error reported in bug buildroot 00001959
 > even after the supplied patch was applied. Thanks!

Run "make clean" in the buildroot before recompiling.  You must remove 
all compiled objects for this package to get the desired result.

If the problem persists, then double-check that the patch was actually 
applied to the build_*/mDNSResponder-107.6/mMDNSPosix/Makefile.
