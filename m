From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:44:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/fping: bump to version 5.0
In-Reply-To: <20200811094920.1857292-1-fontaine.fabrice@gmail.com>
References: <20200811094920.1857292-1-fontaine.fabrice@gmail.com>
Message-ID: <20200812164434.2abc7f0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 11:49:20 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> This bump will fix a build failure with gcc 10 thanks to
> https://github.com/schweikert/fping/commit/0ed73181eb54e3f2dc744271c0329620972a85ab
> 
> Also update indentation in hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f5c8e546200594e2367444e93e31aa615bd73796
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fping/fping.hash | 4 ++--
>  package/fping/fping.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
