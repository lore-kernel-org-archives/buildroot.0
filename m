From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:09:08 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add upstream patch needed
	for builds with ENABLE_VIDEO=OFF
In-Reply-To: <20170729192705.19493-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 29 Jul 2017 22:27:05 +0300")
References: <20170729192705.19493-1-aperez@igalia.com>
Message-ID: <87fuc3ndnv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This includes a slightly modified version of the patch for bug
 > https://bugs.webkit.org/show_bug.cgi?id=174940

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  ...roken-build-when-ENABLE_VIDEO-is-disabled.patch | 207 +++++++++++++++++++++
 >  1 file changed, 207 insertions(+)
 >  create mode 100644 package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch

 > ---
 > This is a follow-up to https://patchwork.ozlabs.org/patch/795207/ which should
 > have included the patch added by this commit, but I sent it too early without
 > waiting for a build to finish. With this added, builds with ENABLE_VIDEO=OFF
 > (as made when BR2_PACKAGE_WEBKITGTK_MULTIMEDIA is unset). And this time I did
 > wait for a full clean build to complete.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
