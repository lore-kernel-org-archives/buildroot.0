From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:14:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cplus: bump to version 2.0.4
In-Reply-To: <20190410220017.13679-1-fontaine.fabrice@gmail.com>
References: <20190410220017.13679-1-fontaine.fabrice@gmail.com>
Message-ID: <20190411081448.57dad16f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Apr 2019 00:00:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove atomic "hack", not needed since:
>   https://github.com/log4cplus/log4cplus/commit/f14427a871219ea69c3f26925bc2f92b87967dab
> - Manage new lto option added by
>   https://github.com/log4cplus/log4cplus/commit/66d3d36495e0670f20d88b1bf2ba9245093ef2de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cplus/log4cplus.hash |  2 +-
>  package/log4cplus/log4cplus.mk   | 12 +++++++-----
>  2 files changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
