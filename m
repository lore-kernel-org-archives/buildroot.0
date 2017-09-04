From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:10:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
	picking GL flags when building
In-Reply-To: <20170803113109.20158-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Thu, 3 Aug 2017 14:31:09 +0300")
References: <20170803113109.20158-1-aperez@igalia.com>
Message-ID: <87bmmrndm8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This solves build failures caused by WebKit trying to include X11 headers
 > when support for X11 is disabled in Mesa3D. A common situation is when
 > configuring both GTK+ and WebKitGTK+ only with Wayland support.

 > Once the fix for https://bugs.webkit.org/show_bug.cgi?id=175125 makes it
 > into a release, the patch can be dropped.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 > ---
 > Changes v1 -> v2:
 >     - Remove hunk in patch for the ChangeLog file, as it is not present
 >       in release tarballs.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
