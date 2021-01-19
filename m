From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:22:57 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sysklogd: bump to version
 2.1.2
In-Reply-To: <20201229181125.704233-1-andreas.hilse@googlemail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201229181125.704233-1-andreas.hilse@googlemail.com>
Message-ID: <20210119222257.361cb35d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Dec 2020 19:11:25 +0100
Andreas Hilse via buildroot <buildroot@busybox.net> wrote:

> - fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility
> - sysklogd removed klogd, functionality has been moved to syslogd
> - now supports config fragments in /etc/syslog.d
> - disabled sysklogd logger to not interfere with other loggers
> - license has changed from GPL-2.0+ to BSD-3-Clause
> 
> Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>
> 
> ---
> Changes v1 -> v2:
>   - added patch for O_CLOEXEC build failure with uClibc
>   - mention license change
>   - extended help text in Config.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
