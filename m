From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:22:42 +0200
Subject: [Buildroot] [PATCH 08/21] package/python-pyudev: bump version
 to 0.21.0
In-Reply-To: <20161006192948.27956-8-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
 <20161006192948.27956-8-bernd.kuhls@t-online.de>
Message-ID: <20161007152242.2f214b59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 21:29:35 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-pyudev/python-pyudev.hash | 6 +++---
>  package/python-pyudev/python-pyudev.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

This patch breaks the build:

>>> python-pyudev 0.21.0 Patching

Applying 0001-Workaround-finding-libudev-on-systems-without-ldconf.patch using patch: 
can't find file to patch at input line 22
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
