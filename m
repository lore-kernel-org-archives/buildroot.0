From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:56:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/snmppp: bump to version 3.3.11a
In-Reply-To: <20190907150043.28449-1-fontaine.fabrice@gmail.com>
References: <20190907150043.28449-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907215653.67315557@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Sep 2019 17:00:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Update hash of license file (source file has been updated)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/snmppp/snmppp.hash | 4 ++--
>  package/snmppp/snmppp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master. I suppose you have also taken care of the
release-monitoring.org, since the Buildroot mapping has been created
for both packages, while autobuild.buildroot.org/stats/, generated
earlier today, said both were not found.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
