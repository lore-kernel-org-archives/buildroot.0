From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Dec 2015 01:53:11 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-nmnCbdHDPS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #7 from nroach44 at gmail.com ---
When I try to sudo from my user:

Jan 01 09:08:59 charon sudo[1092]: [[0;1;31mnroach44 : 3 incorrect password
attempts ; TTY=ttyS0 ; PWD=/root ; USER=root ; COMMAND=/bin/bash[[0m

I can confirm that my password is being typed correctly as I changed it to 'a'
and tried again.

Adding myself to wheel does allow me to sudo strangely enough, which is curious
as the sudo group works fine when sudo is built without PAM.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
