From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:23:13 +0200
Subject: [Buildroot] [PATCH] netperf: bump to version 2.7.0
In-Reply-To: <1437573590-11966-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437573590-11966-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150722172313.793552fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 10:59:50 -0300, Gustavo Zacarias wrote:
> Also add hash file.
> And work around gcc 5+ defaulting to gnu99, fixes:
> 
> http://autobuild.buildroot.net/results/077/077714a0ee67057abcff680b244228a409243bbf/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/netperf/netperf.hash | 2 ++
>  package/netperf/netperf.mk   | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>  create mode 100644 package/netperf/netperf.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
