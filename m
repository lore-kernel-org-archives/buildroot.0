From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Jul 2012 12:51:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120714125106.6169D81F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #6 from s.martin49 at gmail.com 2012-07-14 12:51:06 UTC ---
(In reply to comment #4)
> (In reply to comment #2)
> > I have taken your .config, and the build ended succesfully, so I strongly
> > suspect something on your host that influences the build.
> 
> I also suspect this, but shouldn't the build script check for such things?
> (like the python version)

Currently, there is no check to check/detect python version, but there are few
patches about that in the pipe:
http://patchwork.ozlabs.org/patch/162456/
http://patchwork.ozlabs.org/patch/162457/

Note that in your case, 'python' points to python2.x while 'python3' to
python3.x, which is the standard currently. So, the problem is not here.

BTW, these 2 patches intend to fix this kind of issues on system/distro, such
as archlinux, in which 'python' points to python3.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
