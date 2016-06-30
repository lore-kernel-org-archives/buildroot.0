From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:00:27 +0200
Subject: [Buildroot] [PATCH] python-meld3: bump to version 1.0.2
In-Reply-To: <1467297538-31952-1-git-send-email-yegorslists@googlemail.com>
References: <1467297538-31952-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160701000027.50cbb908@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 16:38:58 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> meld3 1.0.2 supports Python 3, so drop Python 2 only dependency.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-meld3/Config.in         | 4 ++--
>  package/python-meld3/python-meld3.hash | 5 +++--
>  package/python-meld3/python-meld3.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
