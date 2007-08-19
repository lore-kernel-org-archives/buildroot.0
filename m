From: Brad House <brad@mainstreetsoftworks.com>
Date: Sun, 19 Aug 2007 13:20:42 -0400
Subject: [Buildroot] [patch] php fixes and updates
In-Reply-To: <46C212E7.1020707@mainstreetsoftworks.com>
References: <46C212E7.1020707@mainstreetsoftworks.com>
Message-ID: <46C87BEA.4010704@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Changes:
>     - fastcgi config option
>     - force php to find the php.ini in /etc (it seems to default
>       to /lib for some reason)
>     - build with posix support, a lot of php scripts require
>       this apparently
>     - strip the php binary when installing to TARGET_DIR
>     - actually 'uninstall' php on a php-clean

Any word on getting this patch committed?

-Brad
