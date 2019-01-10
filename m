From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Jan 2019 18:56:19 +0000
Subject: [Buildroot] [Bug 11606] libjpeg has no Config.in
In-Reply-To: <bug-11606-163@https.bugs.busybox.net/>
References: <bug-11606-163@https.bugs.busybox.net/>
Message-ID: <bug-11606-163-2EIoQlNKdn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11606

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
jpeg is a virtual package (provided either by libjpeg or libjpeg-turbo). Use
BR2_PACKAGE_JPEG / jpeg to ensure libjpeg or libjpeg-turbo is available. See
the many packages with a 'select BR2_PACKAGE_JPEG'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
