From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2015 17:27:49 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150411172749.9BC7B80E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-11 17:27:49 UTC ---
You're using a custom external toolchain:

BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/cross/quark/toolchain"

So it's most likely this toolchain that is broken. Is this toolchain available
somewhere?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
