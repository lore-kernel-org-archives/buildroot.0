From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 14:51:22 +0000 (UTC)
Subject: [Buildroot] [Bug 6764] Support for kernel signed modules
In-Reply-To: <bug-6764-163@https.bugs.busybox.net/>
References: <bug-6764-163@https.bugs.busybox.net/>
Message-ID: <20140223145122.C3E0C9B838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6764

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-23 14:51:22 UTC ---
A better solution to this problem would be to strip the modules before signing.
However, this should be done in the kernel rather than in buildroot.
Please discuss the matter upstream, once it is fixed there, it will be in
buildroot too (when using these newer kernels). Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
