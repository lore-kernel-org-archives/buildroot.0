From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Dec 2011 09:18:21 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] libXfont and libXft building failed,
 cross-compilation error
In-Reply-To: <bug-4592-163@https.bugs.busybox.net/>
References: <bug-4592-163@https.bugs.busybox.net/>
Message-ID: <20111212091821.61A278F930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

--- Comment #5 from Mario <marioabajo@gmail.com> 2011-12-12 09:18:21 UTC ---
Sorry for the lack of details in the first mail. I'm attaching the .config
file. For building i'm using a work station with debian squeeze and i have the
development files of libfreetype installed:

turin at cronos:~$ dpkg -l libfreetype6-dev
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                         Version                      Description
+++-============================-============================-========================================================================
ii  libfreetype6-dev             2.4.4-1~bpo60+1              FreeType 2 font
engine, development files

I'm also attaching the config.log files of libXft and libXfont packages.
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
