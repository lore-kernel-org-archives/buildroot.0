From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 27 Aug 2016 03:59:46 +0000
Subject: [Buildroot] [Bug 9196] raspberry pi 3 default build seem broken
In-Reply-To: <bug-9196-163@https.bugs.busybox.net/>
References: <bug-9196-163@https.bugs.busybox.net/>
Message-ID: <bug-9196-163-X2SnkmL89h@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

--- Comment #4 from Mikhail <mikhail_tchernychev@yahoo.com> ---
Here is better report (I think)

This is what I did (latest version)

git pull 

make clean

make xconfig raspberrypi3_defconfig

For some reason, it does not show RPi scripts
So I exit (saving) and do it again:

make xconfig

Now RPi scripts in place.

make

OK. write to SD card.

Use RPi3 with display and keyboard attached.

Boots fine.

Welcome to Buildroot

buildroot login:

type: root

Password:

Just press enter.

Shows again:

Password:

press enter

Login timeout after 60 seconds.

No way it let me log in.

I attached latest . config 

I hope it helps

I am going to make changes in config to use systemd and submit
another comment.

Best Regards
Mikhail

-- 
You are receiving this mail because:
You are on the CC list for the bug.
