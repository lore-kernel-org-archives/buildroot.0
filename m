From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 14:51:07 +0200
Subject: [Buildroot] [PATCH 1/2] package/vte: needs host-intltool
In-Reply-To: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
References: <20190713083256.28511-1-fontaine.fabrice@gmail.com>
Message-ID: <20190714145107.7aa5ebb1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Jul 2019 10:32:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/30a8032ebba5a30bacd321c407a1d0734fadf757
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This vte package has not changed since it was introduced in January
2018. Why suddenly we have this error caused by the missing intltool ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
