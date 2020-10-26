From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 22:09:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-intelhex: bump to
 version 2.3.0
In-Reply-To: <20201025223957.2143147-1-fontaine.fabrice@gmail.com>
References: <20201025223957.2143147-1-fontaine.fabrice@gmail.com>
Message-ID: <20201026220927.3b347fb4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 23:39:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix Python 3.9 compatibility issue with 'array' module
> 
> https://github.com/python-intelhex/intelhex/releases/tag/2.3.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1c217f0c67c63ee43494ef84af832df8e856e2df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-intelhex/Config.in            | 2 +-
>  package/python-intelhex/python-intelhex.hash | 4 ++--
>  package/python-intelhex/python-intelhex.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
