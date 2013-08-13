From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 23:10:49 +0200
Subject: [Buildroot] [PATCH] lxc: new package
In-Reply-To: <1360668086-9853-1-git-send-email-jezz@sysmic.org>
References: <1360668086-9853-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130813231049.5f7e3b8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 12 Feb 2013 12:21:26 +0100, J?r?me Pouiller wrote:
> Linux Containers (LXC), provides the ability to group and isolate
> of a set of processes in a jail by virtualizing and accounting the
> kernel resources. It is similar to Linux-Vserver or Openvz.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Applied, thanks.

I've bumped the version to 0.9.0 (last stable release available at this
time), and I've added thread and IPv6 toolchain dependencies.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
