From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Sep 2011 14:50:08 +0000 (UTC)
Subject: [Buildroot] [Bug 3925] midori not getting compile
In-Reply-To: <bug-3925-163@https.bugs.busybox.net/>
References: <bug-3925-163@https.bugs.busybox.net/>
Message-ID: <20110917145008.BD31A8D560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3925

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
You're using CodeSourcery 2009q3, which uses gcc 4.4.1, which has this known
problem: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40134

Since you're using an external binary toolchain here, there's nothing we can
fix in Buildroot, you simply need to upgrade to a newer version of the
CodeSourcery toolchain, such as 2011.03.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
