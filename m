From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Aug 2018 06:58:18 +0000
Subject: [Buildroot] [Bug 11211] Internal compiler error: Killed (program
 cc1plus) on WebCoreDerivedSources.dir
In-Reply-To: <bug-11211-163@https.bugs.busybox.net/>
References: <bug-11211-163@https.bugs.busybox.net/>
Message-ID: <bug-11211-163-XJMGDSOovg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11211

Jan Kundr?t <jan.kundrat@cesnet.cz> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #4 from Jan Kundr?t <jan.kundrat@cesnet.cz> ---
You can either throw more RAM at the build, or you can limit the number of
parallel jobs, yeah. Note that once the compilation passes, you will still have
to link the resulting library which once again requires "plenty" of RAM.

I don't think that there's any issue in Buildroot here, so I'm closing this
bugreport. Please feel free to reopen.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
