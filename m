From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:29:52 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual/adding-packages-python.txt:
 fix outdated Python 3 sentence.
In-Reply-To: <20190909115807.5753-1-raphael.melotte@essensium.com>
References: <20190909115807.5753-1-raphael.melotte@essensium.com>
Message-ID: <20190910192952.4810fb3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  9 Sep 2019 13:58:07 +0200
raphael.melotte at essensium.com wrote:

> From: Rapha?l M?lotte <raphael.melotte@essensium.com>
> 
> Python packages should no longer depend on BR2_PACKAGE_PYTHON
> in their config file, unless they are only compatible with Python 2.
> 
> Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
> ---
>  docs/manual/adding-packages-python.txt | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
