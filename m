From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Feb 2019 14:10:26 +0000
Subject: [Buildroot] [Bug 11671] russian locale ru_RU:145: LC_TIME: syntax
 error
In-Reply-To: <bug-11671-163@https.bugs.busybox.net/>
References: <bug-11671-163@https.bugs.busybox.net/>
Message-ID: <bug-11671-163-ixSXDOEOv8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11671

--- Comment #2 from Alexey <skif@skif-web.ru> ---
Thanks a lot,Peter!

I applied your patches, and now building is comlited successful. 
But in don't have "locale" command in builded system.
May be anyone know, hot to set locale in system and how to add LOCALE command ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
