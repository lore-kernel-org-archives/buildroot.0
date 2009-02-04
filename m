From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Feb 2009 12:29:12 +0000 (UTC)
Subject: [Buildroot] [Bug 81] New package wpa_supplicant
In-Reply-To: <bug-81-163@https.bugs.busybox.net/>
References: <bug-81-163@https.bugs.busybox.net/>
Message-ID: <20090204122912.E888D76210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=81


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #47 is|0                           |1
           obsolete|                            |




--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-02-04 12:29:10 UTC ---
Created an attachment (id=51)
 --> (https://bugs.busybox.net/attachment.cgi?id=51)
New wpa_supplicant package take 2


Added the EAP enable/disable option to make things lighter when it's not
wanted.
Also made some menu descriptions nicer.
Size for each variant:

314444 bytes for wpa_supplicant with EAP-internal
258396 bytes for wpa_supplicant with EAP-openssl
205040 bytes for wpa_supplicant without EAP


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
