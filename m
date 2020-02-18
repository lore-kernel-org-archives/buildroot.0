From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Feb 2020 13:47:36 +0000
Subject: [Buildroot] [Bug 12416] qt5webengine should not use WEBENGINE_CONFIG
In-Reply-To: <bug-12416-163@https.bugs.busybox.net/>
References: <bug-12416-163@https.bugs.busybox.net/>
Message-ID: <bug-12416-163-jaqxokya8F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12416

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Thanks for the bug report and suggested patch (and sorry for the delayed
response).

Meanwhile Nathan Ford took care of the suggested patch plus missing webp mux
and alsa support ([1], [2])..., the suggested patch seems to work for the
Qt-latest/5.12.x case ([3])...

One further question out of interest, on which hardware do you run
qtwebengine and how (or which buildroot config/defconfig do you use)?

There is a report from one buildroot user not to be able to run
the minimal example on RaspberryPi Zero (see [4] and [5])...

[1] http://lists.busybox.net/pipermail/buildroot/2020-January/272066.html
[2] https://patchwork.ozlabs.org/patch/1227357/
[3] http://lists.busybox.net/pipermail/buildroot/2020-February/274385.html
[4] http://lists.busybox.net/pipermail/buildroot/2020-February/273320.html
[5] http://lists.busybox.net/pipermail/buildroot/2020-February/273329.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
