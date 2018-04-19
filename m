From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:35:33 +0200
Subject: [Buildroot] [PATCH] package/libcec: disable build infos
In-Reply-To: <20180418211330.13594-1-romain.naour@gmail.com>
References: <20180418211330.13594-1-romain.naour@gmail.com>
Message-ID: <20180419233533.03381a40@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 23:13:30 +0200, Romain Naour wrote:
> Build infos can break the build due to missing terminating " character.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3b1/3b1182783fc958dfed96c6b1c097993662fc7308
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcec/libcec.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
