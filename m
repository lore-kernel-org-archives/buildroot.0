From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 19:37:18 +0200
Subject: [Buildroot] [PATCH 01/13] pkg-{download,
 generic}: remove source-check
In-Reply-To: <20170704162211.13238-2-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-2-maxime.hadjinlian@gmail.com>
Message-ID: <20170704193718.34d387d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:21:59 +0200, Maxime Hadjinlian wrote:
> This feature is not used by anyone in the core developpers and makes a
> drastic simplification of the pkg-download infrastructure harder.
> 
> The future patch will move much of what's in the current pkg-download.mk
> file into the dl-wrapper which is a shell script.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

You forgot to remove lots of references to source-check, do a "git grep
source-check" to find them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
