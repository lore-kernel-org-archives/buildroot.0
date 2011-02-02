From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Feb 2011 19:58:51 +0000 (UTC)
Subject: [Buildroot] [Bug 3115] How about board specific makefiles?
In-Reply-To: <bug-3115-163@https.bugs.busybox.net/>
References: <bug-3115-163@https.bugs.busybox.net/>
Message-ID: <20110202195851.380A68F320@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3115

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Or you can also do :

$ cd buildroot/
$ make && mv output/images/bzImage output/images/mykernelname

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
