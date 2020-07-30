From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2020 08:35:22 +0000
Subject: [Buildroot] [Bug 13121] wpa_supplicant fails to build without
 libopenssl enabled
In-Reply-To: <bug-13121-163@https.bugs.busybox.net/>
References: <bug-13121-163@https.bugs.busybox.net/>
Message-ID: <bug-13121-163-RC5DFf4HmV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13121

--- Comment #2 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
This is a "known" issue, the following patch (which is not yet merged) should
fix your issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20200108190439.459316-1-geomatsi at gmail.com/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
