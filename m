From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:58:45 +1300
Subject: [Buildroot] [PATCH 1/8] python-pathvalidate: bump to version
 0.13.0
In-Reply-To: <20170117101725.19629-1-yegorslists@googlemail.com>
References: <20170117101725.19629-1-yegorslists@googlemail.com>
Message-ID: <20170124225845.18cc5e9d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jan 2017 11:17:18 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add python-six to the runtime dependencies.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python-pathvalidate/Config.in                | 1 +
>  package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
>  package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)

Entire series applied, thanks!

It's quite amazing that there are two Python packages (setuptools-scm
and vcversioner) that essentially do exactly the same (at least, as far
as I understood what they do). So many things to package for so little
actual code :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
