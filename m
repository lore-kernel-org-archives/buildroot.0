From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 11:28:17 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-2Cv2qfGSvM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
well, did you look at the build output ? Quoting your bug report:

>>> wiringpi 2.44 Downloading

So Buildroot is using wiringpi 2.44, as you request.

The bump to 2.44 was done in March 2017,
https://git.buildroot.org/buildroot/commit/package/wiringpi?id=76d36355de8c1957f08f6d5e68395cf6a1b69474,
so it's part of the latest 2017.08 release.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
