From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Oct 2014 23:30:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7478] Multiple chosen python modules are not built
 due to missing header files in include path
In-Reply-To: <bug-7478-163@https.bugs.busybox.net/>
References: <bug-7478-163@https.bugs.busybox.net/>
Message-ID: <20141029233027.CFD12B5A0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7478

--- Comment #12 from Christian Abegg <cma@vtxnet.ch> 2014-10-29 23:30:26 UTC ---
(In reply to comment #11)
> There is no need for the sysroot include dir to be explicitly passed to gcc
> with the internal toolchain, because the Buildroot sysroot is configured to be
> the natural location for the compiler to look for headers.

Ok, thanks for the details. However I'm still wondering why the inc path array
in the setup.py script doesn't contain the sysroot include dir when the
internal toolchain. What is the next place were I can check why this isn't the
case?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
