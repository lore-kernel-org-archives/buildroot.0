From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 14:39:10 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: remove host-python-cheetah
 dependency
In-Reply-To: <20180626211046.9026-1-fontaine.fabrice@gmail.com>
References: <20180626211046.9026-1-fontaine.fabrice@gmail.com>
Message-ID: <20180805143910.1c6d3d33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 23:10:46 +0200, Fabrice Fontaine wrote:
> host-python-cheetah has been replaced by host-python-mako:
> https://github.com/gnuradio/volk/commit/1b2bedc8685c4dc2b3587068339d69b5ab1c874d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/gnuradio.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
