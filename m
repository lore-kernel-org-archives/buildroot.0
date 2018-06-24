From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 15:56:28 +0200
Subject: [Buildroot] [PATCH 1/1] collectd: fix license
In-Reply-To: <20180624120323.31256-1-fontaine.fabrice@gmail.com>
References: <20180624120323.31256-1-fontaine.fabrice@gmail.com>
Message-ID: <20180624155628.4785d67c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jun 2018 14:03:23 +0200, Fabrice Fontaine wrote:
> - Since version 5.5, daemon is licensed under MIT:
>   https://github.com/collectd/collectd/commit/889e5e6bd51d38d490289332053a238a4f1c70b3
> - Plugins are licensed under MIT, GPL-2.0 or LGPL-2.1
> - Add libltdl/COPYING.LIB to license files to have a copy of LGPL-2.1 as
>   it is not in COPYING
> - Add hash for both license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/collectd.hash | 4 ++++
>  package/collectd/collectd.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
