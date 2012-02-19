From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Feb 2012 02:50:02 +0000 (UTC)
Subject: [Buildroot] [Bug 4772] Add uClibc configuration file option to
 crosstool-ng toolchain support
In-Reply-To: <bug-4772-163@https.bugs.busybox.net/>
References: <bug-4772-163@https.bugs.busybox.net/>
Message-ID: <20120219025002.81E1590AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4772

--- Comment #2 from hank <andrew@sideramota.com> 2012-02-19 02:50:02 UTC ---
Ah ok, I wasn't aware that you could do that. 
Even though, you can't really support multiple configs using the make
*_defconfig targets if you have to  manually specify the uclibc library. 
In that case I guess you can over write the default config in the toolchain
dir.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
