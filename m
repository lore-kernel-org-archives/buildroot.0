From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 17:14:15 +0200
Subject: [Buildroot] [PATCH] scanpypi: add support for the new PyPI
 infrastructure
In-Reply-To: <20180418095542.22608-1-yegorslists@googlemail.com>
References: <20180418095542.22608-1-yegorslists@googlemail.com>
Message-ID: <20180418171415.7a908659@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 11:55:42 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> https://pypi.python.org URL has been changed to https://pypi.org.
> 
> Package's JSON object now contains sha256 checksum, so use it
> instead of locally computed one. Change comments in the hash
> file accordingly.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
