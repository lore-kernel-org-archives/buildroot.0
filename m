From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Aug 2016 16:01:25 +0000
Subject: [Buildroot] [Bug 9196] raspberry pi 3 default build seem broken
In-Reply-To: <bug-9196-163@https.bugs.busybox.net/>
References: <bug-9196-163@https.bugs.busybox.net/>
Message-ID: <bug-9196-163-IG510GFZAW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

--- Comment #2 from Mikhail <mikhail_tchernychev@yahoo.com> ---
Yes sorry I could not log with HDMI/keyboard. However I learn that
for RP3 to use serial line blue tooth needs to be disabled; I used
debian stock image and at first could not login via serial, showed
garbage characters along with some valid ones. After I disabled 
BT in config.txt stock image worked on serial line.

The same trick with buildroot image did not work.

Regarding systemd I build it just by removing the script. It boots 
but getty gets time out 1 m 30 sec, no login prompt is shown.

It is similar to issue described here:

http://buildroot-busybox.2317881.n4.nabble.com/systemd-not-working-properly-td82549.html

But on HDMI/keyboard.

I will reproduce it tonight and send a better report.

Thank you!

Mikhail

-- 
You are receiving this mail because:
You are on the CC list for the bug.
