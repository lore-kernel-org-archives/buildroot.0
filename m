From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:08:31 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Allow building with
	BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
In-Reply-To: <20170729131844.3502-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 29 Jul 2017 16:18:44 +0300")
References: <20170729131844.3502-1-aperez@igalia.com>
Message-ID: <87k21fndow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
 > missing feature dependency in the WebKitGTK+ build files.

 > Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
