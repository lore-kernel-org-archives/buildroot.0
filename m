From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  3 Feb 2012 13:31:52 +0000 (UTC)
Subject: [Buildroot] [Bug 3691] New EFL packages
In-Reply-To: <bug-3691-163@https.bugs.busybox.net/>
References: <bug-3691-163@https.bugs.busybox.net/>
Message-ID: <20120203133152.63FFA909B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3691

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-02-03 13:31:51 UTC ---
We have added packages for the EFL libraries in Buildroot now, and they will be
part of the next stable release 2012.02. All the packages you proposed are now
integrated:

buildroot$ ls package/efl/
Config.in  expedite  libedbus  libeet     libeina        libembryo  libevas
efl.mk     libecore  libedje   libefreet  libelementary  libethumb

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
