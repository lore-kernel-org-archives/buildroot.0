From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Jul 2012 22:42:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120713224256.0621990A43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-07-13 22:42:55 UTC ---
I have taken your .config, and the build ended succesfully, so I strongly
suspect something on your host that influences the build.

Can you attach the file
output/build/libglib-2.30.2/gio/gdbus-2.0/codegen/gdbus-codegen ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
