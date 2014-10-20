From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 20 Oct 2014 16:25:30 +0200
Subject: [Buildroot] systemd not working properly?
In-Reply-To: <20141019124525.01fe9653@free-electrons.com>
References: <20141019124525.01fe9653@free-electrons.com>
Message-ID: <7208052.NlFnfzDpiS@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On Sunday 19 October 2014 12:45:25 Thomas Petazzoni wrote:
> Dear systemd/Buildroot users,
> 
> I don't use systemd much, but every time I need to test a config with
> systemd enabled, there are quite a few errors at boot time, and more
> precisely, it doesn't even boot completely. Here are the errors I get:
> 
> [FAILED] Failed to start Remount Root and Kernel File Systems.
> See 'systemctl status systemd-remount-fs.service' for details.
> ...
There is an incompatibility between busybox mount command and systemd[1][2]. 
This error should be resolved if you use mount from util-linux.

[1] http://lists.busybox.net/pipermail/busybox/2008-June/066078.html
[2] http://lists.busybox.net/pipermail/busybox/2012-July/078064.html

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
