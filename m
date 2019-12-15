From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 21:36:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: add patch to
 support building with musl
In-Reply-To: <20191215184246.3600021-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 15 Dec 2019 20:42:46 +0200")
References: <20191215184246.3600021-1-aperez@igalia.com>
Message-ID: <87y2vdcomh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Import "0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch"
 > from the upstream repository, which allows building against the musl
 > libc (or any other which does not define the TEMP_FAILURE_RETRY macro).
 > The patch has been accepted upstream, but no releases have been made yet
 > which include the fix.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
