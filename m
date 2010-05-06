From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 16:36:30 +0000 (UTC)
Subject: [Buildroot] [Bug 1717] External toolchain fixes for hostapd &
	wpa_supplicant
In-Reply-To: <bug-1717-163@https.bugs.busybox.net/>
References: <bug-1717-163@https.bugs.busybox.net/>
Message-ID: <20100506163631.0044A9A408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1717

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Created attachment 1681
  --> https://bugs.busybox.net/attachment.cgi?id=1681
Fix hostapd build with external toolchain

Since hostapd uses the same build system as wpa_supplicant it's safe to assume
this will fix the same issue as wpa_supplicant.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
