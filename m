From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 22:58:02 +0100
Subject: [Buildroot] [PATCH] package/sysklogd: fix installation path of
 the daemons
In-Reply-To: <20200315022706.20107-1-unixmania@gmail.com>
References: <20200315022706.20107-1-unixmania@gmail.com>
Message-ID: <20200315225802.740f62e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Mar 2020 23:27:06 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Use "--exec-prefix=/" to install syslogd and klogd at /sbin, as required
> by the init scripts. This also ensures that the BusyBox counterparts are
> not installed.
> 
> Update the systemd unit files, accordingly.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
