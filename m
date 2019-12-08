From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:05:19 +0100
Subject: [Buildroot] [PATCH 0/7] Improve sysrepo support
In-Reply-To: <cover.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <20191208230519.563f3843@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Wed, 4 Dec 2019 11:41:44 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> Jan Kundr?t (7):
>   libyang: Optional C++ bindings
>   sysrepo: fix a typo when installing with systemd
>   sysrepo: libnetconf2 is not needed
>   sysrepo: Optional support for C++ bindings
>   sysrepo: Use a common repository location
>   libnetconf2: adjust dependencies
>   Add me as a maintainer for the NETCONF stack

I have applied some of the patches in this series (patches 2, 3 and 7),
but the other patches (1, 4, 5 and 6) had some comments. Could you take
them into account and send an updated series ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
