From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 10:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <20200812160843.24064-1-andreas.hilse@googlemail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
Message-ID: <20200813102505.2120931f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

Thanks for the patch.

On Wed, 12 Aug 2020 18:08:43 +0200
Andreas Hilse <andreas.hilse@googlemail.com> wrote:

> - fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility

I'd like to understand how disruptive/important this issue is. I.e,
should we have this sysklogd version bump be considered as a bug fix?

> - sysklogd removed klogd, functionality has been moved to syslogd
> - now supports config fragments in /etc/syslog.d
> - disabled sysklogd logger to not interfere with other loggers

I think the license change should also be mentioned in the commit log,
but that can be added when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
