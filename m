From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 15:36:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/rtorrent: bump version to
 0.9.7
In-Reply-To: <20180821213949.32148-1-bernd.kuhls@t-online.de>
References: <20180821213949.32148-1-bernd.kuhls@t-online.de>
Message-ID: <20180822153649.06549ff0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue, 21 Aug 2018 23:39:49 +0200, Bernd Kuhls wrote:
> Added license hash, rebased patch 0001.
> 
> Fixes
> http://autobuild.buildroot.net/results/9c6/9c64888e96d59cb536dc7ccaa52f731118e69ce1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Why is this for next only ? rtorrent in master and next are both at
0.9.6. What causes the build failure that makes it next-specific ? It
is not immediately obvious reading the build failure, and it is not
explained in your commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
