From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jul 2010 19:31:40 +0000 (UTC)
Subject: [Buildroot] [Bug 1681] Cross-compiled binaries shouldn't be
 installed into staging
In-Reply-To: <bug-1681-163@https.bugs.busybox.net/>
References: <bug-1681-163@https.bugs.busybox.net/>
Message-ID: <20100729193140.4FBCB83695@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1681

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|2010.05                     |2010.08

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Peter, what do we do with this bug ? What are the actions points related to
this bug for 2010.08 and post-2010.08 ?

In http://buildroot.org/buildroot.html#using_toolchain we're still suggesting
users to add $(STAGING_DIR) to their PATH. Possible proposals for 2010.08 :

 * Change the documentation to tell users to use absolute paths to the tools
and to not add $(STAGING_DIR) to their PATH.

 * Create a new directory with wrappers for the toolchain tools, so that users
can put this directory in their PATH.

Choice ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
