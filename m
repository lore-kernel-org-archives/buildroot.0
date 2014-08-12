From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Aug 2014 20:41:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7286] systemd 215 doesn't build
In-Reply-To: <bug-7286-163@https.bugs.busybox.net/>
References: <bug-7286-163@https.bugs.busybox.net/>
Message-ID: <20140812204151.5F8CD9D42D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7286

--- Comment #9 from Eric Le Bihan <eric.le.bihan.dev@free.fr> 2014-08-12 20:41:51 UTC ---
The bug was reported upstream
(https://bugs.freedesktop.org/show_bug.cgi?id=78923) but has been marked as
rejected, as it is likely to be a compiler/linker issue (though the last
comment says the issue is not raised when using GCC 4.8.3, which is the version
precisely used in our case!). 

Comments in another bug report
(https://bugzilla.redhat.com/show_bug.cgi?id=1067245#c13) suggest testing with
GCC 4.9.

Anyway, the patch is now in patchwork:
http://patchwork.ozlabs.org/patch/379472/. I suggest applying it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
