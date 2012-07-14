From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Jul 2012 08:12:38 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120714081238.606DA90BED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #4 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-14 08:12:38 UTC ---
(In reply to comment #2)
> I have taken your .config, and the build ended succesfully, so I strongly
> suspect something on your host that influences the build.

I also suspect this, but shouldn't the build script check for such things?
(like the python version)

> 
> Can you attach the file
> output/build/libglib-2.30.2/gio/gdbus-2.0/codegen/gdbus-codegen ?

It gets deleted, after the build ends with an error.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
