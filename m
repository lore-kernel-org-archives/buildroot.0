From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 11:29:52 +0100
Subject: [Buildroot] [PATCH 0/5] Various init scripts modification
In-Reply-To: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150203112952.590b4ac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:46:59 +0200, Maxime Hadjinlian wrote:

>   infra: Add automatic install of init scripts
>   acpid: Use new FOO_INIT_SYSV_FILES variable
>   am33x-cm3: Use new FOO_INIT_SYSV_FILES variable

We discussed this at the Buildroot meeting, and decided to not go down
this route. We believe the amount of redundancy with the existing
_INSTALL_INIT_SYSV and _INSTALL_INIT_SYSTEMD variables is not that
huge, and in many _INSTALL_INIT_SYSTEMD variable, a bit of custom stuff
is anyway needed. So we believe the benefits are too small compared to
the effort.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
