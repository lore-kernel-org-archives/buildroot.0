From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:50:34 +0100
Subject: [Buildroot] [PATCH] wilink-bt-firmware: new package
In-Reply-To: <cbd5997af99067109143dbe87a830b237198451f.1489415727.git.baruch@tkos.co.il>
References: <cbd5997af99067109143dbe87a830b237198451f.1489415727.git.baruch@tkos.co.il>
Message-ID: <20170318155034.7cc342ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 16:35:27 +0200, Baruch Siach wrote:

> +config BR2_WILINK_BT_FIRMWARE

This should start with BR2_PACKAGE_

So I assumed you tested this by running "make wilink-bt-firmware" ?

Anyway, I've fixed this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
