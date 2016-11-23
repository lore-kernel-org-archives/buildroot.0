From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Nov 2016 12:41:22 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-F1zvCfhVOG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #14 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Hum, my apologies, there is indeed the message:

iniparser: cannot open /home/test/buildroot/output/build/ubinize.cfg
ubinize: error!: cannot load the input ini file
"/home/test/buildroot/output/build/ubinize.cfg"

and indeed, the UBIFS image is produced but not the UBI image. So I can
reproduce the issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
