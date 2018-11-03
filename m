From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 22:28:57 +0100
Subject: [Buildroot] [PATCH 0/4] audit: fix broken startup and make some
 improvements
In-Reply-To: <20181103164244.10607-1-casantos@datacom.com.br>
References: <20181103164244.10607-1-casantos@datacom.com.br>
Message-ID: <20181103222857.7915bc50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 13:42:40 -0300, Carlos Santos wrote:

> Carlos Santos (4):
>   audit: fix audispd path in auditd.conf
>   audit: ensure that it starts after the logging daemon
>   linux: enble AUDIT if the audit package is selected
>   audit: bump to version 2.8.4

Series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
