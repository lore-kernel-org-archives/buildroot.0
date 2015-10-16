From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Oct 2015 20:52:01 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20151016205201.C10C381EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

--- Comment #9 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-10-16 20:52:01 UTC ---
[--SNIP--]
> At least, there is now a configurable choice between the sleeping S40network
> and ifplugd.

The sleeping solution is to make our RPi defconfig (as well as all our default
configs) "just work" out-of-the-box, nothing more.

Any more serious system would probably have to use something along the lines
of connman (my personal favourite) or NetworkManager or ifplugd. Or even
custom startup scripts.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
