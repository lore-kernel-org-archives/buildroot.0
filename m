From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Oct 2017 16:43:24 +0000
Subject: [Buildroot] [Bug 10426] uboot-tools' fw_setenv does not update the
 redundant environment
In-Reply-To: <bug-10426-163@https.bugs.busybox.net/>
References: <bug-10426-163@https.bugs.busybox.net/>
Message-ID: <bug-10426-163-raAFtbK6sO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10426

--- Comment #1 from Jan Kundr?t <jan.kundrat@cesnet.cz> ---
Hmm, this might actually be an upstream issue. I'm looking into the code now,
and it seems that it does notice that I have two environments (it's basically
counting the relevant lines in the config file). Just one of them is being
updated, though, which might or might not be a result of some recent changes.

Note that I'm using 2017.07 for the tools and 2017.09 for the actual
bootloader.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
