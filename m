From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 17:48:58 +0000
Subject: [Buildroot] [Bug 11781] mariadb build error
In-Reply-To: <bug-11781-163@https.bugs.busybox.net/>
References: <bug-11781-163@https.bugs.busybox.net/>
Message-ID: <bug-11781-163-3NfGi6sr6M@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11781

--- Comment #3 from Ryan Coe <bluemrp9@gmail.com> ---
I get a build failure related to a missing host openssl package.  The following
patch [1] fixes it for me.  Note that this was marked superseded.

[1] http://patchwork.ozlabs.org/patch/1026864/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
