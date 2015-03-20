From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Fri, 20 Mar 2015 11:20:36 +0000
Subject: [Buildroot] Trouble with cron / crontab
Message-ID: <DB3PR04MB1086BDBABB62A2E19D61F0CEA0E0@DB3PR04MB108.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am facing a strange issue with Buildroot 2015.02. I am using cron/crontab from Busybox but can't start/define any cronjob because /var/spool/cron/crontabs didn't exist on my rootfs.
On my rootfs there is no /var/spool/cron but this exist on output/target.

I haven't found anything in documentation about cron...
Is there something I have missed?

Kind regards

Fabrice Mousset
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150320/2d915306/attachment.html>
