From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Jun 2010 21:28:06 +0000 (UTC)
Subject: [Buildroot] [Bug 1807] LZMA 4.32.7,
	Required header file(s) are missing.
In-Reply-To: <bug-1807-163@https.bugs.busybox.net/>
References: <bug-1807-163@https.bugs.busybox.net/>
Message-ID: <20100603212806.CB8299B583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1807

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Strange, it builds here on another arm config. I cannot build your config as
you forgot to attach your uclibc + busybox configs:

BR2_UCLIBC_CONFIG="$(BUILD_DIR)/../../configs/uclibc.config-pet"
BR2_PACKAGE_BUSYBOX_CONFIG="$(BUILD_DIR)/../../configs/busybox26"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
