From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 22:28:09 +0000 (UTC)
Subject: [Buildroot] [Bug 75] arm buildroot "unrecognized option" error
In-Reply-To: <bug-75-163@https.bugs.busybox.net/>
References: <bug-75-163@https.bugs.busybox.net/>
Message-ID: <20100521222809.D549912EDC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=75

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Do you still have this issue ? If so, can you do echo $PATH in the shell you
ran Buildroot make ?

See http://wiki.openembedded.net/index.php/Unrecognized_option_-Qy_on_x86_64
for some details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
