From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Mar 2017 12:59:42 +0000
Subject: [Buildroot] [Bug 9751] expat legal info - manifest.csv: GPLv2
 Source site: MIT License (Buildroot 2017-02)
In-Reply-To: <bug-9751-163@https.bugs.busybox.net/>
References: <bug-9751-163@https.bugs.busybox.net/>
Message-ID: <bug-9751-163-FdoHg8fYFC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9751

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I just tried legal-info with the expat package enabled, and I get:

"expat","2.2.0","MIT","COPYING","expat-2.2.0.tar.bz2","http://downloads.sourceforge.net/project/expat/expat/2.2.0"

The expat package has the correct "MIT" license since we added license
information to this package in commit
https://git.buildroot.org/buildroot/commit/package/expat?id=180c091a83e569d23d1ab2525ac5ef7ea9b5ee90
almost 5 years ago.

So I'm sorry, but I don't see a bug here. Are you sure you didn't misread the
manifest.csv ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
