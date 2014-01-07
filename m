From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jan 2014 07:34:34 +0000 (UTC)
Subject: [Buildroot] [Bug 6656] Build Qt5 with ccache
In-Reply-To: <bug-6656-163@https.bugs.busybox.net/>
References: <bug-6656-163@https.bugs.busybox.net/>
Message-ID: <20140107073434.238B99C3AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6656

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-01-07 07:34:33 UTC ---
Support for building Qt5 with ccache has been added in:

commit cb08d7b05db54eb7b2c52deabbd57c541777a422
Author: Fatih A??c? <fatih.asici@gmail.com>
Date:   Fri Nov 29 10:47:49 2013 +0200

    qt5base: use ccache if enabled

    For now, it doesn't use ccache when compiling host tools (e.g. qmake).
    It seems the fix is not trivial.

    Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

So I'm marking this bug as fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
