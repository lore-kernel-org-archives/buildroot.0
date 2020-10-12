From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Oct 2020 09:04:09 +0000
Subject: [Buildroot] [Bug 13251] cryptsetup does not work on branch 2020.02
 following json-c upgrade
In-Reply-To: <bug-13251-163@https.bugs.busybox.net/>
References: <bug-13251-163@https.bugs.busybox.net/>
Message-ID: <bug-13251-163-9DaGQEjOnc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13251

--- Comment #2 from Dominique Tronche <dominique.tronche@atos.net> ---
Hi,
The patch is working on our facility. 
Is there any reason why a patch instead of upgrading to cryptsetup 2.3.3 ?
That is what we did as a correction on our side and we are interested to know
if it is not safe. 
Regards
Dominique Tronche

-- 
You are receiving this mail because:
You are on the CC list for the bug.
