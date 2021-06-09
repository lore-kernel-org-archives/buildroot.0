From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Jun 2021 22:53:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: disable gamepad
 support
In-Reply-To: <20210525124441.1136863-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 25 May 2021 15:44:41 +0300")
References: <20210525124441.1136863-1-aperez@igalia.com>
Message-ID: <87a6nyoj3a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Pass -DENABLE_GAMEPAD=OFF to CMake in order to disable support for the
 > gamepad API, which requires libmanette, a library that is not yet
 > available in Buildroot.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
