From: Amr Bekhit <amrbekhit@gmail.com>
Date: Tue, 20 Jun 2017 09:29:02 +0300
Subject: [Buildroot] Systemd no longer working when transitioning from
	2017.02.3 to 2017.05
Message-ID: <CAOLz05oMkX9563v=a+Zk1Zro-EUuQaBwgfCMyvi5Ne3Lz_2dQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I've been using systemd with buildroot 2017.02.3 with no problems.
I've recently made the transition to 2017.05 and now on bootup, the
systemd-resolved and systemd-timesyncd services fail to start. I've
pasted their error messages on pastebin:

Startup log: https://pastebin.com/TtSmZF7F
systemd-timesyncd: https://pastebin.com/qC2QMnRN
systemd-resolved: https://pastebin.com/z0U5w98Y

Config file for 2017.02.3: https://pastebin.com/R8JvrkLa
Config file for 2017.05: https://pastebin.com/mMPurrqf

Both systems were built for an Atmel SAMA5D4 Xplained board. The
config file for 2017.05 was created manually by going through the
options in the 2017.02.3 menuconfig and adding them in.

Amr
