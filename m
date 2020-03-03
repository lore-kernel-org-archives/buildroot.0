From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Mar 2020 21:22:52 +0000
Subject: [Buildroot] [Bug 11706] binman (U-boot tool) cannot find libfdt
 "binman: No module named _libfdt" if python3 selected
In-Reply-To: <bug-11706-163@https.bugs.busybox.net/>
References: <bug-11706-163@https.bugs.busybox.net/>
Message-ID: <bug-11706-163-CGIEcSvsFL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11706

--- Comment #3 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
binman uses python3 since version 2020.01 and
https://github.com/u-boot/u-boot/commit/388560134b99dc4cc752627d3a7e9f8c8c2a89a7.

uboot-tools has been bumped to 2020.01 on January 24th with
https://git.buildroot.net/buildroot/commit/?id=8258a60ad403d8e2637bd1226ec43863e4160726
so perhaps this issue has been "fixed".

-- 
You are receiving this mail because:
You are on the CC list for the bug.
