From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:28:38 +0200
Subject: [Buildroot] [PATCH] python-jinja2: don't remove async files for
 Python 3
In-Reply-To: <20170706085753.14779-1-yegorslists@googlemail.com>
References: <20170706085753.14779-1-yegorslists@googlemail.com>
Message-ID: <20170706212838.2340f4ac@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 10:57:53 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> The needed functionality is already included into Python 3.6.x,
> so these files can be now compiled without errors.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-jinja2/python-jinja2.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
