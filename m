From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Mar 2017 18:14:00 +0000
Subject: [Buildroot] [Bug 9711] Recent libCEC version bump seems to break
	kodi package
In-Reply-To: <bug-9711-163@https.bugs.busybox.net/>
References: <bug-9711-163@https.bugs.busybox.net/>
Message-ID: <bug-9711-163-DRRVWL78ug@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

--- Comment #9 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
Ok, we need to revert more, please try these patches:

http://patchwork.ozlabs.org/patch/735885/
http://patchwork.ozlabs.org/patch/735886/

If compilation still fails please post your defconfig.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
