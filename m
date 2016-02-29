From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:50:44 +0100
Subject: [Buildroot] [PATCH 09/32] package/systemd: add support for
 specifying NTP servers
In-Reply-To: <1456437341-19025-10-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-10-git-send-email-gabe@hashrabbit.co>
Message-ID: <20160229225044.5566ab58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Thu, 25 Feb 2016 21:55:18 +0000, Gabe Evans wrote:

> +config BR2_PACKAGE_SYSTEMD_NTP_SERVERS
> +	string "default NTP servers"
> +	default "0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"

Does this really needs to be a compile time definition? Can't this be
specified in some configuration file? If so, then I believe it would be
nicer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
