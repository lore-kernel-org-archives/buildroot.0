From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 11:01:56 +0000 (UTC)
Subject: [Buildroot] [Bug 71] ./wchar.h:41:12: error: empty filename in
	#include
In-Reply-To: <bug-71-163@https.bugs.busybox.net/>
References: <bug-71-163@https.bugs.busybox.net/>
Message-ID: <20090304110157.DBD5576457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71





--- Comment #4 from Paul Jones <paul.jones@iwtech.com.au>  2009-03-04 11:01:54 UTC ---
In Menuconfig I did this:

Target Architecture -> ARM
Target Architecture Variant -> arm920t
Target options -> * ARM Ltd. Device Support
                  * Generic development system 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
