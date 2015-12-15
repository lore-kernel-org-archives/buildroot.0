From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:42:45 +0100
Subject: [Buildroot] [PATCH] python-pyroute2: bump to 0.3.15
In-Reply-To: <1450163810-5839-1-git-send-email-yegorslists@googlemail.com>
References: <1450163810-5839-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20151215214245.42a94349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Tue, 15 Dec 2015 08:16:50 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add a hash file.
> 
> Change download location to pypi and remove a pre-configure
> hook as the package now provides a stand-alone setup.py.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-pyroute2/python-pyroute2.hash |  3 +++
>  package/python-pyroute2/python-pyroute2.mk   | 13 +++----------
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  create mode 100644 package/python-pyroute2/python-pyroute2.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
