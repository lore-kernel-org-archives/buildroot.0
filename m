From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 11:58:44 +0000 (UTC)
Subject: [Buildroot] [Bug 4796] apply-patches.sh reorders patches given on
 the command line
In-Reply-To: <bug-4796-163@https.bugs.busybox.net/>
References: <bug-4796-163@https.bugs.busybox.net/>
Message-ID: <20130526115844.231979A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4796

Samuel Martin <s.martin49@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Samuel Martin <s.martin49@gmail.com> 2013-05-26 11:57:34 UTC ---
What are the packages affected by this bug?

Note that using the latest patch policy (see the new patch naming convention):
http://buildroot.org/downloads/manual/manual.html#patch-policy

After fixing the culprit patch filenames, this bug should not occurs anymore.

So, it's better to fix the packages themselves.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
