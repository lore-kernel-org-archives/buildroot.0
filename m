From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 21:53:03 +0200
Subject: [Buildroot] [PATCH] ejabberd: Call check-erlang-lib script
 directly from its location
In-Reply-To: <20180213132711.17722-1-johan.oudinet@gmail.com>
References: <20180213132711.17722-1-johan.oudinet@gmail.com>
Message-ID: <20180520215303.78e9d56b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Feb 2018 14:27:11 +0100, Johan Oudinet wrote:
> Avoid installing check-erlang-lib in the directory where the tarball is
> extracted. Instead, use an absolute path to its actual location, i.e.:
> $(TOPDIR)/$(EJABBERD_PKGDIR)/check-erlang-lib
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/ejabberd/ejabberd.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
