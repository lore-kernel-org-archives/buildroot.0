From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Mar 2011 23:06:16 +0100
Subject: [Buildroot] [git commit master 1/1] samba: rename CVE-2011-0719
	patch so other patches gets applied as well
Message-ID: <20110311221124.426128F90B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c35b09873f4d73fcadf7efdcd05b78b49477a55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the build breaks during configure with the AC_TRY_RUN test for
getgrouplist.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
