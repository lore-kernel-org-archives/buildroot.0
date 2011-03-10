From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2011 13:57:56 +0100
Subject: [Buildroot] [PATCH 3/3] busybox 1.18.3: add patches for klogd
 and menuconfig
In-Reply-To: <1299759904-22003-3-git-send-email-gustavo@zacarias.com.ar>
References: <1299759904-22003-1-git-send-email-gustavo@zacarias.com.ar>
	<1299759904-22003-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20110310135756.1031efb0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2011 09:25:04 -0300
Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../busybox-1.18.3/busybox-1.18.3-klogd.patch      |   45 ++++++++++++++++++++
>  .../busybox-1.18.3/busybox-1.18.3-menuconfig.patch |   11 +++++
>  2 files changed, 56 insertions(+), 0 deletions(-)
>  create mode 100644 package/busybox/busybox-1.18.3/busybox-1.18.3-klogd.patch
>  create mode 100644 package/busybox/busybox-1.18.3/busybox-1.18.3-menuconfig.patch

Is it really necessary to add Busybox patches all the time, since they
got deprecated pretty quickly by newer releases ? I mean, at the time
of the Buildroot release, it of course make sense to have the latest
Busybox release with the latest fixes, but during the development
phase, is it really useful ?

Of course, if you already do it for other purposes, that's just fine.
I'm just wondering.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
